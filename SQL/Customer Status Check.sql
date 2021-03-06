-- CHECKING STATUS OF THE CUSTOMER RECORD SYNDICATION
DECLARE @CUSTOMERID VARCHAR(50),@FK_OBJ VARCHAR(30),@FK_REQ_INBOX VARCHAR(50),@MODDATETIME VARCHAR(50),@ACK_STATUS VARCHAR(50),@READ_FLAG VARCHAR(5),@TRGCNT INT,@CNT INT,@TrgSysNames varchar(50)

SELECT @CUSTOMERID = '147518'

PRINT 'CUSTOMERID IS: ' + @CUSTOMERID
SELECT @FK_OBJ = FK_OBJ FROM MDM_TB_COMPANY_ATTRVAL (NOLOCK) WHERE COL154 = @CUSTOMERID
PRINT 'FK_OBJ VALUE IS: ' + @FK_OBJ

SELECT @FK_REQ_INBOX = FK_REQ_INBOX,@MODDATETIME = MOD_DATE_TIME FROM MDM_TB_OBJ (NOLOCK) WHERE PK_OBJ = @FK_OBJ 
IF (@FK_REQ_INBOX = '' OR @FK_REQ_INBOX IS NULL)
BEGIN
    SELECT TOP 1 @FK_REQ_INBOX = FK_REQ_INBOX FROM MDM_TB_SERVICE_INST_DATA (NOLOCK) WHERE FK_OBJ = @FK_OBJ AND CREATE_DATE_TIME >= @MODDATETIME ORDER BY MOD_DATE_TIME DESC
END

IF (@FK_REQ_INBOX IS NOT NULL)
BEGIN
    PRINT 'FK_REQ_INBOX VALUE IS: ' + @FK_REQ_INBOX
    --start -- how many target systems are mapped to this record
    DECLARE @ISINIFS bit,@ISINVOSS bit,@ISINCBS bit,@ISINORIENT bit
    SELECT @ISINIFS = ISINIFS ,@ISINVOSS = ISINVOSS,@ISINCBS = ISINCBS,@ISINORIENT = ISINORIENT
    FROM MDM_TB_TARGETSYSTEMMAPPING_DETAILS WHERE FK_OBJ = @FK_OBJ
    SET @TRGCNT = 0
    SET @TRGSYSNAMES = ''
    IF @ISINIFS = 1 
    BEGIN 
        SET @TRGCNT = @TRGCNT + 1
        SET @TRGSYSNAMES = @TRGSYSNAMES + 'IFS'
    END
    IF (@TRGSYSNAMES <> '') SET @TRGSYSNAMES = @TRGSYSNAMES + ','
    IF @ISINVOSS = 1 
    BEGIN 
        SET @TRGCNT = @TRGCNT + 1
        SET @TRGSYSNAMES = @TRGSYSNAMES + 'VOSS'
    END
    IF (@TRGSYSNAMES <> '') SET @TRGSYSNAMES = @TRGSYSNAMES + ','
    IF @ISINCBS = 1 
    BEGIN 
        SET @TRGCNT = @TRGCNT + 1
        SET @TRGSYSNAMES = @TRGSYSNAMES + 'CBS'
    END
    IF (@TRGSYSNAMES <> '') SET @TRGSYSNAMES = @TRGSYSNAMES + ','
    IF @ISINORIENT = 1
    BEGIN 
        SET @TRGCNT = @TRGCNT + 1
        SET @TRGSYSNAMES = @TRGSYSNAMES + 'ORIENT'
    END
    PRINT 'COUNT OF TARGET SYSTEMS IS: ' + CAST (@TRGCNT AS VARCHAR) 
    PRINT 'TARGET SYSTEMS NAMES ARE : ' + @TRGSYSNAMES
    --end - how many target systems are mapped to this record
    SELECT @READ_FLAG = READ_FLAG FROM MDM_TB_SYN_OUTBOX (NOLOCK) WHERE FK_REQ_INBOX = @FK_REQ_INBOX
    IF (@READ_FLAG <> '2')
    BEGIN
        IF (@READ_FLAG = '1')
            PRINT 'BIG TALK IS PROCESSING THE RECORD'
        ELSE
            PRINT 'WAITING FOR BIG TALK TO PICK UP THIS RECORD'
        SELECT 'MDM_TB_SYN_OUTBOX' AS TABLENAME,* FROM MDM_TB_SYN_OUTBOX (NOLOCK) WHERE FK_REQ_INBOX = @FK_REQ_INBOX
        GOTO SAFEEXIT
    END
    PRINT 'OUTBOX STATUS IS : ' + @READ_FLAG

    SELECT @CNT = COUNT(*) FROM MDM_TB_SYN_INBOX (NOLOCK) WHERE FK_REQ_INBOX = @FK_REQ_INBOX
    IF (@CNT < @TRGCNT)
    BEGIN
        PRINT 'TOTAL TARGET SYSTEMS ARE ' + CAST(@TRGCNT AS VARCHAR) + '. BUT ONLY RESEIVED ACCKNOLEDGEMENTS ARE : ' + CAST(@CNT AS VARCHAR)
        SELECT 'MDM_TB_SYN_INBOX' AS TABLENAME,* FROM MDM_TB_SYN_INBOX (NOLOCK) WHERE FK_REQ_INBOX = @FK_REQ_INBOX
        GOTO SAFEEXIT
    END
    ELSE IF (@CNT >= @TRGCNT)
    BEGIN
        SELECT @READ_FLAG = READ_FLAG FROM MDM_TB_SYN_INBOX (NOLOCK) WHERE FK_REQ_INBOX = @FK_REQ_INBOX
        IF (@READ_FLAG <> '1')
        BEGIN
            SELECT 'MDM_TB_SYN_INBOX' AS TABLENAME,* FROM MDM_TB_SYN_INBOX (NOLOCK) WHERE FK_REQ_INBOX = @FK_REQ_INBOX
            GOTO SAFEEXIT
        END
    END
    PRINT 'INBOX STATUS IS : ' + @READ_FLAG

    SELECT @ACK_STATUS = DBO.FN_GETACKSTATUS(@FK_OBJ,@FK_REQ_INBOX)
    PRINT 'ACK STATUS IS: ' + @ACK_STATUS 
    IF (@ACK_STATUS <> 'SUCCESS')
    BEGIN
        SELECT 'MDM_ACK_STATUS' AS TABLENAME,* FROM MDM_ACK_STATUS WHERE FK_REQ_INBOX = @FK_REQ_INBOX
        GOTO SAFEEXIT
    END

    DECLARE @ACKCNT INT
    SELECT @ACKCNT = COUNT(*) FROM MDM_ACK_STATUS WHERE FK_REQ_INBOX = @FK_REQ_INBOX
    IF (@ACKCNT < @TRGCNT)
    BEGIN
        SELECT 'STILL SOME ACK NEED TO BE RECEIVED'
        PRINT 'STILL SOME ACK NEED TO BE RECEIVED'
        SELECT 'MDM_ACK_STATUS' AS TABLENAME,* FROM MDM_ACK_STATUS WHERE FK_REQ_INBOX = @FK_REQ_INBOX
        GOTO SAFEEXIT
    END
    ELSE IF (@ACKCNT >= @TRGCNT)
    BEGIN
        SELECT @ACK_STATUS    
        SET @FK_REQ_INBOX = ''
        SELECT @FK_REQ_INBOX = FK_REQ_INBOX FROM MDM_TB_OBJ (NOLOCK) WHERE PK_OBJ = @FK_OBJ
        IF (@FK_REQ_INBOX IS NOT NULL OR @FK_REQ_INBOX <> '')
        BEGIN
            UPDATE MDM_TB_OBJ SET FK_REQ_INBOX = NULL WHERE PK_OBJ = @FK_OBJ
            PRINT 'RELEASED THE LOCK SINCE RECEIVED ACKNOLEDGEMENTS FROM ALL TARGET SYSTEMS'
        END
    END
END
ELSE
BEGIN
    SELECT 'FK_REQ_INBOX IS NOT GENERATED'
    PRINT 'FK_REQ_INBOX IS NOT GENERATED'
END

SAFEEXIT:

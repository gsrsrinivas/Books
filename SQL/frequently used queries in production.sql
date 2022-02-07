-- to the stautus of the payer syndication 
declare @customerid varchar(25),@fk_obj varchar(30),@fk_req_inbox varchar(30)
select @customerid = '2001007342',@fk_obj = '',@fk_req_inbox = ''
select @fk_obj = fk_obj from [wms_mdm].[dbo].mdm_tb_company_attrval where col154 = @customerid
select @fk_req_inbox = fk_req_inbox from [wms_mdm].[dbo].mdm_tb_obj where pk_obj = @fk_obj
select * from [wms_mdm].[dbo].mdm_ack_status where fk_req_inbox = @fk_req_inbox
--select [wms_mdm].[dbo].FN_GetAckStatus(992325,786849) ---fk_obj,fk_req_inbox)

-- to the stautus of the payer syndication 
declare @vesselIMO varchar(25),@fk_obj varchar(30),@fk_req_inbox varchar(30)
select @vesselIMO = '2001007342',@fk_obj = '',@fk_req_inbox = ''
select @fk_obj = fk_obj from [wms_mdm].[dbo].mdm_tb_vessel_attrval where col3 = @vesselIMO
select @fk_req_inbox = fk_req_inbox from [wms_mdm].[dbo].mdm_tb_obj where pk_obj = @fk_obj
select * from [wms_mdm].[dbo].mdm_ack_status where fk_req_inbox = @fk_req_inbox
--select [wms_mdm].[dbo].FN_GetAckStatus(992325,786849) ---fk_obj,fk_req_inbox)


-- to check the payerasvessel is yes or no 
select p.payerasvessel.query('/WMS_MDM_COMPANY/DATA/OBJECT/PAYERASVESSEL/text()') AS PAYERASVESSEL1 
from (
select cast(upper(replace(replace(cast(out_data_xml as varchar(8000)),';',''),'&','')) as xml)  as payerasvessel,*
from mdm_tb_syn_outbox where fk_req_inbox in ( 
'788079','788078','788077','788076','788075','788074','788073','788072','788071','788070','788069','788068','788067','788066','788065','788064','788063','788062','788061','788060','788059','788058','788057','788056','788055','788054','788053','788052','788051','788050','788049','788048','788047','788046','788045','788044','788043','788042','788041','788040','788039','788038','788037','788036','788035','788034','788033','788032','788031','788030','788029','788028','788027','788026','788025'
) ) p 

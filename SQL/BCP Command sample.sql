bcp "exec wms_mdm_ncpa_production..WMS_MDM_VESSEL_IU_IFS '2009-07-10'" queryout c:\VossVessels.txt -e c:\error.txt -c -t "," -S 10.156.20.184 -U sa -P wipro@123

osql -E -n -d mydb -i custom.qry -o "c:\output\results.csv" -h-1 -s ","

osql -U sa -P wipro@123 -S(local) -Q "set nocount on;exec wms_mdm_ncpa_production..wms_mdm_sp_RetrieveLRFvessels @p1='GR' ,@p2=null ,@p3='' ,@p4=null ,@p5 = 'true' ,@p6 = 'true' ,@p7 = 'false' ,@p8= 'true'"  -o "c:\results.csv" -h-1 -s "," -w 65536

INSERT INTO OPENROWSET('Microsoft.Jet.OLEDB.4.0', 
'Excel 8.0;Database=C:\testing.xls;', 
'SELECT Name, Date FROM [Sheet1$]') 
SELECT [Name], GETDATE() FROM msdb.dbo.sysjobs
GO

sqlcmd -S (local) -d wms_mdm_ncpa_production -E -o "c:\result.csv" -Q "exec wms_mdm_ncpa_production..wms_mdm_sp_RetrieveLRFvessels @p1='GR' ,@p2=null ,@p3='' ,@p4=null ,@p5 = 'true' ,@p6 = 'true' ,@p7 = 'false' ,@p8= 'true'" -W -w 65535 -s"," 




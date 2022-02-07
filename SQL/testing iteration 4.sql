use wms_mdm_ncpa_production
go

declare @customerid varchar(30),@fk_obj varchar(30),@fk_req_inbox varchar(30)

select @customerid = '8000021053',@fk_obj = '',@fk_req_inbox = ''
select col492,* from mdm_tb_company_attrval where col154 = @customerid
select @fk_obj = fk_obj from mdm_tb_company_attrval where col154 = @customerid
select @fk_req_inbox = fk_req_inbox from mdm_tb_obj where pk_obj = @fk_obj
select * from mdm_tb_obj where pk_obj = @fk_obj
select * from mdm_ack_status where fk_req_inbox = @fk_req_inbox
select * from mdm_req_context where record_key = @fk_obj and column_name in ('col492','col137')


declare @vesselimo varchar(30),@fk_obj varchar(30),@fk_req_inbox varchar(30)

select @vesselimo = '1002392',@fk_obj = '',@fk_req_inbox = ''
select col137,* from mdm_tb_vessel_attrval where col3 = @vesselimo
select @fk_obj = fk_obj from mdm_tb_vessel_attrval where col3 = @vesselimo
select @fk_req_inbox = fk_req_inbox from mdm_tb_obj where pk_obj = @fk_obj
select * from mdm_tb_obj where pk_obj = @fk_obj
select * from mdm_ack_status where fk_req_inbox = @fk_req_inbox
select * from mdm_req_context where record_key = @fk_obj and column_name in ('col492','col137')

-- 
--select * from mdm_tb_company_attrval where col154 = '6510004691'
--select * from mdm_tb_obj where pk_obj = '1155709'
--select * from mdm_ack_status where fk_req_inbox = '819073'

--select col154,col206,* from mdm_tb_company_attrval_stg where delete_flag = 'N'
--select top 10 col154,col206,* from mdm_tb_company_attrval where col500 is not null

-- select * from mdm_tb_vessel_attrval_stg where delete_flag = 'N'
-- select top 10 * from mdm_tb_vessel_attrval where col150 is not null

-- select * from mdm_tb_hull_attrval_stg where delete_flag = 'N'
-- select top 10 * from mdm_tb_vessel_attrval where col150 is not null

--select * from mdm_tb_vessel_attrval where col3 = '81000561'
--select * from mdm_tb_vessel_attrval_stg where col3 = '1000291'

-- update mdm_tb_obj set fk_req_inbox = null where pk_obj = 1155709
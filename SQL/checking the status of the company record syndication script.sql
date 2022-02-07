-- start
declare @customerid varchar(10),@datetime datetime,@fk_req_inbox numeric

set @customerid = '2001081593'
set @datetime = dateadd(mi,-1,getdate())

select * from mdm_tb_company_attrval where col154 = @customerid
select * from mdm_tb_obj where pk_obj = (select fk_obj from mdm_tb_company_attrval where col154 = @customerid)
select @fk_req_inbox = fk_req_inbox from mdm_tb_obj where pk_obj = (select fk_obj from mdm_tb_company_attrval where col154 = @customerid)
if (@fk_req_inbox is null)
select top 1 * from mdm_tb_service_inst_data 
where fk_obj = (select fk_obj from mdm_tb_company_attrval where col154 = @customerid) 
    and create_date_time >= @datetime 
order by create_date_time desc

select * from mdm_tb_syn_outbox where fk_req_inbox = @fk_req_inbox
select * from mdm_tb_syn_inbox where fk_req_inbox = @fk_req_inbox
select * from mdm_ack_status where fk_req_inbox =@fk_req_inbox

select * from mdm_tb_map_pyrno_pav where payer_no = @customerid

-- end

select * from mdm_tb_ref_accounttype
--update mdm_tb_ref_accounttype set payerasvessel = 1 where pk_accounttypeid = 6

 
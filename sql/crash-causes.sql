select
  crash_dt,
  (select cause.cause_long_desc from cause where cause.cause_cd = crash.crash_cause_1_cd) as cause_one,
  (select cause.cause_long_desc from cause where cause.cause_cd = crash.crash_cause_2_cd) as cause_two,
  (select cause.cause_long_desc from cause where cause.cause_cd = crash.crash_cause_3_cd) as cause_three
from crash
where crash_dt >= '01/01/2013' and (tot_ped_cnt > 0 or tot_pedcycl_cnt > 0)
order by crash_dt desc;

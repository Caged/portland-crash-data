select
  crash_dt,
  (select evnt.evnt_long_desc from evnt where evnt.evnt_cd = crash.crash_evnt_1_cd) as event_one,
  (select evnt.evnt_long_desc from evnt where evnt.evnt_cd = crash.crash_evnt_2_cd) as event_two,
  (select evnt.evnt_long_desc from evnt where evnt.evnt_cd = crash.crash_evnt_3_cd) as event_three
from crash
where crash_dt >= '01/01/2013' and (tot_ped_cnt > 0 or tot_pedcycl_cnt > 0)
order by crash_dt desc;

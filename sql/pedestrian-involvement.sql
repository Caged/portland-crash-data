select
  crash_yr_no as year,
  crash_mo_no as month,
  count(*)
from crash
where (tot_ped_cnt > 0 or tot_pedcycl_cnt > 0) and crash_yr_no = '2013'
group by 1,2
order by 1,2

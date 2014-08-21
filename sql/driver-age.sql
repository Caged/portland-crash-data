-- Group number of crashes by age ranges favored by the US Census beauro.
select
  crash_yr_no as year,
  crash_mo_no as month,
  sum(cast((age_val::int < 16) as int)) as age_16_under,
  sum(cast((age_val::int >= 16 and age_val::int <= 20) as int)) as age_16_20,
  sum(cast((age_val::int >= 21 and age_val::int <= 24) as int)) as age_21_24,
  sum(cast((age_val::int >= 25 and age_val::int <= 34) as int)) as age_25_34,
  sum(cast((age_val::int >= 35 and age_val::int <= 44) as int)) as age_35_44,
  sum(cast((age_val::int >= 45 and age_val::int <= 54) as int)) as age_45_54,
  sum(cast((age_val::int >= 55 and age_val::int <= 64) as int)) as age_55_64,
  sum(cast((age_val::int >= 65 and age_val::int <= 74) as int)) as age_65_74,
  sum(cast((age_val::int >= 75) as int)) as age_75_older
from crash
  inner join partic on partic.crash_id = crash.crash_id
  inner join partic_typ on partic.partic_typ_cd = partic_typ.partic_typ_cd
where age_val != '00' and partic.partic_typ_cd = '1' and partic_typ_long_desc = 'Driver'
group by 1,2
order by 1,2 asc;

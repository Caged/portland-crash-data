select age_val, count(*)
from crash
inner join partic on partic.crash_id = crash.crash_id
inner join partic_typ on partic.partic_typ_cd = partic_typ.partic_typ_cd
where age_val != '00' and partic.partic_typ_cd = '1' and partic_typ_long_desc = 'Driver'
group by 1
order by 1 desc;

create or replace function decimal_degrees(degrees int, minutes int, seconds real)
  returns double precision as
$BODY$DECLARE
  flip int := 1;
BEGIN
  if degrees < 0 then
    flip = -1;
  end if;
  return flip * (abs(degrees) + (minutes / 60.0) + (seconds / 3600.0));
END
$BODY$
LANGUAGE plpgsql

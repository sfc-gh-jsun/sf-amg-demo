use role sysadmin;

/*Find out your local time zone by issuing below command*?
show parameters like 'timezone';

/* If your Snowflake cluster time zone is already set in UTC, then run the following command */
create or replace view amg_test_db.public.flights_vw as
select *, dateadd(second, (select date_part(epoch_second, current_timestamp()) - date_part(epoch_second, max(old_ts_utc)) from amg_test_db.public.flights), old_ts_utc) as ts_utc from amg_test_db.public.flights ; 

/* Adjust the timestamps to current, feel free to execute continuously to update timestamps.
Note that we are adjusting the current timestamp in UTC to the demo local time zone America/Los_Angels by a 7 hours delay highlighted in red below, you need to modify this value according to your local time zone
*/
create or replace view amg_test_db.public.flights_vw as
select *, dateadd(second, (select date_part(epoch_second, dateadd(hour, -7, current_timestamp())) - date_part(epoch_second, max(old_ts_utc)) from amg_test_db.public.flights), old_ts_utc) as ts_utc from amg_test_db.public.flights;

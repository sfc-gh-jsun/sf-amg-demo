use role sysadmin;
create or replace warehouse load_wh with warehouse_size='x-small';
create database amg_test_db;
create or replace table amg_test_db.public.flights (
        recordid number(38,0),
        old_ts_utc  timestamp_ntz(9),
        alt     number(38,0),
        dest    varchar(16777216),
        orig    varchar(16777216),
        id      varchar(16777216),
        icao    varchar(16777216),
        lat     float,
        lon     float,
        geohash varchar(16777216)
);

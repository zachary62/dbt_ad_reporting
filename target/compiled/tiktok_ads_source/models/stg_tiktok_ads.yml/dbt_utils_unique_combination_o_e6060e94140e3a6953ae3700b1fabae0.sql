





with validation_errors as (

    select
        source_relation, ad_id, stat_time_hour
    from "postgres"."public_stg_tiktok_ads"."stg_tiktok_ads__ad_report_hourly"
    group by source_relation, ad_id, stat_time_hour
    having count(*) > 1

)

select *
from validation_errors



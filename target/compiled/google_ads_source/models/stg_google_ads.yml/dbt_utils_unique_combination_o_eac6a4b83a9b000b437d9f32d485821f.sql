





with validation_errors as (

    select
        source_relation, account_id, device, ad_network_type, date_day
    from "postgres"."public_google_ads_source"."stg_google_ads__account_stats"
    group by source_relation, account_id, device, ad_network_type, date_day
    having count(*) > 1

)

select *
from validation_errors









with validation_errors as (

    select
        source_relation, date_day, account_id, campaign_id, device_os, device_type, network, currency_code
    from "postgres"."public_microsoft_ads"."microsoft_ads__campaign_report"
    group by source_relation, date_day, account_id, campaign_id, device_os, device_type, network, currency_code
    having count(*) > 1

)

select *
from validation_errors



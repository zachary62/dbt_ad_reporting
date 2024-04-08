





with validation_errors as (

    select
        source_relation, organization_id, campaign_id, date_day
    from "postgres"."public_apple_search_ads"."apple_search_ads__campaign_report"
    group by source_relation, organization_id, campaign_id, date_day
    having count(*) > 1

)

select *
from validation_errors


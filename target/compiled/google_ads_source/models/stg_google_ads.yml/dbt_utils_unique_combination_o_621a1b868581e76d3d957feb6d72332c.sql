





with validation_errors as (

    select
        source_relation, campaign_id, updated_at
    from "postgres"."public_google_ads_source"."stg_google_ads__campaign_history"
    group by source_relation, campaign_id, updated_at
    having count(*) > 1

)

select *
from validation_errors









with validation_errors as (

    select
        source_relation, date_day, ad_group_id, campaign_id, advertiser_id
    from "postgres"."public_pinterest_source"."stg_pinterest_ads__ad_group_report"
    group by source_relation, date_day, ad_group_id, campaign_id, advertiser_id
    having count(*) > 1

)

select *
from validation_errors



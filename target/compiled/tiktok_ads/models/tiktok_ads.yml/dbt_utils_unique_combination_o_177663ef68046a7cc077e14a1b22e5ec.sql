





with validation_errors as (

    select
        source_relation, ad_id, ad_group_id, campaign_id, advertiser_id, date_day
    from "postgres"."public_tiktok_ads"."tiktok_ads__url_report"
    group by source_relation, ad_id, ad_group_id, campaign_id, advertiser_id, date_day
    having count(*) > 1

)

select *
from validation_errors


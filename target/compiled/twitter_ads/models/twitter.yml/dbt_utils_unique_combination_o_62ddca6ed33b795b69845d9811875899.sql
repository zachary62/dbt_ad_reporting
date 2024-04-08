





with validation_errors as (

    select
        source_relation, date_day, promoted_tweet_id, placement, line_item_id, campaign_id, account_id
    from "postgres"."public_twitter_ads"."twitter_ads__url_report"
    group by source_relation, date_day, promoted_tweet_id, placement, line_item_id, campaign_id, account_id
    having count(*) > 1

)

select *
from validation_errors



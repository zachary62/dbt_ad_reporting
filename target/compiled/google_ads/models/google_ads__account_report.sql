

with stats as (

    select *
    from "postgres"."public_google_ads_source"."stg_google_ads__account_stats"
), 

accounts as (

    select *
    from "postgres"."public_google_ads_source"."stg_google_ads__account_history"
    where is_most_recent_record = True
), 

fields as (

    select
        stats.source_relation,
        stats.date_day,
        accounts.account_name,
        stats.account_id,
        accounts.currency_code,
        accounts.auto_tagging_enabled,
        accounts.time_zone,
        sum(stats.spend) as spend,
        sum(stats.clicks) as clicks,
        sum(stats.impressions) as impressions

        





    from stats
    left join accounts
        on stats.account_id = accounts.account_id
        and stats.source_relation = accounts.source_relation
    group by 1,2,3,4,5,6,7
)

select *
from fields
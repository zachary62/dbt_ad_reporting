


with  __dbt__cte__int_ad_reporting__account_report as (



with


twitter_ads as (
    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'twitter_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_twitter_ads"."twitter_ads__account_report"

),



facebook_ads as (
    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'facebook_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_facebook_ads"."facebook_ads__account_report"

),



google_ads as (
    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'google_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_google_ads"."google_ads__account_report"

),



microsoft_ads as (
    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'microsoft_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_microsoft_ads"."microsoft_ads__account_report"

),




apple_search_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'apple_search_ads' as TEXT) as platform,

    cast(organization_id as TEXT) as account_id

    
    ,cast(organization_name as TEXT) as account_name

    
    ,cast(taps as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_apple_search_ads"."apple_search_ads__organization_report"

),



linkedin_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'linkedin_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(cost as FLOAT) as spend

    
from "postgres"."public_linkedin_ads"."linkedin_ads__account_report"

),



pinterest_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'pinterest_ads' as TEXT) as platform,

    cast(advertiser_id as TEXT) as account_id

    
    ,cast(advertiser_name as TEXT) as account_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_pinterest"."pinterest_ads__advertiser_report"

),



snapchat_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'snapchat_ads' as TEXT) as platform,

    cast(ad_account_id as TEXT) as account_id

    
    ,cast(ad_account_name as TEXT) as account_name

    
    ,cast(swipes as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_snapchat_ads"."snapchat_ads__account_report"

), 



tiktok_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'tiktok_ads' as TEXT) as platform,

    cast(advertiser_id as TEXT) as account_id

    
    ,cast(advertiser_name as TEXT) as account_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_tiktok_ads"."tiktok_ads__advertiser_report"

), 



amazon_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'amazon_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(cost as FLOAT) as spend

    
from "postgres"."public_amazon_ads"."amazon_ads__account_report"

), 



reddit_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'reddit_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(null as TEXT) as account_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_reddit_ads"."reddit_ads__account_report"

),


unioned as (

    


select * from amazon_ads

union all

select * from apple_search_ads

union all

select * from facebook_ads

union all

select * from google_ads

union all

select * from linkedin_ads

union all

select * from microsoft_ads

union all

select * from pinterest_ads

union all

select * from snapchat_ads

union all

select * from tiktok_ads

union all

select * from twitter_ads

union all

select * from reddit_ads




)

select *
from unioned
), base as (

    select *
    from __dbt__cte__int_ad_reporting__account_report
),

aggregated as (
    
    select
        source_relation,
        date_day,
        platform,
        account_id,
        account_name,
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend 

        





    from base
    group by 1,2,3,4,5
)

select *
from aggregated



with


google_ads as (
    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'google_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(ad_group_id as TEXT) as ad_group_id

    
    ,cast(ad_group_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_google_ads"."google_ads__ad_group_report"

),



microsoft_ads as (
    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'microsoft_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(ad_group_id as TEXT) as ad_group_id

    
    ,cast(ad_group_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_microsoft_ads"."microsoft_ads__ad_group_report"

),




apple_search_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'apple_search_ads' as TEXT) as platform,

    cast(organization_id as TEXT) as account_id

    
    ,cast(organization_name as TEXT) as account_name

    
    ,cast(ad_group_id as TEXT) as ad_group_id

    
    ,cast(ad_group_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(taps as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_apple_search_ads"."apple_search_ads__ad_group_report"

),



linkedin_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'linkedin_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(campaign_id as TEXT) as ad_group_id

    
    ,cast(campaign_name as TEXT) as ad_group_name

    
    ,cast(campaign_group_id as TEXT) as campaign_id

    
    ,cast(campaign_group_name as TEXT) as campaign_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(cost as FLOAT) as spend

    
from "postgres"."public_linkedin_ads"."linkedin_ads__campaign_report"

),



facebook_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'facebook_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(ad_set_id as TEXT) as ad_group_id

    
    ,cast(ad_set_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_facebook_ads"."facebook_ads__ad_set_report"

),



pinterest_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'pinterest_ads' as TEXT) as platform,

    cast(advertiser_id as TEXT) as account_id

    
    ,cast(advertiser_name as TEXT) as account_name

    
    ,cast(ad_group_id as TEXT) as ad_group_id

    
    ,cast(ad_group_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_pinterest"."pinterest_ads__ad_group_report"

),



snapchat_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'snapchat_ads' as TEXT) as platform,

    cast(ad_account_id as TEXT) as account_id

    
    ,cast(ad_account_name as TEXT) as account_name

    
    ,cast(ad_squad_id as TEXT) as ad_group_id

    
    ,cast(ad_squad_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(swipes as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_snapchat_ads"."snapchat_ads__ad_squad_report"

), 



tiktok_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'tiktok_ads' as TEXT) as platform,

    cast(advertiser_id as TEXT) as account_id

    
    ,cast(advertiser_name as TEXT) as account_name

    
    ,cast(ad_group_id as TEXT) as ad_group_id

    
    ,cast(ad_group_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_tiktok_ads"."tiktok_ads__ad_group_report"

), 



twitter_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'twitter_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(line_item_id as TEXT) as ad_group_id

    
    ,cast(line_item_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_twitter_ads"."twitter_ads__line_item_report"

), 



amazon_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'amazon_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(account_name as TEXT) as account_name

    
    ,cast(ad_group_id as TEXT) as ad_group_id

    
    ,cast(ad_group_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(cost as FLOAT) as spend

    
from "postgres"."public_amazon_ads"."amazon_ads__ad_group_report"

), 



reddit_ads as (

    select 
    source_relation,
    
    date(date_day)
 as date_day,
    cast( 'reddit_ads' as TEXT) as platform,

    cast(account_id as TEXT) as account_id

    
    ,cast(null as TEXT) as account_name

    
    ,cast(ad_group_id as TEXT) as ad_group_id

    
    ,cast(ad_group_name as TEXT) as ad_group_name

    
    ,cast(campaign_id as TEXT) as campaign_id

    
    ,cast(campaign_name as TEXT) as campaign_name

    
    ,cast(clicks as INT) as clicks

    ,cast(impressions as INT) as impressions

    ,cast(spend as FLOAT) as spend

    
from "postgres"."public_reddit_ads"."reddit_ads__ad_group_report"

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
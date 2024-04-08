

with base as (

    select * 
    from "postgres"."public_microsoft_ads_source"."stg_microsoft_ads__keyword_daily_report_tmp"
),

fields as (

    select
        
    cast(null as INT) as 
    
    account_id
    
 , 
    cast(null as TEXT) as 
    
    ad_distribution
    
 , 
    cast(null as INT) as 
    
    ad_group_id
    
 , 
    cast(null as INT) as 
    
    ad_id
    
 , 
    cast(null as TEXT) as 
    
    bid_match_type
    
 , 
    cast(null as INT) as 
    
    campaign_id
    
 , 
    cast(null as INT) as 
    
    clicks
    
 , 
    cast(null as TEXT) as 
    
    currency_code
    
 , 
    cast(null as date) as 
    
    date
    
 , 
    cast(null as TEXT) as 
    
    delivered_match_type
    
 , 
    cast(null as TEXT) as 
    
    device_os
    
 , 
    cast(null as TEXT) as 
    
    device_type
    
 , 
    cast(null as INT) as 
    
    impressions
    
 , 
    cast(null as INT) as 
    
    keyword_id
    
 , 
    cast(null as TEXT) as 
    
    language
    
 , 
    cast(null as TEXT) as 
    
    network
    
 , 
    cast(null as FLOAT) as 
    
    spend
    
 , 
    cast(null as TEXT) as 
    
    top_vs_other
    
 


        
    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        date as date_day,
        account_id,
        campaign_id,
        ad_group_id,
        ad_id,
        keyword_id,
        currency_code,
        device_os,
        device_type,
        network,
        language,
        ad_distribution,
        bid_match_type,
        delivered_match_type,
        top_vs_other,
        clicks,
        impressions,
        spend

        




    from fields
)

select * 
from final
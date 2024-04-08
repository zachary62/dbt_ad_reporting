

with base as (

    select * 
    from "postgres"."public_linkedin_ads_source"."stg_linkedin_ads__ad_analytics_by_campaign_tmp"
),

macro as (

    select
        
    cast(null as INT) as 
    
    campaign_id
    
 , 
    cast(null as INT) as 
    
    clicks
    
 , 
    cast(null as numeric(28,6)) as 
    
    cost_in_local_currency
    
 , 
    cast(null as numeric(28,6)) as 
    
    cost_in_usd
    
 , 
    cast(null as TIMESTAMP) as 
    
    day
    
 , 
    cast(null as INT) as 
    
    impressions
    
 


    
        


, cast('' as TEXT) as source_relation




    from base
),

fields as (
    
    select 
        source_relation,
        date_trunc('day', day) as date_day,
        campaign_id,
        clicks,
        impressions,
        
        cost_in_usd as cost
        

        





    from macro
)

select *
from fields
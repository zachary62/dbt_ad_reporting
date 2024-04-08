

with base as (

    select * 
    from "postgres"."public_reddit_ads_source"."stg_reddit_ads__ad_group_report_tmp"
),

fields as (

    select
        
    cast(null as TIMESTAMP) as 
    
    _fivetran_synced
    
 , 
    cast(null as TEXT) as 
    
    account_id
    
 , 
    cast(null as TEXT) as 
    
    ad_group_id
    
 , 
    cast(null as INT) as 
    
    clicks
    
 , 
    cast(null as date) as 
    
    date
    
 , 
    cast(null as INT) as 
    
    impressions
    
 , 
    cast(null as TEXT) as 
    
    region
    
 , 
    cast(null as INT) as 
    
    spend
    
 , 
    cast(null as date) as date_day 


    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        account_id,
        ad_group_id,
        clicks,
        date as date_day,
        impressions,
        region,
        (spend/1000000) as spend
        
        




    from fields
)

select *
from final


with base as (

    select * 
    from "postgres"."public_google_ads_source"."stg_google_ads__keyword_stats_tmp"
),

fields as (

    select
        
    cast(null as TEXT) as 
    
    _fivetran_id
    
 , 
    cast(null as TIMESTAMP) as 
    
    _fivetran_synced
    
 , 
    cast(null as INT) as 
    
    ad_group_criterion_criterion_id
    
 , 
    cast(null as INT) as 
    
    ad_group_id
    
 , 
    cast(null as TEXT) as 
    
    ad_network_type
    
 , 
    cast(null as INT) as 
    
    campaign_id
    
 , 
    cast(null as INT) as 
    
    clicks
    
 , 
    cast(null as INT) as 
    
    cost_micros
    
 , 
    cast(null as INT) as 
    
    customer_id
    
 , 
    cast(null as date) as 
    
    date
    
 , 
    cast(null as TEXT) as 
    
    device
    
 , 
    cast(null as INT) as 
    
    impressions
    
 


    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        _fivetran_id as keyword_id,
        customer_id as account_id, 
        date as date_day, 
        cast(ad_group_id as TEXT) as ad_group_id,
        ad_group_criterion_criterion_id as criterion_id,
        campaign_id, 
        clicks, 
        cost_micros / 1000000.0 as spend, 
        impressions
        
        





    from fields
)

select *
from final
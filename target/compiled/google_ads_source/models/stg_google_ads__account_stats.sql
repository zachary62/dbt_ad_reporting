

with base as (

    select * 
    from "postgres"."public_google_ads_source"."stg_google_ads__account_stats_tmp"
),

fields as (

    select
        
    cast(null as TEXT) as 
    
    _fivetran_id
    
 , 
    cast(null as TIMESTAMP) as 
    
    _fivetran_synced
    
 , 
    cast(null as TEXT) as 
    
    ad_network_type
    
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
        customer_id as account_id, 
        date as date_day,
        ad_network_type,
        device,
        clicks, 
        cost_micros / 1000000.0 as spend, 
        impressions
        
        





    from fields
)

select *
from final
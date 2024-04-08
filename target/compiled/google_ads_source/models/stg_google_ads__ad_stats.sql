

with base as (

    select * 
    from "postgres"."public_google_ads_source"."stg_google_ads__ad_stats_tmp"

),

fields as (

    select
        
    cast(null as TEXT) as 
    
    ad_group
    
 , 
    cast(null as TEXT) as 
    
    ad_group_id
    
 , 
    cast(null as INT) as 
    
    ad_id
    
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
    
 , 
    cast(null as TEXT) as 
    
    keyword_ad_group_criterion
    
 


        
    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        customer_id as account_id, 
        date as date_day, 
        
        coalesce(cast(ad_group_id as TEXT), 

  
    

    split_part(
        ad_group,
        'adGroups/',
        2
        )


  

) as ad_group_id,
        
        keyword_ad_group_criterion,
        ad_network_type,
        device,
        ad_id, 
        campaign_id, 
        clicks, 
        cost_micros / 1000000.0 as spend, 
        impressions
        
        





    from fields
)

select * from final
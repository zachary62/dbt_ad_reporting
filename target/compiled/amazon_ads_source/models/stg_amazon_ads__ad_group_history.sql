

with base as (

    select * 
    from "postgres"."public_amazon_ads_source"."stg_amazon_ads__ad_group_history_tmp"
),

fields as (

    select
        
    cast(null as INT) as 
    
    campaign_id
    
 , 
    cast(null as TIMESTAMP) as 
    
    creation_date
    
 , 
    cast(null as FLOAT) as 
    
    default_bid
    
 , 
    cast(null as TEXT) as 
    
    id
    
 , 
    cast(null as TIMESTAMP) as 
    
    last_updated_date
    
 , 
    cast(null as TEXT) as 
    
    name
    
 , 
    cast(null as TEXT) as 
    
    serving_status
    
 , 
    cast(null as TEXT) as 
    
    state
    
 


    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        cast(id as TEXT) as ad_group_id,
        cast(campaign_id as TEXT) as campaign_id,
        creation_date,
        default_bid,
        last_updated_date,
        name as ad_group_name,
        serving_status,
        state,
        row_number() over (partition by source_relation, id order by last_updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final


with base as (

    select * 
    from "postgres"."public_apple_search_ads_source"."stg_apple_search_ads__ad_group_history_tmp"
),

fields as (

    select
        
    cast(null as INT) as 
    
    campaign_id
    
 , 
    cast(null as TIMESTAMP) as 
    
    end_time
    
 , 
    cast(null as INT) as 
    
    id
    
 , 
    cast(null as TIMESTAMP) as 
    
    modification_time
    
 , 
    cast(null as TEXT) as 
    
    name
    
 , 
    cast(null as INT) as 
    
    organization_id
    
 , 
    cast(null as TIMESTAMP) as 
    
    start_time
    
 , 
    cast(null as TEXT) as 
    
    status
    
 


        
    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        modification_time as modified_at,
        organization_id,
        campaign_id,
        name as ad_group_name,
        id as ad_group_id,
        status as ad_group_status,
        start_time as start_at,
        end_time as end_at,
        row_number() over (partition by source_relation, id order by modification_time desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final


with base as (

    select * 
    from "postgres"."public_apple_search_ads_source"."stg_apple_search_ads__ad_history_tmp"
),

fields as (

    select
        
    cast(null as INT) as 
    
    ad_group_id
    
 , 
    cast(null as INT) as 
    
    campaign_id
    
 , 
    cast(null as TIMESTAMP) as 
    
    creation_time
    
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
    
    org_id
    
 , 
    cast(null as TEXT) as 
    
    status
    
 


    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        creation_time as created_at,
        modification_time as modified_at,
        org_id as organization_id,
        campaign_id,
        ad_group_id,
        name as ad_name,
        id as ad_id,
        status as ad_status, 
        row_number() over (partition by source_relation, id order by modification_time desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
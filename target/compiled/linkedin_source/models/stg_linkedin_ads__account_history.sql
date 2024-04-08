

with base as (

    select *
    from "postgres"."public_linkedin_ads_source"."stg_linkedin_ads__account_history_tmp"

), macro as (

    select
        
    cast(null as TIMESTAMP) as 
    
    created_time
    
 , 
    cast(null as TEXT) as 
    
    currency
    
 , 
    cast(null as INT) as 
    
    id
    
 , 
    cast(null as TIMESTAMP) as 
    
    last_modified_time
    
 , 
    cast(null as TEXT) as 
    
    name
    
 , 
    cast(null as TEXT) as 
    
    status
    
 , 
    cast(null as TEXT) as 
    
    type
    
 , 
    cast(null as TEXT) as 
    
    version_tag
    
 


    
        


, cast('' as TEXT) as source_relation




    from base

), fields as (

    select 
        source_relation,
        id as account_id,
        name as account_name,
        currency,
        cast(version_tag as numeric) as version_tag,
        status,
        type,
        cast(last_modified_time as TIMESTAMP) as last_modified_at,
        cast(created_time as TIMESTAMP) as created_at,
        row_number() over (partition by source_relation, id order by last_modified_time desc) = 1 as is_latest_version

    from macro

)

select *
from fields
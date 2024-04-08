

with base as (

    select *
    from "postgres"."public_linkedin_ads_source"."stg_linkedin_ads__campaign_group_history_tmp"

), macro as (

    select
        
    cast(null as INT) as 
    
    account_id
    
 , 
    cast(null as boolean) as 
    
    backfilled
    
 , 
    cast(null as TIMESTAMP) as 
    
    created_time
    
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
    cast(null as TIMESTAMP) as 
    
    run_schedule_end
    
 , 
    cast(null as TIMESTAMP) as 
    
    run_schedule_start
    
 , 
    cast(null as TEXT) as 
    
    status
    
 


    
        


, cast('' as TEXT) as source_relation




    from base

), fields as (

    select 
        source_relation,
        id as campaign_group_id,
        name as campaign_group_name,
        account_id,
        status,
        backfilled as is_backfilled,
        cast(run_schedule_start as TIMESTAMP) as run_schedule_start_at,
        cast(run_schedule_end as TIMESTAMP) as run_schedule_end_at,
        cast(last_modified_time as TIMESTAMP) as last_modified_at,
        cast(created_time as TIMESTAMP) as created_at,
        row_number() over (partition by source_relation, id order by last_modified_time desc) = 1 as is_latest_version

    from macro

)

select *
from fields
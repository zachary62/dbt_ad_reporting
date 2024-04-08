

with base as (

    select * 
    from "postgres"."public_facebook_ads_source"."stg_facebook_ads__campaign_history_tmp"
),

fields as (

    select
        
    cast(null as TIMESTAMP) as 
    
    updated_time
    
 , 
    cast(null as TIMESTAMP) as 
    
    created_time
    
 , 
    cast(null as INT) as 
    
    account_id
    
 , 
    cast(null as INT) as 
    
    id
    
 , 
    cast(null as TEXT) as 
    
    name
    
 , 
    cast(null as TIMESTAMP) as 
    
    start_time
    
 , 
    cast(null as TIMESTAMP) as 
    
    stop_time
    
 , 
    cast(null as TEXT) as 
    
    status
    
 , 
    cast(null as INT) as 
    
    daily_budget
    
 , 
    cast(null as INT) as 
    
    lifetime_budget
    
 , 
    cast(null as FLOAT) as 
    
    budget_remaining
    
 


        
    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        updated_time as updated_at,
        created_time as created_at,
        cast(account_id as bigint) as account_id,
        cast(id as bigint) as campaign_id,
        name as campaign_name,
        start_time as start_at,
        stop_time as end_at,
        status,
        daily_budget,
        lifetime_budget,
        budget_remaining,
        row_number() over (partition by source_relation, id order by updated_time desc) = 1 as is_most_recent_record
    from fields

)

select * 
from final
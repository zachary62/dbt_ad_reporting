

with base as (

    select * 
    from "postgres"."public_snapchat_ads_source"."stg_snapchat_ads__ad_account_history_tmp"
),

fields as (

    select
        
    cast(null as TIMESTAMP) as 
    
    _fivetran_synced
    
 , 
    cast(null as TEXT) as 
    
    advertiser
    
 , 
    cast(null as TIMESTAMP) as 
    
    created_at
    
 , 
    cast(null as TEXT) as 
    
    currency
    
 , 
    cast(null as TEXT) as 
    
    id
    
 , 
    cast(null as TEXT) as 
    
    name
    
 , 
    cast(null as TEXT) as 
    
    timezone
    
 , 
    cast(null as TEXT) as 
    
    type
    
 , 
    cast(null as TIMESTAMP) as 
    
    updated_at
    
 


    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        id as ad_account_id,
        name as ad_account_name,
        cast (created_at as TIMESTAMP) as created_at,
        advertiser, 
        currency,
        timezone,
        cast (_fivetran_synced as TIMESTAMP) as _fivetran_synced,
        cast (updated_at as TIMESTAMP) as updated_at,
        row_number() over (partition by source_relation, id order by _fivetran_synced desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final
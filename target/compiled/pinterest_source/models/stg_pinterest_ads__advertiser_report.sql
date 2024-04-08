

with base as (

    select * 
    from "postgres"."public_pinterest_source"."stg_pinterest_ads__advertiser_report_tmp"
),

fields as (

    select
        
    cast(null as TIMESTAMP) as 
    
    _fivetran_synced
    
 , 
    cast(null as TEXT) as 
    
    advertiser_id
    
 , 
    cast(null as INT) as 
    
    clickthrough_1
    
 , 
    cast(null as INT) as 
    
    clickthrough_2
    
 , 
    cast(null as TIMESTAMP) as 
    
    date
    
 , 
    cast(null as INT) as 
    
    impression_1
    
 , 
    cast(null as INT) as 
    
    impression_2
    
 , 
    cast(null as INT) as 
    
    spend_in_micro_dollar
    
 


    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        date_trunc('day', date) as date_day,
        advertiser_id,
        coalesce(impression_1,0) + coalesce(impression_2,0) as impressions,
        coalesce(clickthrough_1,0) + coalesce(clickthrough_2,0) as clicks,
        spend_in_micro_dollar / 1000000.0 as spend

        





    from fields
)

select *
from final
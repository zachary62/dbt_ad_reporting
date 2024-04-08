

with base as (

    select * 
    from "postgres"."public_twitter_ads_source"."stg_twitter_ads__line_item_report_tmp"
),

fields as (

    select
        
    cast(null as TEXT) as 
    
    account_id
    
 , 
    cast(null as INT) as 
    
    billed_charge_local_micro
    
 , 
    cast(null as INT) as 
    
    clicks
    
 , 
    cast(null as TIMESTAMP) as 
    
    date
    
 , 
    cast(null as INT) as 
    
    impressions
    
 , 
    cast(null as TEXT) as 
    
    line_item_id
    
 , 
    cast(null as TEXT) as 
    
    placement
    
 , 
    cast(null as INT) as 
    
    url_clicks
    
 


    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        date_trunc('day', date) as date_day,
        account_id,
        line_item_id,
        placement,
        clicks,
        impressions,
        billed_charge_local_micro as spend_micro,
        round(billed_charge_local_micro / 1000000.0,2) as spend,
        url_clicks

        





    from fields
)

select *
from final
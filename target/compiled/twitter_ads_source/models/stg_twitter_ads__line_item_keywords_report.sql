

with base as (

    select * 
    from "postgres"."public_twitter_ads_source"."stg_twitter_ads__line_item_keywords_report_tmp"
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
    cast(null as TEXT) as 
    
    segment
    
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
        md5(cast(coalesce(cast(account_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(line_item_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(segment as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(placement as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as keyword_id,
        account_id,
        line_item_id,
        segment as keyword,
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
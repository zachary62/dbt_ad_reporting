

with base as (

    select * 
    from "postgres"."public_snapchat_ads_source"."stg_snapchat_ads__ad_squad_hourly_report_tmp"
),

fields as (

    select
        
    cast(null as TEXT) as 
    
    ad_squad_id
    
 , 
    cast(null as INT) as 
    
    attachment_quartile_1
    
 , 
    cast(null as INT) as 
    
    attachment_quartile_2
    
 , 
    cast(null as INT) as 
    
    attachment_quartile_3
    
 , 
    cast(null as INT) as 
    
    attachment_total_view_time_millis
    
 , 
    cast(null as INT) as 
    
    attachment_view_completion
    
 , 
    cast(null as TIMESTAMP) as 
    
    date
    
 , 
    cast(null as INT) as 
    
    impressions
    
 , 
    cast(null as INT) as 
    
    quartile_1
    
 , 
    cast(null as INT) as 
    
    quartile_2
    
 , 
    cast(null as INT) as 
    
    quartile_3
    
 , 
    cast(null as INT) as 
    
    saves
    
 , 
    cast(null as INT) as 
    
    screen_time_millis
    
 , 
    cast(null as INT) as 
    
    shares
    
 , 
    cast(null as INT) as 
    
    spend
    
 , 
    cast(null as INT) as 
    
    swipes
    
 , 
    cast(null as INT) as 
    
    video_views
    
 , 
    cast(null as INT) as 
    
    view_completion
    
 , 
    cast(null as INT) as 
    
    view_time_millis
    
 

        
    
        


, cast('' as TEXT) as source_relation




    from base
),

final as (

    select
        source_relation, 
        ad_squad_id,
        cast (date as TIMESTAMP) as date_hour,
        attachment_quartile_1,
        attachment_quartile_2,
        attachment_quartile_3,
        (attachment_total_view_time_millis / 1000000.0) as attachment_total_view_time,
        attachment_view_completion,
        quartile_1,
        quartile_2,
        quartile_3,
        saves,
        shares,
        (screen_time_millis / 1000000.0) as screen_time,
        video_views,
        view_completion,
        (view_time_millis / 1000000.0) as view_time,
        impressions,
        (spend / 1000000.0) as spend,
        swipes

        




    
    from fields
)

select *
from final
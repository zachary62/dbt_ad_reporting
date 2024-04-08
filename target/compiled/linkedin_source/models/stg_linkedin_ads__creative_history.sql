

with base as (

    select *
    from "postgres"."public_linkedin_ads_source"."stg_linkedin_ads__creative_history_tmp"

), macro as (

    select 
        
    cast(null as INT) as 
    
    campaign_id
    
 , 
    cast(null as TEXT) as 
    
    click_uri
    
 , 
    cast(null as TIMESTAMP) as 
    
    created_time
    
 , 
    cast(null as TIMESTAMP) as 
    
    created_at
    
 , 
    cast(null as INT) as 
    
    id
    
 , 
    cast(null as TIMESTAMP) as 
    
    last_modified_time
    
 , 
    cast(null as TIMESTAMP) as 
    
    last_modified_at
    
 , 
    cast(null as TEXT) as 
    
    intended_status
    
 , 
    cast(null as TEXT) as 
    
    status
    
 


    
        


, cast('' as TEXT) as source_relation




    from base

), fields as (

    select
        source_relation,
        id as creative_id,
        campaign_id,
        coalesce(intended_status, status) as status,
        click_uri,
        cast(coalesce(last_modified_at, last_modified_time) as TIMESTAMP) as last_modified_at,
        cast(coalesce(created_at, created_time) as TIMESTAMP) as created_at,
        row_number() over (partition by source_relation, id order by coalesce(last_modified_at, last_modified_time) desc) = 1 as is_latest_version

    from macro

), url_fields as (

    select 
        *,
        

  
    

    split_part(
        click_uri,
        '?',
        1
        )


  

 as base_url,
        
    
    cast(

  
    

    split_part(
        

  
    

    split_part(
        

    replace(
        

    replace(
        

    replace(
        click_uri,
        'android-app://',
        ''
    )


,
        'http://',
        ''
    )


,
        'https://',
        ''
    )


,
        '/',
        1
        )


  

,
        '?',
        1
        )


  

 as TEXT)
 as url_host,
        '/' || 
    
    cast(

  
    

    split_part(
        

    right(
        

    replace(
        

    replace(
        click_uri,
        'http://',
        ''
    )


,
        'https://',
        ''
    )


,
        

    length(
        

    replace(
        

    replace(
        click_uri,
        'http://',
        ''
    )


,
        'https://',
        ''
    )



    )-coalesce(
            nullif(

    position(
        '/' in 

    replace(
        

    replace(
        click_uri,
        'http://',
        ''
    )


,
        'https://',
        ''
    )



    ), 0),
            

    position(
        '?' in 

    replace(
        

    replace(
        click_uri,
        'http://',
        ''
    )


,
        'https://',
        ''
    )



    ) - 1
            )
    ),
        '?',
        1
        )


  

 as TEXT)
 as url_path,
        nullif(

  
    

    split_part(
        

  
    

    split_part(
        click_uri,
        'utm_source=',
        2
        )


  

,
        '&',
        1
        )


  

,'') as utm_source,
        nullif(

  
    

    split_part(
        

  
    

    split_part(
        click_uri,
        'utm_medium=',
        2
        )


  

,
        '&',
        1
        )


  

,'') as utm_medium,
        nullif(

  
    

    split_part(
        

  
    

    split_part(
        click_uri,
        'utm_campaign=',
        2
        )


  

,
        '&',
        1
        )


  

,'') as utm_campaign,
        nullif(

  
    

    split_part(
        

  
    

    split_part(
        click_uri,
        'utm_content=',
        2
        )


  

,
        '&',
        1
        )


  

,'') as utm_content,
        nullif(

  
    

    split_part(
        

  
    

    split_part(
        click_uri,
        'utm_term=',
        2
        )


  

,
        '&',
        1
        )


  

,'') as utm_term
    
    from fields
)

select *
from url_fields
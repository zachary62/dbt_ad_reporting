
    
    



select _fivetran_synced
from "postgres"."public_facebook_ads_source"."stg_facebook_ads__creative_history"
where _fivetran_synced is null


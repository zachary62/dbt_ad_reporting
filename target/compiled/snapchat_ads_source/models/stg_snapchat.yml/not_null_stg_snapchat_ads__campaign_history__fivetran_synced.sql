
    
    



select _fivetran_synced
from "postgres"."public_snapchat_ads_source"."stg_snapchat_ads__campaign_history"
where _fivetran_synced is null



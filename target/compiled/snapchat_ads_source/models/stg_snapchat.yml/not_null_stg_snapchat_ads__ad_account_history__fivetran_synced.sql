
    
    



select _fivetran_synced
from "postgres"."public_snapchat_ads_source"."stg_snapchat_ads__ad_account_history"
where _fivetran_synced is null



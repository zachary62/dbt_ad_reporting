





with validation_errors as (

    select
        source_relation, ad_account_id, _fivetran_synced
    from "postgres"."public_snapchat_ads_source"."stg_snapchat_ads__ad_account_history"
    group by source_relation, ad_account_id, _fivetran_synced
    having count(*) > 1

)

select *
from validation_errors



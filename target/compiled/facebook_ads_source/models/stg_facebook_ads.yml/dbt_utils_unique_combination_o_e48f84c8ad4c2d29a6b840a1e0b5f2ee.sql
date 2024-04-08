





with validation_errors as (

    select
        source_relation, creative_id, _fivetran_synced
    from "postgres"."public_facebook_ads_source"."stg_facebook_ads__creative_history"
    group by source_relation, creative_id, _fivetran_synced
    having count(*) > 1

)

select *
from validation_errors



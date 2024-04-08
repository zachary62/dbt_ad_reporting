





with validation_errors as (

    select
        source_relation, ad_group_id, updated_at
    from "postgres"."public_stg_tiktok_ads"."stg_tiktok_ads__ad_group_history"
    group by source_relation, ad_group_id, updated_at
    having count(*) > 1

)

select *
from validation_errors


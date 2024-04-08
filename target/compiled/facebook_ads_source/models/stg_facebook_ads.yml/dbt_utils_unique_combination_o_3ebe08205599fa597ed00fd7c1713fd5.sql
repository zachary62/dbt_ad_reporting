





with validation_errors as (

    select
        source_relation, ad_id, updated_at
    from "postgres"."public_facebook_ads_source"."stg_facebook_ads__ad_history"
    group by source_relation, ad_id, updated_at
    having count(*) > 1

)

select *
from validation_errors



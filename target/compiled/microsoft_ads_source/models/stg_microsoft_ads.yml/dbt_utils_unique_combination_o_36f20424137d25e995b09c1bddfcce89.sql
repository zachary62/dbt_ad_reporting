





with validation_errors as (

    select
        source_relation, ad_id, modified_at
    from "postgres"."public_microsoft_ads_source"."stg_microsoft_ads__ad_history"
    group by source_relation, ad_id, modified_at
    having count(*) > 1

)

select *
from validation_errors



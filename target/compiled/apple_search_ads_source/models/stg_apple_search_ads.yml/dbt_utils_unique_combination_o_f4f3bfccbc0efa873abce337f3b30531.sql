





with validation_errors as (

    select
        source_relation, keyword_id, modified_at
    from "postgres"."public_apple_search_ads_source"."stg_apple_search_ads__keyword_history"
    group by source_relation, keyword_id, modified_at
    having count(*) > 1

)

select *
from validation_errors



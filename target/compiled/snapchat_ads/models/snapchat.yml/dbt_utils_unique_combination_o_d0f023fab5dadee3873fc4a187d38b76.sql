





with validation_errors as (

    select
        source_relation, ad_id, date_day
    from "postgres"."public_snapchat_ads"."snapchat_ads__url_report"
    group by source_relation, ad_id, date_day
    having count(*) > 1

)

select *
from validation_errors



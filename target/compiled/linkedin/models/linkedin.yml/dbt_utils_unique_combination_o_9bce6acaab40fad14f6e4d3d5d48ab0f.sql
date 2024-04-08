





with validation_errors as (

    select
        source_relation, date_day, account_id
    from "postgres"."public_linkedin_ads"."linkedin_ads__account_report"
    group by source_relation, date_day, account_id
    having count(*) > 1

)

select *
from validation_errors





with report as (
    
    select *
    from "postgres"."public_apple_search_ads_source"."stg_apple_search_ads__campaign_report"

), 

campaign as (

    select *
    from "postgres"."public_apple_search_ads_source"."stg_apple_search_ads__campaign_history"
    where is_most_recent_record = True
), 

organization as (

    select * 
    from "postgres"."public_apple_search_ads_source"."stg_apple_search_ads__organization"

), 

joined as (

    select 
        report.source_relation,
        report.date_day,
        campaign.organization_id,
        organization.organization_name,
        campaign.campaign_id, 
        campaign.campaign_name, 
        report.currency,
        campaign.campaign_status,
        campaign.start_at,
        campaign.end_at,
        sum(report.taps) as taps,
        sum(report.new_downloads) as new_downloads,
        sum(report.redownloads) as redownloads,
        sum(report.new_downloads + report.redownloads) as total_downloads,
        sum(report.impressions) as impressions,
        sum(report.spend) as spend

        




    from report
    join campaign 
        on report.campaign_id = campaign.campaign_id
        and report.source_relation = campaign.source_relation
    join organization 
        on campaign.organization_id = organization.organization_id
        and campaign.source_relation = organization.source_relation
    group by 1,2,3,4,5,6,7,8,9,10
)

select * 
from joined
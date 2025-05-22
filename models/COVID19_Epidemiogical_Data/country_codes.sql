with demographics as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),
country_code as (
    select * from {{ ref('country_codes') }}
),
final as (
    select
        demographics.total_population,
        country_codes.name
    from demographics
    left join country_codes
        on country_codes.code = demographics.ISO3166_1
)
select * from final
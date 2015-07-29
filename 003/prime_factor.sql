

-- 13195

with recursive pf(num) as (
    values(13195)
    union all
    select
        -- min(p.num) as divided
        -- , num - s.i
        p.num
    from
        pf p
        cross join (
            select
                s.i
            from (
                select
                    *
                from
                    generate_series(2, 13195)
            ) s(i)
        ) as s
    where
        p.num % s.i = 0
)

select
    num
from
    pf

;

with seq as (selects.i from (select * from generate_series(2, 13195)) s(i) )

select
    i
    -- min(i)
from (
    select
        case when 13195 % i = 0 then true else false end as can_divide
        , i
    from
        seq
) trial
where
    can_divide = true
;


with seq as (select s.i from (select * from generate_series(2, 13195)) s(i) )


with recursive pf(num1, num2) as (
    values(2, 13195)
    union all
    select
        num1 + 1 as num1
        , case
            when num2 % num1 = 0 then num2 / num1
            else num2
        end as num2
    from
        pf
    -- where
    --     num2 % num1 = 0
    -- limit 1
)

select
    *
from
    pf
;

select
    i
from (
    select s.i from (
      select * from generate_series(2, 13195)
    ) s(i)
) seq

where
    13195 % i = 0
limit 1

select
    sum(a.generate_series)
from (
    select
        *
    from
        generate_series(0, 1000-1)
) a
where
    a.generate_series % 3 = 0
    or a.generate_series % 5 = 0
;
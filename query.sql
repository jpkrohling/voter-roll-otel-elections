select 
  sub.name as name,
  sub.value 
from (
  select 
    split_part(name, '$$$', 1) as name,
    sum(value) as value
  from
    shdev
  where
    series = 'hdev_[[metric]][[repogroup]][[country]]'
    and period = '[[period]]'
  group by
    split_part(name, '$$$', 1)
) sub
where sub.value >= 20
order by name

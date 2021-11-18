select orderid as order_id ,
sum(amount) as amount
from raw.stripe.payment
group by 1
with orders as (

    select * from {{ ref('stg_orders')}}

), payments as (

    select * from {{ ref('stg_payments')}}

), final as (
select o.order_id,
o.customer_id,
sum(p.amount) amount from orders o 
left join payments p
using (order_id)
group by o.order_id,
o.customer_id
)
select * from final

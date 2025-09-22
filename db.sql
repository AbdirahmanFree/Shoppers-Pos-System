create table transaction (
   transaction_id   number primary key not null,
   employee_id      number not null,
   store_id         number not null,
   customer_id      number not null,
   payment_method   varchar(30),
   transaction_date date not null,
   total_amount     number check ( total_amount > 0 ),
   constraint fk_tx_employee foreign key ( employee_id )
      references employee ( employee_id ),
   constraint fk_tx_store foreign key ( store_id )
      references store ( store_id ),
   constraint fk_tx_customer foreign key ( customer_id )
      references customer ( customer_id )
)
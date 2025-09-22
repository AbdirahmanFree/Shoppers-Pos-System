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

create table lineitem (
   transaction_id   number not null,
   line_no          number not null,
   product_id       number not null,
   quantity         number not null check ( quantity > 0 ),
   discount_applied number(5,2) default 0 check ( discount_applied >= 0 ),
   constraint pk_lineitem primary key ( transaction_id,
                                        line_no ),
   constraint fk_li_tx foreign key ( transaction_id )
      references transaction ( transaction_id )
         on delete cascade,
   constraint fk_li_prod foreign key ( product_id )
      references product ( product_id )
);

create table inventory (
   inventory_id      number primary key,
   store_id          number not null,
   product_id        number not null,
   reorder_threshold number not null check ( reorder_threshold >= 0 ),
   stock_level       number not null check ( stock_level >= 0 ),
   constraint uq_inventory_store_prod unique ( store_id,
                                               product_id ),
   constraint fk_inv_store foreign key ( store_id )
      references store ( store_id ),
   constraint fk_inv_prod foreign key ( product_id )
      references product ( product_id )
);
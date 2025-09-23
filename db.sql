create table store (
   store_id   number generated always as identity,
   store_name varchar2(100) not null,
   address    varchar2(200),
   constraint pk_store primary key ( store_id )
);

create table product (
   product_id       number generated always as identity,
   product_name     varchar2(100) not null,
   product_category varchar2(50),
   price            number(10,2) default 0,
   stock_quantity   number default 0,
   constraint pk_product primary key ( product_id )
);

create table customer (
   customer_id    number generated always as identity,
   customer_name  varchar2(100) not null,
   phone_number   varchar2(15),
   email          varchar2(100),
   loyalty_points number default 0,
   constraint pk_customer primary key ( customer_id )
);

create table employee (
   employee_id   number generated always as identity,
   employee_name varchar2(100) not null,
   role          varchar2(50) not null,
   hire_date     date not null,
   constraint pk_employee primary key ( employee_id )
);




create table transaction (
   transaction_id   number generated always as identity,
   employee_id      number not null,
   store_id         number not null,
   customer_id      number not null,
   payment_method   varchar(30),
   transaction_date date not null,
   total_amount     number check ( total_amount > 0 ),
   constraint pk_tansaction primary key ( transaction_id ),
   constraint fk_tx_employee foreign key ( employee_id ) references employee ( employee_id ),
   constraint fk_tx_store foreign key ( store_id ) references store ( store_id ),
   constraint fk_tx_customer foreign key ( customer_id ) references customer ( customer_id )
);

create table lineitem (
   transaction_id   number not null,
   line_no          number not null,
   product_id       number not null,
   quantity         number not null check ( quantity > 0 ),
   discount_applied number(5,2) default 0 check ( discount_applied >= 0 ),
   constraint pk_lineitem primary key ( transaction_id, line_no ),
   constraint fk_li_tx foreign key ( transaction_id ) references transaction ( transaction_id ),
   constraint fk_li_prod foreign key ( product_id ) references product ( product_id )
);

create table inventory (
   inventory_id number generated always as identity,
   store_id          number not null,
   product_id        number not null,
   reorder_threshold number not null check ( reorder_threshold >= 0 ),
   stock_level       number not null check ( stock_level >= 0 ),
   constraint pk_inventory primary key ( inventory_id ),
   constraint uq_inventory_store_prod unique ( store_id, product_id ),
   constraint fk_inv_store foreign key ( store_id ) references store ( store_id ),
   constraint fk_inv_prod foreign key ( product_id ) references product ( product_id )
);

create table supplier (
   supplier_id   number generated always as identity,
   supplier_name varchar2(100) not null,
   contact_info  varchar2(200),
   constraint pk_supplier primary key ( supplier_id )
);

SELECT table_name
FROM   user_tables
ORDER  BY table_name;
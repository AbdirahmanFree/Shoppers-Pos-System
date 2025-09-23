CREATE TABLE Store (
    store_id NUMBER GENERATED ALWAYS AS IDENTITY, 
    store_name VARCHAR2(100) NOT NULL, 
    address VARCHAR2(200),
    constraint pk_store PRIMARY KEY (store_id)
);

CREATE TABLE Product (
    product_id NUMBER GENERATED ALWAYS AS IDENTITY,
    product_name VARCHAR2(100) NOT NULL, 
    product_category VARCHAR2(50),
    price NUMBER(10,2) DEFAULT 0,
    stock_quantity NUMBER DEFAULT 0,
    CONSTRAINT pk_product PRIMARY KEY (product_id)
);

CREATE TABLE Customer (
    customer_id NUMBER GENERATED ALWAYS AS IDENTITY, 
    customer_name VARCHAR2(100) NOT NULL, 
    phone_number VARCHAR2(15), 
    email VARCHAR2(100), 
    loyalty_points NUMBER DEFAULT 0,
    CONSTRAINT pk_customer PRIMARY KEY (customer_id)
);

CREATE TABLE Employee (
    employee_id NUMBER GENERATED ALWAYS AS IDENTITY, 
    employee_name VARCHAR2(100) NOT NULL, 
    role VARCHAR2(50) NOT NULL,
    hire_date DATE NOT NULL, 
    CONSTRAINT pk_employee PRIMARY KEY (employee_id)
);










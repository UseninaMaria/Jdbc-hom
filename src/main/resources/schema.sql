create schema task1;

CREATE TABLE task1.CUSTOMERS (
                                    id SERIAL PRIMARY KEY,
                                    name VARCHAR,
                                    surname VARCHAR,
                                    age INT,
                                    phone_number VARCHAR
);

CREATE TABLE task1.ORDERS (
                                 id SERIAL PRIMARY KEY,
                                 date TIMESTAMP,
                                 customer_id INT,
                                 product_name VARCHAR,
                                 amount INT,
                                 FOREIGN KEY (customer_id) REFERENCES CUSTOMERS (id)
);

insert into task1.CUSTOMERS(id, name, surname, age, phone_number)
values (1, 'Misha', 'Mix', 15, '8456542');
insert into task1.CUSTOMERS(id, name, surname, age, phone_number)
values (2, 'Kesha', 'Yan', 18, '5865484');
insert into task1.CUSTOMERS(id, name, surname, age, phone_number)
values (3, 'Dep', 'Ens', 25, '2454845');

insert into task1.ORDERS(id, customer_id, product_name, amount)
values (1, 1, 'juice', 10);
insert into task1.ORDERS(id, customer_id, product_name, amount)
values (2, 2, 'phone', 40);
insert into task1.ORDERS(id, customer_id, product_name, amount)
values (3, 3, 'chehol', 20);
insert into task1.ORDERS(id, customer_id, product_name, amount)
values (4, 1, 'car', 15);

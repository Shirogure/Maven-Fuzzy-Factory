CREATE DATABASE toy_store;

use toy_store;

CREATE TABLE website_sessions (
    website_session_id INT          NOT NULL,
    created_at         DATETIME     NOT NULL,
    user_id            INT          NOT NULL,
    is_repeat_session  TINYINT      NOT NULL,
    utm_source         VARCHAR(50),
    utm_campaign       VARCHAR(50),
    utm_content        VARCHAR(50),
    device_type        VARCHAR(20),
    http_referer       VARCHAR(100),
    PRIMARY KEY (website_session_id)
);	

create table website_pageviews (
	website_pageview_id int not null,
    created_at datetime not null,
    website_session_id int not null,
    pageview_url varchar(50),
    primary key (website_pageview_id)
);

create table products (
	product_id tinyint not null,
    created_at datetime not null,
    product_name varchar(75) not null,
    primary key (product_id)
);

create table orders (
	order_id int not null,
    created_at datetime not null,
    website_session_id int not null,
    user_id int not null,
    primary_product_id tinyint not null,
    items_purchased int not null,
    price_usd decimal(10,2) not null,
    cogs_usd decimal(10,2) not null,
    primary key (order_id)
);

create table order_items (
	order_item_id int not null,
    created_at datetime not null,
    order_it int not null,
    products_id int not null,
    is_primary_item int not null,
    price_usd decimal(10,2) not null,
    cogs_usd decimal(10,2) not null,
    primary key (order_item_id)
);

create table order_item_refunds (
	order_item_refund_id int not null,
    created_at datetime not null,
    order_item_id int not null,
    order_id int not null,
    refund_amount_usd decimal(10,2) not null,
    primary key (order_item_refund_id)
);


-- editarea coloanelor gordersresite
ALTER TABLE order_items
    CHANGE COLUMN order_it    order_id   INT NOT NULL,
    CHANGE COLUMN products_id product_id TINYINT NOT NULL,
    MODIFY COLUMN is_primary_item TINYINT NOT NULL;
    
-- descrierea tabelului
    DESCRIBE order_items;
    
    
    

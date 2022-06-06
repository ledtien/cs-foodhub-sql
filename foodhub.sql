drop database if exists food_db;
create database food_db;
use food_db;

create table users (
	id int primary key auto_increment,
    user_name varchar(255),
    user_password varchar(28),
    type_login varchar(20)
);

create table category(
	id int primary key auto_increment,
    category_name varchar(255),
    url_image varchar(512)
);

create table restaurants(
	id int primary key auto_increment,
    restaurant_name varchar(255),
    url_image varchar(512)
);

create table menu (
	id int primary key auto_increment,
    menu_name varchar(255),
    url_image varchar(512),
    rating tinyint,
    price int,
    menu_desc varchar(255),
    id_restaurant int,
    id_category int,
    foreign key (id_restaurant) references restaurants(id),
    foreign key (id_category) references category(id)
);

create table submenu (
	id int primary key auto_increment,
    sub_name varchar(255),
    price int,
    id_restaurant int,
    foreign key (id_restaurant) references restaurants(id)
);

create table menudetail (
	id int primary key auto_increment,
    menu_name varchar(255),
    id_submenu int,
    foreign key (id_submenu) references submenu(id)
);

create table masterstatus (
	id int primary key auto_increment,
    status_name varchar(255)
);

create table orders (
	id int primary key auto_increment,
    state_date datetime default now(),
    end_date datetime,
    id_status int,
    id_user int,
    foreign key (id_status) references masterstatus(id),
    foreign key (id_user) references users(id)
);

create table orderdetail (
	id_order int primary key,
    id_menu int,
    price int,
    foreign key (id_order) references orders(id),
    foreign key (id_menu) references menu(id)
);

create table reviews (
	id int primary key auto_increment,
    comments text,
    rating tinyint,
    id_user int,
    id_restaurant int,
    foreign key (id_user) references users(id),
    foreign key (id_restaurant) references restaurants(id)
);

create table state (
	id int primary key auto_increment,
    state_name varchar(255)
);

create table city (
	id int primary key auto_increment,
    city_name varchar(255),
    id_state int,
    foreign key (id_state) references state(id)
);

create table detailuser (
	id_user int primary key,
    full_name varchar(255),
    phone_number smallint,
    id_state int,
    id_city int,
    street text,
    foreign key (id_user) references users(id),
    foreign key (id_state) references state(id),
    foreign key (id_city) references city(id)
);

create table promo (
	id int primary key auto_increment,
    promo_name varchar(255),
    discount int,
    expired_date date
);

create table menu_promo (
	id int primary key auto_increment,
	id_menu int,
    id_promo int,
    foreign key (id_menu) references menu(id),
    foreign key (id_promo) references promo(id)
);
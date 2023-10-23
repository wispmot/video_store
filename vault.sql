create table if not exists hub_client
(
    client_key    integer not null
    constraint hub_client_pk
    primary key,
    load_date     timestamp,
    record_source varchar
);

create table if not exists hub_film
(
    film_key      integer not null
    constraint hub_film_pk
    primary key,
    load_date     timestamp,
    record_source varchar
);

create table if not exists hub_order
(
    order_key     integer not null
    constraint hub_order_pk
    primary key,
    load_date     timestamp,
    record_source varchar
);

create table if not exists hub_videotape
(
    videotape_key integer not null
    constraint hub_videotape_pk
    primary key,
    load_date     timestamp,
    record_source varchar
);

create table if not exists link_film_videotape
(
    link_key      integer not null
    constraint link_film_videotape_pk
    primary key,
    load_date     timestamp,
    record_source varchar,
    film_key      integer
    constraint link_film_videotape_hub_film_null_fk
    references hub_film,
    videotape_key integer
    constraint link_film_videotape___fk
    references hub_videotape
);

create table if not exists link_order_videotape
(
    link_key      integer not null
    constraint link_order_videotape_pk
    primary key,
    load_date     timestamp,
    record_source varchar,
    order_key     integer
    constraint link_order_videotape_hub_order_null_fk
    references hub_order,
    videotape_key integer
    constraint link_order_videotape_hub_videotape_null_fk
    references hub_videotape
);

create table if not exists link_order_client
(
    link_key      integer not null
    constraint link_order_client_pk
    primary key,
    load_date     timestamp,
    record_source varchar,
    order_key     integer
    constraint link_order_client_hub_order_null_fk
    references hub_order,
    client_key    integer
    constraint link_order_client_hub_client_null_fk
    references hub_client
);

create table if not exists satellite_client
(
    client_key    integer not null
    constraint satellite_client_hub_client_null_fk
    references hub_client,
    load_date     timestamp,
    record_source varchar,
    name          varchar,
    passport      varchar,
    phone_number  varchar
);

create table if not exists satellite_film
(
    film_key      integer not null
    constraint satellite_film_hub_film_null_fk
    references hub_film,
    load_date     timestamp,
    record_source varchar,
    name          varchar(255),
    genre         varchar(255),
    release_year  integer
    );

create table if not exists satellite_order
(
    order_key     integer not null
    constraint satellite_order_hub_order_null_fk
    references hub_order,
    load_date     timestamp,
    record_source varchar,
    issue_date    date,
    return_date   date
);

create table if not exists satellite_videotape
(
    videotape_key    integer not null
    constraint satellite_videotape_hub_videotape_null_fk
    references hub_videotape,
    load_date        timestamp,
    record_source    varchar,
    manufacture_date date
);
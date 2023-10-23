create table if not exists film
(
    id           integer not null
    constraint film_pk
    primary key,
    name         varchar(255),
    genre        varchar(255),
    release_year integer
    );

create table if not exists client
(
    id           integer not null
    constraint client_pk
    primary key,
    name         varchar,
    passport     varchar,
    phone_number varchar
);

create table if not exists videotape
(
    id               integer not null
    constraint videotape_pk
    primary key,
    manufacture_date date,
    film_id          integer
    constraint videotape_film_null_fk
    references film
);

create table if not exists "order"
(
    id           integer not null
    constraint order_pk
    primary key,
    issue_date   date,
    return_date  date,
    client_id    integer
    constraint order_client_null_fk
    references client,
    videotape_id integer
    constraint order_videotape_null_fk
    references videotape
);
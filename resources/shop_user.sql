drop table if exists shop_user;

/*==============================================================*/
/* Table: shop_user                                             */
/*==============================================================*/
create table shop_user
(
   ID                   char(32) not null,
   name                 varchar(20) not null,
   password             varchar(32) not null,
   phonenum             char(11) not null,
   money                float not null,
   avatar               varchar(50),
   regtime              char(19) not null,
   role                 char(1) not null,
   primary key (ID)
);

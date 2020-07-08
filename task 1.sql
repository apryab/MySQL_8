drop table if exists logs;
create table logs(
	created_at datetime,
    `table_name` varchar(100),
    prim_key bigint unsigned not null,
    `name` varchar(100)
) engine = ARCHIVE;


DELIMITER ||
create trigger add_to_logs_cat after insert on catalog
for each row
begin
	insert into logs value
    (now(), 'catalog', new.id, new.`name`);
end
||
DELIMITER ;

DELIMITER ||
create trigger add_to_logs_prod after insert on products
for each row
begin
	insert into logs value
    (now(), 'products', new.id, new.`name`);
end
||
DELIMITER ;

DELIMITER ||
create trigger add_to_logs_users after insert on users
for each row
begin
	insert into logs value
    (now(), 'users', new.id, new.firstname);
end
||
DELIMITER ;


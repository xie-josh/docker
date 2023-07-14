CREATE USER 'read_only_user'@'%' IDENTIFIED BY 'read_only_user';
GRANT SELECT ON *.* TO 'read_only_user'@'%' WITH GRANT OPTION;
flush privileges;
create database teamcity collate utf8_bin;
create user tcuser identified by '<password>';
grant all privileges on teamcity.* to tcuser;
grant process on *.* to tcuser;

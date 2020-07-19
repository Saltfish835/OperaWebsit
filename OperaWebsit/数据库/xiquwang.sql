/*



戏曲网的数据库全部操作



*/


/*
	创建数据库
*/
create database xiquwang;
use xiquwang;

/*
	管理员表
*/
create table t_admin(
	id int primary key auto_increment,
    admin_name varchar(50),
    admin_password varchar(50)
);

/*
	创建公告表
*/
create table t_notice(
	id int primary key auto_increment,
    content varchar(500),/*公告内容*/
    publication_time varchar(100)/*公告发表时间*/
);

/*
	用户表
*/
create table t_user(
	id int primary key auto_increment,
    user_name varchar(50),
    user_password varchar(50),
    email varchar(100)
);

/*
	戏曲表
*/
create table t_opera(
	id int primary key auto_increment,
    opera_name varchar(50),
    introduce varchar(500),/*戏曲简介*/
    publication_time varchar(100),/*戏曲发布时间*/
    watch_number int,/*戏曲观看次数*/
    collection_number int,/*收藏次数*/
    opera_status varchar(10),/*戏曲审核状态，取值为 未审核、正在审核、审核通过、审核未通过*/
    file_name varchar(100),/*戏曲文件名*/
    type_id int,/*戏曲类型*/
    user_id int/*戏曲发布者*/
);


/*
	戏曲类型表
*/
create table t_type(
	id int primary key auto_increment,
    type_name varchar(100)/*戏曲有哪些类型名称*/
);

/*
	戏曲收藏表
*/
create table t_collection(
	id int primary key auto_increment,
    collection_time varchar(100),/*什么时候点的收藏*/
	user_id int,/*哪个用户*/
    opera_id int/*收藏了哪个戏曲*/
);

/*
	戏曲评论表
*/
create table t_opera_comment(
	id int primary key auto_increment,
    content varchar(500),/*评论内容*/
    comment_status varchar(10),/*评论状态*/
    comment_time varchar(100),/*评论时间*/
    user_id int,/*是谁评论的*/
    opera_id int/*评论哪个戏剧的*/
);

/*
	留言表
*/
create table t_message(
	id int primary key auto_increment,
    content varchar(500),/*留言内容*/
    message_time varchar(100),/*留言时间*/
    user_id int/*谁留的言*/
);

/*
	留言评论表
*/
create table t_message_comment(
	id int primary key auto_increment,
    content varchar(500),/*评论内容*/
    comment_time varchar(100),/*评论时间*/
    message_id int,/*哪个留言下的评论*/
    user_id int/*哪个用户发的评论*/
);

/*
	添加管理员
*/
insert into t_admin(admin_name,admin_password) values('hehe','123');
select id,admin_name as adminName,admin_password as adminPassword from t_admin;


/*
	添加戏曲种类
*/
insert into t_type(type_name) values('京剧');
insert into t_type(type_name) values('越剧');
insert into t_type(type_name) values('川剧');
insert into t_type(type_name) values('秦腔');
insert into t_type(type_name) values('昆曲');
insert into t_type(type_name) values('黄梅戏');
insert into t_type(type_name) values('二人转');
insert into t_type(type_name) values('皮影戏');

-- Create a database

CREATE DATABASE blogs;

-- Select the database

USE blogs;

-- Create table: roles

CREATE TABLE roles (
    role_id smallint primary key auto_increment,
    role_name varchar(50) not null
)

-- Create table: users

CREATE TABLE users (
    user_id int primary key auto_increment,
    email VARCHAR(100) not null,
    password VARCHAR(255) not null,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    token VARCHAR(50),
    token_validity datetime,
    user_role smallint,
    foreign key (user_role) references roles(role_id) on update cascade on delete cascade
)

-- Create table: posts

CREATE TABLE posts (
    post_id int primary key auto_increment,
    post_date datetime default current_timestamp,
    post_title varchar(100) not null,
    post_content text not null,
    post_author int,
    foreign key (post_author) references users(user_id) on update cascade on delete cascade
)

-- Create table: tags

CREATE TABLE tags (
    tag_id int primary key auto_increment,
    tag_name varchar(50) not null
)

-- Create table: post-tags

CREATE TABLE post_tags (
    post_id int,
    tag_id int,
    primary key(post_id, tag_id),
    foreign key (post_id) references posts(post_id) on update cascade on delete cascade,
    foreign key (tag_id) references tags(tag_id) on update cascade on delete cascade
)

-- Create table: comments

CREATE TABLE comments (
    comment_id int primary key auto_increment,
    comment_date datetime default current_timestamp,
    comment_content text not null,
    comment_author int,
    comment_post int,
    foreign key (comment_author) references users(user_id) on update cascade on delete cascade,
    foreign key (comment_post) references posts(post_id) on update cascade on delete cascade
)

-- Create table: post_reactions

CREATE TABLE post_reactions (
    react_user int,
    react_post int,
    type bool not null,
    primary key(react_user, react_post),
    foreign key (react_user) references users(user_id) on update cascade on delete cascade,
    foreign key (react_post) references posts(post_id) on update cascade on delete cascade
)
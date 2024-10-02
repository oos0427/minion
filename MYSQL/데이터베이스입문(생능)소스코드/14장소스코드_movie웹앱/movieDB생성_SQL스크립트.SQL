
-- 웹 앱 프로그램에서 접속할 사용자 계정 생성
CREATE USER 'movie_user'@'%' IDENTIFIED BY '1234' ;

-- movieDB에 대해서만 모든 권한을 부여
GRANT ALL ON movieDB.* TO 'movie_user'@'%' WITH GRANT OPTION ; 


DROP DATABASE IF EXISTS movieDB ;
CREATE DATABASE IF NOT EXISTS movieDB ;

-- SQL 명령어를 실행할 대상인 기본 데이터베이스를 movieDB로 지정
USE movieDB ;

-- movie 테이블 생성
CREATE TABLE IF NOT EXISTS movie (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
title varchar(20) NOT NULL,
genre varchar(20) NULL, 
myear date NULL, 
price int NULL, 
photo varchar(50) NULL ) ;
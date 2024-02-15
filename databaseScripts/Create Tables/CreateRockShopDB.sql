USE master
IF EXISTS(select * from sys.databases where name='RockShopDB')
DROP DATABASE RockShopDB

CREATE DATABASE RockShopDB;
GO

USE RockShopDB;
GO

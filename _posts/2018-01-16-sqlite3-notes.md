---
layout: single
title:  "Notes on using sqlite3"
categories: programming 
tags: database sqlite3
---

Below we assume that the SQLite3 database is stored in a file 'mydb'
* To list all tables in a database
~~~ bash
    sqlite3 mydb .tables
~~~
  In an interactive session, `.tables` can be also used to list all tables.
* To print the schema of a database into a text file
~~~ bash
    sqlite3 mydb .schema > mydb_schema.sql
~~~
* To list the first 10 rows of a table (mytable) in an interactive session
~~~ sql
    SELECT * FROM mytable WHERE ROWID<=10;
~~~
* To use foreign keys in sqlite3, say column `ParentID` in table `ChildTable` should reference the column `ID` in table `ParentTable`
~~~ sql
    CREATE TABLE ParentTable (
      ID INTEGER PRIMARY KEY,
      NAME TEXT
    );
    CREATE TABLE ChildTable (
      ID INTEGER PRIMARY KEY,
      ParentID INTEGER,
      NAME TEXT,
      FOREIGN KEY(ParentID) REFERENCES ParentTable(ID)
    );
~~~
   Notice that in the last parameter of create table, `ParentID` is used as a parameter of the function `FOREIGN KEY`, and the parent table and foreign key column are defined by the format `ParentTable(ID)`. The two parentheses are interpreted differently.

* By default, the foreign key (FK) constraint is **disabled** in SQLite for back compatibilites. In order to turn FK constraint on, use
~~~ sql
   PRAGMA foreign_keys = ON;
~~~
  To check whether FKs are enabled or not, use `PRAGMA foreign_keys`: `0` indicates that FK is turned off, and `1` indicate that FK is turned on.

* Insert items to a table
~~~ sql
   CREATE TABLE IF NOT EXISTS myTbl (ID INTEGER, NAME TEXT);
   INSERT INTO myTbl (ID, NAME) VALUES (1, 'David');
   INSERT INTO myTbl (ID, NAME) VALUES (2, 'Roland');
   INSERT INTO myTbl VALUES (3, 'Klas');
   SELECT * FROM myTbl;
~~~

* Update an item
~~~ sql
   UPDATE myTbl SET NAME='Martin' WHERE ID=3;
   SELECT * FROM myTbl;
~~~

* Delete items from a table (following the previous example of inserting items to a table)
~~~ sql
  -- delete one item
  DELETE FROM myTbl WHERE NAME='David';
  -- delete all items
  DELETE FROM myTbl;
~~~
## Further readings

1. [Foreign key contraints in SQLite](https://sqlite.org/foreignkeys.html)

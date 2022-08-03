--  CS430 database schema
--  Module 6: Lab
--  Author: Elita Danilyuk
-- 

DROP TABLE IF EXISTS author_phone,
                     publisher_phone,
                     borrowed_by,
                     written_by,
                     book,
                     author,
                     publisher,
                     member,
                     phone;

CREATE TABLE author (
    author_id       INT             NOT NULL,
    first_name      VARCHAR(40)     NOT NULL,
    last_name       VARCHAR(40)     NOT NULL,
    PRIMARY KEY (author_id)
);

CREATE TABLE publisher (
   pub_id       INT             NOT NULL,
   pub_name     VARCHAR(40)     NOT NULL,
   PRIMARY KEY (pub_id)
);

CREATE TABLE member (
    member_id    INT            NOT NULL,
    first_name   VARCHAR(40)    NOT NULL,
    last_name    VARCHAR(40)    NOT NULL,
    dob          DATE           NOT NULL,
    PRIMARY KEY (member_id)
);

CREATE TABLE phone (
    phone_number     VARCHAR(20)     NOT NULL,
    phone_type       VARCHAR(10)     NOT NULL,
    PRIMARY KEY (phone_number)
);

CREATE TABLE book (
    isbn        VARCHAR(20)     NOT NULL,
    num_copies  INT,
    shelf_num   INT,
    floor_num   INT,
    title       VARCHAR(60)     NOT NULL,
    publisher   INT,
    pub_date    DATE,
    FOREIGN KEY (publisher) REFERENCES publisher (pub_id) ON DELETE CASCADE,
    PRIMARY KEY (isbn)
);

CREATE TABLE publisher_phone (
    id              INT     NOT NULL,
    pub_id          INT     NOT NULL,
    phone_number    VARCHAR(20),
    FOREIGN KEY (pub_id) REFERENCES publisher (pub_id) ON DELETE CASCADE,
    FOREIGN KEY (phone_number) REFERENCES phone (phone_number) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

CREATE TABLE written_by (
    id              INT     NOT NULL,
    author_id       INT     NOT NULL,
    isbn    VARCHAR(20),
    FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE CASCADE,
    FOREIGN KEY (isbn) REFERENCES book (isbn) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

CREATE TABLE borrowed_by (
    id              INT         NOT NULL,
    member_id       INT         NOT NULL,
    isbn            VARCHAR(20) NOT NULL,
    checkout_date   DATE        NOT NULL,
    checkin_date    DATE,
    FOREIGN KEY (isbn) REFERENCES book (isbn) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

CREATE TABLE author_phone (
    id              INT         NOT NULL, 
    author_id       INT         NOT NULL,
    phone_number    VARCHAR(20),
    FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE CASCADE,
    FOREIGN KEY (phone_number) REFERENCES phone (phone_number) ON DELETE CASCADE,
    PRIMARY KEY (id)
);
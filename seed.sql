DROP DATABASE IF EXISTS riocard;
CREATE DATABASE riocard;

\c riocard;

CREATE TABLE users (
    ID SERIAL PRIMARY KEY,
    name VARCHAR,
    age INTEGER
);

CREATE TABLE cards (
    ID SERIAL PRIMARY KEY,
    code VARCHAR,
    user_id INTEGER
);

INSERT INTO users (name, age) VALUES ('Lucas', 23);
INSERT INTO cards (code, user_id) VALUES ('first', 1);
DROP DATABASE IF EXISTS riocard;
CREATE DATABASE riocard;

\c riocard;

CREATE TABLE cards (
    ID SERIAL PRIMARY KEY,
    code VARCHAR
);

INSERT INTO cards (code) VALUES ('first');
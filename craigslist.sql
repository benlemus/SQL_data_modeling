DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist


CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region TEXT
);

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    city TEXT
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    prefered_region_id INT REFERENCES regions
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL, 
    post_desc TEXT,
    user_id INT NOT NULL REFERENCES users,
    city_id INT REFERENCES cities,
    region_id INT REFERENCES regions
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category TEXT
);

CREATE TABLE categories_posts(
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories,
    post_id INT REFERENCES posts
);


INSERT INTO regions(region)
VALUES
    ('Northeast'),
    ('Midwest'),
    ('South'),
    ('West');

INSERT INTO cities(city)
VALUES
    ('San Francisco'),
    ('Seattle'),
    ('Chicago'),
    ('New York'),
    ('Atlanta'),
    ('Los Angeles'),
    ('Ohio');

INSERT INTO users(username, prefered_region_id)
VALUES
    ('kornicorpia258', 3),
    ('milothepuppy564', 1),
    ('starbucksluvr221', 1),
    ('dontworryimcooking', 2),
    ('marvinthegreat', 4);

INSERT INTO posts(title, post_desc, user_id, city_id, region_id)
VALUES
    ('Bike For Sale', 'Im selling a new bike, great condition, just dont need it anymore', 5, 6, 4),
    ('Lawn Mowing', 'I will mow your lawn for you!', 2, 4, 1),
    ('Coffee Club!', 'Join our club! We meet once a week and talk beans!', 3, 2, 4),
    ('Looking for gaming friends', 'I am lookin for some new people to game with! Message me if you are interested', 4, 7, 2);

INSERT INTO categories(category)
VALUES
    ('Jobs'),
    ('Items for Sale'),
    ('Gigs'),
    ('misc'),
    ('Discussion Forums');

INSERT INTO categories_posts(category_id, post_id)
VALUES
    (2, 1),
    (1, 2),
    (5, 3),
    (4, 4);


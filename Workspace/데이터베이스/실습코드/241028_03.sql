use bookstore;


CREATE TABLE wine_white (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    fixed_acidity FLOAT,
    volatile_acidity FLOAT,
    citric_acid FLOAT,
    residual_sugar FLOAT,
    chlorides FLOAT,
    free_sulfur_dioxide FLOAT,
    total_sulfur_dioxide FLOAT,
    density FLOAT,
    pH FLOAT,
    sulphates FLOAT,
    alcohol FLOAT,
    quality INT
);

select * from iris;

select * from iris where iris.class = 'iris-setosa';

select * from wine_white where id <= 50;
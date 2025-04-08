CREATE DATABASE if not exists gamify_gym;

USE gamify_gym;

/* TODOS os alimentos tem seus atributos baseados em 1g (uma grama)*/
CREATE TABLE if not exists foods(
	id_food INT AUTO_INCREMENT PRIMARY KEY,
    name_food VARCHAR(25) NOT NULL,
    calories DOUBLE NOT NULL,
    proteins DOUBLE NOT NULL,
    carbohydrates DOUBLE NOT NULL,
    total_sugar DOUBLE NOT NULL,
    added_sugar DOUBLE NOT NULL,
    total_fats DOUBLE NOT NULL,
    trans_fats DOUBLE NOT NULL,
    monounsaturated_fats DOUBLE NOT NULL,
    polyunsaturated_fats DOUBLE NOT NULL,
    satured_fats DOUBLE NOT NULL,
    fibers DOUBLE NOT NULL,
	sodium DOUBLE NOT NULL
);

DELIMITER //
CREATE PROCEDURE add_food (
	IN p_name VARCHAR(25),
    IN p_calories DOUBLE,
    IN p_proteins DOUBLE,
    IN p_carbohydrates DOUBLE,
    IN p_fats DOUBLE, 
    IN p_fibers DOUBLE, 
	IN p_sodium DOUBLE 
)
BEGIN
	INSERT INTO foods(name, calories, proteins, carbohydrates, fats, fibers, sodium)
	VALUES (p_name, p_calories, p_proteins, p_carbohydrates, p_fats, p_fibers, p_sodium);
END //
DELIMITER ;

CREATE TABLE if not exists exercises(
	id_exercise INT AUTO_INCREMENT PRIMARY KEY,
    name_exercises VARCHAR(25) NOT NULL,
    muscles VARCHAR(25) NOT NULL -- Músculos que são treinados nesse exercício separados por vírgulas
);

CREATE TABLE if not exists workouts(
	id_workout INT AUTO_INCREMENT PRIMARY KEY,
    name_workouts VARCHAR(25) NOT NULL,
    description VARCHAR(255) NOT NULL -- Espaço para o usuário colocar observações e etc
);

/* Tabela para reduzir a redundãncia dos dados e associar as tabelas treinos e exercicios*/
CREATE TABLE if not exists exercises_workout(
	id_exercise_workout INT AUTO_INCREMENT PRIMARY KEY,
	min_reps TINYINT, -- Atributo vinculado ao alcance de repetições
    max_reps TINYINT, -- Atributo vinculado ao alcance de repetições
    time TIME, -- Tempo em um exercício(prancha por exemplo)
    n_sets TINYINT NOT NULL,
    exercise_id INT,
    workout_id INT
);
ALTER TABLE exercises_workout
ADD CONSTRAINT fk_exercise
FOREIGN KEY (exercise_id) REFERENCES exercises(id_exercise);

ALTER TABLE exercises_workout
ADD CONSTRAINT fk_workout
FOREIGN KEY (workout_id) REFERENCES workouts(id_workout);

CREATE TABLE if not exists user(
	id_user INT AUTO_INCREMENT PRIMARY KEY,
    name_user VARCHAR(25) NOT NULL,
    password VARCHAR(25) NOT NULL
);
CREATE TABLE if not exists personal_trainers(
	id_personal_trainer INT AUTO_INCREMENT PRIMARY KEY,
    cref VARCHAR(20) NOT NULL UNIQUE
);

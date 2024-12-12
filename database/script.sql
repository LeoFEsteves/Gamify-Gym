CREATE DATABASE gamify_gym;

USE gamify_gym;

/* TODOS os alimentos tem seus atributos baseados em 1g (uma grama)*/
CREATE TABLE alimentos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    calories DOUBLE NOT NULL,
    proteins DOUBLE NOT NULL,
    carbohydrates DOUBLE NOT NULL,
    fats DOUBLE NOT NULL,
    fibers DOUBLE NOT NULL,
	sodium DOUBLE NOT NULL
);

DELIMITER //
CREATE PROCEDURE AddAlimento (
	IN p_name VARCHAR(25),
    IN p_calories DOUBLE,
    IN p_proteins DOUBLE,
    IN p_carbohydrates DOUBLE,
    IN p_fats DOUBLE, 
    IN p_fibers DOUBLE, 
	IN p_sodium DOUBLE 
)
BEGIN
	INSERT INTO alimentos(name, calories, proteins, carbohydrates, fats, fibers, sodium)
	VALUES (p_name, p_calories, p_proteins, p_carbohydrates, p_fats, p_fibers, p_sodium);
END //
DELIMITER ;

CREATE TABLE exercicios(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    muscles VARCHAR(25) NOT NULL -- Músculos que são treinados nesse exercício separados por vírgulas
);

CREATE TABLE treinos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(255) NOT NULL -- Espaço para o usuário colocar observações e etc
);

/* Tabela para reduzir a redundãncia dos dados e associar as tabelas treinos e exercicios*/
CREATE TABLE exercicios_treino(
	id INT AUTO_INCREMENT PRIMARY KEY,
	min_reps TINYINT NOT NULL, -- Atributo vinculado ao alcance de repetições
    max_reps TINYINT NOT NULL, -- Atributo vinculado ao alcance de repetições
    n_sets TINYINT NOT NULL,
    exercicio_id INT,
    treinos_id INT
);
ALTER TABLE exercicios_treino
ADD CONSTRAINT fk_exercicio
FOREIGN KEY (exercicio_id) REFERENCES exercicios(id);

ALTER TABLE exercicios_treino
ADD CONSTRAINT fk_treino
FOREIGN KEY (treino_id) REFERENCES treinos(id);

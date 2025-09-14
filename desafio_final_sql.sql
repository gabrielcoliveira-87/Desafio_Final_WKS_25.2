CREATE DATABASE desafio_final;
USE desafio_final;

CREATE TABLE cliente (
     cliente_id INT PRIMARY KEY auto_increment,
     nome VARCHAR(100) NOT NULL,
     CPF VARCHAR(14) NOT NULL UNIQUE,
     email VARCHAR(100) UNIQUE,
     endereco VARCHAR(255) NOT NULL,
     telefone VARCHAR(20) NOT NULL,
     data_cadastro DATE NOT NULL
     );
 
CREATE TABLE funcionários (
     funcionario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
     endereco VARCHAR(50) NOT NULL,
     nome VARCHAR(100) NOT NULL,
     CPF VARCHAR(14) NOT NULL UNIQUE,
     Cargo VARCHAR(50),
     data_de_admissao DATE NOT NULL
     );
     
CREATE TABLE veículo (
     veiculo_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
     placa VARCHAR(10) NOT NULL UNIQUE,
     modelo VARCHAR(100) NOT NULL,
     cor VARCHAR(50),
     ano_fabricado YEAR NOT NULL,
     valor_aluguel DECIMAL(10,2) NOT NULL,
	 status ENUM('disponível', 'alugado', 'manutenção') NOT NULL default 'disponível'
     );

CREATE TABLE aluguel (
      aluguel_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      cliente_id INT NOT NULL,
      funcionario_id INT NOT NULL,
	  veiculo_id INT NOT NULL,
	  data_inicio DATE NOT NULL,
      data_final_prevista DATE NOT NULL,
      valor_total_final DECIMAL(10,2),
      status_do_aluguel ENUM('ativo', 'finalizado', 'atrasado') NOT NULL default 'ativo',
      FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
      FOREIGN KEY (funcionario_id) REFERENCES funcionários(funcionario_id),
	  FOREIGN KEY (veiculo_id) REFERENCES veículo(veiculo_id)
      );
      
CREATE TABLE manutenção (
        manutencao_id INT PRIMARY KEY NOT NULL auto_increment,
		custo DECIMAL(10,2),
        data_manutencao DATE NOT NULL,
        descricao_servico VARCHAR(50),
        veiculo_id INT NOT NULL,
        funcionario_id INT NOT NULL,
        FOREIGN KEY (funcionario_id) REFERENCES funcionários(funcionario_id),
        FOREIGN KEY (veiculo_id) REFERENCES veículo(veiculo_id)
        );
        
 CREATE TABLE pagamento (
        pagamento_id INT PRIMARY KEY NOT NULL auto_increment,
        valor DECIMAL(10,2) NOT NULL,
        forma_de_pagar ENUM('cartao','pix','boleto') NOT NULL,
        data_pagamento DATE NOT NULL,
        status_pagamento ENUM('pago', 'pendente', 'cancelado') NOT NULL default 'pendente',
        aluguel_id INT NOT NULL,
        FOREIGN KEY (aluguel_id) REFERENCES aluguel(aluguel_id)
        );
        
      INSERT INTO cliente (nome, CPF, email, endereco, telefone, data_cadastro) VALUES
('Ana Silva', '11111111111', 'ana@email.com', 'Rua A, Fortaleza', '85988880001', '2024-01-10'),
('Bruno Costa', '22222222222', 'bruno@email.com', 'Rua B, Fortaleza', '85988880002', '2024-02-12'),
('Carla Mendes', '33333333333', 'carla@email.com', 'Rua C, Caucaia', '85988880003', '2024-03-15'),
('Diego Rocha', '44444444444', 'diego@email.com', 'Rua D, Maracanaú', '85988880004', '2024-04-20'),
('Eduarda Lima', '55555555555', 'eduarda@email.com', 'Rua E, Sobral', '85988880005', '2024-05-05'),
('Felipe Gomes', '66666666666', 'felipe@email.com', 'Rua F, Fortaleza', '85988880006', '2024-06-18'),
('Gabriela Souza', '77777777777', 'gabriela@email.com', 'Rua G, Fortaleza', '85988880007', '2024-07-22'),
('Henrique Alves', '88888888888', 'henrique@email.com', 'Rua H, Juazeiro', '85988880008', '2024-08-01'),
('Isabela Freitas', '99999999999', 'isabela@email.com', 'Rua I, Caucaia', '85988880009', '2024-09-09');

INSERT INTO funcionários (endereco, nome, CPF, Cargo, data_de_admissao) VALUES
('Av A, Fortaleza', 'João Pereira', '10101010101', 'Atendente', '2022-01-01'),
('Av B, Sobral', 'Larissa Moraes', '20202020202', 'Gerente', '2021-02-15'),
('Av C, Maracanaú', 'Marcos Vinícius', '30303030303', 'Vendas', '2023-03-20'),
('Av D, Fortaleza', 'Beatriz Nunes', '40404040404', 'Financeiro', '2020-04-25'),
('Av E, Fortaleza', 'Carlos Eduardo', '50505050505', 'Mecânico', '2019-05-30'),
('Av F, Caucaia', 'Daniela Costa', '60606060606', 'Atendente', '2022-06-10'),
('Av G, Fortaleza', 'Eduardo Ramos', '70707070707', 'Mecânico', '2023-07-15'),
('Av H, Juazeiro', 'Fernanda Lima', '80808080808', 'Vendas', '2021-08-18'),
('Av I, Fortaleza', 'Gustavo Souza', '90909090909', 'Atendente', '2020-09-05');

INSERT INTO veículo (placa, modelo, cor, ano_fabricado, valor_aluguel, status) VALUES
('AAA1A11', 'Fiat Uno', 'Branco', 2018, 120.00, 'disponível'),
('BBB2B22', 'VW Gol', 'Prata', 2019, 150.00, 'disponível'),
('CCC3C33', 'Chevrolet Onix', 'Preto', 2020, 180.00, 'disponível'),
('DDD4D44', 'Honda Civic', 'Cinza', 2021, 250.00, 'alugado'),
('EEE5E55', 'Toyota Corolla', 'Branco', 2022, 300.00, 'disponível'),
('FFF6F66', 'Ford Ka', 'Vermelho', 2017, 110.00, 'disponível'),
('GGG7G77', 'Renault Sandero', 'Azul', 2019, 140.00, 'manutenção'),
('HHH8H88', 'Nissan Versa', 'Prata', 2020, 200.00, 'disponível'),
('III9I99', 'Hyundai HB20', 'Preto', 2021, 190.00, 'disponível');

INSERT INTO aluguel (cliente_id, funcionario_id, veiculo_id, data_inicio, data_final_prevista, valor_total_final, status_do_aluguel) VALUES
(1, 1, 1, '2024-07-01', '2024-07-05', 480.00, 'finalizado'),
(2, 2, 2, '2024-07-10', '2024-07-12', 300.00, 'finalizado'),
(3, 3, 3, '2024-08-01', '2024-08-04', 540.00, 'finalizado'),
(4, 4, 4, '2024-08-15', '2024-08-18', 750.00, 'ativo'),
(5, 5, 5, '2024-09-01', '2024-09-05', 1200.00, 'ativo'),
(6, 6, 6, '2024-09-10', '2024-09-12', 330.00, 'finalizado'),
(7, 7, 7, '2024-09-15', '2024-09-18', 420.00, 'atrasado'),
(8, 8, 8, '2024-09-20', '2024-09-23', 600.00, 'ativo'),
(9, 9, 9, '2024-09-25', '2024-09-28', 570.00, 'ativo');

INSERT INTO manutenção (custo, data_manutencao, descricao_servico, veiculo_id, funcionario_id) VALUES
(500.00, '2024-05-10', 'Troca de motor', 7, 5),
(150.00, '2024-06-15', 'Troca de pneus', 1, 7),
(200.00, '2024-07-01', 'Revisão elétrica', 2, 5),
(300.00, '2024-07-20', 'Troca de freios', 3, 7),
(100.00, '2024-08-05', 'Alinhamento', 6, 5),
(250.00, '2024-08-12', 'Troca de suspensão', 4, 7),
(180.00, '2024-08-25', 'Troca de óleo', 8, 5),
(400.00, '2024-09-01', 'Revisão completa', 9, 7),
(220.00, '2024-09-10', 'Troca de bateria', 5, 5);

INSERT INTO pagamento (valor, forma_de_pagar, data_pagamento, status_pagamento, aluguel_id) VALUES
(480.00, 'cartao', '2024-07-06', 'pago', 1),
(300.00, 'pix', '2024-07-13', 'pago', 2),
(540.00, 'boleto', '2024-08-05', 'pago', 3),
(750.00, 'cartao', '2024-08-15', 'pendente', 4),
(1200.00, 'pix', '2024-09-02', 'pago', 5),
(330.00, 'cartao', '2024-09-13', 'pago', 6),
(420.00, 'boleto', '2024-09-20', 'pendente', 7),
(600.00, 'pix', '2024-09-21', 'pago', 8),
(570.00, 'cartao', '2024-09-26', 'pendente', 9);

UPDATE aluguel SET status_do_aluguel = 'finalizado', valor_total_final = 720.00 WHERE aluguel_id = 1;

UPDATE pagamento SET status_pagamento = 'pago' WHERE aluguel_id = 3;
     
     


 
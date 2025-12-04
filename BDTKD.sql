studentCREATE DATABASE tkd;

USE tkd;

CREATE TABLE student (
  id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(80) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  password VARCHAR(32) NOT NULL,
  birth_date DATE NOT NULL,
  gender VARCHAR(30) NOT NULL,
  belt VARCHAR(30) NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE training (
  id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
  training_type VARCHAR(30) NOT NULL,
  training_date DATE NOT NULL,
  student_id BIGINT(20) NOT NULL,
  CONSTRAINT fk_training_student
    FOREIGN KEY (student_id) REFERENCES student(id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE events (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(150)  NOT NULL,
    description TEXT          NULL,
    event_date  DATE          NOT NULL,
    type        VARCHAR(30)   NOT NULL,
    created_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO events (title, description, event_date, type) VALUES
-- JANEIRO 2025 (retorno após férias em 13/01)
('Retorno às Atividades 2025', 'Reinício das aulas com alongamento, revisão de fundamentos básicos e apresentação do calendário anual.', '2025-01-13', 'FESTIVAL'),
('Seminário de Fundamentos Técnicos', 'Treino especial voltado para base, postura, guarda e deslocamentos.', '2025-01-18', 'SEMINARIO'),
('Treino Físico Intensivo de Verão', 'Sessão focada em condicionamento físico, resistência e explosão para chutes.', '2025-01-25', 'SEMINARIO'),
('Pré-avaliação de Faixa – Janeiro', 'Simulação de exame para identificar pontos de melhoria dos alunos iniciantes.', '2025-01-30', 'EXAME'),

-- FEVEREIRO 2025
('Seminário de Chutes Básicos e Intermediários', 'Trabalho focado em Ap Chagi, Dollyo Chagi, Yop Chagi e combinações.', '2025-02-08', 'SEMINARIO'),
('Festival Infantil de Verão', 'Apresentação dos alunos kids com demonstração de técnicas e brincadeiras lúdicas.', '2025-02-15', 'FESTIVAL'),
('Exame de Faixa – 1º Bimestre', 'Avaliação oficial para mudança de faixa das turmas infantil e juvenil.', '2025-02-22', 'EXAME'),
('Fechamento de Inscrições para Campeonato Regional', 'Último dia para confirmar participação no campeonato regional de março.', '2025-02-28', 'FECHAMENTO'),

-- MARÇO 2025
('Campeonato Regional de Taekwondo', 'Competição regional com lutas e poomsae, categorias mirim, infantil e juvenil.', '2025-03-09', 'CAMPEONATO'),
('Treino Tático de Luta (Kyorugi)', 'Ajustes de distância, tempo de ataque, defesa e contra-ataque.', '2025-03-15', 'SEMINARIO'),
('Seminário de Poomsae – Taeguk 1 a 3', 'Correção detalhada de postura, ritmo e aplicações dos primeiros poomsae.', '2025-03-22', 'SEMINARIO'),
('Festival de Poomsae Iniciante', 'Apresentação interna dos alunos iniciantes executando suas primeiras formas.', '2025-03-29', 'FESTIVAL'),

-- ABRIL 2025
('Treino Especial de Defesa Pessoal', 'Introdução a técnicas de defesa pessoal aplicadas ao cotidiano.', '2025-04-05', 'SEMINARIO'),
('Open TKD Academy – Torneio Interno', 'Campeonato interno com foco em integração entre turmas e níveis diferentes.', '2025-04-12', 'CAMPEONATO'),
('Exame de Faixa – 2º Bimestre', 'Avaliação técnica teórica e prática para progressão de faixa.', '2025-04-19', 'EXAME'),
('Festival de Família na Academia', 'Evento aberto para familiares acompanharem treinos e demonstrações especiais.', '2025-04-26', 'FESTIVAL'),

-- MAIO 2025
('Semana de Condicionamento e Flexibilidade', 'Série de treinos voltados para alongamento, mobilidade e fortalecimento.', '2025-05-03', 'SEMINARIO'),
('Seminário de Poomsae – Taeguk 4 a 6', 'Revisão e aperfeiçoamento de poomsae intermediários para exame e campeonatos.', '2025-05-10', 'SEMINARIO'),
('Campeonato Municipal de Taekwondo', 'Participação oficial no campeonato municipal com atletas de todas as faixas.', '2025-05-18', 'CAMPEONATO'),
('Fechamento de Inscrições para Exame de Meio de Ano', 'Data limite para inscrição no exame de faixa de junho.', '2025-05-31', 'FECHAMENTO'),

-- JUNHO 2025
('Treino Simulado para Exame de Faixa', 'Simulação completa do exame com feedback individual dos instrutores.', '2025-06-07', 'SEMINARIO'),
('Exame de Faixa – Meio de Ano', 'Exame oficial para mudança de faixa de todas as turmas.', '2025-06-14', 'EXAME'),
('Festival Interno de Quebra de Tábuas', 'Demonstração de técnicas de chute e soco com quebras controladas.', '2025-06-21', 'FESTIVAL'),
('Fechamento do Semestre Letivo', 'Encerramento das atividades do primeiro semestre e apresentação de resultados.', '2025-06-28', 'FECHAMENTO'),

-- JULHO 2025
('Treino Especial de Poomsae Avançado', 'Treino específico para faixas verdes em diante focado em poomsae superiores.', '2025-07-05', 'SEMINARIO'),
('Campeonato Paulista de Taekwondo', 'Participação no campeonato estadual com atletas selecionados da academia.', '2025-07-13', 'CAMPEONATO'),
('Treino Técnico de Kyorugi Competitivo', 'Treino voltado para atletas que competem em luta, com foco em estratégias.', '2025-07-19', 'SEMINARIO'),
('Festival Interno de Inverno', 'Evento interno com apresentações de técnicas, poomsae e demonstrações especiais.', '2025-07-27', 'FESTIVAL'),

-- AGOSTO 2025
('Treino Técnico: Defesa Pessoal Urbana', 'Ênfase em liberações de pegada, controle de distância e uso de voz.', '2025-08-02', 'SEMINARIO'),
('Open Taekwondo Championships', 'Torneio aberto de lutas e poomsae com academias convidadas.', '2025-08-10', 'CAMPEONATO'),
('Pré-avaliação para Exame de Faixa', 'Revisão dos requisitos técnicos para o exame de setembro.', '2025-08-17', 'EXAME'),
('Festival Infantil de Chutes', 'Evento lúdico para turmas kids com desafios de chutes e coordenação.', '2025-08-24', 'FESTIVAL'),

-- SETEMBRO 2025
('Exame de Faixa – Início do 2º Semestre', 'Exame oficial de mudança de faixa para alunos que evoluíram no último ciclo.', '2025-09-06', 'EXAME'),
('Seminário de Poomsae Competitivo', 'Treino com foco em performance de poomsae para arbitragem e campeonatos.', '2025-09-13', 'SEMINARIO'),
('Campeonato Interacademias', 'Competição amistosa entre academias parceiras da região.', '2025-09-21', 'CAMPEONATO'),
('Fechamento de Inscrições para Festival de Outubro', 'Último dia para inscrição no festival temático do mês seguinte.', '2025-09-30', 'FECHAMENTO'),

-- OUTUBRO 2025
('Festival Temático – Dia das Crianças', 'Atividades especiais, gincanas e demonstrações voltadas para o público infantil.', '2025-10-12', 'FESTIVAL'),
('Treino Especial de Chutes Giratórios', 'Aprimoramento de técnicas como Tuit Chagi, Nare Chagi e combinações avançadas.', '2025-10-18', 'SEMINARIO'),
('Campeonato Aberto de Outono', 'Torneio com foco em poomsae e apresentações técnicas.', '2025-10-25', 'CAMPEONATO'),
('Fechamento de Inscrições para Exame Final de Ano', 'Encerramento das inscrições para o último exame de faixa do ano.', '2025-10-31', 'FECHAMENTO'),

-- NOVEMBRO 2025
('Treino Intensivo para Exame Final', 'Revisão geral de técnicas, poomsae e teoria do Taekwondo.', '2025-11-08', 'SEMINARIO'),
('Exame de Faixa – Encerramento do Ano Letivo', 'Último exame de faixa do ano para todas as turmas.', '2025-11-15', 'EXAME'),
('Festival de Encerramento de Projetos', 'Apresentação de alunos de projetos sociais e turmas especiais.', '2025-11-23', 'FESTIVAL'),
('Fechamento de Inscrições para Campeonato de Verão', 'Último dia para inscrição no campeonato de verão do próximo ano.', '2025-11-30', 'FECHAMENTO'),

-- DEZEMBRO 2025 (antes das férias 14/12–12/01)
('Campeonato de Verão – Etapa Interna', 'Competição interna para preparar atletas para eventos externos do próximo ano.', '2025-12-06', 'CAMPEONATO'),
('Treino Especial de Demonstrações', 'Preparação de sequências e apresentações para o evento de encerramento.', '2025-12-10', 'SEMINARIO'),
('Festival de Encerramento do Ano', 'Grande evento final com apresentações de alunos, entrega de certificados e homenagens.', '2025-12-13', 'FESTIVAL'),
('Fechamento Oficial do Ano Letivo', 'Comunicação formal do início do período de férias e orientações para o retorno em janeiro.', '2025-12-13', 'FECHAMENTO');

INSERT INTO events (title, description, event_date, type) VALUES
('Cerimônia de Abertura do Campeonato Regional',
 'Apresentação das equipes participantes, juramento dos atletas e boas-vindas oficiais.',
 '2025-03-09',
 'FESTIVAL'),

('Seminário Pós-Exame – Ajustes Técnicos',
 'Aula especial para revisar erros mais comuns observados durante o exame de faixa.',
 '2025-04-19',
 'SEMINARIO'),

('Confraternização de Meio de Ano',
 'Momento de integração com entrega simbólica de faixas e fotos em grupo.',
 '2025-06-14',
 'FESTIVAL'),

('Reunião Técnica de Arbitragem e Regras',
 'Encontro para explicar critérios de pontuação e conduta esportiva aos atletas e responsáveis.',
 '2025-08-10',
 'SEMINARIO'),

('Workshop Lúdico de Taekwondo para Crianças',
 'Atividade educativa explicando disciplina, respeito e princípios do Taekwondo de forma leve.',
 '2025-10-12',
 'SEMINARIO'),

('Treino Especial para Novos Graduados',
 'Treino voltado aos alunos aprovados no exame, focado em técnicas da nova faixa.',
 '2025-11-15',
 'SEMINARIO'),

('Desafio Interno de Poomsae por Equipes',
 'Mini competição interna entre grupos formados pelos próprios alunos durante o festival.',
 '2025-07-27',
 'CAMPEONATO');



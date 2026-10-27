ALTER TABLE alocacao ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE alocacao ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE bloco_horario ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE bloco_horario ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE curso ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE curso ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE disciplina ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE disciplina ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE disponibilidade_professor ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE disponibilidade_professor ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE periodo_atividade_quadro ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE periodo_atividade_quadro ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE professor ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE professor ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE quadro_horario ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE quadro_horario ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE recurso ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE recurso ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE recurso_sala ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE recurso_sala ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE sala ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE sala ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE tipo_recurso ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE tipo_recurso ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE tipo_sala ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE tipo_sala ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE turma ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE turma ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE usuario ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE usuario ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;

INSERT INTO usuario (nome, email, senha, status, created_at, updated_at, tipo_usuario) VALUES
('adm', 'adm@gini.com', '$2a$10$oHzz0j333M3RjQSQoRneK.RB0AxUr9T308Tt10fkhJposh9Mqhx.a', 'ATIVO', '2026-01-10 08:00:00', '2026-01-10 08:00:00', 'ADMINISTRADOR');

INSERT INTO usuario (nome, email, senha, status, created_at, updated_at, tipo_usuario) VALUES
('coordenador', 'coordenador@gini.com', '$2a$10$oHzz0j333M3RjQSQoRneK.RB0AxUr9T308Tt10fkhJposh9Mqhx.a', 'ATIVO', '2026-01-10 08:00:00', '2026-01-10 08:00:00', 'COORDENADOR');

-- Dados de Teste

INSERT INTO  professor ( nome, email,cidade,status) VALUES 
('Carlos','carlos@cps.sp.gov.br','Sorocaba','ATIVO'),
('Roberto','roberto@cps.sp.gov.br','Itu','ATIVO'),
('Julia','Julia@cps.sp.gov.br','Itu','INATIVO');

INSERT INTO professor (nome, email, cidade, status) VALUES
('Mariana', 'mariana@cps.sp.gov.br', 'Sorocaba', 'ATIVO'),
('Felipe', 'felipe@cps.sp.gov.br', 'Votorantim', 'ATIVO'),
('Patricia', 'patricia@cps.sp.gov.br', 'Salto', 'ATIVO'),
('Diego', 'diego@cps.sp.gov.br', 'Itu', 'INATIVO');

INSERT INTO curso (nome, periodicidade, status, duracao) VALUES
('Analise e Desenvolvimento de Sistemas', 'Semestral', 'ATIVO', 6),
('Gestão Tecnologia da Informação', 'Semestral', 'ATIVO', 6),
('Gestao Empresarial', 'Semestral', 'INATIVO', 4);

INSERT INTO curso (nome, periodicidade, status, duracao) VALUES
('Logistica', 'Semestral', 'ATIVO', 4),
('Eletronica Automotiva', 'Anual', 'ATIVO', 3),
('Projetos Mecânicos', 'Semestral', 'INATIVO', 4);

INSERT INTO tipo_sala (nome) VALUES
('Laboratorio'),
('Sala'),
('Auditorio'),
('Sala Maker');

INSERT INTO tipo_sala (nome) VALUES
('Sala de Reuniao'),
('Laboratorio de Informatica');

INSERT INTO bloco_horario (duracao,hora_inicio,hora_fim) VALUES 
(50,'13:20:00','14:10:00'),
(50,'14:10:00','15:00:00'),

(50,'15:10:00','16:00:00'),
(50,'16:00:00','16:50:00'),

(50,'17:00:00','17:50:00'),
(50,'17:50:00','18:40:00');

INSERT INTO bloco_horario (duracao, hora_inicio, hora_fim) VALUES
(50, '18:50:00', '19:40:00'),
(50, '19:40:00', '20:30:00'),
(50, '20:40:00', '21:30:00'),
(50, '21:30:00', '22:20:00');

INSERT INTO turma ( codigo,periodo,ano,numero_alunos,id_curso) VALUES
('2/2026','2',2026,25,2),
('1/2026','1',2026,40,1);

INSERT INTO turma (codigo, periodo, ano, numero_alunos, id_curso) VALUES
('1/2026-LOG', 1, 2026, 32, (SELECT id_curso FROM curso WHERE nome = 'Logistica')),
('2/2026-ADS', 2, 2026, 38, (SELECT id_curso FROM curso WHERE nome = 'Analise e Desenvolvimento de Sistemas')),
('1/2026-GTI', 1, 2026, 28, (SELECT id_curso FROM curso WHERE nome = 'Gestão Tecnologia da Informação'));

-- Segunda turma de Eletronica, para a oferta de Automacao Industrial.
INSERT INTO turma (codigo, periodo, ano, numero_alunos, id_curso) VALUES
('2/2026-EA', 2, 2026, 28, (SELECT id_curso FROM curso WHERE nome = 'Eletronica Automotiva'));

INSERT INTO disciplina (nome, carga_horaria, tipo_disciplina, periodo, modalidade, cod_disciplina, cor, id_curso, id_tipo_sala) VALUES
('Programação Multiplataforma', 80, 'Pratica', 1, 'Presencial', 'ISW044', '#2E86AB', 1, 1);

INSERT INTO disciplina (nome, carga_horaria, tipo_disciplina, periodo, modalidade, cod_disciplina, cor, id_curso, id_tipo_sala) VALUES
('Banco de Dados', 80, 'Teorica', 1, 'Presencial', 'BD001', '#F18F01',
 (SELECT id_curso FROM curso WHERE nome = 'Analise e Desenvolvimento de Sistemas'),
 (SELECT id_tipo_sala FROM tipo_sala WHERE nome = 'Laboratorio')),
('Engenharia de Software', 80, 'Teorica', 2, 'Presencial', 'ES002', '#C73E1D',
 (SELECT id_curso FROM curso WHERE nome = 'Analise e Desenvolvimento de Sistemas'),
 (SELECT id_tipo_sala FROM tipo_sala WHERE nome = 'Sala')),
('Gestao de Projetos', 40, 'Teorica', 2, 'Hibrida', 'GP101', '#6A994E',
 (SELECT id_curso FROM curso WHERE nome = 'Gestão Tecnologia da Informação'),
 (SELECT id_tipo_sala FROM tipo_sala WHERE nome = 'Sala')),
('Fundamentos de Logistica', 60, 'Teorica', 1, 'Presencial', 'LOG010', '#8338EC',
 (SELECT id_curso FROM curso WHERE nome = 'Logistica'),
 (SELECT id_tipo_sala FROM tipo_sala WHERE nome = 'Sala')),
('Automacao Industrial', 80, 'Pratica', 2, 'Presencial', 'AUT020', '#3A86FF',
 (SELECT id_curso FROM curso WHERE nome = 'Eletronica Automotiva'),
 (SELECT id_tipo_sala FROM tipo_sala WHERE nome = 'Sala Maker'));


-- Recorte ficticio da matriz: tres materias em cada turma de ADS.
INSERT INTO disciplina (nome, carga_horaria, tipo_disciplina, periodo, modalidade, cod_disciplina, cor, id_curso, id_tipo_sala)
SELECT dados.nome, dados.carga, dados.tipo, dados.periodo, 'Presencial', dados.codigo, dados.cor,
       c.id_curso, ts.id_tipo_sala
FROM (VALUES
 ('Lógica de Programação', 80, 'Pratica', 1, 'LP101', '#7C3AED', 'Analise e Desenvolvimento de Sistemas', 'Laboratorio'),
 ('Estruturas de Dados', 80, 'Pratica', 2, 'ED201', '#2563EB', 'Analise e Desenvolvimento de Sistemas', 'Laboratorio'),
 ('Interação Humano-Computador', 40, 'Teorica', 2, 'IHC202', '#0891B2', 'Analise e Desenvolvimento de Sistemas', 'Sala'),
 ('Projeto Integrador II', 40, 'Teorica', 2, 'PI202', '#059669', 'Analise e Desenvolvimento de Sistemas', 'Sala'),
 ('Fundamentos de Gestão', 80, 'Teorica', 1, 'FG101', '#B45309', 'Gestão Tecnologia da Informação', 'Sala'),
 ('Informática Aplicada à Gestão', 80, 'Pratica', 1, 'IG101', '#4F46E5', 'Gestão Tecnologia da Informação', 'Laboratorio'),
 ('Banco de Dados Gerenciais', 80, 'Pratica', 2, 'BDG201', '#0F766E', 'Gestão Tecnologia da Informação', 'Laboratorio')
) AS dados(nome, carga, tipo, periodo, codigo, cor, curso, tipo_sala)
JOIN curso c ON c.nome = dados.curso
JOIN tipo_sala ts ON ts.nome = dados.tipo_sala;

INSERT INTO sala ( codigo, capacidade, id_tipo_sala) VALUES
('LAB-01', 40, 1),
('SALA-12', 45, 2),
('AUD-01', 120, 3);

INSERT INTO sala (codigo, capacidade, id_tipo_sala) VALUES
('LAB-02', 40, (SELECT id_tipo_sala FROM tipo_sala WHERE nome = 'Laboratorio')),
('SALA-21', 50, (SELECT id_tipo_sala FROM tipo_sala WHERE nome = 'Sala')),
('MAKER-01', 30, (SELECT id_tipo_sala FROM tipo_sala WHERE nome = 'Sala Maker')),
('REUN-01', 12, (SELECT id_tipo_sala FROM tipo_sala WHERE nome = 'Sala de Reuniao'));

INSERT INTO tipo_recurso (nome) VALUES
('Equipamento'),
('Mobiliario'),
('Software'),
('Material Didatico');

INSERT INTO recurso (nome, id_tipo_recurso) VALUES
('Projetor multimidia', (SELECT id_tipo_recurso FROM tipo_recurso WHERE nome = 'Equipamento')),
('Computador desktop', (SELECT id_tipo_recurso FROM tipo_recurso WHERE nome = 'Equipamento')),
('Kit Arduino', (SELECT id_tipo_recurso FROM tipo_recurso WHERE nome = 'Material Didatico')),
('Mesa de reuniao', (SELECT id_tipo_recurso FROM tipo_recurso WHERE nome = 'Mobiliario')),
('Licenca IDE', (SELECT id_tipo_recurso FROM tipo_recurso WHERE nome = 'Software'));

INSERT INTO periodo_atividade_quadro (ano, data_inicio, data_fim, periodo, status) VALUES
(2026, '2026-02-02', '2026-06-30', 1, 'INATIVO'),
(2026, '2026-08-03', '2026-12-18', 2, 'ATIVO'),
(2025, '2025-08-04', '2025-12-19', 2, 'INATIVO');

-- Uma grade ativa por curso no segundo semestre letivo de 2026.
INSERT INTO quadro_horario (versao, data_criacao, status, id_curso, id_periodo_atividade_quadro) VALUES
(1, '2026-07-15 09:00:00', 'ATIVO',
 (SELECT id_curso FROM curso WHERE nome = 'Analise e Desenvolvimento de Sistemas'),
 (SELECT id_periodo_atividade_quadro FROM periodo_atividade_quadro WHERE ano = 2026 AND periodo = 2)),
(1, '2026-07-15 09:30:00', 'ATIVO',
 (SELECT id_curso FROM curso WHERE nome = 'Gestão Tecnologia da Informação'),
 (SELECT id_periodo_atividade_quadro FROM periodo_atividade_quadro WHERE ano = 2026 AND periodo = 2)),
(2, '2025-07-15 10:00:00', 'INATIVO',
 (SELECT id_curso FROM curso WHERE nome = 'Analise e Desenvolvimento de Sistemas'),
 (SELECT id_periodo_atividade_quadro FROM periodo_atividade_quadro WHERE ano = 2025 AND periodo = 2)),
(1, '2026-07-15 10:30:00', 'ATIVO',
 (SELECT id_curso FROM curso WHERE nome = 'Logistica'),
 (SELECT id_periodo_atividade_quadro FROM periodo_atividade_quadro WHERE ano = 2026 AND periodo = 2)),
(1, '2026-07-15 11:00:00', 'ATIVO',
 (SELECT id_curso FROM curso WHERE nome = 'Eletronica Automotiva'),
 (SELECT id_periodo_atividade_quadro FROM periodo_atividade_quadro WHERE ano = 2026 AND periodo = 2));

INSERT INTO professor_disciplina (id_professor, id_disciplina) VALUES
((SELECT id_professor FROM professor WHERE email = 'carlos@cps.sp.gov.br'), (SELECT id_disciplina FROM disciplina WHERE cod_disciplina = 'BD001')),
((SELECT id_professor FROM professor WHERE email = 'carlos@cps.sp.gov.br'), (SELECT id_disciplina FROM disciplina WHERE cod_disciplina = 'ISW044')),
((SELECT id_professor FROM professor WHERE email = 'mariana@cps.sp.gov.br'), (SELECT id_disciplina FROM disciplina WHERE cod_disciplina = 'ES002')),
((SELECT id_professor FROM professor WHERE email = 'felipe@cps.sp.gov.br'), (SELECT id_disciplina FROM disciplina WHERE cod_disciplina = 'GP101')),
((SELECT id_professor FROM professor WHERE email = 'patricia@cps.sp.gov.br'), (SELECT id_disciplina FROM disciplina WHERE cod_disciplina = 'LOG010')),
((SELECT id_professor FROM professor WHERE email = 'diego@cps.sp.gov.br'), (SELECT id_disciplina FROM disciplina WHERE cod_disciplina = 'AUT020'));

INSERT INTO professor_disciplina (id_professor, id_disciplina)
SELECT p.id_professor, d.id_disciplina
FROM (VALUES
 ('carlos@cps.sp.gov.br', 'BDG201'),
 ('roberto@cps.sp.gov.br', 'LP101'),
 ('roberto@cps.sp.gov.br', 'ED201'),
 ('roberto@cps.sp.gov.br', 'IG101'),
 ('roberto@cps.sp.gov.br', 'AUT020'),
 ('mariana@cps.sp.gov.br', 'IHC202'),
 ('felipe@cps.sp.gov.br', 'PI202'),
 ('patricia@cps.sp.gov.br', 'FG101')
) AS vinculo(email, disciplina)
JOIN professor p ON p.email = vinculo.email
JOIN disciplina d ON d.cod_disciplina = vinculo.disciplina;

INSERT INTO recurso_sala (quantidade, id_recurso, id_sala) VALUES
(1, (SELECT id_recurso FROM recurso WHERE nome = 'Projetor multimidia'), (SELECT id_sala FROM sala WHERE codigo = 'LAB-01')),
(40, (SELECT id_recurso FROM recurso WHERE nome = 'Computador desktop'), (SELECT id_sala FROM sala WHERE codigo = 'LAB-01')),
(1, (SELECT id_recurso FROM recurso WHERE nome = 'Projetor multimidia'), (SELECT id_sala FROM sala WHERE codigo = 'SALA-12')),
(12, (SELECT id_recurso FROM recurso WHERE nome = 'Mesa de reuniao'), (SELECT id_sala FROM sala WHERE codigo = 'REUN-01')),
(10, (SELECT id_recurso FROM recurso WHERE nome = 'Kit Arduino'), (SELECT id_sala FROM sala WHERE codigo = 'MAKER-01'));

-- Grade semanal demonstrativa (recorte, nao uma matriz curricular oficial).
-- Cada materia tem de 2 a 4 blocos de 50 minutos por semana.
-- ADS 2o semestre: Programacao do 1o cabe nos horarios livres de segunda e quarta.
-- Banco de Dados do 1o conflita com Estruturas (terca) e IHC (quinta).
INSERT INTO alocacao (dia_semana, id_bloco_horario, id_disciplina, id_professor, id_quadro_horario, id_sala, id_turma)
SELECT aula.dia, b.id_bloco_horario, d.id_disciplina, p.id_professor,
       q.id_quadro_horario, s.id_sala, t.id_turma
FROM (VALUES
 -- ADS 1o semestre: Carlos em Programacao e Banco de Dados; Roberto em Logica.
 (1, TIME '13:20:00', TIME '15:00:00', 'ISW044', 'carlos@cps.sp.gov.br', 'LAB-01', '1/2026'),
 (3, TIME '13:20:00', TIME '15:00:00', 'ISW044', 'carlos@cps.sp.gov.br', 'LAB-01', '1/2026'),
 (2, TIME '13:20:00', TIME '15:00:00', 'BD001', 'carlos@cps.sp.gov.br', 'LAB-01', '1/2026'),
 (4, TIME '13:20:00', TIME '15:00:00', 'BD001', 'carlos@cps.sp.gov.br', 'LAB-01', '1/2026'),
 (5, TIME '13:20:00', TIME '16:50:00', 'LP101', 'roberto@cps.sp.gov.br', 'LAB-01', '1/2026'),
 -- ADS 2o semestre: duas tardes com Engenharia, duas com Estruturas e aulas de IHC/PI.
 (1, TIME '15:10:00', TIME '16:50:00', 'ES002', 'mariana@cps.sp.gov.br', 'SALA-21', '2/2026-ADS'),
 (3, TIME '15:10:00', TIME '16:50:00', 'ES002', 'mariana@cps.sp.gov.br', 'SALA-21', '2/2026-ADS'),
 (2, TIME '13:20:00', TIME '15:00:00', 'ED201', 'roberto@cps.sp.gov.br', 'LAB-02', '2/2026-ADS'),
 (4, TIME '15:10:00', TIME '16:50:00', 'ED201', 'roberto@cps.sp.gov.br', 'LAB-02', '2/2026-ADS'),
 (4, TIME '13:20:00', TIME '15:00:00', 'IHC202', 'mariana@cps.sp.gov.br', 'SALA-21', '2/2026-ADS'),
 (5, TIME '13:20:00', TIME '15:00:00', 'PI202', 'felipe@cps.sp.gov.br', 'SALA-21', '2/2026-ADS'),
 -- GTI 1o semestre: aulas noturnas em dois dias por materia.
 (1, TIME '18:50:00', TIME '20:30:00', 'IG101', 'roberto@cps.sp.gov.br', 'LAB-02', '1/2026-GTI'),
 (3, TIME '18:50:00', TIME '20:30:00', 'IG101', 'roberto@cps.sp.gov.br', 'LAB-02', '1/2026-GTI'),
 (2, TIME '18:50:00', TIME '20:30:00', 'FG101', 'patricia@cps.sp.gov.br', 'SALA-12', '1/2026-GTI'),
 (4, TIME '18:50:00', TIME '20:30:00', 'FG101', 'patricia@cps.sp.gov.br', 'SALA-12', '1/2026-GTI'),
 -- GTI 2o semestre: Fundamentos de Gestao cabe antes de Gestao de Projetos na terca.
 (1, TIME '18:50:00', TIME '20:30:00', 'BDG201', 'carlos@cps.sp.gov.br', 'LAB-01', '2/2026'),
 (3, TIME '18:50:00', TIME '20:30:00', 'BDG201', 'carlos@cps.sp.gov.br', 'LAB-01', '2/2026'),
 (2, TIME '20:40:00', TIME '22:20:00', 'GP101', 'felipe@cps.sp.gov.br', 'SALA-21', '2/2026'),
 -- Logistica e Eletronica usam quadros e salas dos seus respectivos cursos.
 (5, TIME '18:50:00', TIME '21:30:00', 'LOG010', 'patricia@cps.sp.gov.br', 'SALA-12', '1/2026-LOG'),
 (3, TIME '20:40:00', TIME '22:20:00', 'AUT020', 'roberto@cps.sp.gov.br', 'MAKER-01', '2/2026-EA'),
 (5, TIME '18:50:00', TIME '20:30:00', 'AUT020', 'roberto@cps.sp.gov.br', 'MAKER-01', '2/2026-EA')
) AS aula(dia, inicio, fim, disciplina, professor, sala, turma)
JOIN disciplina d ON d.cod_disciplina = aula.disciplina
JOIN professor p ON p.email = aula.professor AND p.status = 'ATIVO'
JOIN professor_disciplina pd ON pd.id_professor = p.id_professor AND pd.id_disciplina = d.id_disciplina
JOIN turma t ON t.codigo = aula.turma AND t.id_curso = d.id_curso AND t.periodo = d.periodo
JOIN quadro_horario q ON q.id_curso = t.id_curso AND q.status = 'ATIVO'
JOIN sala s ON s.codigo = aula.sala AND s.capacidade >= t.numero_alunos AND s.id_tipo_sala = d.id_tipo_sala
JOIN bloco_horario b ON b.hora_inicio >= aula.inicio AND b.hora_fim <= aula.fim;

-- Disponibilidade coerente com todas as aulas da grade de exemplo.
INSERT INTO disponibilidade_professor (dia_semana, id_bloco_horario, id_professor)
SELECT DISTINCT CASE a.dia_semana
    WHEN 0 THEN 'DOMINGO' WHEN 1 THEN 'SEGUNDA' WHEN 2 THEN 'TERCA'
    WHEN 3 THEN 'QUARTA' WHEN 4 THEN 'QUINTA' WHEN 5 THEN 'SEXTA' WHEN 6 THEN 'SABADO' END,
    a.id_bloco_horario, a.id_professor
FROM alocacao a;

INSERT INTO usuario (nome, email, senha, status, created_at, updated_at, tipo_usuario, id_curso) VALUES
('coordenadora.ads', 'coordenadora.ads@gini.com', '$2a$10$oHzz0j333M3RjQSQoRneK.RB0AxUr9T308Tt10fkhJposh9Mqhx.a', 'ATIVO', '2026-01-10 08:30:00', '2026-01-10 08:30:00', 'COORDENADOR', (SELECT id_curso FROM curso WHERE nome = 'Analise e Desenvolvimento de Sistemas')),
('coordenador.gti', 'coordenador.gti@gini.com', '$2a$10$oHzz0j333M3RjQSQoRneK.RB0AxUr9T308Tt10fkhJposh9Mqhx.a', 'ATIVO', '2026-01-10 08:30:00', '2026-01-10 08:30:00', 'COORDENADOR', (SELECT id_curso FROM curso WHERE nome = 'Gestão Tecnologia da Informação')),
('usuario.inativo', 'usuario.inativo@gini.com', '$2a$10$oHzz0j333M3RjQSQoRneK.RB0AxUr9T308Tt10fkhJposh9Mqhx.a', 'INATIVO', '2026-01-10 08:30:00', '2026-01-10 08:30:00', 'COORDENADOR', (SELECT id_curso FROM curso WHERE nome = 'Logistica'));



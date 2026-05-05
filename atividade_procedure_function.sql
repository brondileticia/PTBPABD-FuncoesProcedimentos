-- ============================================================================
-- ATIVIDADE DE BANCO DE DADOS - PROCEDURE E FUNCTION
-- Disciplina: Programação e Administração de Banco de Dados
--
-- ============================================================================
-- QUESTÃO 01: Criar procedimento student_grade_points
-- ============================================================================
--
-- DESCRIÇÃO: Procedimento que retorna informações dos alunos e suas notas,
--            filtrado por um conceito (grade) informado como parâmetro.
--
-- PARÂMETRO DE ENTRADA: @grade (ex: 'A+', 'A-', 'B+', etc.)
--
-- RETORNA: Nome do estudante, Departamento do estudante, Título do curso,
--          Departamento do curso, Semestre, Ano, Pontuação alfanumérica (grade),
--          Pontuação numérica (points da tabela grade_points)
-- ============================================================================

CREATE PROCEDURE student_grade_points
    @grade VARCHAR(2)
AS
BEGIN
    SELECT 
        s.name AS NomeEstudante,
        s.dept_name AS DeptoEstudante,
        c.title AS TituloCurso,
        c.dept_name AS DeptoCurso,
        t.semester AS Semestre,
        t.year AS Ano,
        t.grade AS PontuacaoAlfanumerica,
        gp.points AS PontuacaoNumerica
    FROM student s
    INNER JOIN takes t ON s.ID = t.ID
    INNER JOIN course c ON t.course_id = c.course_id
    INNER JOIN grade_points gp ON t.grade = gp.grade
    WHERE t.grade = @grade
    ORDER BY s.name, t.year, t.semester;
END;

-- ============================================================================
-- TESTE DA QUESTÃO 01 (
-- ============================================================================
EXEC student_grade_points 'A';
EXEC student_grade_points 'A+';
EXEC student_grade_points 'B-';

-- ============================================================================
-- QUESTÃO 02: Criar função return_instructor_location
-- ============================================================================
--
-- DESCRIÇÃO: Função que retorna a localização (prédio e sala) onde um instrutor
--            ministrou seus cursos, filtrado pelo nome do instrutor.
--
-- PARÂMETRO DE ENTRADA: @instructor_name (nome do instrutor)
--
-- RETORNA: Nome do instrutor, Curso ministrado, Semestre, Ano, Prédio, Número da sala
-- ============================================================================

CREATE FUNCTION return_instructor_location
    (@instructor_name VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        i.name AS NomeInstrutor,
        c.title AS CursoMinistrado,
        t.semester AS Semestre,
        t.year AS Ano,
        s.building AS Predio,
        s.room_number AS NumeroSala
    FROM instructor i
    INNER JOIN teaches t ON i.ID = t.ID
    INNER JOIN section s ON 
        t.course_id = s.course_id 
        AND t.sec_id = s.sec_id 
        AND t.semester = s.semester 
        AND t.year = s.year
    INNER JOIN course c ON t.course_id = c.course_id
    WHERE i.name = @instructor_name
);

-- ============================================================================
-- TESTE DA QUESTÃO 02
-- ============================================================================
SELECT * FROM dbo.return_instructor_location('Gustafsson');
SELECT * FROM dbo.return_instructor_location('Srinivasan');
SELECT * FROM dbo.return_instructor_location('Wu');

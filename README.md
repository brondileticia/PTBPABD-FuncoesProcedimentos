# Atividade - Procedure e Function

## 📚 Descrição

Esta atividade consiste na criação de um procedimento armazenado (STORED PROCEDURE) e uma função de tabela (TABLE-VALUED FUNCTION) em SQL Server, utilizando o esquema de banco de dados university.

## 📝 Questões

### Questão 01
Criar a procedure `student_grade_points` que:
- Recebe um conceito (nota) como parâmetro de entrada
- Retorna informações do aluno, curso e pontuação numérica da nota
- Filtra os resultados pelo conceito informado

### Questão 02
Criar a function `return_instructor_location` que:
- Recebe o nome do instrutor como parâmetro de entrada
- Retorna a localização (prédio e sala) onde o instrutor ministrou seus cursos

## 📁 Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `atividade_procedure_function.sql` | Script com a procedure e a função |

## ▶️ Como executar

1. Conecte-se ao banco de dados university
2. Execute o script `atividade_procedure_function.sql`
3. Teste a procedure:
   ```sql
   EXEC student_grade_points 'A';
4. Teste a função:
   ```sql
   SELECT * FROM dbo.return_instructor_location('Gustafsson');

## 🔧 Dependências
- A tabela grade_points deve existir para a Questão 01 funcionar
- O banco deve conter as tabelas: student, takes, course, instructor, teaches, section

## 👩‍💻 Autora
Letícia Brondi Carvalheiro

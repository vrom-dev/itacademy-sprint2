-- BBDD Universitat
USE universidad;

-- #1 Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;

-- #2 Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

-- #3 Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM persona WHERE tipo = 'alumno' AND year(fecha_nacimiento) = 1999;

-- #4 Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- #5 Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * FROM asignatura WHERE curso = 3 AND cuatrimestre = 1 AND id_grado = 7;

-- #6 Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS 'departamento' FROM persona AS p JOIN profesor AS pr ON pr.id_profesor = p.id JOIN departamento AS d ON pr.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;

-- #7 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM asignatura AS a JOIN alumno_se_matricula_asignatura AS m ON a.id = m.id_asignatura JOIN curso_escolar AS ce ON ce.id = m.id_curso_escolar JOIN persona AS p ON m.id_alumno = p.id WHERE p.nif = '26902806M';

-- #8 Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT d.nombre AS 'departamento' FROM departamento AS d JOIN profesor AS pr ON pr.id_departamento = d.id JOIN asignatura AS a ON a.id_profesor = pr.id_profesor JOIN grado as g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)' GROUP BY d.nombre;

-- #9 Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona AS p JOIN alumno_se_matricula_asignatura AS m ON p.id = m.id_alumno WHERE m.id_curso_escolar IN (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018 AND anyo_fin = 2019) GROUP BY p.nombre;

-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- #1 Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS 'departamento', p.apellido1, p.apellido2, p.nombre FROM persona AS p LEFT JOIN profesor AS pr ON p.id = pr.id_profesor LEFT JOIN departamento AS d ON pr.id_departamento = d.id ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- #2 Retorna un llistat amb els professors que no estan associats a un departament.
SELECT d.nombre AS 'departamento', p.apellido1, p.apellido2, p.nombre FROM persona AS p LEFT JOIN profesor AS pr ON p.id = pr.id_profesor LEFT JOIN departamento AS d ON pr.id_departamento = d.id WHERE d.nombre IS NULL;

-- #3 Retorna un llistat amb els departaments que no tenen professors associats.
SELECT d.id, d.nombre FROM departamento AS d LEFT JOIN profesor AS pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NULL;

-- #4 Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT p.apellido1, p.apellido2, p.nombre FROM persona AS p LEFT JOIN asignatura AS a ON a.id_profesor = p.id WHERE p.tipo = 'profesor' AND a.nombre IS NULL;

-- #5 Retorna un llistat amb les assignatures que no tenen un professor assignat.
SELECT a.nombre, a.tipo, a.curso, a.cuatrimestre, a.id_profesor FROM persona as p RIGHT JOIN asignatura AS a ON p.id = a.id_profesor WHERE a.id_profesor IS NULL;

-- #6 Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT * FROM departamento WHERE id NOT IN (SELECT d.id FROM departamento AS d LEFT JOIN profesor AS pr ON d.id = pr.id_departamento LEFT JOIN asignatura AS a ON pr.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura AS m ON a.id = m.id_asignatura WHERE m.id_curso_escolar IS NOT NULL GROUP BY d.id);

-- Consultes resum:
-- #1 Retorna el nombre total d'alumnes que hi ha.
SELECT count(id) AS 'total_alumnos' FROM persona AS p WHERE p.tipo = 'alumno';

-- #2 Calcula quants alumnes van néixer en 1999.
SELECT count(id) AS 'total_alumnos_nacidos_en_1999' FROM persona AS p WHERE p.tipo = 'alumno' AND year(p.fecha_nacimiento) = 1999;

-- #3 Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
SELECT d.nombre AS 'departamento', count(pr.id_departamento) AS 'profesores' FROM departamento AS d JOIN profesor AS pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY profesores DESC;

-- #4 Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre AS 'departamento', count(pr.id_departamento) AS 'profesores' FROM departamento AS d LEFT JOIN profesor AS pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY profesores DESC;

-- #5 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre, count(a.id) AS 'numero_asignaturas' FROM grado AS g LEFT JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY numero_asignaturas DESC;

-- #6 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.nombre, count(a.id) AS 'numero_asignaturas' FROM grado AS g LEFT JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre HAVING numero_asignaturas > 40;

-- #7 Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre AS 'grado', a.tipo, sum(a.creditos) AS 'total_creditos' FROM grado AS g JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;

-- #8 Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT c.anyo_inicio, count(DISTINCT m.id_alumno) FROM curso_escolar AS c LEFT JOIN alumno_se_matricula_asignatura AS m ON c.id = m.id_curso_escolar GROUP BY c.id;

-- #9 Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT p.id, p.apellido1, p.apellido2, p.nombre, count(a.id) AS 'total_asignaturas' FROM persona AS p LEFT JOIN asignatura AS a ON p.id = a.id_profesor group by p.id;

-- #10 Retorna totes les dades de l'alumne més jove.
SELECT * FROM persona AS p WHERE p.tipo = 'alumno' ORDER BY p.fecha_nacimiento DESC LIMIT 1;

-- #11 Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.
SELECT p.apellido1, p.apellido2, p.nombre FROM persona AS p JOIN profesor AS pr ON p.id = pr.id_profesor LEFT JOIN asignatura AS a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL; 
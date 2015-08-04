<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Tarefas</title>
<link rel="stylesheet" type="text/css" href="styles/02-tasks.css" media="screen" />
<!-- Bibliotecas JQuery, TMPL -->
<script type="text/javascript" src="scripts/jquery-2.1.4.js"></script>
<script type="text/javascript" src="scripts/jquery.tmpl.min.js"></script>
<script type="text/javascript" src= "scripts/tasks-controller.js"></script>
<script type="text/javascript" src= "scripts/jquery.validate.js"></script>
<!-- tasks-webstorage.js possui as funções para tratar a peristência das tarefas usando localStorage -->
<script type="text/javascript" src= "scripts/tasks-webstorage.js"></script>
<!-- Conforme sugestão do enunciado acrescentei a biblioteca datejs para auxiliar nas operações com datas -->
<script type="text/javascript" src="scripts/date.js"></script>
</head>
<body>
	<header>
		<span>Lista de Tarefas</span>
	</header>
	<main id="taskPage">
		<section id="taskCreation" class="not">
			<form id="taskForm">
				<input type="hidden" name="id" />
				<!-- Adicionei este novo campo em forma de hidden para tratar as tarefas concluidas e também poder contar as tarefas "não concluídas" -->
				<input type="hidden" name="completed">
				<div>
					<label>Tarefa</label> 
					<input type="text" required="required" name="task" maxlength="200" class="large" placeholder="Estudar e programar" />
				</div>
				<div>
					<label>Finalizar até</label> <input type="date" required="required" name="requiredBy" />
				</div>
				<div>
					<label>Categoria</label> 
					<select name="category">
						<option value="Pessoal">Pessoal</option>
						<option value="Profissional">Profissional</option>
					</select>
				</div>
				<nav>
					<a href="#" id="saveTask">Salvar tarefa</a> <a href="#" id="clearTask">Limpar tarefa</a>
				</nav>
			</form>
		</section>
		<section>
			<table id="tblTasks">
					<colgroup>
						<col width="40%">
						<col width="15%">
						<col width="15%">
						<col width="30%">
					</colgroup>
				<thead>
					<tr>
						<th>Nome</th>
						<th>Deadline</th>
						<th>Categoria</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<nav class="bottom">
				<a href="#" id="btnAddTask">Adicionar tarefa</a>
			</nav>
			<nav class="bottom">
				<a href="index.html" id="btnAddTask">Home</a>
			</nav>
		</section>
	</main>
	<footer>Você tem: <span id="taskCount"></span> tarefa(s) pendente(s) e <span id="tasksCompleted"></span> tarefa(s) finalizada(s)</footer>
</body>

<script>
	$(document).ready(function() {
		tasksController.init($('#taskPage'));
		tasksController.loadTasks();
	});
</script>

<script id="taskRow" type="text/x-jQuery-tmpl">
<tr row-task-id="${id}">
	<td>${task}</td>
	<td><time datetime="${requiredBy}"> ${requiredBy}</time></td>
	<td>${category}</td>
	<td>
		<nav>
			<a href="#" class="editRow" data-task-id="${id}">Editar</a>
			<a href="#" class="completeRow" data-task-id="${id}">Completar</a>
			<a href="#" class="deleteRow" data-task-id="${id}">Deletar</a>
		</nav>
	</td>
</tr>
</script>
</html>

<%@ page import="tasks.Categoria" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<title>Tarefas</title>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<asset:javascript src="categorias-controller.js"/>
	<!-- categorias-h2.js possui as funções para tratar a peristência das categorias usando H2 como base de dados -->
	<asset:javascript src="categorias-h2.js"/>
</head>
<body>
	<main id="categoriaPage">
		<section id="categoriaCreation" class="not">
			<form id="categoriaForm">
				<input type="hidden" name="id" />
				<div>
					<label>Nome</label> 
					<input type="text" required="required" name="nome" maxlength="200" class="large" placeholder="Nome da categoria" />
				</div>
				<nav>
					<a href="#" id="saveCategoria">Salvar Categoria</a> <a href="#" id="clearCategoria">Limpar Categoria</a>
				</nav>
			</form>
		</section>
		<section>
			<table id="tblCategorias">
					<colgroup>
						<col width="15%">
						<col width="50%">
						<col width="35%">
					</colgroup>
				<thead>
					<tr>
						<th>Código</th>
						<th>Nome</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<nav class="bottom">
				<a href="#" id="btnAddCategoria">Adicionar Categoria</a>
				<a href="/tasks" >Principal</a>
			</nav>
		</section>
	</main>
	<footer>Você tem <span id="categoriaCount"></span> categoria(s). </footer>
<script id="categoriaRow" type="text/x-jQuery-tmpl">
<tr row-categoria-id="{{= id }}">
	<td>{{= id }}</td>
	<td>{{= nome }}</td>
	<td>
		<nav>
			<a href="#" class="editRow" data-categoria-id="{{= id }}">Editar</a>
			<a href="#" class="deleteRow" data-categoria-id="{{= id }}">Deletar</a>
		</nav>
	</td>
</tr>
</script>

<script>
	$(document).ready(function() {
		categoriasController.init($('#categoriaPage'));
	});
</script>


</body>

</html>

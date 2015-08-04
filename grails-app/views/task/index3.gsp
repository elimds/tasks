
<%@ page import="tasks.Task" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="tasks-controller.js"/>
	</head>
	<body>
		<a href="#list-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li> <a href="#" onclick="$('#create-task').show();">Nova Tarefa</a> </li>
			</ul>
		</div>
		<div id="create-task" class="content scaffold-create" role="main" style="display:none;">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${taskInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${taskInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:formRemote url="[resource:taskInstance, action:'save']" update="list-task" name="formTask" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:formRemote>
		</div>		
		<div id="list-task" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="idTask" title="${message(code: 'task.idTask.label', default: 'Id Task')}" />
					
						<g:sortableColumn property="task" title="${message(code: 'task.task.label', default: 'Task')}" />

						<g:sortableColumn property="categoria" title="${message(code: 'task.categoria.label', default: 'Categoria')}" />
					
						<g:sortableColumn property="requiredBy" title="${message(code: 'task.requiredBy.label', default: 'Required By')}" />
					
						<g:sortableColumn property="complete" title="${message(code: 'task.complete.label', default: 'Complete')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${taskInstanceList}" status="i" var="taskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: taskInstance, field: "idTask")}</td>
					
						<td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "task")}</g:link></td>

						<td>${fieldValue(bean: taskInstance, field: "categoria")}</td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${taskInstance.requiredBy}" /></td>
					
						<td>${fieldValue(bean: taskInstance, field: "complete")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${taskInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
<script type="text/javascript">
console.log("Passou por aqui... ");
window.alert("teste");
	$(document).ready(function() {
		console.log("Passou por aqui... ");
		$('#create-task').hide();
		console.log($('#create-task'));
	});
</script>
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<p>teste: "${taskInstance.?}" - "${params}"</p>
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

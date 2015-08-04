
<%@ page import="tasks.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<nav>
				<a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</nav>
		</div>
		<div id="show-categoria" class="content scaffold-show" role="main">
			<h1 class="capa"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list categoria">
			
				<g:if test="${categoriaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="categoria.nome.label" default="Nome" />:</span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${categoriaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:categoriaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<nav>
					<g:link class="edit" action="edit" resource="${categoriaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</nav>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="com.oor.security.Utilisateur"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>


	<div class="row-fluid">

		<g:render template="leftMenu" />

		<div class="span9">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>

			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			
				<g:render template="info" />
				
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${utilisateurInstance?.id}" />
					<g:link class="edit" action="edit" id="${utilisateurInstance?.id}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:actionSubmit class="delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>

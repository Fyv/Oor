<%@ page import="com.oor.security.Utilisateur"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">

		<g:render template="leftMenu" />

		<div class="span9">
			<div class="page-header">
				<h1>
					<g:message code="default.list.label" args="[entityName]" />
				</h1>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${utilisateurInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${utilisateurInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<div class=".form-actions">
				<g:form method="post">
					<g:hiddenField name="id" value="${utilisateurInstance?.id}" />
					<g:hiddenField name="version"
						value="${utilisateurInstance?.version}" />
					<fieldset class="form">
						<g:render template="form" />
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="save" action="update"
							value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							formnovalidate=""
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>

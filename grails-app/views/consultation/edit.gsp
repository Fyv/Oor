<%@ page import="com.oor.core.Consultation"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'consultation.label', default: 'Consultation')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
	
		<g:render template="leftMenu" />

		<div class="span9">
			<div class="page-header">
				<h1>
					<g:message code="default.edit.label" args="[entityName]" />
				</h1>
			</div>

			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${consultationInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${consultationInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form method="post">
				<g:hiddenField name="id" value="${consultationInstance?.id}" />
				<g:hiddenField name="version"
					value="${consultationInstance?.version}" />
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
</body>
</html>

<%@ page import="com.oor.core.Patient"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'patient.label', default: 'Patient')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">

		<g:render template="leftMenu" />

		<div class="span4">
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
			<g:hasErrors bean="${patientInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${patientInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>

			<div id="updatePatient">
				<g:render template="formremote" />
			</div>

		</div>
		<div class="span3">
			<div class="page-header">
				<h1>Consultation</h1>
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


			<div id="updateConsult">
				<g:render template="../consultation/formremote" />
			</div>
		

			<div class="page-header">
				<h2>Liste</h2>
			</div>
			<div id="refreshList">
				<%--<g:include controller="consultation" action="refreshList" params="[max:5, patientId:patientInstance?.id]"/>--%>
				<g:render template="../consultation/collapselist" />
			</div>
		</div>
	</div>
 </body>
</html>

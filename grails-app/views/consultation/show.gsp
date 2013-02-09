
<%@ page import="com.oor.core.Consultation"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'consultation.label', default: 'Consultation')}" />
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
			<ol class="property-list consultation">

				<g:if test="${consultationInstance?.motif}">
					<li class="fieldcontain"><span id="motif-label"
						class="property-label"><g:message
								code="consultation.motif.label" default="Motif" /></span> <span
						class="property-value" aria-labelledby="motif-label"><g:fieldValue
								bean="${consultationInstance}" field="motif" /></span></li>
				</g:if>

				<g:if test="${consultationInstance?.doleance}">
					<li class="fieldcontain"><span id="doleance-label"
						class="property-label"><g:message
								code="consultation.doleance.label" default="Doleance" /></span> <span
						class="property-value" aria-labelledby="doleance-label"><g:fieldValue
								bean="${consultationInstance}" field="doleance" /></span></li>
				</g:if>

				<g:if test="${consultationInstance?.traitement}">
					<li class="fieldcontain"><span id="traitement-label"
						class="property-label"><g:message
								code="consultation.traitement.label" default="Traitement" /></span> <span
						class="property-value" aria-labelledby="traitement-label"><g:fieldValue
								bean="${consultationInstance}" field="traitement" /></span></li>
				</g:if>

				<g:if test="${consultationInstance?.dateCreated}">
					<li class="fieldcontain"><span id="dateCreated-label"
						class="property-label"><g:message
								code="consultation.dateCreated.label" default="Date Created" /></span>

						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
								date="${consultationInstance?.dateCreated}" /></span></li>
				</g:if>

				<g:if test="${consultationInstance?.lastUpdated}">
					<li class="fieldcontain"><span id="lastUpdated-label"
						class="property-label"><g:message
								code="consultation.lastUpdated.label" default="Last Updated" /></span>

						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
								date="${consultationInstance?.lastUpdated}" /></span></li>
				</g:if>

				<g:if test="${consultationInstance?.patient}">
					<li class="fieldcontain"><span id="patient-label"
						class="property-label"><g:message
								code="consultation.patient.label" default="Patient" /></span> <span
						class="property-value" aria-labelledby="patient-label"><g:link
								controller="patient" action="show"
								id="${consultationInstance?.patient?.id}">
								${consultationInstance?.patient?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${consultationInstance?.id}" />
					<g:link class="edit" action="edit" id="${consultationInstance?.id}">
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

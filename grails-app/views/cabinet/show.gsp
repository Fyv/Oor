
<%@ page import="com.oor.core.Cabinet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cabinet.label', default: 'Cabinet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cabinet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cabinet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cabinet">
			
				<g:if test="${cabinetInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="cabinet.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${cabinetInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cabinetInstance?.admin}">
				<li class="fieldcontain">
					<span id="admin-label" class="property-label"><g:message code="cabinet.admin.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="admin-label"><g:link controller="utilisateur" action="show" id="${cabinetInstance?.admin?.id}">${cabinetInstance?.admin?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cabinetInstance?.therapeute}">
				<li class="fieldcontain">
					<span id="therapeute-label" class="property-label"><g:message code="cabinet.therapeute.label" default="Therapeute" /></span>
					
						<g:each in="${cabinetInstance.therapeute}" var="t">
						<span class="property-value" aria-labelledby="therapeute-label"><g:link controller="utilisateur" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cabinetInstance?.adresse}">
				<li class="fieldcontain">
					<span id="adresse-label" class="property-label"><g:message code="cabinet.adresse.label" default="Adresse" /></span>
					
						<span class="property-value" aria-labelledby="adresse-label"><g:fieldValue bean="${cabinetInstance}" field="adresse"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cabinetInstance?.localite}">
				<li class="fieldcontain">
					<span id="localite-label" class="property-label"><g:message code="cabinet.localite.label" default="Localite" /></span>
					
						<span class="property-value" aria-labelledby="localite-label"><g:link controller="localite" action="show" id="${cabinetInstance?.localite?.id}">${cabinetInstance?.localite?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cabinetInstance?.id}" />
					<g:link class="edit" action="edit" id="${cabinetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

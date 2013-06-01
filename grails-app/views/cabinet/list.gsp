
<%@ page import="com.oor.core.Cabinet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cabinet.label', default: 'Cabinet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cabinet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cabinet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'cabinet.nom.label', default: 'Nom')}" />
					
						<th><g:message code="cabinet.admin.label" default="Admin" /></th>
					
						<g:sortableColumn property="adresse" title="${message(code: 'cabinet.adresse.label', default: 'Adresse')}" />
					
						<th><g:message code="cabinet.localite.label" default="Localite" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cabinetInstanceList}" status="i" var="cabinetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cabinetInstance.id}">${fieldValue(bean: cabinetInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: cabinetInstance, field: "admin")}</td>
					
						<td>${fieldValue(bean: cabinetInstance, field: "adresse")}</td>
					
						<td>${fieldValue(bean: cabinetInstance, field: "localite")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cabinetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

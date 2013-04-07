
<%@ page import="com.oor.core.Patient"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'patient.label', default: 'Patient')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">

		<g:render template="leftMenu" />

		<div class="span9">
			<div class="page-header">
				<h1>
					<%--<g:message code="default.list.label" args="[entityName]" />
				--%>
					Recherche
				</h1>
			</div>

			<g:form id="searchForm" class="form-search"
				url="${[controller: 'patient', action:'search'] }" name="searchForm"
				method="post" update="searchUpdate">
				<div class="input-append">
					<input type="text" name="searchValue" id="searchValue"
						class="input-xxlarge search-query">
					<g:actionSubmit type="submit" action="search" class="btn"
						value="Search"></g:actionSubmit>
				</div>
			</g:form>

			<hr />
			<div id="searchUpdate">
				<g:if test="${patientInstanceList!= null && patientInstanceList.size() > 0}">
					<g:render template="listSearchPatients" />
				</g:if>
				<g:elseif test="${patientInstanceList != null && patientInstanceList.size() == 0 }">
					<h2>Aucun patient trouvé</h2>
				</g:elseif>
				<g:else>
					<h2>Aucune recherche effectuée</h2>
				</g:else>
			</div>
		</div>
	</div>
</body>
</html>

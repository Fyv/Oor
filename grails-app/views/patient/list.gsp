
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
					<g:message code="default.list.label" args="[entityName]" />
				</h1>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<table class="table table-striped">
				<thead>
					<tr>

						<g:sortableColumn property="civilite"
							title="${message(code: 'patient.civilite.label', default: 'Civilite')}" />

						<g:sortableColumn property="nom"
							title="${message(code: 'patient.nom.label', default: 'Nom')}" />

						<g:sortableColumn property="prenom"
							title="${message(code: 'patient.prenom.label', default: 'Prenom')}" />

						<g:sortableColumn property="email"
							title="${message(code: 'patient.email.label', default: 'Email')}" />
						<th>Actions</th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${patientInstanceList}" status="i"
						var="patientInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td>
								${fieldValue(bean: patientInstance, field: "civilite")}
							</td>

							<td>
								${fieldValue(bean: patientInstance, field: "nom")}
							</td>

							<td>
								${fieldValue(bean: patientInstance, field: "prenom")}
							</td>

							<td>
								${fieldValue(bean: patientInstance, field: "email")}
							</td>
							<td class="link">
								<div class="btn-group">
									<g:link class="btn" action="show" id="${patientInstance?.id}">
										<i class="icon-search"></i>
										<g:message code="default.button.show.label" default="Show" />
									</g:link>
									<button class="btn dropdown-toggle" data-toggle="dropdown">
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><g:link action="edit" id="${patientInstance.id}">
												<i class="icon-edit"></i>
												<g:message code="default.button.edit.label" default="Edit" />
											</g:link></li>
										<%--<li>
											<g:link type="submit" action="_action_delete" id="${patientInstance.id}">
											<i class="icon-trash"></i>
											<g:message code="default.button.delete.label" default="Delete" />
											</g:link>
										</li>
									--%>
									</ul>
								</div>
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination-centered">
				<g:paginate total="${patientInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>

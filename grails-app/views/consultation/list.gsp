
<%@ page import="com.oor.core.Consultation"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'consultation.label', default: 'Consultation')}" />
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

						<g:sortableColumn property="motif"
							title="${message(code: 'consultation.motif.label', default: 'Motif')}" />


						<g:sortableColumn property="dateCreated"
							title="${message(code: 'consultation.dateCreated.label', default: 'Date Created')}" />

						<g:sortableColumn property="lastUpdated"
							title="${message(code: 'consultation.lastUpdated.label', default: 'Last Updated')}" />

						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${consultationInstanceList}" status="i"
						var="consultationInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td>
								${fieldValue(bean: consultationInstance, field: "motif")}
							</td>


							<td><g:formatDate format="dd/MM/yyyy"
									date="${consultationInstance.dateCreated}" /></td>

							<td><g:formatDate format="dd/MM/yyyy"
									date="${consultationInstance.lastUpdated}" /></td>

							<td class="link">
								<div class="btn-group">
									<g:link class="btn" action="show"
										id="${consultationInstance?.id}"
										params="['patientId': params.patientId]">
										<i class="icon-search"></i>
										<g:message code="default.button.show.label" default="Show" />
									</g:link>
									<button class="btn dropdown-toggle" data-toggle="dropdown">
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><g:link action="edit" id="${consultationInstance.id}"
												params="['patientId': params.patientId]">
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
				<g:paginate total="${consultationInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>

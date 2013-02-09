
<%@ page import="com.oor.security.Utilisateur"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
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
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table class="table table-striped">
					<thead>
						<tr>
							<g:sortableColumn property="username"
								title="${message(code: 'utilisateur.username.label', default: 'Username')}" />

							<g:sortableColumn property="email"
								title="${message(code: 'utilisateur.email.label', default: 'Email')}" />

							<g:sortableColumn property="dateCreated"
								title="${message(code: 'utilisateur.dateCreated.label', default: 'Date Created')}" />

							<g:sortableColumn property="lastUpdated"
								title="${message(code: 'utilisateur.lastUpdated.label', default: 'Last Updated')}" />

							<g:sortableColumn property="accountExpired"
								title="${message(code: 'utilisateur.accountExpired.label', default: 'Account Expired')}" />
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${utilisateurInstanceList}" status="i"
							var="utilisateurInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${utilisateurInstance.id}">
										${fieldValue(bean: utilisateurInstance, field: "username")}
									</g:link></td>

								<td>
									${fieldValue(bean: utilisateurInstance, field: "email")}
								</td>


								<td><g:formatDate format="dd/MM/yyyy"
										date="${utilisateurInstance.dateCreated}" /></td>

								<td><g:formatDate format="dd/MM/yyyy"
										date="${utilisateurInstance.lastUpdated}" /></td>

								<td><g:formatBoolean
										boolean="${utilisateurInstance.accountExpired}" /></td>
								<td class="link">
									<div class="btn-group">
										<g:link class="btn" action="show"
											id="${utilisateurInstance?.id}">
											<i class="icon-search"></i>
											<g:message code="default.button.show.label" default="Show" />
										</g:link>
										<button class="btn dropdown-toggle" data-toggle="dropdown">
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><g:link action="edit" id="${utilisateurInstance.id}">
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
					<g:paginate total="${utilisateurInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>

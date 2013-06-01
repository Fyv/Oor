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

		<div class="span3"></div>

		<div class="span9">
			<div class="page-header">
				<h1>Edition préférences utilisateur</h1>
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
			<div id="updateUtilisateur">
				<g:render template="formremote"></g:render>
			</div>

			<div class="page-header">
				<h3>
					Création de cabinet ostéopathique <small>Partage et
						visualisation de patients</small>
				</h3>
				<p>
					La création d'un cabinet sur [Oor] vous permettra d'associer vos
					patients à vos différents cabinet et de rajouter vos collègues à
					votre cabinet. <br /> Ainsi, vous pourrez visualiser et partager
					des informations avec vos collègues.
			</div>

			<div id="updateCabinet" class="row">
					<g:render template="../cabinet/formremote" />
			</div>
		</div>
	</div>
</body>
</html>

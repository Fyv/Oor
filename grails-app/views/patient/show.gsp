
<%@ page import="com.oor.core.Patient"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'patient.label', default: 'Patient')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">

		<div class="span3">
			<div class="well">
				<ul class="nav nav-list">
					<li class="nav-header">
						${entityName}
					</li>
					<li><g:link class="list" action="list">
							<i class="icon-list"></i>
							<g:message code="default.list.label" args="[entityName]" />
						</g:link></li>
					<li><g:link class="create" action="create">
							<i class="icon-plus"></i>
							<g:message code="default.create.label" args="[entityName]" />
						</g:link></li>
					<g:set var="entityNameConsult"
						value="${message(code: 'consultation.label', default: 'Consultation')}" />

					<li class="nav-header">
						${entityNameConsult}
					</li>

					<li><g:link controller="consultation" class="list"
							action="list" params="['patientId': patientInstance?.id]">
							<i class="icon-list"></i>
							<g:message code="default.list.label" args="[entityNameConsult]" />
						</g:link></li>
					<li><g:link controller="consultation" class="create"
							action="create" params="['patientId': patientInstance?.id]">
							<i class="icon-plus"></i>
							<g:message code="default.add.label" args="[entityNameConsult]" />
						</g:link></li>

				</ul>
			</div>
		</div>

		<div class="span9">


			<div class="page-header">
				<g:if
					test="${patientInstance?.nom && patientInstance?.prenom && patientInstance?.civilite}">
					<h1>
						<g:fieldValue bean="${patientInstance}" field="civilite" />
						<g:fieldValue bean="${patientInstance}" field="nom" />
						<g:fieldValue bean="${patientInstance}" field="prenom" />
					</h1>
				</g:if>
			</div>



			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>

			<ul class="nav nav-tabs" id="tab">
				<li class="active"><a href="#info" data-toggle="tab">Infos</a></li>
				<li><a href="#antecedent" data-toggle="tab">Antécedents</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="info">

					<g:if test="${patientInstance?.nom}">
						<dt>
							<g:message code="patient.nom.label" default="Nom" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="nom" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.prenom}">
						<dt>
							<g:message code="patient.prenom.label" default="Prenom" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="prenom" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.adresse}">
						<dt>
							<g:message code="patient.adresse.label" default="Adresse" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="adresse" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.adresseSuite}">
						<dt>
							<g:message code="patient.adresseSuite.label"
								default="Adresse Suite" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="adresseSuite" />
						</dd>

					</g:if>
					<g:if test="${patientInstance?.email}">
						<dt>
							<g:message code="patient.email.label" default="Email" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="email" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.dateNaissance}">
						<dt>
							<g:message code="patient.dateNaissance.label"
								default="Date Naissance" />
						</dt>

						<dd>
							<g:formatDate date="${patientInstance?.dateNaissance}" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.sexe}">
						<dt>
							<g:message code="patient.sexe.label" default="Sexe" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="sexe" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.telFixe}">
						<dt>
							<g:message code="patient.telFixe.label" default="Tel Fixe" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="telFixe" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.telPortable}">
						<dt>
							<g:message code="patient.telPortable.label"
								default="Tel Portable" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="telPortable" />
						</dd>

					</g:if>



					<g:if test="${patientInstance?.profession}">
						<dt>
							<g:message code="patient.profession.label" default="Profession" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="profession" />
						</dd>

					</g:if>
					<g:if test="${patientInstance?.dateCreated}">
						<dt>
							<g:message code="patient.dateCreated.label"
								default="Date Created" />
						</dt>

						<dd>
							<g:formatDate date="${patientInstance?.dateCreated}" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.lastUpdated}">
						<dt>
							<g:message code="patient.lastUpdated.label"
								default="Last Updated" />
						</dt>

						<dd>
							<g:formatDate date="${patientInstance?.lastUpdated}" />
						</dd>

					</g:if>
				</div>
				<div class="tab-pane" id="antecedent">
					<g:if test="${patientInstance?.remarque}">
						<dt>
							<g:message code="patient.remarque.label" default="Remarque" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="remarque" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.chirurgical}">
						<dt>
							<g:message code="patient.chirurgical.label" default="Chirurgical" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="chirurgical" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.traumatisme}">
						<dt>
							<g:message code="patient.traumatisme.label" default="Traumatisme" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="traumatisme" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.naissance}">
						<dt>
							<g:message code="patient.naissance.label" default="Naissance" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="naissance" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.complementaire}">
						<dt>
							<g:message code="patient.complementaire.label"
								default="Complementaire" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="complementaire" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.loisir}">
						<dt>
							<g:message code="patient.loisir.label" default="Loisir" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="loisir" />
						</dd>

					</g:if>

					<g:if test="${patientInstance?.medical}">
						<dt>
							<g:message code="patient.medical.label" default="Medical" />
						</dt>

						<dd>
							<g:fieldValue bean="${patientInstance}" field="medical" />
						</dd>

					</g:if>
				</div>
			</div>

			<hr />
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${patientInstance?.id}" />
					<g:link class="edit" action="edit" id="${patientInstance?.id}">
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

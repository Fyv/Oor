<div class="span3">
	<div class="well">
		<ul class="nav nav-list">
			<li class="nav-header">
				${entityName}
			</li>
			<li class="active"><g:link controller="consultation"
					value="${params["patientId"]}" params="['patientId': params.patientId]"
					class="list" action="list">
					<i class="icon-list icon-white"></i>
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>

			<li><g:link class="create" params="['patientId': params.patientId]"
					value="${params["patientId"]}" action="create">
					<i class="icon-plus"></i>
					<g:message code="default.create.label" args="[entityName]" />
				</g:link></li>
			<li class="nav-header">Patient</li>
			<g:set var="entityNamePatient"
				value="${message(code: 'patient.label', default: 'Patient')}" />
			<li><g:link class="list" action="list" controller="patient">
					<i class="icon-list"></i>
					<g:message code="default.list.label" args="[entityNamePatient]" />
				</g:link></li>
			<li><g:link class="show" action="show" controller="patient"
					id="${params.patientId}">
					<i class="icon-search"></i>
					<g:message code="default.show.label" args="[entityNamePatient]" />
				</g:link></li>
		</ul>
	</div>
</div>
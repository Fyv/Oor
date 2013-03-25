<g:if test="${isUpdated != null}">
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">×</button>
		Patient enregistré !
	</div>
</g:if>
<g:formRemote id="patientForm" class="form-horizontal"
	url="${[controller: 'patient', action:'update'] }" name="patientForm"
	method="post" update="updatePatient">
	<g:hiddenField name="id" value="${patientInstance?.id}" />
	<g:hiddenField name="version" value="${patientInstance?.version}" />
	<fieldset class="form">
		<g:render template="form" />
	</fieldset>
	<div class="form-actions">
		<fieldset class="buttons">
			<g:actionSubmit class="btn btn-primary save" action="update"
				value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="btn btn-danger delete" action="delete"
				value="${message(code: 'default.button.delete.label', default: 'Delete')}"
				formnovalidate=""
				onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</fieldset>
	</div>
</g:formRemote>
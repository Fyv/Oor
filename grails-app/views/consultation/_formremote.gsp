
<g:if test="${isUpdated != null}">
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">×</button>
		Consultation enregistré !
	</div>
</g:if>
<g:formRemote id="consultationForm" 
	url="${[controller: 'consultation', action:'save', params: [patientId: patientInstance?.id]] }"
	name="consultationForm" method="post" update="updateConsult"
	onSuccess="${remoteFunction(controller:'consultation', 
action:'refreshConsultations', params:[patientId:patientInstance?.id], 
update:'refreshList')}"
	>
	<fieldset class="form">
		<g:render template="../consultation/form" />
	</fieldset>
	<fieldset class="buttons">
		<g:submitButton name="create" class="btn btn-primary save"
			value="${message(code: 'default.button.create.label', default: 'Create')}" />
	</fieldset>
</g:formRemote>

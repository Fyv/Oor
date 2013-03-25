
<g:formRemote method="post"
	url="${[controller: 'consultation', action:'update']}"
	name="editConsultationForm" update="updateConsult" 
	onSuccess="${remoteFunction(controller:'consultation', 
action:'refreshConsultations', params:[patientId:patientInstance?.id], 
update:'refreshList')}"
	>
	<g:hiddenField name="id" value="${consultationInstance?.id}" />
	<g:hiddenField name="version" value="${consultationInstance?.version}" />
	<fieldset class="form">
		<g:render template="form" />
	</fieldset>
	<fieldset class="buttons">
		<g:actionSubmit class="save" action="update" class="btn btn-primary save"
			value="${message(code: 'default.button.update.label', default: 'Update')}" />
		<%--<g:actionSubmit class="delete" action="delete"
			value="${message(code: 'default.button.delete.label', default: 'Delete')}"
			formnovalidate=""
			onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
	</fieldset>
</g:formRemote>
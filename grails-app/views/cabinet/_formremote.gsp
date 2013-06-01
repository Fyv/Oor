<div class="span6">
	<g:if test="${isUpdated != null}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">×</button>
			Cabinet enregistré !
		</div>
	</g:if>
	<form id="cabinetForm" class="form-horizontal" name="cabinetForm"
		method="post">
		<g:hiddenField name="id" value="${cabinetInstance?.id}" />
		<g:hiddenField name="version" value="${cabinetInstance?.version}" />
		<fieldset class="form">
			<g:render template="../cabinet/form" />
		</fieldset>
		<div class="form-actions">
			<fieldset class="buttons">
				<g:if test="${cabinetInstance?.id != null}">
					<g:submitToRemote
						url="${[controller: 'cabinet', action:'update'] }"
						update="updateCabinet" class="btn btn-primary save"
						action="update"
						id="${cabinetInstance?.id}"
						version="${cabinetInstance?.version}"
						value="${message(code: 'default.button.edit.label', default: 'Update')}" />
				</g:if>
				<g:else>
					<g:submitToRemote url="${[controller: 'cabinet', action:'save'] }"
						update="updateCabinet" class="btn btn-primary save" action="save"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</g:else>
			</fieldset>
		</div>
	</form>
</div>
<div class="span3">
	<g:render template="../cabinet/table" />
</div>
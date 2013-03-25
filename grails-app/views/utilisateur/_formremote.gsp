<g:if test="${isUpdated != null}">
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">×</button>
		Préférences édité
	</div>
</g:if>
<div class=".form-actions">
	<g:formRemote id="utilisateurForm" class="form-horizontal"
		url="${[controller: 'utilisateur', action:'preferences'] }"
		name="utilisateurForm" method="post" update="updateUtilisateur">
		<g:hiddenField name="id" value="${utilisateurInstance?.id}" />
		<g:hiddenField name="version" value="${utilisateurInstance?.version}" />
		<fieldset class="form">
			<g:render template="form" />
		</fieldset>
		<div class="form-actions">
			<fieldset class="buttons">
				<g:actionSubmit class="btn btn-primary save" action="update"
					value="${message(code: 'default.button.update.label', default: 'Update')}" />
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<g:actionSubmit class="btn btn-primary delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						formnovalidate=""
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</sec:ifAllGranted>
			</fieldset>
		</div>
	</g:formRemote>
</div>

<%@ page import="com.oor.core.Cabinet"%>

<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: cabinetInstance, field: 'nom', 'error')} required">
		<label class="control-label" for="nom"> <g:message code="cabinet.nom.label"
				default="Nom" /> <span class="required-indicator">*</span>
		</label>

	</div>
	<div class="controls">
		<g:textField name="nom" required="" value="${cabinetInstance?.nom}" />
	</div>
</div>

<div class="control-group">

	<div
		class="fieldcontain ${hasErrors(bean: cabinetInstance, field: 'adresse', 'error')} ">
		<label  class="control-label" for="adresse"> <g:message code="cabinet.adresse.label"
				default="Adresse" />

		</label>
		<div class="controls">
			<g:textField name="adresse" value="${cabinetInstance?.adresse}" />
		</div>
	</div>
</div>
<g:render template="/commons/localite" />
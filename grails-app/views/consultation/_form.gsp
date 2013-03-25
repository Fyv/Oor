<%@ page import="com.oor.core.Consultation" %>

<div class="fieldcontain ${hasErrors(bean: consultationInstance, field: 'motif', 'error')} required">
	<label for="motif">
		<g:message code="consultation.motif.label" default="Motif" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="motif" required="" value="${consultationInstance?.motif}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: consultationInstance, field: 'doleance', 'error')} ">
	<label for="doleance">
		<g:message code="consultation.doleance.label" default="Doleance" />
		
	</label>
	<g:textArea name="doleance" value="${consultationInstance?.doleance}" rows="5" class="field span12"/>
</div>

<div class="fieldcontain ${hasErrors(bean: consultationInstance, field: 'traitement', 'error')} ">
	<label for="traitement">
		<g:message code="consultation.traitement.label" default="Traitement" />
		
	</label>
	<g:textArea name="traitement" value="${consultationInstance?.traitement}" rows="5" class="field span12"/>
</div>

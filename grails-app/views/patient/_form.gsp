<%@ page import="com.oor.core.Patient" %>



<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'civilite', 'error')} required">
	<label for="civilite">
		<g:message code="patient.civilite.label" default="Civilite" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="civilite" from="${com.oor.core.domain.enums.Civilite?.values()}" keys="${com.oor.core.domain.enums.Civilite.values()*.name()}" required="" value="${patientInstance?.civilite?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="patient.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${patientInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="patient.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${patientInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'adresse', 'error')} required">
	<label for="adresse">
		<g:message code="patient.adresse.label" default="Adresse" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="adresse" required="" value="${patientInstance?.adresse}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'adresseSuite', 'error')} ">
	<label for="adresseSuite">
		<g:message code="patient.adresseSuite.label" default="Adresse Suite" />
		
	</label>
	<g:textField name="adresseSuite" value="${patientInstance?.adresseSuite}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="patient.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${patientInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'telFixe', 'error')} ">
	<label for="telFixe">
		<g:message code="patient.telFixe.label" default="Tel Fixe" />
		
	</label>
	<g:textField name="telFixe" value="${patientInstance?.telFixe}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'telPortable', 'error')} ">
	<label for="telPortable">
		<g:message code="patient.telPortable.label" default="Tel Portable" />
		
	</label>
	<g:textField name="telPortable" value="${patientInstance?.telPortable}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'dateNaissance', 'error')} required">
	<label for="dateNaissance">
		<g:message code="patient.dateNaissance.label" default="Date Naissance" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateNaissance" precision="day"  value="${patientInstance?.dateNaissance}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sexe', 'error')} required">
	<label for="sexe">
		<g:message code="patient.sexe.label" default="Sexe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexe" from="${com.oor.core.domain.enums.Genre?.values()}" keys="${com.oor.core.domain.enums.Genre.values()*.name()}" required="" value="${patientInstance?.sexe?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'chirurgical', 'error')} ">
	<label for="chirurgical">
		<g:message code="patient.chirurgical.label" default="Chirurgical" />
		
	</label>
	<g:textField name="chirurgical" value="${patientInstance?.chirurgical}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'complementaire', 'error')} ">
	<label for="complementaire">
		<g:message code="patient.complementaire.label" default="Complementaire" />
		
	</label>
	<g:textField name="complementaire" value="${patientInstance?.complementaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'famille', 'error')} ">
	<label for="famille">
		<g:message code="patient.famille.label" default="Famille" />
		
	</label>
	<g:textField name="famille" value="${patientInstance?.famille}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'loisir', 'error')} ">
	<label for="loisir">
		<g:message code="patient.loisir.label" default="Loisir" />
		
	</label>
	<g:textField name="loisir" value="${patientInstance?.loisir}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'medical', 'error')} ">
	<label for="medical">
		<g:message code="patient.medical.label" default="Medical" />
		
	</label>
	<g:textField name="medical" value="${patientInstance?.medical}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'naissance', 'error')} ">
	<label for="naissance">
		<g:message code="patient.naissance.label" default="Naissance" />
		
	</label>
	<g:textField name="naissance" value="${patientInstance?.naissance}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'profession', 'error')} ">
	<label for="profession">
		<g:message code="patient.profession.label" default="Profession" />
		
	</label>
	<g:textField name="profession" value="${patientInstance?.profession}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'remarque', 'error')} ">
	<label for="remarque">
		<g:message code="patient.remarque.label" default="Remarque" />
		
	</label>
	<g:textField name="remarque" value="${patientInstance?.remarque}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'traumatisme', 'error')} ">
	<label for="traumatisme">
		<g:message code="patient.traumatisme.label" default="Traumatisme" />
		
	</label>
	<g:textField name="traumatisme" value="${patientInstance?.traumatisme}"/>
</div>


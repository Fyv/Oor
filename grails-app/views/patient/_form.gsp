<%@ page import="com.oor.core.Patient"%>
<ul class="nav nav-tabs" id="tab">
	<li class="active"><a href="#info" data-toggle="tab">Infos</a></li>
	<li><a href="#antecedent" data-toggle="tab">Antécedents</a></li>
</ul>
<div class="tab-content">

	<div class="tab-pane active" id="info">
	
	<g:if test="${cabinetInstanceList != null && !cabinetInstanceList.isEmpty()}">
		<div class="control-group">
			<label class="control-label" for="cabinet"> Cabinet
			</label>
			<div class="controls">
				<g:select name="cab" 
					from="${cabinetInstanceList?.nom}"
					keys="${cabinetInstanceList?.id}"  
					value="${patientInstance?.cabinet?.id }"/>
			</div>
		</div>
	</g:if>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'civilite', 'error')} required">

				<label class="control-label" for="civilite"> <g:message
						code="patient.civilite.label" default="Civilite" /> <span
					class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:select name="civilite"
						from="${com.oor.core.domain.enums.Civilite?.values()}"
						keys="${com.oor.core.domain.enums.Civilite.values()*.name()}"
						required="" value="${patientInstance?.civilite?.name()}" />
				</div>
			</div>
		</div>

		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'nom', 'error')} required">
				<label class="control-label" for="nom"> <g:message
						code="patient.nom.label" default="Nom" /> <span
					class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField name="nom" required="" value="${patientInstance?.nom}" />
				</div>
			</div>
		</div>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'prenom', 'error')} required">
				<label class="control-label" for="prenom"> <g:message
						code="patient.prenom.label" default="Prenom" /> <span
					class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField name="prenom" required=""
						value="${patientInstance?.prenom}" />
				</div>
			</div>
		</div>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'adresse', 'error')} required">
				<label class="control-label" for="adresse"> <g:message
						code="patient.adresse.label" default="Adresse" /> <span
					class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField name="adresse" required=""
						value="${patientInstance?.adresse}" />
				</div>
			</div>
		</div>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'adresseSuite', 'error')} ">
				<label class="control-label" for="adresseSuite"> <g:message
						code="patient.adresseSuite.label" default="Adresse Suite" />

				</label>
				<div class="controls">
					<g:textField name="adresseSuite"
						value="${patientInstance?.adresseSuite}" />
				</div>
			</div>
		</div>

		<g:render template="/commons/localite" />


		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'email', 'error')} ">
				<label class="control-label" for="email"> <g:message
						code="patient.email.label" default="Email" />

				</label>
				<div class="controls">
					<g:textField name="email" value="${patientInstance?.email}" />
				</div>
			</div>
		</div>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'telFixe', 'error')} ">
				<label class="control-label" for="telFixe"> <g:message
						code="patient.telFixe.label" default="Tel Fixe" />

				</label>
				<div class="controls">
					<g:textField name="telFixe" value="${patientInstance?.telFixe}" />
				</div>
			</div>
		</div>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'telPortable', 'error')} ">
				<label class="control-label" for="telPortable"> <g:message
						code="patient.telPortable.label" default="Tel Portable" />

				</label>
				<div class="controls">
					<g:textField name="telPortable"
						value="${patientInstance?.telPortable}" />
				</div>
			</div>
		</div>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'dateNaissance', 'error')} required">
				<label class="control-label" for="dateNaissance"> <g:message
						code="patient.dateNaissance.label" default="Date Naissance" /> <span
					class="required-indicator">*</span>
				</label>
				<div class="controls">
					<%--<g:datePicker name="dateNaissance" precision="day" class="span2"
						value="${patientInstance?.dateNaissance}" />--%>

					<input type="datetime" class="span10"
						value="<g:formatDate format="dd/MM/yyyy" date="${patientInstance?.dateNaissance}"/>"
						id="dp1" name="datenaissance" placeholder="ex: 01/01/1970">

				</div>
			</div>
		</div>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'sexe', 'error')} required">
				<label class="control-label" for="sexe"> <g:message
						code="patient.sexe.label" default="Sexe" /> <span
					class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:select name="sexe"
						from="${com.oor.core.domain.enums.Genre?.values()}"
						keys="${com.oor.core.domain.enums.Genre.values()*.name()}"
						required="" value="${patientInstance?.sexe?.name()}" />
				</div>
			</div>
		</div>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'loisir', 'error')} ">
				<label class="control-label" for="loisir"> <g:message
						code="patient.loisir.label" default="Loisir" />

				</label>
			</div>
			<div class="controls">
				<g:textArea name="loisir" value="${patientInstance?.loisir}"
					class="field span10" />
			</div>
		</div>
		<div class="control-group">
			<div
				class="fieldcontain ${hasErrors(bean: patientInstance, field: 'profession', 'error')} ">
				<label class="control-label" for="profession"> <g:message
						code="patient.profession.label" default="Profession" />

				</label>
				<div class="controls">
					<g:textArea name="profession"
						value="${patientInstance?.profession}" class="field span10" />
				</div>
			</div>
		</div>
	</div>
	<!-- end -->
	<div class="tab-pane" id="antecedent">
		<div
			class="fieldcontain ${hasErrors(bean: patientInstance, field: 'traumatisme', 'error')} ">
			<label for="traumatisme"> <g:message
					code="patient.traumatisme.label" default="Traumatisme" />

			</label>
			<g:textArea name="traumatisme"
				value="${patientInstance?.traumatisme}" class="field span10" />
		</div>
		<div
			class="fieldcontain ${hasErrors(bean: patientInstance, field: 'chirurgical', 'error')} ">
			<label for="chirurgical"> <g:message
					code="patient.chirurgical.label" default="Chirurgical" />

			</label>
			<g:textArea name="chirurgical"
				value="${patientInstance?.chirurgical}" class="field span10" />
		</div>

		<div
			class="fieldcontain ${hasErrors(bean: patientInstance, field: 'complementaire', 'error')} ">
			<label for="complementaire"> <g:message
					code="patient.complementaire.label"
					default="Examens complémentaires / Musculosquelettique" />

			</label>
			<g:textArea name="complementaire"
				value="${patientInstance?.complementaire}" class="field span10" />
		</div>
		<div
			class="fieldcontain ${hasErrors(bean: patientInstance, field: 'medical', 'error')} ">
			<label for="medical"> <g:message code="patient.medical.label"
					default="Medical" />

			</label>
			<g:textArea name="medical" value="${patientInstance?.medical}"
				class="field span10" rows="5" />
		</div>

		<div
			class="fieldcontain ${hasErrors(bean: patientInstance, field: 'grossesse', 'error')} ">
			<label for="grossesse"> <g:message
					code="patient.grossesse.label" default="Grossesse(s)" />

			</label>
			<g:textArea name="grossesse" value="${patientInstance?.grossesse}"
				class="field span10" />
		</div>
		<div
			class="fieldcontain ${hasErrors(bean: patientInstance, field: 'traitement', 'error')} ">
			<label for="traitement"> <g:message
					code="patient.traitement.label" default="Traitement" />

			</label>
			<g:textArea name="traitement" value="${patientInstance?.traitement}"
				class="field span10" />
		</div>
		<div
			class="fieldcontain ${hasErrors(bean: patientInstance, field: 'posturologie', 'error')} ">
			<label for="posturologie"> <g:message
					code="patient.posturologie.label" default="Posturologie" />

			</label>
			<g:textArea name="posturologie"
				value="${patientInstance?.posturologie}" class="field span10" />
		</div>
		<div
			class="fieldcontain ${hasErrors(bean: patientInstance, field: 'naissance', 'error')} ">
			<label for="naissance"> <g:message
					code="patient.naissance.label" default="Naissance" />

			</label>
			<g:textArea name="naissance" value="${patientInstance?.naissance}"
				class="field span10" />
		</div>


		<div
			class="fieldcontain ${hasErrors(bean: patientInstance, field: 'remarque', 'error')} ">
			<label for="remarque"> <g:message
					code="patient.remarque.label" default="Remarque" />

			</label>
			<g:textArea name="remarque" value="${patientInstance?.remarque}"
				class="field span10" rows="1" />
		</div>

	</div>
</div>
<script>
	$(function() {
		$('#dp1').datepicker({
			format : 'dd/mm/yyyy'
		});
	})
</script>

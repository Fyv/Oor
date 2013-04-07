<h3>${patientInstanceTotal} patient<g:if test="${patientInstanceTotal > 1 }">s</g:if> trouvé</h3>
<table class="table table-striped">
	<thead>
		<tr>

			<th>Civilite</th>
			<th>Nom</th>
			<th>Prenom</th>

			<th>Email</th>
			<th>Actions</th>

		</tr>
	</thead>
	<tbody>
		<g:each in="${patientInstanceList}" status="i" var="patientInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td>
					${fieldValue(bean: patientInstance, field: "civilite")}
				</td>

				<td>
					${fieldValue(bean: patientInstance, field: "nom")}
				</td>

				<td>
					${fieldValue(bean: patientInstance, field: "prenom")}
				</td>

				<td>
					${fieldValue(bean: patientInstance, field: "email")}
				</td>
				<td class="link">
					<div class="btn-group">
						<g:link class="btn" action="edit" id="${patientInstance?.id}">
							<i class="icon-search"></i>
							<g:message code="default.button.show.label" default="Show" />
						</g:link>
					</div>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>

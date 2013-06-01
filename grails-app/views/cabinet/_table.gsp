<%@ page import="com.oor.core.Cabinet"%>

<div id="list-cabinet" class="content scaffold-list" role="main">
	<h1>Cabinets Associés</h1>
	<g:if test="${cabinetInstanceAll.isEmpty()}">
		<span>Aucun cabinet créé</span>
	</g:if>
	<g:else>
		<g:each in="${cabinetInstanceAll}" status="i" var="cabinetInstance">
			<ul>
				<li>Nom : ${cabinetInstance.nom }
				</li>
				<li>Administrateur : ${cabinetInstance.admin.nom } ${cabinetInstance.admin.prenom }</li>
				<li>
					<g:remoteLink action="show"
					id="${fieldValue(bean: cabinetInstance, field: "id")}"
					controller="cabinet" 
					update="updateCabinet"
					>
					<small>Modifier</small></g:remoteLink>
				</li>
			</ul>
		</g:each>
	</g:else>
</div>
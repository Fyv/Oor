
<div class="span3">
	<div class="well">
		<ul class="nav nav-list">
			<li class="nav-header">
				${entityName}
			</li>
			<li class="active"><g:link class="list" action="list">
					<i class="icon-list icon-white"></i>
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<i class="icon-plus"></i>
					<g:message code="default.create.label" args="[entityName]" />
				</g:link></li>
			<li class="nav-header">Recherche patient</li>
			<li><g:form id="searchForm" class="form-search"
					url="${[controller: 'patient', action:'search'] }"
					name="searchForm" method="post" update="searchUpdate">
					<div class="input-append">
						<input type="text" name="searchValue" id="searchValue"
							class="input-medium search-query">
						<g:actionSubmit type="submit" action="search" class="btn"
							value="Search"></g:actionSubmit>
					</div>
				</g:form></li>
		</ul>
	</div>
</div>
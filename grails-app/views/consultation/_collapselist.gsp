<g:if test="${!consultationInstanceList.isEmpty() }">
	<div id="listConsultation" class="accordion" id="accordion">
		<g:each in="${consultationInstanceList}" status="i"
			var="consultationInstance">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion" href="${'#collapse'+i }"> ${fieldValue(bean: consultationInstance, field: "motif")}
						le <g:formatDate format="dd/MM/yyyy"
							date="${consultationInstance.dateCreated}" />
					</a>
				</div>
				<div id="${'collapse'+i }" class="accordion-body collapse">
					<div class="accordion-inner">
						<g:if test="${consultationInstance?.doleance }">
							<h6>Doléance</h6>
							<div>
								${consultationInstance.doleance}
							</div>
						</g:if>
						<g:if test="${consultationInstance?.traitement }">
							<h6>Traitement</h6>
							<div>
								${consultationInstance.traitement}
							</div>
						</g:if>
						<g:remoteLink action="edit"
							id="${fieldValue(bean: consultationInstance, field: "id")}"
							controller="consultation" 
							update="updateConsult"
							params="[patientId:patientInstance?.id]"
							class="pull-right">
							<small>Editer</small>
						</g:remoteLink>
					</div>
				</div>
			</div>
		</g:each>
		<div class="pagination-centered">
			<g:paginate total="${consultationInstanceTotal}"
				id="${patientInstance.id}"
				maxsteps="${3 }"
				 />
		</div>
	</div>
</g:if>
<g:else>
	<h3>Aucune consultation</h3>
</g:else>
<script type="text/javascript">
	$(document).ready(function() {
		setupGridAjax();
	});

	// Turn all sorting and paging links into ajax requests for the grid
	function setupGridAjax() {
		$("#listConsultation").find(".paginateButtons a, th.sortable a").live(
				'click', function(event) {
					event.preventDefault();
					var url = $(this).attr('href');

					var grid = $(this).parents("table.ajax");
					$(grid).html($("#spinner").html());

					$.ajax({
						type : 'GET',
						url : url,
						success : function(data) {
							$(grid).fadeOut('fast', function() {
								$(this).html(data).fadeIn('slow');
							});
						}
					})
				});
	}
</script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="auth" uri="spring.security.taglib.tld"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var counter = 2;

						$("#addButton")
								.click(
										function() {

											if (counter > 5) {
												alert("Only 5 textboxes allow");
												return false;
											}

											var newTextBoxDiv = $(
													document
															.createElement('div'))
													.attr(
															"id",
															'TextBoxDiv'
																	+ counter);
											newTextBoxDiv.attr("style",
													'height: 30px');

											newTextBoxDiv
													.after()
													.html(
															'<input class="tf" size="30" name="objname'+counter +'" id="objname'+counter+'"/>'
																	+ '&nbsp;&nbsp; <input class="tf" size="30" name="objid' + counter + '" id="objid' + counter + '" />');

											newTextBoxDiv
													.appendTo("#TextBoxesGroup");

											counter++;
										});

						$("#removeButton").click(function() {
							if (counter == 2) {
								//alert("No more textbox to remove");
								return false;
							}

							counter--;

							$("#TextBoxDiv" + counter).remove();

						});

					});
	function submitModule() {
		document.forms["viewObj"].submit();
	}
</script>

<div class="securemainbody">
	<div class="left gride900">
		<h2 >Select Module to View Objects</h2>
	</div>
	<br />
	<form name="viewObj" action="editObjectIds.htm" method="post"
		class="white">
		<center>
			<div class="left mb15" style="width: 100%; text-align: center;">
				<span class="title">Select Category :</span> &nbsp; <select
					id="project_module" name="project_module" class="selectbox2"
					onchange="submitModule();">
					<option value="">Select</option>
					<c:forEach var="module" items="${PROJECT_MODULES }">
						<option value="${module}"
							<c:if test="${module eq  moduleName}" > selected="selected"  </c:if>>${module}</option>
					</c:forEach>
				</select> <input type="hidden" name="project_name" id="project_name"
					value="${PROJECT_NAME }" />
				<div id="errormsg">${msg}</div>
			</div>

			<br /> <br />


			<table class="dynaLabel" style="width: 500px;">
				<tr>
					<th class="dynaLabel" style="text-align: left;"><span
						class="title">Object Reference</span>
					</th>
					<th class="dynaLabel" style="text-align: right;"><span
						class="title">Object ID</span>
					</th>
				</tr>
				<c:set var="count" value="1" scope="page" />
				<c:forEach var="obj" items="${vObjectIds}">
				
					<tr>
						<th style="text-align: left;">
						<div  style="width: 100%; text-align: center; height: 30px">
						<input type="text"
							name="objname${count}" id="objname${count}" class="tf" size="30"
							value="${obj.key}" /></div>
							</th>
						<th style="text-align: right;">
						<div  style="width: 100%; text-align: center; height: 30px">
						<input type="text"
							name="objid${count}" id="objid${count}" class="tf" size="30"
							value="${obj.value}" />
						</div>	</th>
							
					</tr>
					
					<c:set var="count" value="${count + 1}" scope="page" />
				</c:forEach>
			</table>

			<input type="hidden" name="objCount" value="${count}"> <input
				type="submit" id='getIds' class="loginbtn" name="setIds"
				value="Update" size="30" />
		</center>
	</form>

</div>
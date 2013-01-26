<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String utenteLoggato = (String) request.getSession().getAttribute(
			"nomeUtente");

	if (utenteLoggato == null || utenteLoggato.isEmpty()) {
		response.sendRedirect("index.jsp");
	}
%>
<jsp:include page="Header.jsp">
	<jsp:param name="titolo" value="richiesta abilit�" />
</jsp:include>

<div id="content">
	<div class="right">

		<div id="contentTitle">Richiesta abilit�</div>
		<div class="articles">
			<div class="main_content">
				<form action="InviaRichiestaAbilita" method="post">
					<fieldset>
						<table>
							<tr>
								<td class="td_campi_form"><label for="nomeAbilita">Nome
										abilit�:</label></td>
								<td style="height: 49px"><input name="nomeAbilita"
									type="text" style="width: 185px" /></td>
							</tr>
							<tr>
								<td class="td_campi_form"><label for="descrizione">Descrizione:</label></td>
								<td style="height: 49px"><input name="descrizione" type="text"
									style="width: 185px" /></td>
							</tr>
							<tr>
								<td class="td_campi_form"></td>
								<td align=center>
								<input name="submit" type="submit"
									alt="InviaRichiestaAbilita" /></td>
							</tr>
							<%
								String messaggioRegistrazione = (String) request
										.getAttribute("messaggio");

								if (messaggioRegistrazione != null
										&& !messaggioRegistrazione.isEmpty()) {
							%>
							<tr>
								<td>
									<div id="erroreRegistrazione">

										<%
											out.print(messaggioRegistrazione);
										%><br />
									</div>
								</td>
							</tr>
							<%
								}
							%>
						</table>
					</fieldset>
				</form>
			</div>
		</div>

	</div>

	<div class="left">

		<h2>
			Benvenuto
			<%
			String nomeStud = (String) session.getAttribute("nomeUtente");
			out.print(nomeStud);
		%>!
		</h2>
	</div>
	<div style="clear: both;"></div>
</div>


<jsp:include page="Footer.jsp" />
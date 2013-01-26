<%@page import="it.swimv2.entities.remoteEntities.IUtente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="Header.jsp">
	<jsp:param name="titolo" value="Ricerca" />
</jsp:include>

<div id="content">
	<div class="right">

		<div id="contentTitle">
			Ricerca per username<br />
		</div>
		<div class="articles">
			<div class="main_content">
				<form action="RicercaUtente" method="post">
					<fieldset>
						<table>
							<tr>
								<td class="td_campi_form"><label>Ricerca:</label></td>
								<td style="height: 49px"><input name="testoRicerca"
									type="text" id="nome" style="width: 185px" /></td>
								<td><input name="submit" type="submit" alt="RicercaUtente" /></td>
							</tr>
						</table>
					</fieldset>
				</form>
				<%
					IUtente[] risultato = (IUtente[]) request
							.getAttribute("risultatoRicerca");
					if (risultato != null && risultato.length > 0) {
				%>
				<table>
					<tr>
						<td style="height: 49px">Nomeutente</td>
						<td style="height: 49px">Nome</td>
						<td style="height: 49px">Cognome</td>
					</tr>
					<%
						for (int i = 0; i < risultato.length; i++) {
					%>
					<tr>
						<td style="height: 49px">
							<%
								risultato[i].getUsername();
							%>
						</td>
						<td style="height: 49px">
							<%
								risultato[i].getNome();
							%>
						</td>
						<td style="height: 49px">
							<%
								risultato[i].getCognome();
							%>
						</td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					}
				%>


			</div>

		</div>
	</div>

	<div class="left">
		<%
			String utenteLoggato = (String) request.getSession().getAttribute(
					"nomeUtente");
			if (utenteLoggato != null && !utenteLoggato.isEmpty()) {
		%>
		<span id="Benvenuto"><h2>
				Benvenuto <br />
				<%
					out.print(utenteLoggato);
				%>!

			</h2> <br /> <br /></span>
		<form action="Logout" method="post">
			<input id="immagineLogout" name="submit" type="image"
				src="css/images/button-logout.jpg" alt="Logout" />
		</form>
		<%
			}
		%>
	</div>
	<div style="clear: both;"></div>
</div>

<jsp:include page="Footer.jsp" />
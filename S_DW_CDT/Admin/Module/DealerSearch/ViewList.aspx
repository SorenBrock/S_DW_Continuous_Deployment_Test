<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ViewList.aspx.vb" Inherits="Dynamicweb.Admin.DealerSearch.Backend.ViewList" %>
<%@ Import namespace="Dynamicweb" %>
<%@ Import namespace="Dynamicweb.Backend" %>

<%
Dim showTxt as string = Translate.Translate("Visninger")
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title></title>
		<link rel="STYLESHEET" type="text/css" href="/Admin/Stylesheet.css">
		<script language="javascript">
		function del(ID){
			if(confirm("Slet?")){
				location = "ViewDelete.aspx?ID=" + ID;
			}
		}
		</script>
		<%=Gui.MakeHeaders(showTxt, showTxt, "Javascript", false, "")%>
	</head>
	<body>
	<%=Gui.MakeHeaders(showTxt, showTxt, "Html", false, "")%>
	<table border="0" cellpadding="0" cellspacing="0" class="tabTable">
		<tr>
			<td valign="top">
				<br>
				<table border="0" cellpadding="0" width="598">
					<tr>
						<td width="468"><strong><%=Translate.Translate("Navn")%></strong></td>
						<td width="30" align="center"><strong><%=Translate.Translate("Slet")%></strong></td>		
					</tr>
					<tr>
						<td colspan="2" bgcolor="#C4C4C4"><img src="/Admin/images/nothing.gif" width=1 height=1 alt="" border="0"></td>
					</tr>
					<asp:literal id="Literal1" runat="server"></asp:literal>
					<tr>
						<td align="right" colspan="2">
							<table>
								<tr>
									<td><%=Gui.Button("Ny visning", "location = 'ViewEdit.aspx';", 0)%></td>
									<td><%=Gui.Button(Translate.Translate("Annuller"), "location = 'CategoryList.aspx';", 0)%></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</body>
</html>
<%Translate.GetEditOnlineScript()%>
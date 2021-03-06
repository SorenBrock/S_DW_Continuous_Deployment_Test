﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ListForms.aspx.vb" Inherits="Dynamicweb.Admin.ListForms" %>

<%@ Register Assembly="Dynamicweb.Controls" Namespace="Dynamicweb.Controls" TagPrefix="dw" %>
<%@ Import Namespace="Dynamicweb.Backend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<dw:ControlResources ID="ctrlResources" IncludePrototype="false" runat="server" />
	<script type="text/javascript">
		function help() {
		    <%=Dynamicweb.Gui.help("","modules.basicforms") %>
        }

		function editform(formid) {
			if (!formid) {
				var formid = ContextMenu.callingID;
			}
			overlayShow();
			location = "EditForm.aspx?ID=" + formid;
		}

		function deleteform() {
			var formid = ContextMenu.callingID;
			var formName = document.getElementById("formname" + formid).innerHTML;
			if (confirm("<%=Translate.JsTranslate("Slet %%?", "%%", Translate.JsTranslate("formular"))%> (" + formName + ")")) {
				overlayShow();
				location = "ListForms.aspx?action=delete&ID=" + formid;
			}
		}

		function copyform() {
			var formid = ContextMenu.callingID;
			overlayShow();
			location = "ListForms.aspx?action=copy&ID=" + formid;
		}

		function newform() {
			document.getElementById("FormName").value = "<%=Translate.JsTranslate("Ny formular")%>";
			document.getElementById("FormID").value = 0;
			dialog.show('settingsDialog');
			document.getElementById("FormName").select();
		}

		function renameform() {
			var formid = ContextMenu.callingID;
			var elmId = "formname" + formid;
			document.getElementById("FormName").value = document.getElementById(elmId).innerHTML;
			document.getElementById("FormID").value = formid;
			dialog.show('settingsDialog');
			document.getElementById("FormName").focus();
		}

		function saveform() {
			document.getElementById("renameform").submit();
		}

		function resetform() {
			dialog.hide('settingsDialog');
			document.getElementById("renameform").reset();
		}

		function submits(formid) {
			if (!formid) {
				var formid = ContextMenu.callingID;
			}
			overlayShow();
			location = "ListSubmits.aspx?formid=" + formid;
		}

		function overlayShow() {
			showOverlay('wait');
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<dw:Toolbar ID="ToolbarButtons" runat="server" ShowEnd="false">
			<dw:ToolbarButton ID="cmdAdd" runat="server" Divide="None" ImagePath="/Admin/Images/Ribbon/Icons/Small/form_blue_add.png" Text="Ny formular" OnClientClick="newform();" />
			<dw:ToolbarButton ID="cmdHelp" runat="server" Divide="None" Image="Help" Text="Help" OnClientClick="help();" />
		</dw:Toolbar>
		<h2 class="subtitle">
			<dw:TranslateLabel ID="lbSetup" Text="Formularer" runat="server" />
			<span runat="server" id="formcount"></span>
		</h2>
		<dw:List ID="list" ShowPaging="false" PageSize="1000" NoItemsMessage="" ShowTitle="false" ShowCollapseButton="false" StretchContent="false" runat="server">
			<Columns>
				<dw:ListColumn ID="colName" Name="Name" Width="150" runat="server" EnableSorting="true" />
				<dw:ListColumn ID="colFields" Name="Fields" Width="60" runat="server" ItemAlign="Center" HeaderAlign="Center" EnableSorting="true" />
				<dw:ListColumn ID="colSubmits" Name="Submits" Width="60" runat="server" ItemAlign="Center" HeaderAlign="Center" EnableSorting="true" />
				<dw:ListColumn ID="colLastsubmit" Name="Last submit" Width="120" runat="server" EnableSorting="true" />
				<dw:ListColumn ID="colCreated" Name="Edited" Width="120" runat="server" EnableSorting="true" />
				<dw:ListColumn ID="colEdited" Name="Bruger" Width="120" runat="server" EnableSorting="true" />
			</Columns>
		</dw:List>
	</form>

	<dw:Dialog ID="settingsDialog" runat="server" Width="540" ShowOkButton="true" OkAction="saveform();" OkText="Gem" ShowCancelButton="true" CancelAction="resetform();" ShowClose="true" IsModal="true" Title="Formular">
		<form id="renameform" method="post">
			<input type="hidden" id="FormID" name="ID" />
			<input type="hidden" id="action" name="action" value="save" />
			<dw:GroupBox ID="GB_settings" runat="server" DoTranslation="True" Title="Indstillinger">
				<table>
					<tr>
						<td width="170" valign="top">
							<label for="FormName">
								<dw:TranslateLabel runat="server" Text="Navn" />
							</label>
						</td>
						<td>
							<input type="text" id="FormName" name="FormName" maxlength="255" class="std" />
						</td>
					</tr>
				</table>
			</dw:GroupBox>
		</form>
	</dw:Dialog>

	<dw:ContextMenu ID="EditForm" runat="server">
		<dw:ContextMenuButton ID="ContextMenuButton3" runat="server" Text="Rediger" ImagePath="/Admin/Images/Ribbon/Icons/Small/Edit.png" OnClientClick="editform();" Divide="After">
		</dw:ContextMenuButton>
		<dw:ContextMenuButton ID="ContextMenuButton4" runat="server" Text="Kopier" ImagePath="/Admin/Images/Ribbon/Icons/Small/Copy.png" OnClientClick="copyform();">
		</dw:ContextMenuButton>
		<dw:ContextMenuButton ID="ContextMenuButton1" runat="server" Text="Omdøb" ImagePath="/Admin/Images/Ribbon/Icons/Small/RenameDocument.png" OnClientClick="renameform();">
		</dw:ContextMenuButton>
		<dw:ContextMenuButton ID="ContextMenuButton2" runat="server" Text="Form data" ImagePath="/Admin/Images/Ribbon/Icons/Small/data_view.png" OnClientClick="submits();">
		</dw:ContextMenuButton>
		
		<dw:ContextMenuButton ID="deleteFieldBtn" runat="server" Text="Slet formular" Image="Delete" OnClientClick="deleteform();" Divide="Before">
		</dw:ContextMenuButton>
	</dw:ContextMenu>
	<dw:Overlay ID="wait" runat="server"></dw:Overlay>
	<%  
		Dynamicweb.Backend.Translate.GetEditOnlineScript()
	%>
</body>
</html>

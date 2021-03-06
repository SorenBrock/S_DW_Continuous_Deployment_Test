﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="FieldOptionsList.ascx.vb" Inherits="Dynamicweb.Admin.eComBackend.FieldOptionsList" %>
<%@ Register TagPrefix="dw" Namespace="Dynamicweb.Controls" Assembly="Dynamicweb.Controls" %>

<div class="grid-container">
    <dw:EditableGrid ID="optionsGrid" AllowAddingRows="true" AddNewRowMessage="Click here to add new option..." 
        NoRowsMessage="No options found" AllowDeletingRows="false" AllowSortingRows="true" runat="server">
        <Columns>
            <asp:TemplateField HeaderText="Name" HeaderStyle-Width="200">
                <ItemTemplate>
                    <div style="white-space: nowrap">
                        &nbsp;<asp:TextBox ID="txName" CssClass="std" Width="200" Text='<%#TranslatedName(Container.DataItem)%>' runat="server" />
                    </div>
                    <asp:HiddenField ID="hID" Value='<%#Eval("ID")%>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Value" HeaderStyle-Width="200">
                <ItemTemplate>
                    <asp:TextBox ID="txValue" CssClass="std" Width="200" Text='<%#Eval("Value")%>' runat="server" />
                    <asp:HiddenField ID="hValue" Value='<%#Eval("Value")%>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default" HeaderStyle-Width="75">
                <ItemTemplate>
                    <span class="option-field-offset">
                        <asp:CheckBox ID="chkDefault" Checked='<%#Eval("IsDefault")%>' runat="server" />
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" HeaderStyle-Width="75">
                <ItemTemplate>
                    <span class="option-field-offset">
                        <a href="javascript:void(0);" onclick="FieldOptionsList.deleteRow(this);">
                            <img src="/Admin/Images/Ribbon/Icons/Small/Delete.png" alt="" border="0" />
                        </a>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </dw:EditableGrid>
</div>
<div class="sorting-hint">
    <dw:TranslateLabel ID="lbSorting" Text="Hint: you can change options order by dragging rows in the list." runat="server" />
</div>

<span class="hidden-message message-delete-row"><dw:TranslateLabel ID="lbDeleteRow" Text="Are you sure you want to delete an option '%%' ?" runat="server" /></span>
<span class="hidden-message message-not-specified"><dw:TranslateLabel ID="lbNotSpecified" Text="Not specified" runat="server" /></span>
<span class="hidden-message message-not-unique-values"><dw:TranslateLabel ID="lbNotUnique" Text="The value is not unique '%%'." runat="server" /></span>

<script type="text/javascript">
    function CheckUniquenessOfValues() {
        if (!<%=EnforceUniqueValues.ToString().ToLower() %>)
            return "";

        var rows = dwGrid_optionsGrid.rows.getAll();
        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            var valueField = row.findControl('txValue');
            var value = valueField.value;

            for (var j = i + 1; j < rows.length; j++) {
                var loopRow = rows[j];
                var loopValueField = loopRow.findControl('txValue');

                if (loopValueField.value == value) {
                    loopValueField.focus();
                    return FieldOptionsList._message("message-not-unique-values").replace("%%", value);
                }
            }
        }
        return "";
    }
</script>

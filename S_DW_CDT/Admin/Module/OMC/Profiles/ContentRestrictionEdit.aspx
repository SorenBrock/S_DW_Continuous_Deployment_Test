﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ContentRestrictionEdit.aspx.vb" Inherits="Dynamicweb.Admin.OMC.Profiles.ContentRestrictionEdit" %>
<%@ Register TagPrefix="dw" Namespace="Dynamicweb.Controls" Assembly="Dynamicweb.Controls" %>
<%@ Register TagPrefix="omc" TagName="ContentRestrictionEditor" Src="~/Admin/Module/OMC/Controls/ContentRestrictionEditor.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />

        <title><dw:TranslateLabel ID="lbTitle" Text="Content restriction edit" runat="server" /></title>
        <dw:ControlResources ID="ctrlResources" runat="server" />

        <style type="text/css">
            html, body
            {
                margin: 0px;
                padding: 0px;
                background-color: #efefef !important;
                border-right: none !important;
                height: auto;
            }
        </style>

        <script type="text/javascript">
            var w = null;
            var editorObj = null;
            var editor = '<%=EditorClientInstanceName%>';

            if (typeof (parent.Dynamicweb) != 'undefined' &&
                typeof (parent.Dynamicweb.Controls) != 'undefined' &&
                typeof (parent.Dynamicweb.Controls.PopUpWindow) != 'undefined') {

                w = parent.Dynamicweb.Controls.PopUpWindow.current(window);
                w.add_ok(function (sender, args) {
                    if (!editorObj) {
                        try {
                            editorObj = eval(editor);
                        } catch (ex) { }
                    }

                    if (editorObj) {
                        args.set_cancel(true);

                        editorObj.validate(function (isValid) {
                            if (isValid) {
                                sender.get_okButton().disabled = true;
                                sender.get_operationIndicator().show();

                                editorObj.save();
                            } else {
                                alert(editorObj.get_lastError());
                            }
                        });
                    }
                });
            }
        </script>
    </head>

    <body>
        <form id="MainForm" runat="server">
            <omc:ContentRestrictionEditor ID="restrictionEditor" runat="server" />
        </form>

        <%Dynamicweb.Backend.Translate.GetEditOnlineScript()%>
    </body>
</html>

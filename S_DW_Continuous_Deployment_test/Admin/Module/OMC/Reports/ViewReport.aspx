﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Module/OMC/EntryContent.Master" CodeBehind="ViewReport.aspx.vb" Inherits="Dynamicweb.Admin.OMC.Reports.ViewReport" %>
<%@ Register TagPrefix="dw" Namespace="Dynamicweb.Controls" Assembly="Dynamicweb.Controls" %>
<%@ Register TagPrefix="dw" Namespace="Dynamicweb.Controls.Charts" Assembly="Dynamicweb.Controls" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <asp:Panel ID="pChart" runat="server">
            <h2 id="elmReportName" class="omc-report-heading" runat="server"></h2>
            <p id="elmReportDescription" class="omc-report-description" runat="server"></p>

            <table border="0" cellspacing="4" cellpadding="0">
                <tr>
                    <td valign="top">
                        <dw:RoundedFrame ID="frmChart" runat="server">
                            <div id="divDataTruncated" class="report-data-truncated" style="display: none" runat="server">
                                <dw:Infobar ID="infoTruncated" Type="Warning" Message="Report data has been truncated for best user experience." runat="server" />
                            </div>

                            <!--#comment_start#-->

                            <div id="divInstallChromeFrame" class="report-install-chromeframe" style="display: none" runat="server">
                                <dw:Infobar ID="infoInstallChromeFrame" Type="Information" TranslateMessage="False" runat="server" />
                            </div>

                            <!--#comment_end#-->

                            <dw:Chart ID="repChart" Width="500" Height="400" AutoDraw="false" runat="server" />
                        </dw:RoundedFrame>

                        <div ID="divChartArea" class="omc-report-data" runat="server">
                            <dw:RoundedFrame ID="frmChartData" runat="server">
                                <dw:Chart ID="repChartData" Width="500" AutoDraw="false" Type="Table" runat="server" />
                            </dw:RoundedFrame>
                        </div>
                    </td>

                    <td valign="top">
                        <div id="divFiltersArea" class="omc-filters-container" runat="server">
                            <dw:RoundedFrame ID="frmFilters" Width="320" CssClass="omc-report-filters" runat="server">
                            </dw:RoundedFrame>
                        </div>

                        <!--#comment_start#-->

                        <dw:RoundedFrame ID="frmTasks" Width="320" CssClass="omc-report-tasks" runat="server">
                            <ul>
                                <li>
                                    <span>
                                        <a class="omc-report-task-edit" href="javascript:void(0);" onclick="ViewReport.editReport();"><dw:TranslateLabel ID="lbEditReport" Text="Edit report" runat="server" /></a>
                                    </span>
                                    <div class="omc-clear"></div>
                                </li>
                                <li>
                                    <a class="omc-report-task-export-csv" href="javascript:void(0);" onclick="ViewReport.exportReportData();">
                                        <span>
                                            <dw:TranslateLabel ID="lbExportReportData" Text="Export to CSV" runat="server" />
                                        </span>
                                        <img id="imgExportProgress" src="/Admin/Module/Seo/Dynamicweb_wait.gif" alt="" title="<%=Dynamicweb.Backend.Translate.JsTranslate("Exporting...")%>" border="0" style="display: none" />
                                        <div class="omc-clear"></div>
                                    </a>
                                </li>
                                <li>
                                    <a class="omc-report-task-export-pdf" href="javascript:void(0);" onclick="ViewReport.exportReportData('pdf');">
                                        <span>
                                            <dw:TranslateLabel ID="lbExportReportDataPdf" Text="Export to PDF" runat="server" />
                                        </span>
                                        <img id="imgExportProgress_pdf" src="/Admin/Module/Seo/Dynamicweb_wait.gif" alt="" title="<%=Dynamicweb.Backend.Translate.JsTranslate("Exporting...")%>" border="0" style="display: none" />
                                        <div class="omc-clear"></div>
                                    </a>
                                </li>
                                <li>
                                    <span>
                                        <a class="omc-report-task-delete" href="javascript:void(0);" onclick="ViewReport.deleteReport();"><dw:TranslateLabel ID="lbDeleteReport" Text="Delete report" runat="server" /></a>
                                    </span>
                                    <div class="omc-clear"></div>
                                </li>
                            </ul>
                        </dw:RoundedFrame>

                        <!--#comment_end#-->
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="pNoChart" runat="server">
            <dw:Infobar ID="barNoChart" Message="Report cannot be displayed." Type="Error" TranslateMessage="false" runat="server" />
        </asp:Panel>
    </div>

    <script type="text/javascript">
        <asp:Literal ID="litClientInitialize" runat="server" />
    </script>

    <asp:Literal ID="litExportToFileContent" runat="server" />
</asp:Content>

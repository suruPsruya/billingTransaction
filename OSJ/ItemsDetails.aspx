<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="ItemsDetails.aspx.cs" Inherits="OSJ.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<script>
        function openWin() {

            var w = 950;
            var h = 450;
            var left = Number((screen.width / 2) - (w / 2));
            var tops = Number((screen.height / 2.2) - (h / 2));

            window.open("NewItems.aspx", "Popup", 'toolbar=no, location=no, directories=no, titlebar=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + tops + ', left=' + left);
        }
        function openWin1() {

            var w = 950;
            var h = 450;
            var left = Number((screen.width / 2) - (w / 2));
            var tops = Number((screen.height / 2.2) - (h / 2));

            window.open("NewItemsEdit.aspx", "Popup", 'toolbar=no, location=no, directories=no, titlebar=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + tops + ', left=' + left);
        }
    </script>--%>
    <div class="container">
        <p style="font-size: 24px; color: #EBE8E7">Items Details</p>
        <div class="card" style="margin-top: -15px; box-shadow: 3px 3px 3px 3px #CDD9F7; background-color: #000000">
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-9" style="padding-right: 30px;">
                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Search" Style="max-width: 100%; width: 100%; background-color: transparent; border-bottom: 1px solid white" BorderStyle="None" ForeColor="White"></asp:TextBox>
                    </div>
                    <div class="col-sm-3" style="text-align: right;">
                        <button class="btn1" style="background-color: #5B0305; border-style: none;">
                            <asp:LinkButton ID="LinkButton1" ForeColor="White" Font-Underline="False" runat="server">
    <div class="fa fa-search">&nbsp;</div>Search!
                            </asp:LinkButton>
                        </button>
                        <button class="btn1" style="background-color: #03155B; border-style: none;">
                            <asp:LinkButton ID="LinkRecord" runat="server" ForeColor="White"
                                Font-Underline="False">+ New Record</asp:LinkButton>
                        </button>
                    </div>
                </div>

                <p style="color: white">
                    Filter By : [Name]
                </p>
            </div>
        </div>
    </div>

    <%--<div class="container" style="margin-top: 15px;">
        <div class="card" style="border-color: White; box-shadow: 1px 1px 1px 1px #C0C0C0;">
            <div class="card-body">
                <asp:GridView ID="grdCenter" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover table-responsive-lg"
                    DataKeyNames="id" OnRowDeleting="GridView_RowDeleting" OnRowCommand="GridView1_RowCommand"
                    OnSelectedIndexChanged="grdCenter_SelectedIndexChanged" Font-Size="10pt"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                    CellPadding="3">
                    <Columns>

                        <asp:TemplateField HeaderText="SN" ItemStyle-Width="50">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblSN" runat="server" ForeColor="Black" Text='<%#Container.DataItemIndex+1 %>'>></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="SN" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" ForeColor="Black" Text='<%#Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="TYPES" ItemStyle-Width="90">
                            <ItemStyle HorizontalAlign="Left" />
                            <ItemTemplate>
                                <asp:Label ID="lblTypes" runat="server" ForeColor="Black" Text='<%# Eval("types").ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ITEMS" ItemStyle-Width="280">
                            <ItemStyle HorizontalAlign="Left" />
                            <ItemTemplate>
                                <asp:Label ID="lblItems" runat="server" ForeColor="Black" Text='<%# Eval("item").ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="TAG" ItemStyle-Width="90">
                            <ItemStyle HorizontalAlign="Left" />
                            <ItemTemplate>
                                <asp:Label ID="lblTagNo" runat="server" ForeColor="Black" Text='<%# Eval("tagNo").ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="SHORT NAME" ItemStyle-Width="90">
                            <ItemStyle HorizontalAlign="Left" />
                            <ItemTemplate>
                                <asp:Label ID="lblShortName" runat="server" ForeColor="Black" Text='<%# Eval("shortName").ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ACTION" ItemStyle-Width="90">
                            <ItemStyle HorizontalAlign="Center" Width="65px" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" Title="Edit Record" CommandName="Select"
                                    OnClick="btnOpen1_Click" CommandArgument="<%# Container.DataItemIndex %>">
                                    <i class="fa fa-file" style="color: Green"></i>
                                </asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="cmdDelete" runat="server" Title="Delete Record" CommandName="Delete"
                                    OnClientClick="return confirm('Do you want to delete record ?');"
                                    CommandArgument='<% #Bind("tagNo") %>'>
                                    <i class="fa fa-trash" style="color:Red"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>
        </div>
    </div>--%>
</asp:Content>

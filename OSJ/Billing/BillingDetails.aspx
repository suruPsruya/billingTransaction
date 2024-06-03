﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="BillingDetails.aspx.cs" Inherits="OSJ.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <p style="font-size: 24px; color: #EBE8E7">Billing Details</p>
        <div class="card" style="margin-top: -15px; box-shadow: 3px 3px 3px 3px #CDD9F7; background-color: #000000">
            <div class="card-body">
                
                <div class="row">
                    <div class="col-sm-9" style="padding-right: 30px;">
                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Search" style="max-width:100%; width: 100%; background-color: transparent; border-bottom:1px solid white" BorderStyle="None" ForeColor="White"></asp:TextBox>
                    </div>
                    <div class="col-sm-3" style="text-align: right;">
                        <button class="btn1" style="background-color: #5B0305; border-style: none;">
                            <asp:LinkButton ID="LinkButton1" ForeColor="White" Font-Underline="False" runat="server">
                                <div class="fa fa-search">&nbsp;</div>Search!
                            </asp:LinkButton>
                        </button>
                        <button class="btn1" style="background-color: #03155B; border-style: none;">
                            <asp:LinkButton ID="billingDetails" ForeColor="White" Font-Underline="False" runat="server" OnClick="billingDetails_Click">
                                + New Record
                            </asp:LinkButton>
                        </button>
                    </div>
                </div>
                <p style="color: white">
                    Filter By  [AC No. , Client Name]
                </p>
            </div>
        </div>
    </div>

    <%--<div class="container" style="margin-top: 15px;">
        <div class="card" style=" background-color: #000000">
            <div class="card-body">
                <asp:GridView ID="grdCenter" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-responsive-lg hover-gridview"
                    Font-Size="10pt" ForeColor="White" DataKeyNames="BillT" OnRowCommand="GridView1_RowCommand"                
                    OnRowDeleting="GridView_RowDeleting" onselectedindexchanged="grdCenter_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="SN">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblSN" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="SN" Visible="false">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_Id" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="ACNO" SortExpression="Name">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblAccountno" runat="server" Text='<%# Eval("accountNo").ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="CLIENT NAME" SortExpression="Name">
                            <ItemStyle HorizontalAlign="Left" />
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("clientName").ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="REFERRED" SortExpression="Name">
                            <ItemStyle HorizontalAlign="Left" />
                            <ItemTemplate>
                                <asp:Label ID="lblReferred" runat="server" Text='<%# Eval("referred").ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="ADDRESS" SortExpression="Name">
                            <ItemStyle HorizontalAlign="Left" />
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("address").ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="MOBILE" SortExpression="Name">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("mobile").ToString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="ACTION" SortExpression="Name">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="cmdBill" runat="server" Title="Print Record" CommandName="Select"
                                  CommandArgument="<%# Container.DataItemIndex %>">
                                    <i class="fa fa-print" style="color: Blue"></i>
                                </asp:LinkButton> 
                                |
                                <asp:LinkButton ID="deleteRecord" runat="server" Title="Delete Record" CommandName="Delete"
                                OnClientClick="return confirm('Do you want to delete record ?');" 
                                CommandArgument='<% #Bind("clientName") %>'>
                                    <i class="fa fa-trash" style="color:Red"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#5B0305" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
    </div>--%>
</asp:Content>

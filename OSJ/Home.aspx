<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OSJ.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <div class="row">
        <div class="col-md-3">
            <div class="card" style="background-color: #101010;">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-9">
                            <p style="font-family: Consolas; color: white">Customer Details</p>
                            <button class="btn" style="background-color: #5B0305; border-style: none;">
                                <asp:LinkButton ID="customerDetails" runat="server" ForeColor="White"
                                Font-Underline="False" OnClick="customerDetails_Click"><div class="fa fa-arrow-circle-o-right">&nbsp;</div>More info</asp:LinkButton></button>
                        </div>
                        <div class="col-sm-3">
                            <p style="font-size: 42px; color: #BCCBF0;"><i class="fa-regular fa-address-book"></i></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card" style="background-color: #101010;">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-9">
                            <p style="font-family: Consolas; color: white">Credit List</p>
                            <button class="btn" style="background-color: #5B0305; border-style: none;">
                                <asp:LinkButton ID="creditList" runat="server" ForeColor="White"
                                Font-Underline="False"><div class="fa fa-arrow-circle-o-right">&nbsp;</div>More info</asp:LinkButton></button>
                        </div>
                        <div class="col-sm-3">
                            <p style="font-size: 42px; color: #BCCBF0;"><i class="fa-solid fa-list-ul"></i></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card" style="background-color: #101010;">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-9">
                            <p style="font-family: Consolas; color: white">Creditlist 0 Balance</p>
                            <button class="btn" style="background-color: #5B0305; border-style: none;">
                                <asp:LinkButton ID="creditList0Balance" runat="server" ForeColor="White"
                                Font-Underline="False"><div class="fa fa-arrow-circle-o-right">&nbsp;</div>More info</asp:LinkButton></button>
                        </div>
                        <div class="col-sm-3">
                            <p style="font-size: 42px; color: #BCCBF0;"><i class="fa-regular fa-rectangle-list"></i></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card" style="background-color: #101010;">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-9">
                            <p style="font-family: Consolas; color: white">Expenses/Income</p>
                            <button class="btn" style="background-color: #5B0305; border-style: none;">
                                <asp:LinkButton ID="expensesIncome" runat="server" ForeColor="White"
                                Font-Underline="False"><div class="fa fa-arrow-circle-o-right">&nbsp;</div>More info</asp:LinkButton></button>
                        </div>
                        <div class="col-sm-3">
                            <p style="font-size: 42px; color: #BCCBF0;"><i class="fa-solid fa-indian-rupee-sign"></i></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

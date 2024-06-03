<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditSale.aspx.cs" Inherits="OSJ.CreditSale" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="/fontawesome/css/all.css" rel="stylesheet" />

    <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/bootstrap/js/popper.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>

    <style>
        body{
            background-image: linear-gradient(#03155B, #5B0305, #000000);
            height: 100vh;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top: 24px;">
            <center>
                <p style="font-size: 24px; font-family: Century; color: #EBE8E7">Credit Sales</p>
                <p style="margin-top: -15px; color: #728AEA">Note : * - Indicates a required fields.Complete the all required fields.</p>
            </center>

            <div class="row" style="color: #EBE8E7; font-family: Consolas">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <center>
                        <p>
                            Client Name :
                                    <asp:Label ID="lblClientName" runat="server"></asp:Label>
                            <asp:Label ID="lblAddress" runat="server"></asp:Label>
                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                        </p>
                        <p>
                            <asp:Label ID="lblAccountNo" runat="server"></asp:Label>
                            <asp:Label ID="lblReferred" runat="server"></asp:Label>
                            <asp:Label ID="lblAddition" runat="server"></asp:Label>
                            <asp:TextBox ID="txtAddition" runat="server" BackColor="#03155B"
                                BorderStyle="None" Font-Size="Larger" Height="17px"
                                Style="margin-left: 3px" Width="128px" ForeColor="#03155B"></asp:TextBox>
                        </p>
                    </center>

                    <div class="row">
                        <div class="col-lg-3">
                            <label for="exampleFormControlInput1" class="form-label">Date *</label>
                            <asp:TextBox ID="txtCurrentDate" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-lg-9">
                            <label for="exampleFormControlInput1" class="form-label">Item Description *</label>
                            <asp:TextBox ID="txtItemDescription" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-lg-3">
                            <label for="exampleFormControlInput1" class="form-label">Amount *</label>
                            <asp:TextBox ID="txtAmount" CssClass="form-control rightText" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <label for="exampleFormControlInput1" class="form-label">Pay</label>
                            <asp:TextBox ID="txtPay" CssClass="form-control rightText" runat="server" onclick="AddAmount();"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <label for="exampleFormControlInput1" class="form-label">Gold/Swap</label>
                            <asp:TextBox ID="txtGoldSwap" CssClass="form-control rightText" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <label for="exampleFormControlInput1" class="form-label">Balance *</label>
                            <asp:TextBox ID="txtBalance" CssClass="form-control rightText" runat="server" onclick="Adds();"></asp:TextBox>
                        </div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-lg-9">
                            <label for="exampleFormControlInput1" class="form-label">Remark's</label>
                            <asp:TextBox ID="txtRemark" CssClass="form-control" runat="server"
                                onclick="Addalls();"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <label for="exampleFormControlInput1" class="form-label">Next Due Date *</label>
                            <asp:TextBox ID="txtDueDate" CssClass="form-control" runat="server"
                                autocomplete="off" TextMode="Date" Font-Size="Medium"></asp:TextBox>
                        </div>
                    </div>

                    <br />

                    <center>
                        <button type="button" class="btn" style="background-color: #03155B; border-style: none;">
                            <asp:LinkButton ID="btnSubmit" Font-Underline="False" ForeColor="White"
                                runat="server">Submit</asp:LinkButton>
                        </button>

                        <button type="button" class="btn" style="background-color: #5B0305; border-style: none;">
                            <asp:LinkButton ID="btnBack" Font-Underline="False" ForeColor="White"
                                runat="server" OnClick="btnBack_Click">Back</asp:LinkButton>
                        </button>
                    </center>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
    </form>
</body>
</html>

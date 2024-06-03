<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomersEdit.aspx.cs" Inherits="OSJ.CustomersEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="fontawesome/css/all.css" rel="stylesheet" />

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
                <p style="font-size: 24px; font-family: Century; color: #EBE8E7">Customer's</p>
                <p style="margin-top: -15px; color: #728AEA">Note : * - Indicates a required fields.Complete the all required fields.</p>
            </center>
            <div class="container" style="color: #EBE8E7; font-family: Consolas">
                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-7">
                                <label for="exampleFormControlInput1" class="form-label">Client Name *</label>
                                <asp:TextBox ID="txtClientName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-5">
                                <label for="exampleFormControlInput1" class="form-label">Account No.*</label>
                                <asp:TextBox ID="txtAccountNo" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-lg-7">
                                <label for="exampleFormControlInput1" class="form-label">Address *</label>
                                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-lg-5">
                                <label for="exampleFormControlInput1" class="form-label">Category *</label>
                                <asp:DropDownList ID="listCategory" CssClass="form-control" runat="server" Font-Names="Consolas"></asp:DropDownList>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-lg-6">
                                <label for="exampleFormControlInput1" class="form-label">Mobile *</label>
                                <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-lg-6">
                                <label for="exampleFormControlInput1" class="form-label">PAN</label>
                                <asp:TextBox ID="txtPan" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-lg-6">
                                <label for="exampleFormControlInput1" class="form-label">Aadhar No</label>
                                <asp:TextBox ID="txtAadhar" CssClass="form-control" runat="server"
                                    MaxLength="12"></asp:TextBox>
                            </div>

                            <div class="col-lg-6">
                                <label for="exampleFormControlInput1" class="form-label">Referred By</label>
                                <asp:TextBox ID="txtReferred" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <center>
                            <button type="button" class="btn" style="background-color: #03155B; border-style: none;">
                                <asp:LinkButton ID="btnUpdate" Font-Underline="False" ForeColor="White" runat="server" OnClick="btnUpdate_Click">
                                            Update
                                </asp:LinkButton>
                            </button>
                            <button type="button" class="btn" style="background-color: #5B0305; border-style: none;">
                                <asp:LinkButton ID="btnBack" Font-Underline="False" ForeColor="White" runat="server" OnClick="btnBack_Click">
                                            Back
                                </asp:LinkButton>
                            </button>
                        </center>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

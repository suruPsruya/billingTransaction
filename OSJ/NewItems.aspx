<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewItems.aspx.cs" Inherits="OSJ.NewItems" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link href="bootstrap-5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <%--<link rel="stylesheet" href="font/font-awesome.min.css" />--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="Js/popper.min.js" crossorigin="anonymous"></script>
    <script src="bootstrap-5.2.2/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #F4F7FC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top: 24px;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="exampleFormControlInput1" class="form-label">Item*</label>
                                        <asp:TextBox ID="txtItems" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <br />

                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="exampleFormControlInput1" class="form-label">Types*</label>
                                        <asp:DropDownList ID="listTypes" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="exampleFormControlInput1" class="form-label">Short Name*</label>
                                        <asp:TextBox ID="txtShortName" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="exampleFormControlInput1" class="form-label">Tag No</label>
                                        <asp:TextBox ID="txtTagNo" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <br />


                                <center>
                                    <button class="btn btn-success">
                                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="False"
                                            ForeColor="White" OnClick="LinkButton1_Click">
                                      Back
                                        </asp:LinkButton>
                                    </button>
                                    <button type="button" class="btn btn-primary">
                                        <asp:LinkButton ID="btnSubmit" Font-Underline="False" ForeColor="White"
                                            runat="server" OnClick="btnSubmit_Click">Submit</asp:LinkButton>
                                    </button>

                                    <%--<button type="button" class="btn btn-danger">
                                   <asp:LinkButton ID="btnBack" Font-Underline="False" ForeColor="White"
                                   runat="server" onclick="btnBack_Click">Back</asp:LinkButton>
                               </button>--%>
                                </center>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

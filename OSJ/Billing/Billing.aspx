<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="OSJ.Billing" %>

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
        .rightText {
            text-align: right;
        }
    </style>
</head>
<body style="background-image: linear-gradient(#03155B, #5B0305, #000000); height: 120vh; background-repeat: no-repeat">
    <form id="form1" runat="server">

        <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Font-Size="Larger" Height="29px" Style="margin-left: 3px" Width="162px" BackColor="#03155B" ForeColor="#F4F7FC"></asp:TextBox>
        <asp:Label ID="lblAccountNo" runat="server" BackColor="#03155B" ForeColor="#003366"></asp:Label>
        <asp:Label ID="lblReferred" runat="server" BackColor="#03155B" ForeColor="#F4F7FC"></asp:Label>
        <asp:TextBox ID="txtFinalBal" runat="server" BorderStyle="None" BackColor="#03155B" ForeColor="#003366"></asp:TextBox>
        <asp:TextBox ID="txtStockBillDate" runat="server" BackColor="#03155B" BorderStyle="None" ForeColor="#F4F7FC"></asp:TextBox>
        <asp:TextBox ID="txtAddition" runat="server" BackColor="#03155B" BorderStyle="None" Font-Size="Larger" Height="1px" Style="margin-left: 3px" Width="1px" ForeColor="#F4F7FC"></asp:TextBox>
        <asp:TextBox ID="txtSubstraction" runat="server" BackColor="#03155B" BorderStyle="None" Font-Size="Larger" Height="1px" Style="margin-left: 3px" Width="1px" ForeColor="#F4F7FC"></asp:TextBox>
        <asp:TextBox ID="txtTagNo" runat="server" BackColor="#03155B" BorderStyle="None" Font-Size="Larger" Height="1px" Style="margin-left: 3px" Width="1px" ForeColor="Black"></asp:TextBox>
        <asp:TextBox ID="txttn" runat="server" BackColor="#03155B" BorderStyle="None" Font-Size="Larger" Height="1px" Style="margin-left: 3px" Width="1px" ForeColor="Black"></asp:TextBox>
        <asp:Label ID="lblFine" CssClass="newLabel" runat="server" Visible="False"></asp:Label>

        <div class="container-fluid" style="margin-top: 24px;">
            <div class="row">
                <div class="col-lg-7">
                    <center>
                        <p style="font-size: 24px; font-family: Century; color: #EBE8E7">Billing Cash/Credit</p>
                        <p style="margin-top: -15px; color: #728AEA">Note : * - Indicates a required fields.Complete the all required fields.</p>
                    </center>
                    <div style="color: #EBE8E7; font-family: Consolas">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">Bill Types *</label>
                                <asp:DropDownList ID="listBillType" CssClass="form-control" runat="server"
                                    OnSelectedIndexChanged="listBillType_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">BillNo *</label>
                                <asp:TextBox ID="txtBillNo" CssClass="form-control" runat="server"
                                    ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">Date</label>
                                <asp:TextBox ID="txtDate" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">Name*</label><br />
                                <asp:DropDownList ID="listClientName" runat="server" class="form-control" AutoPostBack="True"
                                    OnSelectedIndexChanged="listClientName_SelectedIndexChanged" Width="160px">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">Address</label>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-7">
                                <label for="exampleFormControlInput1" class="form-label">-</label>
                                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">-</label>
                                <asp:TextBox ID="lblMobile" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-4">
                                <label for="exampleFormControlInput1" class="form-label">Item Name *</label>
                                <asp:DropDownList ID="listItem" CssClass="form-control" runat="server"
                                    OnSelectedIndexChanged="listItem_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">Tag No *</label>&nbsp;<asp:Label ID="lblCarat" runat="server"></asp:Label>
                                <asp:DropDownList ID="listAcc" CssClass="form-control" runat="server"
                                    OnSelectedIndexChanged="listAcc_SelectedIndexChanged1" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">Gold/Silver *</label>
                                <asp:TextBox ID="txtType" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">Weight *</label>&nbsp;<asp:Label ID="lblWt" runat="server"></asp:Label>
                                <asp:TextBox ID="txtWeight" CssClass="form-control rightText" runat="server">0</asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-12">
                                <label for="exampleFormControlInput1" class="form-label">Item Description</label>&nbsp;<asp:Label ID="lblDescription" runat="server"></asp:Label>
                                <asp:TextBox ID="txtItemDescription" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">Amount *</label>
                                <asp:TextBox ID="txtAmount" CssClass="form-control rightText" runat="server">0</asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">M_Charges</label>
                                <asp:DropDownList ID="listMakingCharge" CssClass="form-control" runat="server"
                                    OnSelectedIndexChanged="listMakingCharge_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">Percent (%)</label>
                                <asp:TextBox ID="txtPercent" CssClass="form-control rightText" runat="server">0</asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">Making</label>
                                <asp:TextBox ID="txtMaking" CssClass="form-control rightText" runat="server">0</asp:TextBox>

                                <asp:LinkButton ID="lnkHidden" runat="server" OnClick="OnBlur" />
                            </div>
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">Total</label>
                                <asp:TextBox ID="txtTotal" CssClass="form-control rightText" runat="server">0</asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn" style="margin-top: 32px; background-color: #03155B; border-style: none;">
                                    <asp:LinkButton ID="btnAdd" Font-Underline="False" ForeColor="White"
                                        runat="server" OnClientClick="return confirm('Do you want to Save record ?');" OnClick="btnAdd_Click">Add Item</asp:LinkButton>
                                </button>
                            </div>
                        </div>

                        <br />

                        <asp:GridView ID="grdCenter" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-responsive-lg hover-gridview"
                            Font-Size="10pt" ForeColor="White" DataKeyNames="tagNo">
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
                        
                                <asp:TemplateField HeaderText="Description" SortExpression="Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("itemDescription").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                        
                                <asp:TemplateField HeaderText="Tag" SortExpression="Name">
                                    <ItemStyle HorizontalAlign="Left" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblTagNo" runat="server" Text='<%# Eval("tagNo").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                        
                                <asp:TemplateField HeaderText="Amount" SortExpression="Name">
                                    <ItemStyle HorizontalAlign="Left" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("amount").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                        
                                <asp:TemplateField HeaderText="Weight" SortExpression="Name">
                                    <ItemStyle HorizontalAlign="Left" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblWeight" runat="server" Text='<%# Eval("weight").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                        
                                <asp:TemplateField HeaderText="Making" SortExpression="Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblMaking" runat="server" Text='<%# Eval("making").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                        
                                <asp:TemplateField HeaderText="Total" SortExpression="Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("total").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                        
                                <asp:TemplateField HeaderText="ACTION" SortExpression="Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cmdDelete" runat="server" Title="Delete Record" CommandName="Delete"
                                        OnClientClick="return confirm('Do you want to delete record ?');" 
                                        CommandArgument='<% #Bind("tagNo") %>'>
                                            <i class="fa fa-trash" style="color:Red"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#5B0305" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </div>
                <div class="col-lg-5">
                    <center>
                        <p style="font-size: 24px; font-family: Century; color: #EBE8E7">GST & Gross Amount</p>
                    </center>
                    <div style="color: #EBE8E7; font-family: Consolas; padding-top: 25px">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">Amount *</label>
                                <asp:TextBox ID="txtFinalAmount" CssClass="form-control rightText" runat="server">0</asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">CGST *</label>
                                <asp:TextBox ID="txtCGST" CssClass="form-control rightText" runat="server">0</asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">SGST *</label>
                                <asp:TextBox ID="txtSGST" CssClass="form-control rightText" runat="server">0</asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <label for="exampleFormControlInput1" class="form-label">HaLLMark</label>
                                <asp:TextBox ID="txtHallMark" CssClass="form-control rightText" runat="server">0</asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">Total *</label>
                                <asp:TextBox ID="txtFinalTotal" CssClass="form-control rightText" runat="server">0</asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-4">
                                <label for="exampleFormControlInput1" class="form-label">Cash *</label>
                                <asp:TextBox ID="txtCash" CssClass="form-control rightText" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label for="exampleFormControlInput1" class="form-label">Swap/Online</label>
                                <asp:DropDownList ID="listSwapOnline" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <label for="exampleFormControlInput1" class="form-label">Swap/Online</label>
                                <asp:TextBox ID="txtSwapOnline" CssClass="form-control rightText" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-3">
                                <label for="exampleFormControlInput1" class="form-label">OLD Gold</label>
                                <asp:TextBox ID="txtOld" CssClass="form-control rightText" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-5">
                                <label for="exampleFormControlInput1" class="form-label">Round (-) / Discount</label>
                                <asp:TextBox ID="txtRound" CssClass="form-control rightText" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label for="exampleFormControlInput1" class="form-label">Balance *</label>
                                <asp:TextBox ID="txtFinalBalance" CssClass="form-control rightText" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-6">
                                <label for="exampleFormControlInput1" class="form-label">Sales By *</label>
                                <asp:TextBox ID="txtSalesBy" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="exampleFormControlInput1" class="form-label">Next Due Date</label>
                                <asp:TextBox ID="txtNextDate" runat="server" class="form-control"
                                    autocomplete="off" TextMode="Date" Font-Size="Medium"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-6">
                                <label for="exampleFormControlInput1" class="form-label">Remarks</label>
                                <asp:TextBox ID="txtRemarks" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="exampleFormControlInput1" class="form-label">Payment Remarks</label>
                                <asp:TextBox ID="txtPaymentR" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <center>
                            <button type="button" class="btn" style="background-color: #03155B; border-style: none;">
                                <asp:LinkButton ID="btnSave" Font-Underline="False" ForeColor="White" runat="server">Save</asp:LinkButton>
                            </button>
                            <button type="button" class="btn" style="background-color: #5B0305; border-style: none;">
                                <asp:LinkButton ID="btnBack" Font-Underline="False" ForeColor="White" runat="server" OnClick="btnBack_Click">Back</asp:LinkButton>
                            </button>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

using Microsoft.Identity.Client;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSJ
{
    public partial class Billing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        static string tn = "";
        static string tt = "";
        static int tfa1, to1, tc1, tfb1;
        static int tfa2, to2, tc2, tfb2;
        static double totalTotal;

        static int ittots;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListData();
                ListData1();

                listBillType.Items.Add("Select Bill Type");
                listBillType.Items.Add("Bill");
                listBillType.Items.Add("Bill WG");
                listBillType.Items.Add("Estimate");

                listMakingCharge.Items.Add("Fixed");
                listMakingCharge.Items.Add("%");
                listMakingCharge.Items.Add("Fine %");

                listSwapOnline.Items.Add("None");
                listSwapOnline.Items.Add("Card Debit/Credit");
                listSwapOnline.Items.Add("PayTM");
                listSwapOnline.Items.Add("PhonePay");
                listSwapOnline.Items.Add("UPI");
                listSwapOnline.Items.Add("Others");

            }
        }
        protected void ListData()
        {
            using (SqlConnection con1 = new SqlConnection(strcon))
            {
                using (SqlCommand cmd1 = new SqlCommand("SELECT distinct item FROM tblStockIn order by item"))
                {
                    cmd1.CommandType = CommandType.Text;
                    cmd1.Connection = con1;
                    con1.Open();
                    listItem.DataSource = cmd1.ExecuteReader();
                    listItem.DataTextField = "item";
                    listItem.DataValueField = "Item";
                    listItem.DataBind();
                    con1.Close();

                    listItem.Items.Insert(0, new ListItem("Select Item", "0"));
                }
            }
        }
        protected void ListData1()
        {
            using (SqlConnection con1 = new SqlConnection(strcon))
            {
                using (SqlCommand cmd1 = new SqlCommand("SELECT clientName FROM tblCustomer order by clientName"))
                {
                    cmd1.CommandType = CommandType.Text;
                    cmd1.Connection = con1;
                    con1.Open();
                    listClientName.DataSource = cmd1.ExecuteReader();
                    listClientName.DataTextField = "clientName";
                    listClientName.DataValueField = "clientName";
                    listClientName.DataBind();
                    con1.Close();

                    listClientName.Items.Insert(0, new ListItem("Select Name", "0"));
                }
            }
        }
        protected void listBillType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBillType.SelectedItem.Text == "Bill")
            {
                txtCGST.Visible = true;
                txtSGST.Visible = true;

                int maxrows;
                string mpar_code;
                int m1par_code;

                String strConnString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

                SqlConnection con;
                con = new SqlConnection(strConnString);
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from [tblBill] where [BillT]  LIKE '" + "OSJ" + "%'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                adp.Fill(ds, "sonu");
                dt = ds.Tables[0];

                maxrows = ds.Tables["sonu"].Rows.Count;

                if (maxrows == 0)
                    mpar_code = "0";
                else
                    mpar_code = dt.Rows[maxrows - 1]["BillT"].ToString().Substring(4, 6);

                m1par_code = Convert.ToInt32(mpar_code) + 1;
                mpar_code = (Convert.ToInt32(mpar_code) + 1).ToString();

                if (m1par_code < 10)
                {
                    mpar_code = "OSJ-00000" + mpar_code.ToString();
                }

                if (m1par_code < 100 && m1par_code > 9)
                {
                    mpar_code = "OSJ-0000" + mpar_code.ToString();
                }

                if (m1par_code < 1000 && m1par_code > 99)
                {
                    mpar_code = "OSJ-000" + mpar_code.ToString();
                }

                if (m1par_code < 10000 && m1par_code > 999)
                {
                    mpar_code = "OSJ-00" + mpar_code.ToString();
                }
                if (m1par_code < 100000 && m1par_code > 9999)
                {
                    mpar_code = "OSJ-0" + mpar_code.ToString();
                }
                if (m1par_code < 1000000 && m1par_code > 99999)
                {
                    mpar_code = "OSJ-" + mpar_code.ToString();
                }

                txtBillNo.Text = mpar_code;

                maxrows = 0;
            }
            else if (listBillType.SelectedItem.Text == "Bill WG")
            {
                txtCGST.Visible = false;
                txtSGST.Visible = false;

                int maxrows;
                string mpar_code;
                int m1par_code;

                String strConnString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

                SqlConnection con;
                con = new SqlConnection(strConnString);
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from [tblBill] where [BillT]  LIKE '" + "WOSJ" + "%'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                adp.Fill(ds, "sonu");
                dt = ds.Tables[0];

                maxrows = ds.Tables["sonu"].Rows.Count;

                if (maxrows == 0)
                    mpar_code = "0";
                else
                    mpar_code = dt.Rows[maxrows - 1]["BillT"].ToString().Substring(5, 6);

                m1par_code = Convert.ToInt32(mpar_code) + 1;
                mpar_code = (Convert.ToInt32(mpar_code) + 1).ToString();

                if (m1par_code < 10)
                {
                    mpar_code = "WOSJ-00000" + mpar_code.ToString();
                }

                if (m1par_code < 100 && m1par_code > 9)
                {
                    mpar_code = "WOSJ-0000" + mpar_code.ToString();
                }

                if (m1par_code < 1000 && m1par_code > 99)
                {
                    mpar_code = "WOSJ-000" + mpar_code.ToString();
                }

                if (m1par_code < 10000 && m1par_code > 999)
                {
                    mpar_code = "WOSJ-00" + mpar_code.ToString();
                }
                if (m1par_code < 100000 && m1par_code > 9999)
                {
                    mpar_code = "WOSJ-0" + mpar_code.ToString();
                }
                if (m1par_code < 1000000 && m1par_code > 99999)
                {
                    mpar_code = "WOSJ-" + mpar_code.ToString();
                }

                txtBillNo.Text = mpar_code;

                maxrows = 0;
            }

            else
            {
                txtCGST.Visible = false;
                txtSGST.Visible = false;

                int maxrows;
                string mpar_code;
                int m1par_code;

                String strConnString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

                SqlConnection con;
                con = new SqlConnection(strConnString);
                con.Open();

                SqlCommand cmd = new SqlCommand("Select * from [tblBill] where [BillT]  LIKE '" + "EOSJ" + "%'", con);

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                adp.Fill(ds, "sonu");
                dt = ds.Tables[0];

                maxrows = ds.Tables["sonu"].Rows.Count;

                if (maxrows == 0)
                    mpar_code = "0";
                else
                    mpar_code = dt.Rows[maxrows - 1]["BillT"].ToString().Substring(5, 6);

                m1par_code = Convert.ToInt32(mpar_code) + 1;
                mpar_code = (Convert.ToInt32(mpar_code) + 1).ToString();

                if (m1par_code < 10)
                {
                    mpar_code = "EOSJ-00000" + mpar_code.ToString();
                }

                if (m1par_code < 100 && m1par_code > 9)
                {
                    mpar_code = "EOSJ-0000" + mpar_code.ToString();
                }

                if (m1par_code < 1000 && m1par_code > 99)
                {
                    mpar_code = "EOSJ-000" + mpar_code.ToString();
                }

                if (m1par_code < 10000 && m1par_code > 999)
                {
                    mpar_code = "EOSJ-00" + mpar_code.ToString();
                }
                if (m1par_code < 100000 && m1par_code > 9999)
                {
                    mpar_code = "EOSJ-0" + mpar_code.ToString();
                }
                if (m1par_code < 1000000 && m1par_code > 99999)
                {
                    mpar_code = "EOSJ-" + mpar_code.ToString();
                }

                txtBillNo.Text = mpar_code;

                maxrows = 0;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            if (tt == "Group")
            {
                txtSubstraction.Text = (float.Parse(lblWt.Text) - float.Parse(txtWeight.Text)).ToString();
            }
            else
            {
                txtSubstraction.Text = (float.Parse(txtWeight.Text) - float.Parse(txtWeight.Text)).ToString();
            }


            // Half Bill
            String strConnString1 = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

            SqlConnection con2;
            con2 = new SqlConnection(strConnString1);
            con2.Open();

            SqlCommand cmd2 = new SqlCommand("insert into tblHalfBill (itemDescription,tagNo,weight,amount,making,total,BillT,carat) values (@cItemDescription,@cTagNo,@cWeight,@cAmount,@cMaking,@cTotal,@cBillT,@cCarat)", con2);

            cmd2.Parameters.Add("@cItemDescription", SqlDbType.VarChar).Value = txtItemDescription.Text.Trim();
            if (tt == "Group")
                cmd2.Parameters.Add("@cTagNo", SqlDbType.VarChar).Value = txtTagNo.Text.Trim();
            else
                cmd2.Parameters.Add("@cTagNo", SqlDbType.VarChar).Value = txttn.Text.Trim();
            cmd2.Parameters.Add("@cWeight", SqlDbType.VarChar).Value = txtWeight.Text.Trim();
            cmd2.Parameters.Add("@cAmount", SqlDbType.VarChar).Value = txtAmount.Text.Trim();
            cmd2.Parameters.Add("@cMaking", SqlDbType.VarChar).Value = txtMaking.Text.Trim();
            cmd2.Parameters.Add("@cTotal", SqlDbType.VarChar).Value = txtTotal.Text.Trim();
            cmd2.Parameters.Add("@cBillT", SqlDbType.VarChar).Value = txtBillNo.Text.Trim();
            cmd2.Parameters.Add("@cCarat", SqlDbType.VarChar).Value = lblCarat.Text.Trim();
            cmd2.ExecuteNonQuery(); // insert

            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Added')", true);

            con2.Close();


            // Left Record Bill
            String strConnStringLeftRecordBill = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

            SqlConnection conLeftRecordBill;
            conLeftRecordBill = new SqlConnection(strConnStringLeftRecordBill);
            conLeftRecordBill.Open();

            SqlCommand cmdLeftRecordBill = new SqlCommand("insert into tblLeftRecordBill (itemDescription,tagNo,weight,amount,making,total,BillT,billDate,type,item,percentage,carat,accountNo,clientName,stockBillDate) values (@cItemDescription,@cTagNo,@cWeight,@cAmount,@cMaking,@cTotal,@cBillT,@cBillDate,@cType,@cItem,@cPercentage,@cCarat,@cAccountNo,@cClientName,@cStockBillDate)", conLeftRecordBill);

            cmdLeftRecordBill.Parameters.AddWithValue("@cItemDescription", txtItemDescription.Text);
            if (tt == "Group")
                cmdLeftRecordBill.Parameters.AddWithValue("@cTagNo", txtTagNo.Text);
            else
                cmdLeftRecordBill.Parameters.AddWithValue("@cTagNo", txttn.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cWeight", txtWeight.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cAmount", txtAmount.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cMaking", txtMaking.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cTotal", txtTotal.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cBillT", txtBillNo.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cBillDate", txtDate.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cType", txtType.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cItem", listItem.SelectedItem.Value);
            cmdLeftRecordBill.Parameters.AddWithValue("@cPercentage", txtPercent.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cCarat", lblCarat.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cAccountNo", lblAccountNo.Text);
            cmdLeftRecordBill.Parameters.AddWithValue("@cClientName", txtName.Text);
            //cmdLeftRecordBill.Parameters.AddWithValue("@cStockBillDate", txtStockBillDate.Text);
            DateTime stockBillDate;
            if (DateTime.TryParse(txtStockBillDate.Text, out stockBillDate))
            {
                cmdLeftRecordBill.Parameters.Add("@cStockBillDate", SqlDbType.DateTime).Value = stockBillDate;
            }
            else
            {
                // Handle the case where the date cannot be parsed from the text.
                // You can set a default date or show an error message.
                cmdLeftRecordBill.Parameters.Add("@cStockBillDate", SqlDbType.DateTime).Value = DBNull.Value; // or set a default date
            }
            cmdLeftRecordBill.ExecuteNonQuery(); // insert

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Added')", true);

            conLeftRecordBill.Close();

            BindGridData();


            if (Convert.ToDouble(txtSubstraction.Text) == 0)
            {

                SqlConnection con4;
                con4 = new SqlConnection(strcon);
                con4.Open();
                string sqlQuery = " UPDATE tblStockIn SET  statusSN='S'  WHERE [tagNo]=@tagno";
                SqlCommand cmd4 = new SqlCommand(sqlQuery, con4);
                //cmd4.Parameters.AddWithValue("@tagno", txttn.Text);
                cmd4.ExecuteNonQuery();
                con4.Close();
            }
            else
            {
                SqlConnection con4;
                con4 = new SqlConnection(strcon);
                con4.Open();
                string sqlQuery = " UPDATE tblStockIn SET weight = @weight  WHERE [tagNo]=@tagno";
                SqlCommand cmd4 = new SqlCommand(sqlQuery, con4);
                cmd4.Parameters.AddWithValue("@weight", txtSubstraction.Text);
                cmd4.Parameters.AddWithValue("@tagno", txtTagNo.Text);
                cmd4.ExecuteNonQuery();
                con4.Close();
            }

            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tag: " + txtTagNo.Text + "');", true);
            tn = listAcc.SelectedValue;

            txtFinalAmount.Text = (txtTotal.Text);
            txtCash.Text = "0";
            txtSwapOnline.Text = "0";
            txtOld.Text = "0";
            txtRound.Text = "0";

            if (listBillType.Text == "Bill")
            {
                txtCGST.Text = Math.Round(((float.Parse(txtTotal.Text) * 1.5) / 100), 2).ToString();
                txtSGST.Text = Math.Round(((float.Parse(txtTotal.Text) * 1.5) / 100), 2).ToString();

                txtFinalTotal.Text = Math.Round(float.Parse(txtFinalAmount.Text) + float.Parse(txtCGST.Text) + float.Parse(txtSGST.Text)).ToString();
                txtFinalBalance.Text = Math.Round(double.Parse(txtFinalTotal.Text), 0).ToString();
                txtFinalBal.Text = Math.Round(double.Parse(txtFinalTotal.Text)).ToString();
            }
            else if (listBillType.Text == "Estimate")
            {
                txtCGST.Text = (float.Parse(txtTotal.Text) * 0).ToString();
                txtSGST.Text = (float.Parse(txtTotal.Text) * 0).ToString();

                txtFinalTotal.Text = Math.Round(float.Parse(txtFinalAmount.Text) + float.Parse(txtCGST.Text) + float.Parse(txtSGST.Text)).ToString();
                txtFinalBalance.Text = Math.Round(double.Parse(txtFinalTotal.Text)).ToString();
                txtFinalBal.Text = Math.Round(double.Parse(txtFinalTotal.Text)).ToString();
            }
            else if (listBillType.Text == "Bill WG")
            {
                txtCGST.Text = ((float.Parse(txtTotal.Text) * 1.5) / 100).ToString();
                txtSGST.Text = ((float.Parse(txtTotal.Text) * 1.5) / 100).ToString();

                txtFinalTotal.Text = Math.Round(float.Parse(txtFinalAmount.Text) + float.Parse(txtCGST.Text) + float.Parse(txtSGST.Text)).ToString();
                txtFinalBalance.Text = Math.Round(double.Parse(txtFinalTotal.Text)).ToString();
                txtFinalBal.Text = Math.Round(double.Parse(txtFinalTotal.Text)).ToString();
            }
        }

        protected void listItem_SelectedIndexChanged(object sender, EventArgs e)
        {


            String strConnString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con;

            con = new SqlConnection(strConnString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * from tblStockIn where item = '" + listItem.SelectedItem.ToString() + "'", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            string wt = "", tg = "";
            //        tgs="";

            foreach (DataRow row in dt.Rows)
            {
                tt = row["types"].ToString();
                tn = row["tagNo"].ToString();
                txtTagNo.Text = row["tagNo"].ToString();
                wt = row["weight"].ToString();
                tg = row["type"].ToString();
            }

            listAcc.Items.Clear();

            //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + tn.ToString() + "');", true);

            if (tt == "Group")
            {
                listAcc.Items.Insert(0, new ListItem(tn.ToString(), "0"));
                lblWt.Text = wt.ToString();
                txtType.Text = tg;
                txtWeight.Text = "";
                listAcc.Enabled = false;
                txtType.Enabled = false;
                lblWt.Visible = true;
            }
            else
            {
                listAcc.Enabled = true;
                txtType.Enabled = true;
                txtSubstraction.Visible = false;
                lblWt.Visible = false;
                txtType.Text = "";
                txtWeight.Text = "";
                listAcc.Items.Clear();

                using (SqlConnection con1 = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd1 = new SqlCommand("SELECT tagNo FROM tblStockIn  where statusSN='N'  and  item = '" + listItem.SelectedItem.ToString() + "'"))
                    {
                        cmd1.CommandType = CommandType.Text;
                        cmd1.Connection = con1;
                        con1.Open();
                        listAcc.DataSource = cmd1.ExecuteReader();
                        listAcc.DataTextField = "tagNo";
                        listAcc.DataValueField = "tagNo";
                        listAcc.DataBind();
                        con1.Close();

                        listAcc.Items.Insert(0, new ListItem("Select Item", "0"));
                    }
                }
            }


        }

        protected void listClientName_SelectedIndexChanged(object sender, EventArgs e)
        {
            String strConnString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con;

            con = new SqlConnection(strConnString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT address,referred, mobile, clientName, accountNo from tblCustomer where clientName = '" + listClientName.SelectedItem.ToString() + "'", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);


            foreach (DataRow row in dt.Rows)
            {
                txtAddress.Text = row["address"].ToString();
                lblAccountNo.Text = row["accountNo"].ToString();
                lblReferred.Text = row["referred"].ToString();
                lblMobile.Text = row["mobile"].ToString();
                txtName.Text = row["clientName"].ToString();
            }
        }
        protected void listAcc_SelectedIndexChanged1(object sender, EventArgs e)
        {


            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + listAcc.SelectedItem.ToString() + "');", true);

            String strConnString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con;

            con = new SqlConnection(strConnString);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT item, type, tagNo, weight, stockBillDate, carat from tblStockIn where tagNo = '" + listAcc.SelectedItem.ToString() + "'", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);


            foreach (DataRow row in dt.Rows)
            {
                txtType.Text = row["type"].ToString();
                txtWeight.Text = row["weight"].ToString();
                txtStockBillDate.Text = row["stockBillDate"].ToString();
                lblCarat.Text = row["carat"].ToString();

            }

            txttn.Text = listAcc.SelectedItem.ToString();

        }

        protected void listMakingCharge_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listMakingCharge.SelectedItem.Text == "Fixed")
            {
                txtPercent.Enabled = false;
                txtPercent.Text = "";
            }
            else if (listMakingCharge.SelectedItem.Text == "%")
            {
                txtPercent.Enabled = true;
                txtMaking.Text = null;
            }
            else
            {
                txtPercent.Enabled = true;
                txtMaking.Text = null;
                lblFine.Visible = true;
            }
        }

        private void BindGridData()
        {
            SqlConnection connection = new SqlConnection(strcon);
            SqlCommand command = new SqlCommand("SELECT * from [tblHalfBill]", connection);
            SqlDataAdapter daimages = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            daimages.Fill(dt);
            grdCenter.DataSource = dt;

            grdCenter.Columns[6].FooterText = "Grand Total";

            totalTotal = 0;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                totalTotal += Convert.ToDouble(dt.Rows[i]["total"].ToString());
            }

            grdCenter.Columns[7].FooterText = totalTotal.ToString();

            grdCenter.DataBind();
            grdCenter.Attributes.Add("bordercolor", "blue");



        }
        protected void OnBlur(object sender, EventArgs e)
        {
            if (listMakingCharge.Text == "Fixed")
                txtTotal.Text = Math.Round(float.Parse(txtMaking.Text) + (float.Parse(txtAmount.Text) * float.Parse(txtWeight.Text))).ToString();

            else if (listMakingCharge.Text == "%")
            {
               txtMaking.Text = Math.Round((Convert.ToDouble(TextBox1.Text) * Convert.ToDouble(txtPercent.Text)) / 100).ToString();

               txtTotal.Text = Math.Round(Convert.ToDouble(txtMaking.Text) + Convert.ToDouble(TextBox1.Text)).ToString();
            }
            else
            {
               txtMaking.Text = Math.Round((Convert.ToDouble(lblFine.Text) * Convert.ToDouble(txtPercent.Text)) / 100).ToString();

               txtTotal.Text = Math.Round(Convert.ToDouble(txtMaking.Text) + Convert.ToDouble(lblFine.Text)).ToString();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("BillingDetails.aspx");
        }
    }
}
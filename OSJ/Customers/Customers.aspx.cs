using Microsoft.Identity.Client;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace OSJ
{
    public partial class Customers : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        string numb = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listCategory.Items.Add("Select Category");
                listCategory.Items.Add("Good");
                listCategory.Items.Add("Normal");
                listCategory.Items.Add("Average");
                listCategory.Items.Add("Bad");

                num();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + txtAccountNo.Text + "');", true);

                    //SqlCommand cmd = new SqlCommand("insert into tblCustomer (clientName,accountNo) values (@cClientName,@cAccount)", con);
                    SqlCommand cmd = new SqlCommand("insert into tblCustomer (clientName,accountNo,address,category,mobile,pan,aadhar,referred,disabled) values (@cClientName,@cAccount,@cAddress,@cCategory,@cMobile,@cPan,@cAadhar,@cReferred,@cDisabled)", con);

                    cmd.Parameters.AddWithValue("@cClientName", txtClientName.Text);
                    cmd.Parameters.AddWithValue("@cAccount", txtAccountNo.Text);
                    cmd.Parameters.AddWithValue("@cAddress", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@cCategory", listCategory.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@cMobile", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@cPan", txtPan.Text);
                    cmd.Parameters.AddWithValue("@cAadhar", txtAadhar.Text);
                    cmd.Parameters.AddWithValue("@cReferred", txtReferred.Text);
                    cmd.Parameters.AddWithValue("@cDisabled", true);

                    cmd.ExecuteNonQuery(); // insert
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Added')", true);

                txtClientName.Text = "";
                txtAddress.Text = "";
                txtMobile.Text = "";
                txtPan.Text = "";
                txtAadhar.Text = "";
                txtReferred.Text = "";
            }
            catch (Exception ex)
            {
                // Log the exception details for debugging
                Console.WriteLine(ex.Message);
                
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Some Error')", true);
            }
        }

        private void num()
        {
            int maxrows;
            string mpar_code;
            int m1par_code;

            SqlConnection conun;
            conun = new SqlConnection(numb);
            conun.Open();

            SqlCommand cmd = new SqlCommand("Select * from [tblCustomer]", conun);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            adp.Fill(ds, "sonu");
            dt = ds.Tables[0];

            maxrows = ds.Tables["sonu"].Rows.Count;

            if (maxrows == 0)
                mpar_code = "0";
            else
                mpar_code = dt.Rows[maxrows - 1]["accountNo"].ToString().Substring(0, 6);

            m1par_code = Convert.ToInt32(mpar_code) + 1;
            mpar_code = (Convert.ToInt32(mpar_code) + 1).ToString();


            if (m1par_code < 10)
            {
                mpar_code = "00000" + mpar_code.ToString();
            }

            if (m1par_code < 100 && m1par_code > 9)
            {
                mpar_code = "0000" + mpar_code.ToString();
            }

            if (m1par_code < 1000 && m1par_code > 99)
            {
                mpar_code = "000" + mpar_code.ToString();
            }

            if (m1par_code < 10000 && m1par_code > 999)
            {
                mpar_code = "00" + mpar_code.ToString();
            }

            if (m1par_code < 100000 && m1par_code > 999)
            {
                mpar_code = "0" + mpar_code.ToString();
            }


            txtAccountNo.Text = mpar_code;
            maxrows = 0;

            conun.Close();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerDetails.aspx");
        }
    }
}
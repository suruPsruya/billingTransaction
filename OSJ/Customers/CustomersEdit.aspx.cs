using Microsoft.Identity.Client;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace OSJ
{
    public partial class CustomersEdit : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            listCategory.Items.Add("Select Category");
            listCategory.Items.Add("Good");
            listCategory.Items.Add("Normal");
            listCategory.Items.Add("Average");
            listCategory.Items.Add("Bad");
            if (!IsPostBack)
            {

                int x = Convert.ToInt32(Session["def"].ToString());

                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from [tblCustomer] where [id]=" + x + "", con);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    txtClientName.Text = dt.Rows[i]["clientName"].ToString();
                    txtAccountNo.Text = dt.Rows[i]["accountNo"].ToString();
                    txtAddress.Text = dt.Rows[i]["address"].ToString();
                    listCategory.Text = dt.Rows[i]["category"].ToString();
                    txtMobile.Text = dt.Rows[i]["mobile"].ToString();
                    txtPan.Text = dt.Rows[i]["pan"].ToString();
                    txtAadhar.Text = dt.Rows[i]["aadhar"].ToString();
                    txtReferred.Text = dt.Rows[i]["referred"].ToString();
                }
            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerDetails.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(Session["def"].ToString());

            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd = new SqlCommand("update tblCustomer set clientName=@cClientName, accountNo=@cAccountNo, address=@cAddress, category=@cCategory, mobile=@cMobile, pan=@cPan, aadhar=@cAadhar, referred=@cReferred where id=@id", con);

            cmd.Parameters.AddWithValue("@cClientName", txtClientName.Text);
            cmd.Parameters.AddWithValue("@cAccountNo", txtAccountNo.Text);
            cmd.Parameters.AddWithValue("@cAddress", txtAddress.Text);
            cmd.Parameters.AddWithValue("@cCategory", listCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@cMobile", txtMobile.Text);
            cmd.Parameters.AddWithValue("@cPan", txtPan.Text);
            cmd.Parameters.AddWithValue("@cAadhar", txtAadhar.Text);
            cmd.Parameters.AddWithValue("@cReferred", txtReferred.Text);

            cmd.Parameters.AddWithValue("@id", x);
            cmd.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated')", true);

            txtClientName.Text = "";
            txtAddress.Text = "";
            txtMobile.Text = "";
            txtPan.Text = "";
            txtAadhar.Text = "";
            txtReferred.Text = "";
        }
    }
}
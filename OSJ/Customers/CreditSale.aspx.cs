using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSJ
{
    public partial class CreditSale : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCurrentDate.Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");

            if (!IsPostBack)
            {
                //TextBox1.Text = Session["def"].ToString();
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from [tblCustomer] where [accountNo]='" + Session["def"].ToString() + "'", con);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    lblClientName.Text = dt.Rows[i]["clientName"].ToString();
                    lblAddress.Text = dt.Rows[i]["address"].ToString();
                    lblMobile.Text = dt.Rows[i]["mobile"].ToString();
                    lblAccountNo.Text = dt.Rows[i]["accountNo"].ToString();
                    lblReferred.Text = dt.Rows[i]["referred"].ToString();
                }

                SqlConnection conBill = new SqlConnection(strcon);
                conBill.Open();
                SqlCommand cmdBill = new SqlCommand("select * from [tblBill] where [accountNo]='" + Session["def"].ToString() + "'", conBill);
                DataTable dtBill = new DataTable();
                SqlDataAdapter daBill = new SqlDataAdapter(cmdBill);
                daBill.Fill(dtBill);

                if (dtBill.Rows.Count > 0)
                {
                    txtAmount.Text = dtBill.Rows[0]["finalAmount"].ToString();
                    txtPay.Text = dtBill.Rows[0]["cash"].ToString();
                    txtGoldSwap.Text = dtBill.Rows[0]["old"].ToString();
                    txtBalance.Text = dtBill.Rows[0]["finalBalance"].ToString();
                    lblReferred.Text = dtBill.Rows[0]["referred"].ToString();
                    //txtDateNext.Text = dtBill.Rows[0]["nextDate"].ToString();
                }
            }

            BindGridData();
        }
        private void BindGridData()
        {
            SqlConnection connection = new SqlConnection(strcon);
            SqlCommand command = new SqlCommand("SELECT * from tblCreditSale where accountNo = '" + lblAccountNo.Text + "'", connection);
            SqlDataAdapter daimages = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            daimages.Fill(dt);
            //grdCenter.DataSource = dt;
            //grdCenter.DataBind();
            //grdCenter.Attributes.Add("bordercolor", "blue");

            double fib, bfib;
            fib = 0;
            bfib = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int finalBalance, BillfinalBalance;
                if (int.TryParse(dt.Rows[i]["finalBalance"].ToString(), out finalBalance))
                {
                    fib = fib + finalBalance;
                }
                if (int.TryParse(dt.Rows[i]["BillfinalBalance"].ToString(), out BillfinalBalance))
                {
                    bfib = bfib + BillfinalBalance;
                }
            }


            //   TextBox1.Text = lblAccountNo.Text;
            //TextBox1.Text = (fib + bfib).ToString();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerDetails.aspx");
        }
    }
}
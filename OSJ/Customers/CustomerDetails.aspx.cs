using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSJ
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridData();
                //  CountData();
            }
        }

        private void BindGridData()
        {
            SqlConnection connection = new SqlConnection(strcon);
            SqlCommand command = new SqlCommand("SELECT * from [tblCustomer] where disabled = 1 order by accountNo", connection);
            SqlDataAdapter daimages = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            daimages.Fill(dt);
            grdCenter.DataSource = dt;
            grdCenter.DataBind();
            grdCenter.Attributes.Add("bordercolor", "blue");
        }

        protected void customerDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select1")
            {
                object dataKeyValue = grdCenter.DataKeys[int.Parse(e.CommandArgument.ToString())].Value;

                Session["def"] = dataKeyValue;
                Response.Redirect("CreditSale.aspx");
            }
            else if (e.CommandName == "Select2")
            {

                object dataKeyValue = grdCenter.DataKeys[int.Parse(e.CommandArgument.ToString())].Value;

                Session["def"] = dataKeyValue;
                Response.Redirect("CustomersEdit.aspx");
            }
        }

        protected void GridView_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)grdCenter.Rows[e.RowIndex];
            Label id = grdCenter.Rows[e.RowIndex].FindControl("lbl_Id") as Label;

            SqlConnection connection = new SqlConnection(strcon);
            connection.Open();

            // Updating the record
            SqlCommand cmd = new SqlCommand("UPDATE tblCustomer SET disabled = 0 WHERE id = @id", connection);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(id.Text));
            cmd.ExecuteNonQuery();

            connection.Close();
            BindGridData();

        }

        protected void grdCenter_SelectedIndexChanged(object sender, EventArgs e)
        {

            //Accessing BoundField Column.
            string name = grdCenter.SelectedRow.Cells[0].Text;

            //Accessing TemplateField Column controls.
            string country = (grdCenter.SelectedRow.FindControl("lbl_id") as Label).Text;

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + name + "\\nCountry: " + country + "');", true);

            Session["def"] = country;

            Response.Redirect("CustomersEdit.aspx");
            //   lblValues.Text = "<b>Name:</b> " + name + " <b>Country:</b> " + country;
        }
    }
}
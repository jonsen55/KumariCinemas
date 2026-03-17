using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Users : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void UsersDataSource_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                string errorMessage = e.Exception.GetBaseException().Message;
                if (errorMessage.Contains("ORA-02292"))
                {
                    string friendlyMessage = "Cannot delete this user because there are tickets associated with this user. Please delete or reassign the tickets first.";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{friendlyMessage}');", true);
                    e.ExceptionHandled = true;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            UsersDataSource.InsertParameters["USER_ID"].DefaultValue = txtUserID.Text;
            UsersDataSource.InsertParameters["SHOW_ID"].DefaultValue = ddlShow.SelectedValue;
            UsersDataSource.InsertParameters["MOV_ID"].DefaultValue = ddlMovie.SelectedValue;
            UsersDataSource.InsertParameters["THEATER_ID"].DefaultValue = ddlTheater.SelectedValue;

            UsersDataSource.InsertParameters["U_NAME"].DefaultValue = txtUName.Text;
            UsersDataSource.InsertParameters["F_NAME"].DefaultValue = txtFName.Text;
            UsersDataSource.InsertParameters["L_NAME"].DefaultValue = txtLName.Text;
            UsersDataSource.InsertParameters["EMAIL"].DefaultValue = txtEmail.Text;
            UsersDataSource.InsertParameters["AGE"].DefaultValue = txtAge.Text;
            UsersDataSource.InsertParameters["CONTACT"].DefaultValue = txtContact.Text;
            UsersDataSource.InsertParameters["ADDRESS"].DefaultValue = txtAddress.Text;

            UsersDataSource.Insert();

            GridView1.DataBind();

            txtUserID.Text = "";
            txtUName.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            txtEmail.Text = "";
            txtAge.Text = "";
            txtContact.Text = "";
            txtAddress.Text = "";
        }
    }
}
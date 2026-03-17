using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class Shows : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnSaveShow_Click(object sender, EventArgs e)
        {
            ShowsDataSource.InsertParameters["SHOW_ID"].DefaultValue = txtShowID.Text;
            ShowsDataSource.InsertParameters["MOV_ID"].DefaultValue = ddlMovie.SelectedValue;
            ShowsDataSource.InsertParameters["THEATER_ID"].DefaultValue = ddlTheater.SelectedValue;
            ShowsDataSource.InsertParameters["SHOW_DATE"].DefaultValue = txtShowDate.Text;
            ShowsDataSource.InsertParameters["SHOW_TIME"].DefaultValue = txtShowTime.Text;
            ShowsDataSource.InsertParameters["TICKET_PRICE"].DefaultValue = txtTicketPrice.Text;

            ShowsDataSource.Insert();

            GridView1.DataBind();

            // Clear fields
            txtShowID.Text = "";
            txtShowTime.Text = "";
            txtTicketPrice.Text = "";
        }
    }
}
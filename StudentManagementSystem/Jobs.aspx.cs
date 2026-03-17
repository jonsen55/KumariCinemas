using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class Jobs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
            GridView1.DataBind();

            // Clear fields after insert
            txtJobId.Text = "";
            txtJobTitle.Text = "";
            txtMinSalary.Text = "";
            txtMaxSalary.Text = "";
        }
    }
}
using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class TheaterCityHall : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnSaveHall_Click(object sender, EventArgs e)
        {
            TheaterCityHallDataSource.InsertParameters["HALL_ID"].DefaultValue = txtHallID.Text;
            TheaterCityHallDataSource.InsertParameters["THEATER_ID"].DefaultValue = ddlTheater.SelectedValue;
            TheaterCityHallDataSource.InsertParameters["THEATER_CITY_HALL"].DefaultValue = txtCityHall.Text;
            TheaterCityHallDataSource.InsertParameters["HALL_CAPACITY"].DefaultValue = txtCapacity.Text;

            TheaterCityHallDataSource.Insert();

            GridView1.DataBind();

            // Clear fields
            txtHallID.Text = "";
            txtCityHall.Text = "";
            txtCapacity.Text = "";
        }
    }
}
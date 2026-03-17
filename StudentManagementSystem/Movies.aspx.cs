using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class Movies : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSaveMovie_Click(object sender, EventArgs e)
        {
            MTSMovies.InsertParameters["MOV_ID"].DefaultValue = txtMovId.Text;
            MTSMovies.InsertParameters["TITLE"].DefaultValue = txtTitle.Text;
            MTSMovies.InsertParameters["DURATION"].DefaultValue = txtDuration.Text;
            MTSMovies.InsertParameters["LANGUAGE"].DefaultValue = txtLanguage.Text;
            MTSMovies.InsertParameters["GENRE"].DefaultValue = txtGenre.Text;
            MTSMovies.InsertParameters["RELEASEDATE"].DefaultValue = txtReleaseDate.Text;

            MTSMovies.Insert();

            GridView1.DataBind();

            // Clear fields
            txtMovId.Text = "";
            txtTitle.Text = "";
            txtDuration.Text = "";
            txtLanguage.Text = "";
            txtGenre.Text = "";
            txtReleaseDate.Text = "";
        }
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    SqlDataSource1.Insert();
        //    GridView1.DataBind();

        //    // Clear fields after insert
        //    txtJobId.Text = "";
        //    txtJobTitle.Text = "";
        //    txtMinSalary.Text = "";
        //    txtMaxSalary.Text = "";
        //}
    }
}
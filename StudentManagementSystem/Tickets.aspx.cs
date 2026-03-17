using System;
using System.Globalization;
using System.Web.UI;

namespace WebApplication2
{
    public partial class Tickets : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSaveTicket_Click(object sender, EventArgs e)
        {
            // Parse the datetime-local value (format: "yyyy-MM-ddTHH:mm")
            // and convert to Oracle-friendly format
            string bookingTimeRaw = txtBookingTime.Text;
            string bookingTimeFormatted = "";

            if (!string.IsNullOrWhiteSpace(bookingTimeRaw))
            {
                DateTime parsedDate;
                bool success = DateTime.TryParseExact(
                    bookingTimeRaw,
                    "yyyy-MM-ddTHH:mm",
                    CultureInfo.InvariantCulture,
                    DateTimeStyles.None,
                    out parsedDate
                );

                if (success)
                {
                    // Format Oracle expects with OracleClient
                    bookingTimeFormatted = parsedDate.ToString("dd-MMM-yy HH:mm:ss", CultureInfo.InvariantCulture).ToUpper();
                }
                else
                {
                    // Fallback: try general parse
                    if (DateTime.TryParse(bookingTimeRaw, out parsedDate))
                    {
                        bookingTimeFormatted = parsedDate.ToString("dd-MMM-yy HH:mm:ss", CultureInfo.InvariantCulture).ToUpper();
                    }
                }
            }

            if (string.IsNullOrWhiteSpace(bookingTimeFormatted))
            {
                // Don't insert if booking time is missing
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Please enter a valid Booking Time.');", true);
                return;
            }

            TicketsDataSource.InsertParameters["TICKET_ID"].DefaultValue = txtTicketID.Text;
            TicketsDataSource.InsertParameters["USER_ID"].DefaultValue = ddlUser.SelectedValue;
            TicketsDataSource.InsertParameters["SHOW_ID"].DefaultValue = ddlShow.SelectedValue;
            TicketsDataSource.InsertParameters["MOV_ID"].DefaultValue = ddlMovie.SelectedValue;
            TicketsDataSource.InsertParameters["THEATER_ID"].DefaultValue = ddlTheater.SelectedValue;
            TicketsDataSource.InsertParameters["BOOKING_TIME"].DefaultValue = bookingTimeFormatted;
            TicketsDataSource.InsertParameters["BOOKING_STATUS"].DefaultValue = txtBookingStatus.Text;
            TicketsDataSource.InsertParameters["QUANTITY"].DefaultValue = txtQuantity.Text;
            TicketsDataSource.InsertParameters["PAYMENT_STATUS"].DefaultValue = txtPaymentStatus.Text;
            TicketsDataSource.InsertParameters["TOTAL_AMOUNT"].DefaultValue = txtTotalAmount.Text;

            TicketsDataSource.Insert();

            GridView1.DataBind();

            // Clear fields
            txtTicketID.Text = "";
            txtBookingStatus.Text = "";
            txtQuantity.Text = "";
            txtPaymentStatus.Text = "";
            txtTotalAmount.Text = "";
        }
    }
}
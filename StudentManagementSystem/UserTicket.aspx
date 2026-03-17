<%@ Page Title="UserTicket" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTicket.aspx.cs" Inherits="WebApplication2.UserTicket" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom:2rem;">
        <p style="font-size:.7rem; font-weight:700; letter-spacing:.2em; color:#EA580C; text-transform:uppercase; margin-bottom:.4rem;">Reports</p>
        <h2 style="font-family:'Playfair Display',serif; font-size:2rem; font-weight:700; color:#111; margin:0 0 .5rem;">User Tickets</h2>
        <div style="width:3rem; height:3px; background:#EA580C; border-radius:2px;"></div>
        <p style="margin-top:.75rem; font-size:.875rem; color:#6B7280;">Showing bookings from the last 6 months for selected user.</p>
    </div>

    <div style="display:flex; align-items:center; gap:.85rem; margin-bottom:1.5rem;">
        <label style="font-size:.7rem; font-weight:700; letter-spacing:.1em; text-transform:uppercase; color:#6B7280; white-space:nowrap;">Select User</label>
        <div class="report-select">
            <asp:DropDownList ID="DropDownList1" runat="server"
                DataSourceID="UserDataSource"
                DataTextField="U_NAME"
                DataValueField="USER_ID"
                AutoPostBack="true">
            </asp:DropDownList>
        </div>
    </div>

    <asp:SqlDataSource ID="UserDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT &quot;USER_ID&quot;, &quot;U_NAME&quot; FROM &quot;USERS&quot;" />

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; overflow:hidden;">
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="TICKET_ID"
            DataSourceID="UserTicketDataSource"
            CssClass="grid-table">
            <Columns>
                <asp:BoundField DataField="USER_ID"      HeaderText="User ID"     SortExpression="USER_ID" />
                <asp:BoundField DataField="U_NAME"       HeaderText="Name"        SortExpression="U_NAME" />
                <asp:BoundField DataField="TICKET_ID"    HeaderText="Ticket ID"   ReadOnly="True" SortExpression="TICKET_ID" />
                <asp:BoundField DataField="SHOW_ID"      HeaderText="Show ID"     SortExpression="SHOW_ID" />
                <asp:BoundField DataField="MOV_ID"       HeaderText="Movie ID"    SortExpression="MOV_ID" />
                <asp:BoundField DataField="THEATER_ID"   HeaderText="Theater ID"  SortExpression="THEATER_ID" />
                <asp:BoundField DataField="BOOKING_TIME" HeaderText="Booked At"   SortExpression="BOOKING_TIME" />
                <asp:BoundField DataField="QUANTITY"     HeaderText="Qty"         SortExpression="QUANTITY" />
                <asp:BoundField DataField="TOTAL_AMOUNT" HeaderText="Total (NPR)" SortExpression="TOTAL_AMOUNT" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="UserTicketDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT DISTINCT U.USER_ID, U.U_NAME, T.TICKET_ID, T.SHOW_ID, T.MOV_ID, T.THEATER_ID, T.BOOKING_TIME, T.QUANTITY, T.TOTAL_AMOUNT FROM USERS U JOIN TICKET T ON U.USER_ID = T.USER_ID WHERE U.USER_ID = :USER_ID AND T.BOOKING_TIME &gt;= ADD_MONTHS(SYSDATE, -6)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="USER_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
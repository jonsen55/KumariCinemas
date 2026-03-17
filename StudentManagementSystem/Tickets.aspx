<%@ Page Title="Tickets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="WebApplication2.Tickets" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom:2rem;">
        <p style="font-size:.7rem; font-weight:700; letter-spacing:.2em; color:#EA580C; text-transform:uppercase; margin-bottom:.4rem;">Manage</p>
        <h2 style="font-family:'Playfair Display',serif; font-size:2rem; font-weight:700; color:#111; margin:0 0 .5rem;">Tickets</h2>
        <div style="width:3rem; height:3px; background:#EA580C; border-radius:2px;"></div>
    </div>

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; overflow:hidden; margin-bottom:2.5rem;">
        <asp:GridView ID="GridView1" runat="server"
            AllowPaging="True"
            AutoGenerateColumns="False"
            DataKeyNames="TICKET_ID"
            DataSourceID="TicketsDataSource"
            CssClass="grid-table">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TICKET_ID"      HeaderText="ID"             ReadOnly="True" SortExpression="TICKET_ID" />
                <asp:BoundField DataField="USER_ID"        HeaderText="User ID"        SortExpression="USER_ID" />
                <asp:BoundField DataField="SHOW_ID"        HeaderText="Show ID"        SortExpression="SHOW_ID" />
                <asp:BoundField DataField="MOV_ID"         HeaderText="Movie ID"       SortExpression="MOV_ID" />
                <asp:BoundField DataField="THEATER_ID"     HeaderText="Theater ID"     SortExpression="THEATER_ID" />
                <asp:BoundField DataField="BOOKING_TIME"   HeaderText="Booking Time"   SortExpression="BOOKING_TIME" />
                <asp:BoundField DataField="BOOKING_STATUS" HeaderText="Booking Status" SortExpression="BOOKING_STATUS" />
                <asp:BoundField DataField="QUANTITY"       HeaderText="Qty"            SortExpression="QUANTITY" />
                <asp:BoundField DataField="PAYMENT_STATUS" HeaderText="Payment"        SortExpression="PAYMENT_STATUS" />
                <asp:BoundField DataField="TOTAL_AMOUNT"   HeaderText="Total (NPR)"    SortExpression="TOTAL_AMOUNT" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="TicketsDataSource" runat="server"
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKET_ID&quot; = :original_TICKET_ID AND &quot;USER_ID&quot; = :original_USER_ID AND &quot;SHOW_ID&quot; = :original_SHOW_ID AND &quot;MOV_ID&quot; = :original_MOV_ID AND &quot;THEATER_ID&quot; = :original_THEATER_ID AND &quot;BOOKING_TIME&quot; = :original_BOOKING_TIME AND &quot;BOOKING_STATUS&quot; = :original_BOOKING_STATUS AND ((&quot;QUANTITY&quot; = :original_QUANTITY) OR (&quot;QUANTITY&quot; IS NULL AND :original_QUANTITY IS NULL)) AND ((&quot;PAYMENT_STATUS&quot; = :original_PAYMENT_STATUS) OR (&quot;PAYMENT_STATUS&quot; IS NULL AND :original_PAYMENT_STATUS IS NULL)) AND &quot;TOTAL_AMOUNT&quot; = :original_TOTAL_AMOUNT"
        InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKET_ID&quot;, &quot;USER_ID&quot;, &quot;SHOW_ID&quot;, &quot;MOV_ID&quot;, &quot;THEATER_ID&quot;, &quot;BOOKING_TIME&quot;, &quot;BOOKING_STATUS&quot;, &quot;QUANTITY&quot;, &quot;PAYMENT_STATUS&quot;, &quot;TOTAL_AMOUNT&quot;) VALUES (:TICKET_ID, :USER_ID, :SHOW_ID, :MOV_ID, :THEATER_ID, :BOOKING_TIME, :BOOKING_STATUS, :QUANTITY, :PAYMENT_STATUS, :TOTAL_AMOUNT)"
        OldValuesParameterFormatString="original_{0}"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM &quot;TICKET&quot;"
        UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;USER_ID&quot; = :USER_ID, &quot;SHOW_ID&quot; = :SHOW_ID, &quot;MOV_ID&quot; = :MOV_ID, &quot;THEATER_ID&quot; = :THEATER_ID, &quot;BOOKING_TIME&quot; = :BOOKING_TIME, &quot;BOOKING_STATUS&quot; = :BOOKING_STATUS, &quot;QUANTITY&quot; = :QUANTITY, &quot;PAYMENT_STATUS&quot; = :PAYMENT_STATUS, &quot;TOTAL_AMOUNT&quot; = :TOTAL_AMOUNT WHERE &quot;TICKET_ID&quot; = :original_TICKET_ID AND &quot;USER_ID&quot; = :original_USER_ID AND &quot;SHOW_ID&quot; = :original_SHOW_ID AND &quot;MOV_ID&quot; = :original_MOV_ID AND &quot;THEATER_ID&quot; = :original_THEATER_ID AND &quot;BOOKING_TIME&quot; = :original_BOOKING_TIME AND &quot;BOOKING_STATUS&quot; = :original_BOOKING_STATUS AND ((&quot;QUANTITY&quot; = :original_QUANTITY) OR (&quot;QUANTITY&quot; IS NULL AND :original_QUANTITY IS NULL)) AND ((&quot;PAYMENT_STATUS&quot; = :original_PAYMENT_STATUS) OR (&quot;PAYMENT_STATUS&quot; IS NULL AND :original_PAYMENT_STATUS IS NULL)) AND &quot;TOTAL_AMOUNT&quot; = :original_TOTAL_AMOUNT">
        <DeleteParameters>
            <asp:Parameter Name="original_TICKET_ID"      Type="Decimal" />
            <asp:Parameter Name="original_USER_ID"        Type="Decimal" />
            <asp:Parameter Name="original_SHOW_ID"        Type="Decimal" />
            <asp:Parameter Name="original_MOV_ID"         Type="Decimal" />
            <asp:Parameter Name="original_THEATER_ID"     Type="Decimal" />
            <asp:Parameter Name="original_BOOKING_TIME"   Type="DateTime" />
            <asp:Parameter Name="original_BOOKING_STATUS" Type="String" />
            <asp:Parameter Name="original_QUANTITY"       Type="Decimal" />
            <asp:Parameter Name="original_PAYMENT_STATUS" Type="String" />
            <asp:Parameter Name="original_TOTAL_AMOUNT"   Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TICKET_ID"      Type="Decimal" />
            <asp:Parameter Name="USER_ID"        Type="Decimal" />
            <asp:Parameter Name="SHOW_ID"        Type="Decimal" />
            <asp:Parameter Name="MOV_ID"         Type="Decimal" />
            <asp:Parameter Name="THEATER_ID"     Type="Decimal" />
            <asp:Parameter Name="BOOKING_TIME"   Type="DateTime" />
            <asp:Parameter Name="BOOKING_STATUS" Type="String" />
            <asp:Parameter Name="QUANTITY"       Type="Decimal" />
            <asp:Parameter Name="PAYMENT_STATUS" Type="String" />
            <asp:Parameter Name="TOTAL_AMOUNT"   Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="USER_ID"             Type="Decimal" />
            <asp:Parameter Name="SHOW_ID"             Type="Decimal" />
            <asp:Parameter Name="MOV_ID"              Type="Decimal" />
            <asp:Parameter Name="THEATER_ID"          Type="Decimal" />
            <asp:Parameter Name="BOOKING_TIME"        Type="DateTime" />
            <asp:Parameter Name="BOOKING_STATUS"      Type="String" />
            <asp:Parameter Name="QUANTITY"            Type="Decimal" />
            <asp:Parameter Name="PAYMENT_STATUS"      Type="String" />
            <asp:Parameter Name="TOTAL_AMOUNT"        Type="Decimal" />
            <asp:Parameter Name="original_TICKET_ID"      Type="Decimal" />
            <asp:Parameter Name="original_USER_ID"        Type="Decimal" />
            <asp:Parameter Name="original_SHOW_ID"        Type="Decimal" />
            <asp:Parameter Name="original_MOV_ID"         Type="Decimal" />
            <asp:Parameter Name="original_THEATER_ID"     Type="Decimal" />
            <asp:Parameter Name="original_BOOKING_TIME"   Type="DateTime" />
            <asp:Parameter Name="original_BOOKING_STATUS" Type="String" />
            <asp:Parameter Name="original_QUANTITY"       Type="Decimal" />
            <asp:Parameter Name="original_PAYMENT_STATUS" Type="String" />
            <asp:Parameter Name="original_TOTAL_AMOUNT"   Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="UserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand='SELECT USER_ID, U_NAME FROM "USERS"' />
    <asp:SqlDataSource ID="ShowDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand='SELECT SHOW_ID FROM "SHOWS"' />
    <asp:SqlDataSource ID="MovieDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand='SELECT MOV_ID, TITLE FROM "MOVIES"' />
    <asp:SqlDataSource ID="TheaterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand='SELECT THEATER_ID, THEATER_NAME FROM "THEATERS"' />

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; padding:2rem; max-width:520px;">
        <h3 style="font-family:'Playfair Display',serif; font-size:1.25rem; color:#111; margin:0 0 1.5rem;">Add New Ticket</h3>
        <div style="display:flex; flex-direction:column; gap:1rem;">

            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Ticket ID</label>
                <asp:TextBox ID="txtTicketID" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">User</label>
                <asp:DropDownList ID="ddlUser" runat="server" DataSourceID="UserDataSource" DataTextField="U_NAME" DataValueField="USER_ID" CssClass="form-input"></asp:DropDownList>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Show</label>
                <asp:DropDownList ID="ddlShow" runat="server" DataSourceID="ShowDataSource" DataTextField="SHOW_ID" DataValueField="SHOW_ID" CssClass="form-input"></asp:DropDownList>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Movie</label>
                <asp:DropDownList ID="ddlMovie" runat="server" DataSourceID="MovieDataSource" DataTextField="TITLE" DataValueField="MOV_ID" CssClass="form-input"></asp:DropDownList>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Theater</label>
                <asp:DropDownList ID="ddlTheater" runat="server" DataSourceID="TheaterDataSource" DataTextField="THEATER_NAME" DataValueField="THEATER_ID" CssClass="form-input"></asp:DropDownList>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Booking Time</label>
                <asp:TextBox ID="txtBookingTime" runat="server" TextMode="DateTimeLocal" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Booking Status</label>
                <asp:TextBox ID="txtBookingStatus" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Quantity</label>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Payment Status</label>
                <asp:TextBox ID="txtPaymentStatus" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Total Amount (NPR)</label>
                <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div style="padding-top:.5rem;">
                <asp:Button ID="btnSaveTicket" runat="server" Text="Save Ticket" OnClick="btnSaveTicket_Click" CssClass="btn-save" />
            </div>

        </div>
    </div>

</asp:Content>
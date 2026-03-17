<%@ Page Title="Shows" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shows.aspx.cs" Inherits="WebApplication2.Shows" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom:2rem;">
        <p style="font-size:.7rem; font-weight:700; letter-spacing:.2em; color:#EA580C; text-transform:uppercase; margin-bottom:.4rem;">Manage</p>
        <h2 style="font-family:'Playfair Display',serif; font-size:2rem; font-weight:700; color:#111; margin:0 0 .5rem;">Showtimes</h2>
        <div style="width:3rem; height:3px; background:#EA580C; border-radius:2px;"></div>
    </div>

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; overflow:hidden; margin-bottom:2.5rem;">
        <asp:GridView ID="GridView1" runat="server"
            AllowPaging="True"
            AutoGenerateColumns="False"
            DataKeyNames="SHOW_ID"
            DataSourceID="ShowsDataSource"
            CssClass="grid-table">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="SHOW_ID"      HeaderText="ID"          ReadOnly="True" SortExpression="SHOW_ID" />
                <asp:BoundField DataField="MOV_ID"       HeaderText="Movie ID"    SortExpression="MOV_ID" />
                <asp:BoundField DataField="THEATER_ID"   HeaderText="Theater ID"  SortExpression="THEATER_ID" />
                <asp:BoundField DataField="SHOW_DATE"    HeaderText="Show Date"   SortExpression="SHOW_DATE" />
                <asp:BoundField DataField="SHOW_TIME"    HeaderText="Show Time"   SortExpression="SHOW_TIME" />
                <asp:BoundField DataField="TICKET_PRICE" HeaderText="Price (NPR)" SortExpression="TICKET_PRICE" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="ShowsDataSource" runat="server"
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        DeleteCommand="DELETE FROM &quot;SHOWS&quot; WHERE &quot;SHOW_ID&quot; = :original_SHOW_ID AND &quot;MOV_ID&quot; = :original_MOV_ID AND &quot;THEATER_ID&quot; = :original_THEATER_ID AND &quot;SHOW_DATE&quot; = :original_SHOW_DATE AND &quot;SHOW_TIME&quot; = :original_SHOW_TIME AND &quot;TICKET_PRICE&quot; = :original_TICKET_PRICE"
        InsertCommand="INSERT INTO &quot;SHOWS&quot; (&quot;SHOW_ID&quot;, &quot;MOV_ID&quot;, &quot;THEATER_ID&quot;, &quot;SHOW_DATE&quot;, &quot;SHOW_TIME&quot;, &quot;TICKET_PRICE&quot;) VALUES (:SHOW_ID, :MOV_ID, :THEATER_ID, :SHOW_DATE, :SHOW_TIME, :TICKET_PRICE)"
        OldValuesParameterFormatString="original_{0}"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM &quot;SHOWS&quot;"
        UpdateCommand="UPDATE &quot;SHOWS&quot; SET &quot;MOV_ID&quot; = :MOV_ID, &quot;THEATER_ID&quot; = :THEATER_ID, &quot;SHOW_DATE&quot; = :SHOW_DATE, &quot;SHOW_TIME&quot; = :SHOW_TIME, &quot;TICKET_PRICE&quot; = :TICKET_PRICE WHERE &quot;SHOW_ID&quot; = :original_SHOW_ID AND &quot;MOV_ID&quot; = :original_MOV_ID AND &quot;THEATER_ID&quot; = :original_THEATER_ID AND &quot;SHOW_DATE&quot; = :original_SHOW_DATE AND &quot;SHOW_TIME&quot; = :original_SHOW_TIME AND &quot;TICKET_PRICE&quot; = :original_TICKET_PRICE">
        <DeleteParameters>
            <asp:Parameter Name="original_SHOW_ID"      Type="Decimal" />
            <asp:Parameter Name="original_MOV_ID"       Type="Decimal" />
            <asp:Parameter Name="original_THEATER_ID"   Type="Decimal" />
            <asp:Parameter Name="original_SHOW_DATE"    Type="DateTime" />
            <asp:Parameter Name="original_SHOW_TIME"    Type="String" />
            <asp:Parameter Name="original_TICKET_PRICE" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SHOW_ID"      Type="Decimal" />
            <asp:Parameter Name="MOV_ID"       Type="Decimal" />
            <asp:Parameter Name="THEATER_ID"   Type="Decimal" />
            <asp:Parameter Name="SHOW_DATE"    Type="DateTime" />
            <asp:Parameter Name="SHOW_TIME"    Type="String" />
            <asp:Parameter Name="TICKET_PRICE" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MOV_ID"                Type="Decimal" />
            <asp:Parameter Name="THEATER_ID"            Type="Decimal" />
            <asp:Parameter Name="SHOW_DATE"             Type="DateTime" />
            <asp:Parameter Name="SHOW_TIME"             Type="String" />
            <asp:Parameter Name="TICKET_PRICE"          Type="Decimal" />
            <asp:Parameter Name="original_SHOW_ID"      Type="Decimal" />
            <asp:Parameter Name="original_MOV_ID"       Type="Decimal" />
            <asp:Parameter Name="original_THEATER_ID"   Type="Decimal" />
            <asp:Parameter Name="original_SHOW_DATE"    Type="DateTime" />
            <asp:Parameter Name="original_SHOW_TIME"    Type="String" />
            <asp:Parameter Name="original_TICKET_PRICE" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="MovieDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand='SELECT MOV_ID, TITLE FROM "MOVIES"' />
    <asp:SqlDataSource ID="TheaterDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand='SELECT THEATER_ID, THEATER_NAME FROM "THEATERS"' />

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; padding:2rem; max-width:520px;">
        <h3 style="font-family:'Playfair Display',serif; font-size:1.25rem; color:#111; margin:0 0 1.5rem;">Add New Show</h3>
        <div style="display:flex; flex-direction:column; gap:1rem;">

            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Show ID</label>
                <asp:TextBox ID="txtShowID" runat="server" CssClass="form-input"></asp:TextBox>
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
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Show Date</label>
                <asp:TextBox ID="txtShowDate" runat="server" TextMode="Date" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Show Time</label>
                <asp:TextBox ID="txtShowTime" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Ticket Price (NPR)</label>
                <asp:TextBox ID="txtTicketPrice" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div style="padding-top:.5rem;">
                <asp:Button ID="btnSaveShow" runat="server" Text="Save Show" OnClick="btnSaveShow_Click" CssClass="btn-save" />
            </div>

        </div>
    </div>

</asp:Content>
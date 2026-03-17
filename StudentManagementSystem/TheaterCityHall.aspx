<%@ Page Title="TheaterCityHall" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TheaterCityHall.aspx.cs" Inherits="WebApplication2.TheaterCityHall" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom:2rem;">
        <p style="font-size:.7rem; font-weight:700; letter-spacing:.2em; color:#EA580C; text-transform:uppercase; margin-bottom:.4rem;">Manage</p>
        <h2 style="font-family:'Playfair Display',serif; font-size:2rem; font-weight:700; color:#111; margin:0 0 .5rem;">Theater City Halls</h2>
        <div style="width:3rem; height:3px; background:#EA580C; border-radius:2px;"></div>
    </div>

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; overflow:hidden; margin-bottom:2.5rem;">
        <asp:GridView ID="GridView1" runat="server"
            AllowPaging="True"
            AutoGenerateColumns="False"
            DataKeyNames="HALL_ID"
            DataSourceID="TheaterCityHallDataSource"
            CssClass="grid-table">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="HALL_ID"           HeaderText="Hall ID"    ReadOnly="True" SortExpression="HALL_ID" />
                <asp:BoundField DataField="THEATER_ID"        HeaderText="Theater ID" SortExpression="THEATER_ID" />
                <asp:BoundField DataField="THEATER_CITY_HALL" HeaderText="City Hall"  SortExpression="THEATER_CITY_HALL" />
                <asp:BoundField DataField="HALL_CAPACITY"     HeaderText="Capacity"   SortExpression="HALL_CAPACITY" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="TheaterCityHallDataSource" runat="server"
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        DeleteCommand="DELETE FROM &quot;THEATERHALLS&quot; WHERE &quot;HALL_ID&quot; = :original_HALL_ID AND &quot;THEATER_ID&quot; = :original_THEATER_ID AND &quot;THEATER_CITY_HALL&quot; = :original_THEATER_CITY_HALL AND &quot;HALL_CAPACITY&quot; = :original_HALL_CAPACITY"
        InsertCommand="INSERT INTO &quot;THEATERHALLS&quot; (&quot;HALL_ID&quot;, &quot;THEATER_ID&quot;, &quot;THEATER_CITY_HALL&quot;, &quot;HALL_CAPACITY&quot;) VALUES (:HALL_ID, :THEATER_ID, :THEATER_CITY_HALL, :HALL_CAPACITY)"
        OldValuesParameterFormatString="original_{0}"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM &quot;THEATERHALLS&quot;"
        UpdateCommand="UPDATE &quot;THEATERHALLS&quot; SET &quot;THEATER_ID&quot; = :THEATER_ID, &quot;THEATER_CITY_HALL&quot; = :THEATER_CITY_HALL, &quot;HALL_CAPACITY&quot; = :HALL_CAPACITY WHERE &quot;HALL_ID&quot; = :original_HALL_ID AND &quot;THEATER_ID&quot; = :original_THEATER_ID AND &quot;THEATER_CITY_HALL&quot; = :original_THEATER_CITY_HALL AND &quot;HALL_CAPACITY&quot; = :original_HALL_CAPACITY">
        <DeleteParameters>
            <asp:Parameter Name="original_HALL_ID"           Type="String" />
            <asp:Parameter Name="original_THEATER_ID"        Type="Decimal" />
            <asp:Parameter Name="original_THEATER_CITY_HALL" Type="String" />
            <asp:Parameter Name="original_HALL_CAPACITY"     Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HALL_ID"           Type="String" />
            <asp:Parameter Name="THEATER_ID"        Type="Decimal" />
            <asp:Parameter Name="THEATER_CITY_HALL" Type="String" />
            <asp:Parameter Name="HALL_CAPACITY"     Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="THEATER_ID"                 Type="Decimal" />
            <asp:Parameter Name="THEATER_CITY_HALL"          Type="String" />
            <asp:Parameter Name="HALL_CAPACITY"              Type="Decimal" />
            <asp:Parameter Name="original_HALL_ID"           Type="String" />
            <asp:Parameter Name="original_THEATER_ID"        Type="Decimal" />
            <asp:Parameter Name="original_THEATER_CITY_HALL" Type="String" />
            <asp:Parameter Name="original_HALL_CAPACITY"     Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="TheaterDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand='SELECT THEATER_ID, THEATER_NAME FROM "THEATERS"' />

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; padding:2rem; max-width:520px;">
        <h3 style="font-family:'Playfair Display',serif; font-size:1.25rem; color:#111; margin:0 0 1.5rem;">Add New Theater Hall</h3>
        <div style="display:flex; flex-direction:column; gap:1rem;">

            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Hall ID</label>
                <asp:TextBox ID="txtHallID" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Theater</label>
                <asp:DropDownList ID="ddlTheater" runat="server" DataSourceID="TheaterDataSource" DataTextField="THEATER_NAME" DataValueField="THEATER_ID" CssClass="form-input"></asp:DropDownList>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Theater City Hall</label>
                <asp:TextBox ID="txtCityHall" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Hall Capacity</label>
                <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div style="padding-top:.5rem;">
                <asp:Button ID="btnSaveHall" runat="server" Text="Save Hall" OnClick="btnSaveHall_Click" CssClass="btn-save" />
            </div>

        </div>
    </div>

</asp:Content>
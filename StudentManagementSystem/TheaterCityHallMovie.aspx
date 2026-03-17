<%@ Page Title="TheaterCityHallMovie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TheaterCityHallMovie.aspx.cs" Inherits="WebApplication2.TheaterCityHallMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom:2rem;">
        <p style="font-size:.7rem; font-weight:700; letter-spacing:.2em; color:#EA580C; text-transform:uppercase; margin-bottom:.4rem;">Reports</p>
        <h2 style="font-family:'Playfair Display',serif; font-size:2rem; font-weight:700; color:#111; margin:0 0 .5rem;">Theater City Hall Movies</h2>
        <div style="width:3rem; height:3px; background:#EA580C; border-radius:2px;"></div>
        <p style="margin-top:.75rem; font-size:.875rem; color:#6B7280;">View all scheduled screenings for a selected theater.</p>
    </div>

    <div style="display:flex; align-items:center; gap:.85rem; margin-bottom:1.5rem;">
        <label style="font-size:.7rem; font-weight:700; letter-spacing:.1em; text-transform:uppercase; color:#6B7280; white-space:nowrap;">Select Theater</label>
        <div class="report-select">
            <asp:DropDownList ID="TheaterCityHallMovieDropDown" runat="server"
                DataSourceID="TheaterCityHall"
                DataTextField="THEATER_NAME"
                DataValueField="THEATER_ID"
                AutoPostBack="true">
            </asp:DropDownList>
        </div>
    </div>

    <asp:SqlDataSource ID="TheaterCityHall" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT &quot;THEATER_NAME&quot;, &quot;THEATER_ID&quot; FROM &quot;THEATERS&quot;" />

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; overflow:hidden;">
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataSourceID="TheaterCityHallMovieDataSource"
            CssClass="grid-table">
            <Columns>
                <asp:BoundField DataField="THEATER_NAME" HeaderText="Theater"   SortExpression="THEATER_NAME" />
                <asp:BoundField DataField="TITLE"        HeaderText="Movie"     SortExpression="TITLE" />
                <asp:BoundField DataField="GENRE"        HeaderText="Genre"     SortExpression="GENRE" />
                <asp:BoundField DataField="SHOW_DATE"    HeaderText="Show Date" SortExpression="SHOW_DATE" />
                <asp:BoundField DataField="SHOW_TIME"    HeaderText="Show Time" SortExpression="SHOW_TIME" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="TheaterCityHallMovieDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT T.THEATER_NAME, M.TITLE, M.GENRE, S.SHOW_DATE, S.SHOW_TIME FROM THEATERS T JOIN SHOWS S ON T.THEATER_ID = S.THEATER_ID JOIN MOVIES M ON S.MOV_ID = M.MOV_ID WHERE T.THEATER_ID = :THEATER_ID ORDER BY S.SHOW_DATE, S.SHOW_TIME">
        <SelectParameters>
            <asp:ControlParameter ControlID="TheaterCityHallMovieDropDown" Name="THEATER_ID" PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
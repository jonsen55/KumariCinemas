<%@ Page Title="MovieTheaterCityHallOccupancy" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieTheaterCityHallOccupancy.aspx.cs" Inherits="WebApplication2.MovieTheaterCityHallOccupancy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom:2rem;">
        <p style="font-size:.7rem; font-weight:700; letter-spacing:.2em; color:#EA580C; text-transform:uppercase; margin-bottom:.4rem;">Analytics</p>
        <h2 style="font-family:'Playfair Display',serif; font-size:2rem; font-weight:700; color:#111; margin:0 0 .5rem;">Hall Occupancy</h2>
        <div style="width:3rem; height:3px; background:#EA580C; border-radius:2px;"></div>
        <p style="margin-top:.75rem; font-size:.875rem; color:#6B7280;">Top 3 halls by occupancy percentage for a selected movie (paid tickets only).</p>
    </div>

    <div style="display:flex; align-items:center; gap:.85rem; margin-bottom:1.5rem;">
        <label style="font-size:.7rem; font-weight:700; letter-spacing:.1em; text-transform:uppercase; color:#6B7280; white-space:nowrap;">Select Movie</label>
        <div class="report-select">
            <asp:DropDownList ID="MovieOccupancyDropDown" runat="server"
                DataSourceID="MovieDataSource"
                DataTextField="TITLE"
                DataValueField="MOV_ID"
                AutoPostBack="true">
            </asp:DropDownList>
        </div>
    </div>

    <asp:SqlDataSource ID="MovieDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT TITLE, MOV_ID FROM MOVIES" />

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; overflow:hidden;">
        <asp:GridView ID="GridViewOccupancy" runat="server"
            AutoGenerateColumns="False"
            DataSourceID="OccupancyDataSource"
            CssClass="grid-table">
            <Columns>
                <asp:BoundField DataField="THEATER_CITY_HALL" HeaderText="City Hall" />
                <asp:BoundField DataField="TITLE"             HeaderText="Movie" />
                <asp:BoundField DataField="HALL_CAPACITY"     HeaderText="Capacity" />
                <asp:BoundField DataField="OCCUPANCY_PERCENT" HeaderText="Occupancy (%)" DataFormatString="{0:F2}%" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="OccupancyDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM (SELECT TH.THEATER_CITY_HALL, M.TITLE, TH.HALL_CAPACITY, ROUND((SUM(T.QUANTITY) / TH.HALL_CAPACITY) * 100, 2) AS OCCUPANCY_PERCENT FROM THEATERHALLS TH JOIN TICKET T ON TH.THEATER_ID = T.THEATER_ID JOIN MOVIES M ON T.MOV_ID = M.MOV_ID WHERE T.PAYMENT_STATUS = 'PAID' AND M.MOV_ID = :MOV_ID GROUP BY TH.THEATER_CITY_HALL, M.TITLE, TH.HALL_CAPACITY ORDER BY OCCUPANCY_PERCENT DESC) WHERE ROWNUM &lt;= 3">
        <SelectParameters>
            <asp:ControlParameter ControlID="MovieOccupancyDropDown" Name="MOV_ID" PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
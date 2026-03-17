<%@ Page Title="HallMovie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HallMovie.aspx.cs" Inherits="StudentManagementSystem.HallMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>KUMARI CINEMAS</h3>
        <p>On Theater selection, Hall detail should be updated, further leading to updating list of Movies</p>

        Select Theater:
        <asp:DropDownList ID="TheaterName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="THEATER_NAME" DataValueField="THEATER_ID"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand="SELECT &quot;THEATER_NAME&quot;, &quot;THEATER_ID&quot; FROM &quot;THEATERS&quot;"></asp:SqlDataSource>
        <br /><br />
        Select Hall:
        <asp:DropDownList ID="HallName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="HALL_ID" DataValueField="HALL_ID"></asp:DropDownList>

            <!-- INSERT FORM -->
            <h3>Ticket Management</h3>
                <br />


                <asp:Label ID="Username" runat="server" Text="Full Name:"></asp:Label>
                <asp:TextBox ID="TicketMovieUsername" runat="server"></asp:TextBox>
                <br /><br />
                <asp:Label ID="PhoneNumber" runat="server" Text="Phone Number:"></asp:Label>
                <asp:TextBox ID="TicketMoviePhone" runat="server"></asp:TextBox>
                <br /><br />
                <asp:Label ID="Movie" runat="server" Text="Movie Name:"></asp:Label>
                <asp:DropDownList ID="TicketMovieName" runat="server" AutoPostBack="True" DataSourceID="MTSMovies" DataTextField="TITLE" DataValueField="THEATER_ID"></asp:DropDownList>
                <asp:SqlDataSource ID="MTSMovies" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand="SELECT THEATERS.THEATER_ID, THEATERS.MOV_ID, MOVIES.TITLE FROM THEATERS, MOVIES WHERE THEATERS.MOV_ID = MOVIES.MOV_ID"></asp:SqlDataSource>
                <br /><br />
                <asp:Label ID="Day" runat="server" Text="Label:"></asp:Label>
                <asp:Calendar ID="TicketMovieCalendar" runat="server"></asp:Calendar>
                <br /><br />

            <br /><br />

            <asp:Button
                ID="btnSave"
                runat="server"
                Text="Save"
                OnClick="btnSave_Click" />
    
   
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;HALL_ID&quot;, &quot;THEATER_CITY_HALL&quot;, &quot;HALL_CAPACITY&quot; FROM &quot;THEATERHALLS&quot; WHERE (&quot;THEATER_ID&quot; = :THEATER_ID) ORDER BY &quot;THEATER_CITY_HALL&quot;">
        <SelectParameters>
            <asp:ControlParameter ControlID="TheaterName" Name="THEATER_ID" PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>



        <!-- DATASOURCE -->
<asp:SqlDataSource
    ID="SqlDataSource3"
    runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand='SELECT "JOB_ID","JOB_TITLE","MIN_SALARY","MAX_SALARY" FROM "JOBS"'
    InsertCommand='INSERT INTO "JOBS"
        ("JOB_ID","JOB_TITLE","MIN_SALARY","MAX_SALARY")
        VALUES (:JOB_ID,:JOB_TITLE,:MIN_SALARY,:MAX_SALARY)'>

    <InsertParameters>
        <asp:ControlParameter Name="JOB_ID" ControlID="txtJobId" PropertyName="Text" />
        <asp:ControlParameter Name="JOB_TITLE" ControlID="txtJobTitle" PropertyName="Text" />
        <asp:ControlParameter Name="MIN_SALARY" ControlID="txtMinSalary" PropertyName="Text" />
        <asp:ControlParameter Name="MAX_SALARY" ControlID="txtMaxSalary" PropertyName="Text" />
    </InsertParameters>

</asp:SqlDataSource>
    
   
    </main>
</asp:Content>

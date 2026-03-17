<%@ Page Title="Jobs"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Jobs.aspx.cs"
    Inherits="WebApplication2.Jobs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Jobs</h2>

    <!-- GRIDVIEW -->
    <asp:GridView
        ID="GridView1"
        runat="server"
        AutoGenerateColumns="False"
        AllowPaging="True"
        AllowSorting="True"
        DataKeyNames="JOB_ID"
        DataSourceID="SqlDataSource1">

        <Columns>
            <asp:BoundField DataField="JOB_ID" HeaderText="Job ID" ReadOnly="True" />
            <asp:BoundField DataField="JOB_TITLE" HeaderText="Job Title" />
            <asp:BoundField DataField="MIN_SALARY" HeaderText="Min Salary" />
            <asp:BoundField DataField="MAX_SALARY" HeaderText="Max Salary" />
        </Columns>
    </asp:GridView>

    <hr />

    <!-- INSERT FORM -->
    <h3>Add New Job</h3>

    <asp:Label runat="server" Text="Job ID:" />
    <asp:TextBox ID="txtJobId" runat="server" />
    <br />

    <asp:Label runat="server" Text="Job Title:" />
    <asp:TextBox ID="txtJobTitle" runat="server" />
    <br />

    <asp:Label runat="server" Text="Min Salary:" />
    <asp:TextBox ID="txtMinSalary" runat="server" />
    <br />

    <asp:Label runat="server" Text="Max Salary:" />
    <asp:TextBox ID="txtMaxSalary" runat="server" />
    <br /><br />

    <asp:Button
        ID="btnSave"
        runat="server"
        Text="Save"
        OnClick="btnSave_Click" />

    <br /><br />

    <!-- DATASOURCE -->
    <asp:SqlDataSource
        ID="SqlDataSource1"
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

</asp:Content>
<%@ Page Title="JobsEmployee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobsEmployee.aspx.cs" Inherits="StudentManagementSystem.JobsEmployee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>JOBS EMPLOYEE.</h3>
        <p>On job selection, employee detail should be altered</p>

        SELECT JOBS:&nbsp;
        <asp:DropDownList ID="drpJobName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="JOB_ID" DataValueField="JOB_ID"></asp:DropDownList>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_TITLE&quot; FROM &quot;JOBS&quot;"></asp:SqlDataSource>
   
    <br />
    Employee List:<br />
    <asp:GridView ID="empList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE_ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
            <asp:BoundField DataField="FIRST_NAME" HeaderText="FIRST_NAME" SortExpression="FIRST_NAME" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="LAST_NAME" HeaderText="LAST_NAME" SortExpression="LAST_NAME" />
            <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
            <asp:BoundField DataField="HIRE_DATE" HeaderText="HIRE_DATE" SortExpression="HIRE_DATE" />
            <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" SortExpression="DEPARTMENT_ID" />
        </Columns>
    </asp:GridView>
   
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;FIRST_NAME&quot;, &quot;EMAIL&quot;, &quot;LAST_NAME&quot;, &quot;PHONE_NUMBER&quot;, &quot;HIRE_DATE&quot;, &quot;DEPARTMENT_ID&quot; FROM &quot;EMPLOYEES&quot; WHERE (&quot;JOB_ID&quot; = :JOB_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="drpJobName" Name="JOB_ID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
   
    </main>
</asp:Content>

<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="StudentManagementSystem.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Your application description page.</h3>
        <p>Use this area to provide additional information.</p>

        <h1>Employees</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE_ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
                <asp:BoundField DataField="FIRST_NAME" HeaderText="FIRST_NAME" SortExpression="FIRST_NAME" />
                <asp:BoundField DataField="LAST_NAME" HeaderText="LAST_NAME" SortExpression="LAST_NAME" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
                <asp:BoundField DataField="HIRE_DATE" HeaderText="HIRE_DATE" SortExpression="HIRE_DATE" />
                <asp:BoundField DataField="JOB_ID" HeaderText="JOB_ID" SortExpression="JOB_ID" />
                <asp:BoundField DataField="SALARY" HeaderText="SALARY" SortExpression="SALARY" />
                <asp:BoundField DataField="COMMISSION_PCT" HeaderText="COMMISSION_PCT" SortExpression="COMMISSION_PCT" />
                <asp:BoundField DataField="MANAGER_ID" HeaderText="MANAGER_ID" SortExpression="MANAGER_ID" />
                <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" SortExpression="DEPARTMENT_ID" />
            </Columns>
</asp:GridView>
        
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;EMPLOYEES&quot; WHERE &quot;EMPLOYEE_ID&quot; = :original_EMPLOYEE_ID AND ((&quot;FIRST_NAME&quot; = :original_FIRST_NAME) OR (&quot;FIRST_NAME&quot; IS NULL AND :original_FIRST_NAME IS NULL)) AND &quot;LAST_NAME&quot; = :original_LAST_NAME AND &quot;EMAIL&quot; = :original_EMAIL AND ((&quot;PHONE_NUMBER&quot; = :original_PHONE_NUMBER) OR (&quot;PHONE_NUMBER&quot; IS NULL AND :original_PHONE_NUMBER IS NULL)) AND &quot;HIRE_DATE&quot; = :original_HIRE_DATE AND &quot;JOB_ID&quot; = :original_JOB_ID AND ((&quot;SALARY&quot; = :original_SALARY) OR (&quot;SALARY&quot; IS NULL AND :original_SALARY IS NULL)) AND ((&quot;COMMISSION_PCT&quot; = :original_COMMISSION_PCT) OR (&quot;COMMISSION_PCT&quot; IS NULL AND :original_COMMISSION_PCT IS NULL)) AND ((&quot;MANAGER_ID&quot; = :original_MANAGER_ID) OR (&quot;MANAGER_ID&quot; IS NULL AND :original_MANAGER_ID IS NULL)) AND ((&quot;DEPARTMENT_ID&quot; = :original_DEPARTMENT_ID) OR (&quot;DEPARTMENT_ID&quot; IS NULL AND :original_DEPARTMENT_ID IS NULL))" InsertCommand="INSERT INTO &quot;EMPLOYEES&quot; (&quot;EMPLOYEE_ID&quot;, &quot;FIRST_NAME&quot;, &quot;LAST_NAME&quot;, &quot;EMAIL&quot;, &quot;PHONE_NUMBER&quot;, &quot;HIRE_DATE&quot;, &quot;JOB_ID&quot;, &quot;SALARY&quot;, &quot;COMMISSION_PCT&quot;, &quot;MANAGER_ID&quot;, &quot;DEPARTMENT_ID&quot;) VALUES (:EMPLOYEE_ID, :FIRST_NAME, :LAST_NAME, :EMAIL, :PHONE_NUMBER, :HIRE_DATE, :JOB_ID, :SALARY, :COMMISSION_PCT, :MANAGER_ID, :DEPARTMENT_ID)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM &quot;EMPLOYEES&quot;" UpdateCommand="UPDATE &quot;EMPLOYEES&quot; SET &quot;FIRST_NAME&quot; = :FIRST_NAME, &quot;LAST_NAME&quot; = :LAST_NAME, &quot;EMAIL&quot; = :EMAIL, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER, &quot;HIRE_DATE&quot; = :HIRE_DATE, &quot;JOB_ID&quot; = :JOB_ID, &quot;SALARY&quot; = :SALARY, &quot;COMMISSION_PCT&quot; = :COMMISSION_PCT, &quot;MANAGER_ID&quot; = :MANAGER_ID, &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID WHERE &quot;EMPLOYEE_ID&quot; = :original_EMPLOYEE_ID AND ((&quot;FIRST_NAME&quot; = :original_FIRST_NAME) OR (&quot;FIRST_NAME&quot; IS NULL AND :original_FIRST_NAME IS NULL)) AND &quot;LAST_NAME&quot; = :original_LAST_NAME AND &quot;EMAIL&quot; = :original_EMAIL AND ((&quot;PHONE_NUMBER&quot; = :original_PHONE_NUMBER) OR (&quot;PHONE_NUMBER&quot; IS NULL AND :original_PHONE_NUMBER IS NULL)) AND &quot;HIRE_DATE&quot; = :original_HIRE_DATE AND &quot;JOB_ID&quot; = :original_JOB_ID AND ((&quot;SALARY&quot; = :original_SALARY) OR (&quot;SALARY&quot; IS NULL AND :original_SALARY IS NULL)) AND ((&quot;COMMISSION_PCT&quot; = :original_COMMISSION_PCT) OR (&quot;COMMISSION_PCT&quot; IS NULL AND :original_COMMISSION_PCT IS NULL)) AND ((&quot;MANAGER_ID&quot; = :original_MANAGER_ID) OR (&quot;MANAGER_ID&quot; IS NULL AND :original_MANAGER_ID IS NULL)) AND ((&quot;DEPARTMENT_ID&quot; = :original_DEPARTMENT_ID) OR (&quot;DEPARTMENT_ID&quot; IS NULL AND :original_DEPARTMENT_ID IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_EMPLOYEE_ID" Type="Decimal" />
            <asp:Parameter Name="original_FIRST_NAME" Type="String" />
            <asp:Parameter Name="original_LAST_NAME" Type="String" />
            <asp:Parameter Name="original_EMAIL" Type="String" />
            <asp:Parameter Name="original_PHONE_NUMBER" Type="String" />
            <asp:Parameter Name="original_HIRE_DATE" Type="DateTime" />
            <asp:Parameter Name="original_JOB_ID" Type="String" />
            <asp:Parameter Name="original_SALARY" Type="Decimal" />
            <asp:Parameter Name="original_COMMISSION_PCT" Type="Decimal" />
            <asp:Parameter Name="original_MANAGER_ID" Type="Decimal" />
            <asp:Parameter Name="original_DEPARTMENT_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EMPLOYEE_ID" Type="Decimal" />
            <asp:Parameter Name="FIRST_NAME" Type="String" />
            <asp:Parameter Name="LAST_NAME" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="PHONE_NUMBER" Type="String" />
            <asp:Parameter Name="HIRE_DATE" Type="DateTime" />
            <asp:Parameter Name="JOB_ID" Type="String" />
            <asp:Parameter Name="SALARY" Type="Decimal" />
            <asp:Parameter Name="COMMISSION_PCT" Type="Decimal" />
            <asp:Parameter Name="MANAGER_ID" Type="Decimal" />
            <asp:Parameter Name="DEPARTMENT_ID" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FIRST_NAME" Type="String" />
            <asp:Parameter Name="LAST_NAME" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="PHONE_NUMBER" Type="String" />
            <asp:Parameter Name="HIRE_DATE" Type="DateTime" />
            <asp:Parameter Name="JOB_ID" Type="String" />
            <asp:Parameter Name="SALARY" Type="Decimal" />
            <asp:Parameter Name="COMMISSION_PCT" Type="Decimal" />
            <asp:Parameter Name="MANAGER_ID" Type="Decimal" />
            <asp:Parameter Name="DEPARTMENT_ID" Type="Decimal" />
            <asp:Parameter Name="original_EMPLOYEE_ID" Type="Decimal" />
            <asp:Parameter Name="original_FIRST_NAME" Type="String" />
            <asp:Parameter Name="original_LAST_NAME" Type="String" />
            <asp:Parameter Name="original_EMAIL" Type="String" />
            <asp:Parameter Name="original_PHONE_NUMBER" Type="String" />
            <asp:Parameter Name="original_HIRE_DATE" Type="DateTime" />
            <asp:Parameter Name="original_JOB_ID" Type="String" />
            <asp:Parameter Name="original_SALARY" Type="Decimal" />
            <asp:Parameter Name="original_COMMISSION_PCT" Type="Decimal" />
            <asp:Parameter Name="original_MANAGER_ID" Type="Decimal" />
            <asp:Parameter Name="original_DEPARTMENT_ID" Type="Decimal" />
        </UpdateParameters>
</asp:SqlDataSource>
        
   
    </main>
</asp:Content>

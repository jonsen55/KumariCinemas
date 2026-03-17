<%@ Page Title="Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebApplication2.Users" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom:2rem;">
        <p style="font-size:.7rem; font-weight:700; letter-spacing:.2em; color:#EA580C; text-transform:uppercase; margin-bottom:.4rem;">Manage</p>
        <h2 style="font-family:'Playfair Display',serif; font-size:2rem; font-weight:700; color:#111; margin:0 0 .5rem;">Users</h2>
        <div style="width:3rem; height:3px; background:#EA580C; border-radius:2px;"></div>
    </div>

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; overflow:hidden; margin-bottom:2.5rem;">
        <asp:GridView ID="GridView1" runat="server"
            AllowPaging="True"
            AutoGenerateColumns="False"
            DataKeyNames="USER_ID,SHOW_ID,MOV_ID,THEATER_ID"
            DataSourceID="UsersDataSource"
            CssClass="grid-table">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="USER_ID"    HeaderText="User ID"    ReadOnly="True" SortExpression="USER_ID" />
                <asp:BoundField DataField="SHOW_ID"    HeaderText="Show ID"    ReadOnly="True" SortExpression="SHOW_ID" />
                <asp:BoundField DataField="MOV_ID"     HeaderText="Movie ID"   ReadOnly="True" SortExpression="MOV_ID" />
                <asp:BoundField DataField="THEATER_ID" HeaderText="Theater ID" ReadOnly="True" SortExpression="THEATER_ID" />
                <asp:BoundField DataField="U_NAME"     HeaderText="Username"   SortExpression="U_NAME" />
                <asp:BoundField DataField="F_NAME"     HeaderText="First Name" SortExpression="F_NAME" />
                <asp:BoundField DataField="L_NAME"     HeaderText="Last Name"  SortExpression="L_NAME" />
                <asp:BoundField DataField="EMAIL"      HeaderText="Email"      SortExpression="EMAIL" />
                <asp:BoundField DataField="AGE"        HeaderText="Age"        SortExpression="AGE" />
                <asp:BoundField DataField="CONTACT"    HeaderText="Contact"    SortExpression="CONTACT" />
                <asp:BoundField DataField="ADDRESS"    HeaderText="Address"    SortExpression="ADDRESS" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="UsersDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID AND &quot;SHOW_ID&quot; = :SHOW_ID AND &quot;MOV_ID&quot; = :MOV_ID AND &quot;THEATER_ID&quot; = :THEATER_ID"
        InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;SHOW_ID&quot;, &quot;MOV_ID&quot;, &quot;THEATER_ID&quot;, &quot;U_NAME&quot;, &quot;F_NAME&quot;, &quot;L_NAME&quot;, &quot;EMAIL&quot;, &quot;AGE&quot;, &quot;CONTACT&quot;, &quot;ADDRESS&quot;) VALUES (:USER_ID, :SHOW_ID, :MOV_ID, :THEATER_ID, :U_NAME, :F_NAME, :L_NAME, :EMAIL, :AGE, :CONTACT, :ADDRESS)"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM &quot;USERS&quot; ORDER BY &quot;F_NAME&quot;"
        UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;U_NAME&quot; = :U_NAME, &quot;F_NAME&quot; = :F_NAME, &quot;L_NAME&quot; = :L_NAME, &quot;EMAIL&quot; = :EMAIL, &quot;AGE&quot; = :AGE, &quot;CONTACT&quot; = :CONTACT, &quot;ADDRESS&quot; = :ADDRESS WHERE &quot;USER_ID&quot; = :USER_ID AND &quot;SHOW_ID&quot; = :SHOW_ID AND &quot;MOV_ID&quot; = :MOV_ID AND &quot;THEATER_ID&quot; = :THEATER_ID"
        OnDeleted="UsersDataSource_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="USER_ID"   Type="Decimal" />
            <asp:Parameter Name="SHOW_ID"   Type="Decimal" />
            <asp:Parameter Name="MOV_ID"    Type="Decimal" />
            <asp:Parameter Name="THEATER_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USER_ID"   Type="Decimal" />
            <asp:Parameter Name="SHOW_ID"   Type="Decimal" />
            <asp:Parameter Name="MOV_ID"    Type="Decimal" />
            <asp:Parameter Name="THEATER_ID" Type="Decimal" />
            <asp:Parameter Name="U_NAME"    Type="String" />
            <asp:Parameter Name="F_NAME"    Type="String" />
            <asp:Parameter Name="L_NAME"    Type="String" />
            <asp:Parameter Name="EMAIL"     Type="String" />
            <asp:Parameter Name="AGE"       Type="Decimal" />
            <asp:Parameter Name="CONTACT"   Type="String" />
            <asp:Parameter Name="ADDRESS"   Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="U_NAME"    Type="String" />
            <asp:Parameter Name="F_NAME"    Type="String" />
            <asp:Parameter Name="L_NAME"    Type="String" />
            <asp:Parameter Name="EMAIL"     Type="String" />
            <asp:Parameter Name="AGE"       Type="Decimal" />
            <asp:Parameter Name="CONTACT"   Type="String" />
            <asp:Parameter Name="ADDRESS"   Type="String" />
            <asp:Parameter Name="USER_ID"   Type="Decimal" />
            <asp:Parameter Name="SHOW_ID"   Type="Decimal" />
            <asp:Parameter Name="MOV_ID"    Type="Decimal" />
            <asp:Parameter Name="THEATER_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ShowDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand='SELECT SHOW_ID FROM "SHOWS"' />
    <asp:SqlDataSource ID="MovieDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand='SELECT MOV_ID, TITLE FROM "MOVIES"' />
    <asp:SqlDataSource ID="TheaterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>" ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>" SelectCommand='SELECT THEATER_ID, THEATER_NAME FROM "THEATERS"' />

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; padding:2rem; max-width:520px;">
        <h3 style="font-family:'Playfair Display',serif; font-size:1.25rem; color:#111; margin:0 0 1.5rem;">Add New User</h3>
        <div style="display:flex; flex-direction:column; gap:1rem;">

            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">User ID</label>
                <asp:TextBox ID="txtUserID" runat="server" CssClass="form-input"></asp:TextBox>
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
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Username</label>
                <asp:TextBox ID="txtUName" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">First Name</label>
                <asp:TextBox ID="txtFName" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Last Name</label>
                <asp:TextBox ID="txtLName" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Age</label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Contact</label>
                <asp:TextBox ID="txtContact" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div style="padding-top:.5rem;">
                <asp:Button ID="btnSave" runat="server" Text="Save User" OnClick="btnSave_Click" CssClass="btn-save" />
            </div>

        </div>
    </div>

</asp:Content>
<%@ Page Title="Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="WebApplication2.Movies" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom:2rem;">
        <p style="font-size:.7rem; font-weight:700; letter-spacing:.2em; color:#EA580C; text-transform:uppercase; margin-bottom:.4rem;">Manage</p>
        <h2 style="font-family:'Playfair Display',serif; font-size:2rem; font-weight:700; color:#111; margin:0 0 .5rem;">Movies</h2>
        <div style="width:3rem; height:3px; background:#EA580C; border-radius:2px;"></div>
    </div>

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; overflow:hidden; margin-bottom:2.5rem;">
        <asp:GridView ID="GridView1" runat="server"
            AllowPaging="True"
            AutoGenerateColumns="False"
            DataKeyNames="MOV_ID"
            DataSourceID="MTSMovies"
            CssClass="grid-table">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="MOV_ID"      HeaderText="ID"           ReadOnly="True" SortExpression="MOV_ID" />
                <asp:BoundField DataField="TITLE"       HeaderText="Title"        SortExpression="TITLE" />
                <asp:BoundField DataField="DURATION"    HeaderText="Duration"     SortExpression="DURATION" />
                <asp:BoundField DataField="LANGUAGE"    HeaderText="Language"     SortExpression="LANGUAGE" />
                <asp:BoundField DataField="GENRE"       HeaderText="Genre"        SortExpression="GENRE" />
                <asp:BoundField DataField="RELEASEDATE" HeaderText="Release Date" SortExpression="RELEASEDATE" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="MTSMovies" runat="server"
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:MTSConnectionString %>"
        DeleteCommand="DELETE FROM &quot;MOVIES&quot; WHERE &quot;MOV_ID&quot; = :original_MOV_ID AND &quot;TITLE&quot; = :original_TITLE AND &quot;DURATION&quot; = :original_DURATION AND &quot;LANGUAGE&quot; = :original_LANGUAGE AND &quot;GENRE&quot; = :original_GENRE AND &quot;RELEASEDATE&quot; = :original_RELEASEDATE"
        InsertCommand="INSERT INTO &quot;MOVIES&quot; (&quot;MOV_ID&quot;, &quot;TITLE&quot;, &quot;DURATION&quot;, &quot;LANGUAGE&quot;, &quot;GENRE&quot;, &quot;RELEASEDATE&quot;) VALUES (:MOV_ID, :TITLE, :DURATION, :LANGUAGE, :GENRE, :RELEASEDATE)"
        OldValuesParameterFormatString="original_{0}"
        ProviderName="<%$ ConnectionStrings:MTSConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM &quot;MOVIES&quot;"
        UpdateCommand="UPDATE &quot;MOVIES&quot; SET &quot;TITLE&quot; = :TITLE, &quot;DURATION&quot; = :DURATION, &quot;LANGUAGE&quot; = :LANGUAGE, &quot;GENRE&quot; = :GENRE, &quot;RELEASEDATE&quot; = :RELEASEDATE WHERE &quot;MOV_ID&quot; = :original_MOV_ID AND &quot;TITLE&quot; = :original_TITLE AND &quot;DURATION&quot; = :original_DURATION AND &quot;LANGUAGE&quot; = :original_LANGUAGE AND &quot;GENRE&quot; = :original_GENRE AND &quot;RELEASEDATE&quot; = :original_RELEASEDATE">
        <DeleteParameters>
            <asp:Parameter Name="original_MOV_ID"      Type="Decimal" />
            <asp:Parameter Name="original_TITLE"       Type="String" />
            <asp:Parameter Name="original_DURATION"    Type="Decimal" />
            <asp:Parameter Name="original_LANGUAGE"    Type="String" />
            <asp:Parameter Name="original_GENRE"       Type="String" />
            <asp:Parameter Name="original_RELEASEDATE" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MOV_ID"      Type="Decimal" />
            <asp:Parameter Name="TITLE"       Type="String" />
            <asp:Parameter Name="DURATION"    Type="Decimal" />
            <asp:Parameter Name="LANGUAGE"    Type="String" />
            <asp:Parameter Name="GENRE"       Type="String" />
            <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TITLE"                Type="String" />
            <asp:Parameter Name="DURATION"             Type="Decimal" />
            <asp:Parameter Name="LANGUAGE"             Type="String" />
            <asp:Parameter Name="GENRE"                Type="String" />
            <asp:Parameter Name="RELEASEDATE"          Type="DateTime" />
            <asp:Parameter Name="original_MOV_ID"      Type="Decimal" />
            <asp:Parameter Name="original_TITLE"       Type="String" />
            <asp:Parameter Name="original_DURATION"    Type="Decimal" />
            <asp:Parameter Name="original_LANGUAGE"    Type="String" />
            <asp:Parameter Name="original_GENRE"       Type="String" />
            <asp:Parameter Name="original_RELEASEDATE" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div style="background:#fff; border-radius:1rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; padding:2rem; max-width:520px;">
        <h3 style="font-family:'Playfair Display',serif; font-size:1.25rem; color:#111; margin:0 0 1.5rem;">Add New Movie</h3>
        <div style="display:flex; flex-direction:column; gap:1rem;">

            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Movie ID</label>
                <asp:TextBox ID="txtMovId" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Title</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Duration (min)</label>
                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Language</label>
                <asp:TextBox ID="txtLanguage" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Genre</label>
                <asp:TextBox ID="txtGenre" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
            <div>
                <label style="display:block; font-size:.7rem; font-weight:600; letter-spacing:.08em; text-transform:uppercase; color:#6B7280; margin-bottom:.35rem;">Release Date</label>
                <asp:TextBox ID="txtReleaseDate" runat="server" TextMode="Date" CssClass="form-input"></asp:TextBox>
            </div>
            <div style="padding-top:.5rem;">
                <asp:Button ID="btnSaveMovie" runat="server" Text="Save Movie" OnClick="btnSaveMovie_Click" CssClass="btn-save" />
            </div>

        </div>
    </div>

</asp:Content>
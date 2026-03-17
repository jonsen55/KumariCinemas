<%@ Page Title="Kumari Cinemas | Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudentManagementSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div style="max-width:960px; margin:0 auto;">

    <!-- Hero -->
    <section style="text-align:center; padding:4rem 1rem 3rem;">
        <p style="font-size:.72rem; font-weight:700; letter-spacing:.22em; color:#EA580C; text-transform:uppercase; margin-bottom:1rem;">Nepal's Premier Cinema Network</p>
        <h1 style="font-family:'Playfair Display',serif; font-size:clamp(2.5rem,6vw,4rem); font-weight:900; color:#111; line-height:1.1; margin-bottom:1.25rem;">
            Kumari <span style="color:#EA580C;">Cinemas</span>
        </h1>
        <p style="font-size:1rem; color:#6B7280; max-width:520px; margin:0 auto 2rem; line-height:1.8;">
            Experience a revolutionizing movie watching experience in Nepal with
            sophisticated halls and high-tech centralized ticketing.
        </p>
        <a href="Movies.aspx"
           style="background:linear-gradient(135deg,#EA580C,#C2410C); color:#fff; font-weight:600; font-size:.88rem; letter-spacing:.06em; padding:.8rem 2.25rem; border-radius:.5rem; text-decoration:none; display:inline-block; box-shadow:0 4px 14px rgba(194,65,12,0.35);"
           onmouseover="this.style.opacity='.88'" onmouseout="this.style.opacity='1'">
            BROWSE NOW SHOWING &rarr;
        </a>
    </section>

    <!-- Divider -->
    <div style="display:flex; align-items:center; gap:1rem; margin-bottom:3rem;">
        <div style="flex:1; height:1px; background:linear-gradient(to right,transparent,#E5E2DA);"></div>
        <span style="font-size:.7rem; letter-spacing:.18em; color:#C2410C; font-weight:600;">&#9670; FEATURES &#9670;</span>
        <div style="flex:1; height:1px; background:linear-gradient(to left,transparent,#E5E2DA);"></div>
    </div>

    <!-- Feature Cards -->
    <div style="display:grid; grid-template-columns:repeat(auto-fit,minmax(260px,1fr)); gap:1.5rem; padding-bottom:3rem;">

        <!-- Smart Booking -->
        <div style="background:#fff; border-radius:1rem; padding:2rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; transition:box-shadow .2s, transform .2s;"
             onmouseover="this.style.boxShadow='0 8px 32px rgba(194,65,12,0.12)';this.style.transform='translateY(-4px)'"
             onmouseout="this.style.boxShadow='0 2px 16px rgba(0,0,0,0.07)';this.style.transform='translateY(0)'">
            <div style="width:2.75rem; height:2.75rem; background:#FFF3E0; border-radius:.625rem; display:flex; align-items:center; justify-content:center; margin-bottom:1.25rem;">
                <span style="color:#EA580C; font-size:1.2rem;">&#127915;</span>
            </div>
            <h2 style="font-family:'Playfair Display',serif; font-size:1.2rem; color:#111; margin-bottom:.65rem;">Smart Booking</h2>
            <p style="color:#6B7280; font-size:.875rem; line-height:1.8; margin-bottom:1.25rem;">
                Registered users can book one or many tickets instantly.
                Our system automatically cancels reservations if tickets
                are not purchased within one hour of the show.
            </p>
            <a href="Tickets.aspx" style="color:#EA580C; font-size:.8rem; font-weight:700; text-decoration:none; letter-spacing:.05em;">
                MANAGE TICKETS &rarr;
            </a>
        </div>

        <!-- Sophisticated Halls -->
        <div style="background:#fff; border-radius:1rem; padding:2rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; transition:box-shadow .2s, transform .2s;"
             onmouseover="this.style.boxShadow='0 8px 32px rgba(194,65,12,0.12)';this.style.transform='translateY(-4px)'"
             onmouseout="this.style.boxShadow='0 2px 16px rgba(0,0,0,0.07)';this.style.transform='translateY(0)'">
            <div style="width:2.75rem; height:2.75rem; background:#FFF3E0; border-radius:.625rem; display:flex; align-items:center; justify-content:center; margin-bottom:1.25rem;">
                <span style="color:#EA580C; font-size:1.2rem;">&#127970;</span>
            </div>
            <h2 style="font-family:'Playfair Display',serif; font-size:1.2rem; color:#111; margin-bottom:.65rem;">Sophisticated Halls</h2>
            <p style="color:#6B7280; font-size:.875rem; line-height:1.8; margin-bottom:1.25rem;">
                From Pokhara Cineplex to Labim Mall and Biratnagar,
                we provide high-capacity seating and premium
                audio-visual technology for every screening.
            </p>
            <a href="TheaterCityHall.aspx" style="color:#EA580C; font-size:.8rem; font-weight:700; text-decoration:none; letter-spacing:.05em;">
                VIEW LOCATIONS &rarr;
            </a>
        </div>

        <!-- Dynamic Pricing -->
        <div style="background:#fff; border-radius:1rem; padding:2rem; box-shadow:0 2px 16px rgba(0,0,0,0.07); border:1px solid #F0EDE6; transition:box-shadow .2s, transform .2s;"
             onmouseover="this.style.boxShadow='0 8px 32px rgba(194,65,12,0.12)';this.style.transform='translateY(-4px)'"
             onmouseout="this.style.boxShadow='0 2px 16px rgba(0,0,0,0.07)';this.style.transform='translateY(0)'">
            <div style="width:2.75rem; height:2.75rem; background:#FFF3E0; border-radius:.625rem; display:flex; align-items:center; justify-content:center; margin-bottom:1.25rem;">
                <span style="color:#EA580C; font-size:1.2rem;">&#127914;</span>
            </div>
            <h2 style="font-family:'Playfair Display',serif; font-size:1.2rem; color:#111; margin-bottom:.65rem;">Dynamic Pricing</h2>
            <p style="color:#6B7280; font-size:.875rem; line-height:1.8; margin-bottom:1.25rem;">
                Enjoy competitive ticket rates starting from
                200 NPR. Prices may vary during holidays
                and blockbuster release weeks.
            </p>
            <a href="Shows.aspx" style="color:#EA580C; font-size:.8rem; font-weight:700; text-decoration:none; letter-spacing:.05em;">
                CHECK SHOWTIMES &rarr;
            </a>
        </div>

    </div>
</div>

</asp:Content>
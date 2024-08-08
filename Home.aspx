<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LibraryManagementSystem.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="px-4 pt-5 my-5 text-center border-bottom animate__animated animate__fadeIn">
        <h1 class="display-4 fw-bold text-body-emphasis animate__animated animate__fadeInDown">LMS</h1>
        <div class="col-lg-6 mx-auto">
            <p class="lead mb-4 animate__animated animate__fadeInDown">With user-friendly features and a robust backend, the system allows to easily catalog books, track member activity, and manage library resources efficiently.</p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5 animate__animated animate__fadeInUp">
                <a href="Contact.aspx" class="btn btn-primary btn-lg px-4 me-sm-3">Get Quote</a>
                <a href="Register.aspx" class="btn btn-outline-secondary btn-lg px-4">Free Trial</a>
            </div>
        </div>
        <div class="overflow-hidden" style="max-height: 30vh;">
            <div class="container px-5">
                <img src="assets/img/bootstrap-docs.png" class="img-fluid border rounded-3 shadow-lg mb-4 animate__animated animate__fadeInUp" alt="Example image" width="700" height="500" loading="lazy">
            </div>
        </div>
    </section>
    <section class="container py-5 mb-5">
        <div class="row">
            <h1 class="display-4 text-center mb-5 animate__animated animate__fadeInDown">About</h1>
            <div class="col-md-6">
                <img src="assets/img/library.jpg" class="img-fluid animate__animated animate__fadeInLeft" />
            </div>
            <div class="col-md-6">
                <p class="lead animate__animated animate__fadeInRight">
                    At LMS, we are committed to providing a seamless and efficient library experience for our patrons. Our Library Management System (LMS) is designed to simplify the process of managing library resources, enhancing user experience, and facilitating effective library operations.
                </p>
            </div>
        </div>
    </section>
    <section class="container-fluid bg-purple mb-5">
        <div class="container py-5 animate__animated animate__fadeIn">
            <p class="text-center lead text-white animate__animated animate__fadeInDown">
                Experience the difference our Library Management System can make in simplifying library operations and enhancing user satisfaction.<br />
                Join the growing number of libraries that trust us for their library management needs!
            </p>
        </div>
    </section>
    <section class="container py-5 mb-5">
        <div class="row">
            <h1 class="display-4 text-center mb-5 animate__animated animate__fadeInDown">Contact us</h1>
            <div class="col-md-6 animate__animated animate__fadeInLeft">
                <div class="form-floating mb-3">
                    <asp:TextBox CssClass="form-control" ID="Name" runat="server" placeholder="Full Name"></asp:TextBox>
                    <label for="Name">Full Name</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox CssClass="form-control" ID="Email" runat="server" placeholder="Email Address"></asp:TextBox>
                    <label for="Email">Email Address</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox CssClass="form-control" ID="Subject" runat="server" placeholder="Subject"></asp:TextBox>
                    <label for="Subject">Subject</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox CssClass="form-control" ID="Message" runat="server" placeholder="Message" TextMode="MultiLine" style="height: 100px;"></asp:TextBox>
                    <label for="Message">Message</label>
                </div>
                <asp:Button CssClass="btn btn-dark py-2 px-5" ID="ContactButton" runat="server" Text="Contact" />
            </div>
            <div class="col-md-6">
                <img src="assets/img/contact.jpg" class="img-fluid animate__animated animate__fadeInRight" />
            </div>
        </div>
    </section>
</asp:Content>

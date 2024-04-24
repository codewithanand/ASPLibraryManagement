<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LibraryManagementSystem.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
            <div class="col-md-3 mb-3">
                <a href="BookIssue.aspx" class="card shadow bg-info text-white text-decoration-none px-4 py-5">
                    <div class="d-flex flex-column justify-content-center align-items-center">
                        <i style="font-size: 50px;" class="fa-solid fa-upload mb-3"></i>
                        <h3 class="text-uppercase">Issue</h3>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-3">
                <a href="BookReturn.aspx" class="card shadow bg-warning text-white text-decoration-none px-4 py-5">
                    <div class="d-flex flex-column justify-content-center align-items-center">
                        <i style="font-size: 50px;" class="fa-solid fa-diagram-next mb-3"></i>
                        <h3 class="text-uppercase">Return</h3>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-3">
                <a href="Books.aspx" class="card shadow bg-success text-white text-decoration-none px-4 py-5">
                    <div class="d-flex flex-column justify-content-center align-items-center">
                        <i style="font-size: 50px;" class="fa-solid fa-book mb-3"></i>
                        <h3 class="text-uppercase">Books</h3>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-3">
                <a href="Students.aspx" class="card shadow bg-primary text-white text-decoration-none px-4 py-5">
                    <div class="d-flex flex-column justify-content-center align-items-center">
                        <i style="font-size: 50px;" class="fa-solid fa-graduation-cap mb-3"></i>
                        <h3 class="text-uppercase">Students</h3>
                    </div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>

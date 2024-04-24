<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="BookReturn.aspx.cs" Inherits="LibraryManagementSystem.BookReturn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
            <div class="col-6">
                <h3 class="h3 text-white">Return Book</h3>
            </div>
            <div class="col-6 d-flex align-items-center justify-content-end">
                <a class="btn btn-light" href="BookIssue.aspx"><i class="fa-solid fa-upload"></i> Issue Book</a>
            </div>
        </div>
        
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    
</asp:Content>

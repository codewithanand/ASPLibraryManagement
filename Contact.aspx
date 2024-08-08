<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="LibraryManagementSystem.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row mb-5">
            <h2 class="text-center">Contact Us</h2>
        </div>
        <div class="row">
            <div class="col-md-6">
                <img class="img-fluid" src="assets/img/contact.png" />
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>Full Name</label>
                    <asp:TextBox CssClass="form-control" ID="Name" runat="server"></asp:TextBox>
                </div>
                <div class="form-group mt-3">
                    <label>Email Address</label>
                    <asp:TextBox CssClass="form-control" ID="Email" runat="server"></asp:TextBox>
                </div>
                <div class="form-group mt-3">
                    <label>Subject</label>
                    <asp:TextBox CssClass="form-control" ID="Subject" runat="server"></asp:TextBox>
                </div>
                <div class="form-group mt-3">
                    <label>Message</label>
                    <asp:TextBox CssClass="form-control" ID="Message" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group mt-3">
                    <asp:Button CssClass="btn btn-dark" ID="ContactButton" runat="server" Text="Send Message" OnClick="ContactButton_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

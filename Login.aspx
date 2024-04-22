﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LibraryManagementSystem.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="bg-purple py-5">
        <div class="container py-5">
            <div class="row">
                <div class="col-md-6 offset-md-3 card shadow p-3">
                    <h3 class="mb-3">Login</h3>
                    <div class="form-group mb-3">
                        <label>Email Address</label>
                        <asp:TextBox class="form-control" ID="EmailTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="*Required" ControlToValidate="EmailTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EmailCheckValidator" ControlToValidate="EmailTextBox" ForeColor="Red" runat="server" ErrorMessage="Not a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:Label CssClass="text-danger text-sm" ID="EmailErrorMsg" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="form-group mb-3">
                        <label>Password</label>
                        <asp:TextBox class="form-control" ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ErrorMessage="*Required" ControlToValidate="PasswordTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Label CssClass="text-danger text-sm" ID="ErrorMessage" runat="server" Text=""></asp:Label>
                    <div class="mb-3">
                        <a href="Register.aspx">Don't have an account? Register</a>
                    </div>
                    <div class="form-group">
                        <asp:Button CssClass="btn btn-dark" ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

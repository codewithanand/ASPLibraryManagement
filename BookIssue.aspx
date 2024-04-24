<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="BookIssue.aspx.cs" Inherits="LibraryManagementSystem.BookIssue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
            <div class="col-6">
                <h3 class="h3 text-white">Issue Book</h3>
            </div>
            <div class="col-6 d-flex align-items-center justify-content-end">
                <a class="btn btn-light" href="BookReturn.aspx"><i class="fa-solid fa-diagram-next"></i>Return Book</a>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-6 mb-3">
                <div class="card p-3">
                    <div class="form-group">
                        <label>Student Id</label>
                        <asp:TextBox CssClass="form-control" ID="StudentId" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Button CssClass="btn btn-dark" ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />
                        <asp:Button CssClass="btn btn-light" ID="RefreshButton" runat="server" Text="Refresh" OnClick="RefreshButton_Click" />
                    </div>
                </div>
                <asp:PlaceHolder ID="BookIdPlaceHolder" runat="server">
                    <div class="card p-3 mt-3">
                        <div class="form-group">
                            <label>Book ISBN</label>
                            <asp:TextBox CssClass="form-control" ID="BookISBN" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group mt-3">
                            <asp:Button CssClass="btn btn-dark" ID="IssueButton" runat="server" Text="Issue Book" OnClick="IssueButton_Click" />
                        </div>
                    </div>
                </asp:PlaceHolder>
            </div>
            <div class="col-md-6">
                <asp:PlaceHolder ID="StudentPlaceHolder" runat="server">
                    <div class="card p-3">
                        <h3 class="h3 mb-3">Student Information</h3>
                        <asp:ListView ID="IssuedBooksistView" runat="server">
                            <ItemTemplate>
                                <div class="border rounded p-3 mb-3">
                                    <p>
                                        #ISBN120000 <strong>Book Name</strong>
                                    </p>
                                    <p>
                                        Date of Issue: <strong>20-04-2024</strong>
                                    </p>
                                    <p>
                                        Date of Return: <strong>24-04-2024</strong>
                                    </p>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

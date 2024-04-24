<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="BookAdd.aspx.cs" Inherits="LibraryManagementSystem.BookAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
            <div class="col-6">
                <h3 class="h3 text-white">Add Book</h3>
            </div>
            <div class="col-6 d-flex align-items-center justify-content-end">
                <a class="btn btn-light" href="Books.aspx"><i class="fa-solid fa-book"></i> View Books</a>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <div class="card p-3">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="BookTitle">Book Title</label>
                            <asp:TextBox CssClass="form-control" ID="BookTitle" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="BookTitle" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mt-3">
                            <label for="Author">Author</label>
                            <asp:TextBox CssClass="form-control" ID="Author" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ControlToValidate="Author" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mt-3">
                            <label for="IsbnNumber">ISBN Number</label>
                            <asp:TextBox CssClass="form-control" ID="IsbnNumber" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ControlToValidate="IsbnNumber" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mt-3">
                            <label for="Genre">Genre</label>
                            <asp:TextBox CssClass="form-control" ID="Genre" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required" ControlToValidate="Genre" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mt-3">
                            <label for="PublicationYear">Publication Year</label>
                            <asp:TextBox CssClass="form-control" ID="PublicationYear" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required" ControlToValidate="PublicationYear" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mt-3">
                            <label for="Pages">Pages</label>
                            <asp:TextBox CssClass="form-control" ID="Pages" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required" ControlToValidate="Pages" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mt-3">
                            <label for="ShelfLocation">Shelf Location</label>
                            <asp:TextBox CssClass="form-control" ID="ShelfLocation" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Required" ControlToValidate="ShelfLocation" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group mt-3">
                            <asp:Button CssClass="btn btn-dark" ID="BookAddButton" runat="server" Text="Create Book" OnClick="BookAddButton_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    
</asp:Content>

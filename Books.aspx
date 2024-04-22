<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="LibraryManagementSystem.Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/datatables/datatables.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
            <div class="col-6">
                <h3 class="h3 text-white">Books</h3>
            </div>
            <div class="col-6 d-flex align-items-center justify-content-end">
                <a class="btn btn-light" href="BookAdd.aspx"><i class="fa-solid fa-file-import"></i> Add New</a>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <div class="card p-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped" id="booksTable">
                                <thead>
                                    <tr>
                                        <th>ISBN</th>
                                        <th>Title</th>
                                        <th>Author</th>
                                        <th>Year</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="BookListView" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("isbn") %></td>
                                                <td><%# Eval("title") %></td>
                                                <td><%# Eval("author") %></td>
                                                <td><%# Eval("publication_year") %></td>
                                                <td>
                                                    <a href="BookEdit.aspx?bookId=<%# Eval("id") %>" class="btn btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                                                   <a href="BookDelete.aspx?bookId=<%# Eval("id") %>" onclick="return confirm('Are you sure want to delete this book?')" class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="assets/datatables/jquery.min.js"></script>
    <script src="assets/datatables/datatables.min.js"></script>
    <script>
        new DataTable('#booksTable');
    </script>
</asp:Content>

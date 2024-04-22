<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="LibraryManagementSystem.Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/datatables/datatables.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
            <div class="col-6">
                <h3 class="h3 text-white">Students</h3>
            </div>
            <div class="col-6 d-flex align-items-center justify-content-end">
                <a class="btn btn-light" href="StudentAdd.aspx"><i class="fa-solid fa-file-import"></i> Add New</a>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <div class="card p-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped" id="studentsTable">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Class</th>
                                        <th>Section</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="StudentListView" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("s_id") %></td>
                                                <td><%# Eval("name") %></td>
                                                <td><%# Eval("class") %></td>
                                                <td><%# Eval("section") %></td>
                                                <td>
                                                    <a href="StudentEdit.aspx?studentId=<%# Eval("id") %>" class="btn btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                                                   <a href="StudentDelete.aspx?studentId=<%# Eval("id") %>" onclick="return confirm('Are you sure want to delete this student?')" class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
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
        new DataTable('#studentsTable');
    </script>
</asp:Content>

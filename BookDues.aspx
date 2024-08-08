<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="BookDues.aspx.cs" Inherits="LibraryManagementSystem.BookDues" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/datatables/datatables.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
            <div class="col-6">
                <h3 class="h3 text-white">Book Dues</h3>
            </div>
            <div class="col-6 d-flex align-items-center justify-content-end">
                <a class="btn btn-light" href="BookReturn.aspx"><i class="fa-solid fa-diagram-next"></i>Return Book</a>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <div class="card p-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped" id="bookDues">
                                <thead>
                                    <tr>
                                        <th>Student Id</th>
                                        <th>Student Name</th>
                                        <th>Issuing Date</th>
                                        <th>Returning Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="BookDuesListView" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("student_id") %></td>
                                                <td><%# Eval("student_name") %></td>
                                                <td><%# DataBinder.Eval(Container.DataItem, "issuing_date", "{0:dd/MM/yyyy}") %></td>
                                                <td><%# DataBinder.Eval(Container.DataItem, "returning_date", "{0:dd/MM/yyyy}") %></td>
                                                <td> <%# CheckDueDate((DateTime)Eval("returning_date")) %> </td>
                                                <td>
                                                    <a class="btn btn-primary" href="BookReturn.aspx?studentId=<%# Eval("student_id") %>"><i class="fa-solid fa-diagram-next"></i>Return Book</a>
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
        new DataTable('#bookDues');
    </script>
</asp:Content>

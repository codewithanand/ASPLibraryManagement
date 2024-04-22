<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="StudentAdd.aspx.cs" Inherits="LibraryManagementSystem.StudentAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
            <div class="col-6">
                <h3 class="h3 text-white">Add Student</h3>
            </div>
            <div class="col-6 d-flex align-items-center justify-content-end">
                <a class="btn btn-light" href="Students.aspx"><i class="fa-solid fa-graduation-cap"></i> View Students</a>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <div class="card p-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label>Student Name</label>
                                    <asp:TextBox CssClass="form-control" ID="StudentName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="*Required" ControlToValidate="StudentName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" ID="DateOfBirth" runat="server" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="DateOfBirth" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label>Father's Name</label>
                                    <asp:TextBox CssClass="form-control" ID="FathersName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ControlToValidate="FathersName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label>Mother's Name</label>
                                    <asp:TextBox CssClass="form-control" ID="MothersName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ControlToValidate="MothersName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label>Class</label>
                                    <asp:TextBox CssClass="form-control" ID="ClassNum" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required" ControlToValidate="ClassNum" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label>Class Roll Number</label>
                                    <asp:TextBox CssClass="form-control" ID="ClassRoll" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required" ControlToValidate="ClassRoll" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label>Section</label>
                                    <asp:TextBox CssClass="form-control" ID="ClassSection" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Required" ControlToValidate="ClassSection" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label>Admission Year</label>
                                    <asp:TextBox CssClass="form-control" ID="AdmissionYear" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required" ControlToValidate="AdmissionYear" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <asp:Button CssClass="btn btn-dark" ID="CreateStudentButton" runat="server" Text="Create Student" OnClick="CreateStudentButton_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    
</asp:Content>

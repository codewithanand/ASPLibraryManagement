<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pricing.aspx.cs" Inherits="LibraryManagementSystem.Pricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row mb-4">
            <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
                <h1 class="display-4 fw-normal text-body-emphasis">Pricing</h1>
            </div>
        </div>
        <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
            <div class="col">
                <div class="card bg-success-subtle mb-4 rounded-3 shadow-sm">
                    <div class="card-header bg-success py-3">
                        <h4 class="my-0 fw-normal text-white">Basic</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">$0<small class="text-body-secondary fw-light">/mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>10 users included</li>
                            <li>2 GB of storage</li>
                            <li>Email support</li>
                            <li>Help center access</li>
                        </ul>
                        <button type="button" class="w-100 btn btn-lg btn-outline-success">Sign up for free</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card bg-warning-subtle mb-4 rounded-3 shadow-sm">
                    <div class="card-header bg-warning py-3">
                        <h4 class="my-0 fw-normal">Standard</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">$15<small class="text-body-secondary fw-light">/mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>20 users included</li>
                            <li>10 GB of storage</li>
                            <li>Phone and email support</li>
                            <li>Help center access</li>
                        </ul>
                        <button type="button" class="w-100 btn btn-lg btn-warning">Get started</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card bg-info-subtle mb-4 rounded-3 shadow-sm border-primary">
                    <div class="card-header py-3 text-bg-primary border-primary">
                        <h4 class="my-0 fw-normal">Premium</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">$29<small class="text-body-secondary fw-light">/mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>30 users included</li>
                            <li>15 GB of storage</li>
                            <li>Priority phone support</li>
                            <li>Help center access</li>
                        </ul>
                        <button type="button" class="w-100 btn btn-lg btn-primary">Contact us</button>
                    </div>
                </div>
            </div>
        </div>

        <h2 class="display-6 text-center mb-4">Compare plans</h2>

        <div class="table-responsive">
            <table class="table text-center">
                <thead>
                    <tr>
                        <th style="width: 34%;"></th>
                        <th style="width: 22%;">Basic</th>
                        <th style="width: 22%;">Standard</th>
                        <th style="width: 22%;">Premium</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row" class="text-start">Max users</th>
                        <td>
                            Up to 50
                        </td>
                        <td>
                            Up to 100
                        </td>
                        <td>
                            Unlimited    
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="text-start">Book Inventory</th>
                        <td>
                            Up to 5000
                        </td>
                        <td>
                            Up to 10000
                        </td>
                        <td>
                            Unlimited    
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="text-start">Patron Management</th>
                        <td>
                            Basic
                        </td>
                        <td>
                            Advanced
                        </td>
                        <td>
                            Advanced   
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="text-start">Customization</th>
                        <td>
                            Limited
                        </td>
                        <td>
                            Moderate
                        </td>
                        <td>
                            Extensive   
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="text-start">Support</th>
                        <td>
                            Email
                        </td>
                        <td>
                            Email+Phone
                        </td>
                        <td>
                            Priority+Phone   
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

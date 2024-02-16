<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ProgettoSett.Models.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-4">
            <div class="d-flex justify-content-between my-3">
                <h1 class="m-0">EpiShop</h1>
                <asp:Button ID="Button1" runat="server" Class="btn btn-info" Text="Visualizza Carrello" OnClick="btnVisualizzaCarrello_Click" />
            </div>
            <div class="row">
                <asp:Repeater ID="rptProdotti" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-3">
                            <div class="card h-100">
                                <img src='<%# Eval("Immagine") %>' class="card-img-top p-4" alt='<%# Eval("Nome") %>' style="max-width: 20rem; height: auto;" />
                                <div class="card-body">
                                    <div>
                                        <h2 class="card-title fs-6"><%# Eval("Nome") %></h2>
                                        <p class="card-text"><%# Eval("Descrizione") %></p>
                                        <p class="card-text">Prezzo: $<%# Eval("Prezzo", "{0:N2}") %></p>
                                    </div>
                                </div>
                                <div class="card-footer bg-white d-flex justify-content-between">
                                    <asp:Button ID="btnDettaglio" runat="server" CssClass="btn btn-primary mr-2" Text="Dettagli" OnClick="btnDettaglio_Click" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:Button ID="btnAggiungiAlCarrello" runat="server" CssClass="btn btn-success" Text="Aggiungi al Carrello" OnClick="btnAggiungiAlCarrello_Click" CommandArgument='<%# Eval("Id") %>' />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>

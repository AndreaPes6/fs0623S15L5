<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrello.aspx.cs" Inherits="ProgettoSett.Models.Carrello" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Carrello</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="d-flex justify-content-between my-4">
                <h2 class=" m-0">Carrello</h2>
                <asp:Button ID="btnTornaHomePage" runat="server" CssClass="btn btn-secondary" Text="Torna alla Home Page" OnClick="btnTornaHomePage_Click" />
            </div>
            <asp:Repeater ID="rptCarrello" runat="server">
                <ItemTemplate>
                    <div class="d-flex justify-content-between my-4">
                        <div class="align-self-center">
                            <asp:HyperLink ID="lnkDettaglio" runat="server" Text='<%# Eval("Nome") %>' NavigateUrl='<%# "Dettaglio.aspx?id=" + Eval("Id") %>'></asp:HyperLink>
                            - $<%# Eval("Prezzo") %>
                        </div>
                        <asp:Button ID="btnRimuovi" runat="server" Class="btn btn-danger ml-2" Text="Rimuovi" OnClick="btnRimuovi_Click" CommandArgument='<%# Eval("Id") %>' />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <hr />
            <asp:Label ID="lblTotale" runat="server" Text="Totale: $0.00" />
        </div>
    </form>
</body>
</html>

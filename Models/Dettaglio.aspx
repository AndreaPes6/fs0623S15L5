<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dettaglio.aspx.cs" Inherits="ProgettoSett.Models.Dettaglio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dettagli Prodotto</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container dettaglio-container mt-3">
            <div class="d-flex justify-content-between">
                <h2 class="m-0">Dettagli Prodotto</h2>
                <asp:Button ID="btnTornaHomePage" runat="server" CssClass="btn btn-secondary" Text="Torna alla Home Page" OnClick="btnTornaHomePage_Click" />
            </div>
            <hr />
            <div class="row">
                <asp:Image ID="lblImmagineProdotto" runat="server" CssClass="img-fluid" />
                <div class="col-md-6 d-flex flex-column ">
                    <asp:Label ID="lblNomeProdotto" runat="server" Class="font-weight-bold my-2" />
                    <asp:Label ID="lblDescrizione" runat="server" Class="my-2" />
                    <asp:Label ID="lblPrezzo" runat="server" Class="my-2" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

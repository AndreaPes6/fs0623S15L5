using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;



namespace ProgettoSett.Models
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopolaArticoli();
            }
        }

        private void PopolaArticoli()
        {
            rptProdotti.DataSource = ProdottiManager.GetProdotti();
            rptProdotti.DataBind();
        }

        protected void btnDettaglio_Click(object sender, EventArgs e)
        {
            Button btnDettaglio = (Button)sender;
            int idProdotto = Convert.ToInt32(btnDettaglio.CommandArgument);
            Response.Redirect($"Dettaglio.aspx?id={idProdotto}");
        }

        protected void btnAggiungiAlCarrello_Click(object sender, EventArgs e)
        {
            Button btnAggiungiAlCarrello = (Button)sender;
            int idProdotto = Convert.ToInt32(btnAggiungiAlCarrello.CommandArgument);
            Articolo prodotto = ProdottiManager.GetProdottoById(idProdotto);
            AggiungiAlCarrello(prodotto);
        }

        private void AggiungiAlCarrello(Articolo prodotto)
        {
            List<Articolo> carrello = Session["Carrello"] as List<Articolo>;
            if (carrello == null)
            {
                carrello = new List<Articolo>();
            }
            carrello.Add(prodotto);
            Session["Carrello"] = carrello;
        }

        protected void btnVisualizzaCarrello_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrello.aspx");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace ProgettoSett.Models
{
    public partial class Carrello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["add"] != null)
                {
                    int idProdotto = Convert.ToInt32(Request.QueryString["add"]);
                    Articolo prodotto = ProdottiManager.GetProdottoById(idProdotto);
                    AggiungiAlCarrello(prodotto);
                }
                MostraCarrello();
            }
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

        private void MostraCarrello()
        {
            List<Articolo> carrello = Session["Carrello"] as List<Articolo>;
            rptCarrello.DataSource = carrello;
            rptCarrello.DataBind();

            if (carrello != null)
            {
                double totale = carrello.Sum(p => p.Prezzo);
                lblTotale.Text = $"Totale: ${totale.ToString("0.00")}";
            }
        }

        protected void btnTornaHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void btnRimuovi_Click(object sender, EventArgs e)
        {
            Button btnRimuovi = (Button)sender;
            int idProdotto = Convert.ToInt32(btnRimuovi.CommandArgument);
            RimuoviDalCarrello(idProdotto);
            MostraCarrello();
        }

        private void RimuoviDalCarrello(int idProdotto)
        {
            List<Articolo> carrello = Session["Carrello"] as List<Articolo>;
            if (carrello != null)
            {
                Articolo prodottoDaRimuovere = carrello.FirstOrDefault(p => p.Id == idProdotto);
                if (prodottoDaRimuovere != null)
                {
                    carrello.Remove(prodottoDaRimuovere);
                    Session["Carrello"] = carrello;
                }
            }
        }
    }
}

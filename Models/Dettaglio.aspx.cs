using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using ProgettoSett.Models;

namespace ProgettoSett.Models
{
    public partial class Dettaglio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int idProdotto;
                    if (int.TryParse(Request.QueryString["id"], out idProdotto))
                    {
                        Articolo prodotto = ProdottiManager.GetProdottoById(idProdotto);
                        MostraDettagliProdotto(prodotto);
                    }
                    else
                    {
                        Response.Redirect("HomePage.aspx");
                    }
                }
                else
                {
                    Response.Redirect("HomePage.aspx");
                }
            }
        }

        private void MostraDettagliProdotto(Articolo prodotto)
        {
            lblImmagineProdotto.ImageUrl = prodotto.Immagine;
            lblNomeProdotto.Text = prodotto.Nome;
            lblDescrizione.Text = prodotto.Descrizione;
            lblPrezzo.Text = prodotto.Prezzo.ToString("$0.00");
        }

        protected void btnTornaHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}

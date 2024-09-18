using ProduccionBack.Data;
using ProduccionBack.Entities;

namespace ProduccionBack.Services
{
    public class AplicacionService : IAplicacionService
    {
        private IFacturaRepository repository;
        public AplicacionService()
        {
            repository = new FacturaRepository();
        }
        public List<Articulo> ConsultarArticulos()
        {
            return repository.ObtenerArticulos();
        }

        public List<FormaPago> ConsultarFormasPago()
        {
            return repository.ObtenerFormasPago();
        }

        public List<Factura> ConsultarFacturas()
        {
            return repository.ObtenerFacturas();
        }

        public bool RegistrarProduccion(Factura factura)
        {
            return repository.InsertarFactura(factura);
        }

    }
}

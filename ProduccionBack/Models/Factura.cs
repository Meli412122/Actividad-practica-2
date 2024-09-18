using System;
using System.Collections.Generic;


namespace ProduccionBack.Entities
{
    public class Factura
    {
        public int Nro { get; set; }
        public int FormaPago { get; set; }

        public DateTime Fecha { get; set; }

        public List<DetalleFactura> ListaDetalles { get; set; }

        public string Cliente { get; set; }
        public int Cantidad { get; set; }


        public Factura(int nro, int formaPago, DateTime fecha, string cliente, int cantidad)
        {
            Nro = nro;
            FormaPago = formaPago;
            Fecha = fecha;
            ListaDetalles = new List<DetalleFactura>();
            Cliente = cliente;
            Cantidad = cantidad;
        }

        public Factura()
        {
            Nro = 0;
            FormaPago = 0;
            Fecha = DateTime.Now;
            Cliente = "";
            Cantidad = 0;
            ListaDetalles = new List<DetalleFactura>();
        }

        public void QuitarDetalle(int index)
        {
            ListaDetalles.RemoveAt(index);
        }

        public void AgregarDetalle(DetalleFactura detalle)
        {
            ListaDetalles.Add(detalle);
        }
    }
}

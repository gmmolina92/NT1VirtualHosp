using System;
using System.ComponentModel.DataAnnotations;
using VirtualHosp.Models.Enums;

namespace VirtualHosp.Models
{
    public class Usuario
    {
        [Required(ErrorMessage = "Nombre es requerido")]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "Apellido es requerido")]
        public string Apellido { get; set; }
        [Required(ErrorMessage = "Fecha es requerida")]
        [Display(Name = "Fecha de nacimiento")]
        [DataType(DataType.Date)]
        public DateTime FechaNacimiento { get; set; }
        [Required(ErrorMessage = "Tipo es requerido")]
        [Display(Name = "Tipo de documento")]
        public TipoDocumento TipoDocumento { get; set; }
        [Required(ErrorMessage = "Numero es requerido")]
        [Display(Name = "Número de documento")]
        [Range(0.0, double.MaxValue, ErrorMessage = "El campo {0} debe ser mayor a {1}.")]
        public int NumeroDocumento { get; set; }
        [Display(Name = "Estado civil")]
        public EstadoCivil? EstadoCivil { get; set; }
        [Required(ErrorMessage = "Email es requerido")]
        [EmailAddress]
        public string Email { get; set; }
        public string Direccion { get; set; }
        public string Nacionalidad { get; set; }
        public string Ciudad { get; set; }
        [Display(Name = "Codigo Postal")]
        public int? CodigoPostal { get; set; }
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        [Required(ErrorMessage = "Contraseña es requerida")]
        [StringLength(30, ErrorMessage = "Debe ser entre 5 y 30 caracteres", MinimumLength = 5)]
        public string Password { get; set; }
        public string NombreCompleto => Apellido + ", " + Nombre;
    }
}
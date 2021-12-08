using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using VirtualHosp.Models.Enums;

namespace VirtualHosp.Models
{
    public class Consulta
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required(ErrorMessage = "Fecha es requerida")]
        [Display(Name = "Fecha de consulta")]
        [DataType(DataType.Date)]
        public DateTime Fecha { get; set; }
        public virtual Medico Medico { get; set; }
        public virtual Paciente Paciente { get; set; }
        public Estado Estado { get; set; }
        public double Coseguro { get; set; }
        public int? MedicoId { get; set; }
        public int? PacienteId { get; set; }
        [Required(ErrorMessage = "La consulta es requerida")]
        [Display(Name = "Consulta del paciente")]
        public string ConsultaDescripcion { get; set; }
        [Display(Name = "Respuesta del médico")]
        public string RespuestaMedico { get; set; }
        public Especialidad Especialidad { get; set; }
    }
}
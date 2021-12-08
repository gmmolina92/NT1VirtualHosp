using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using VirtualHosp.Models.Enums;

namespace VirtualHosp.Models
{
    public class Paciente : Usuario
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public PlanMedico Plan { get; set; }
        public List<Consulta> Consultas { get; set; }
        [Display(Name = "Historial Médico")]
        public string HistorialMedico { get; set; }
        [Display(Name = "Antecedentes Médicos")]
        public string AntecedentesMedicos { get; set; }
        public string Medicamentos { get; set; }
        public List<Estudio> Estudios { get; set; }
    }
}

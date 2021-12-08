using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using VirtualHosp.Models.Enums;

namespace VirtualHosp.Models
{
    public class Medico : Usuario
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required(ErrorMessage = "Número de matrícula es requerida")]
        [Display(Name = "Matrícula")]
        public int NumeroMatricula { get; set; }
        public Especialidad Especialidad { get; set; }
    }
}

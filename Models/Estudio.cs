using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using VirtualHosp.Models.Enums;

namespace VirtualHosp.Models
{
    public class Estudio
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public Especialidad Especialidad { get; set; }
    }
}

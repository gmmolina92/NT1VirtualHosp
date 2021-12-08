using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Diagnostics;
using System.Threading.Tasks;
using VirtualHosp.Context;
using VirtualHosp.Models;

namespace VirtualHosp.Controllers
{
    public class HomeController : Controller
    {
        private readonly HospitalDbContext _context;
        private readonly ILogger<HomeController> _logger;

        public HomeController(HospitalDbContext context, ILogger<HomeController> logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<IActionResult> Index()
        {
            var consultas = await _context.Consultas.ToListAsync();
            foreach (var consulta in consultas)
            {
                if (consulta.MedicoId != 0)
                {
                    consulta.Medico = await _context.Medicos.FindAsync(consulta.MedicoId);
                }
                if (consulta.PacienteId != 0)
                {
                    consulta.Paciente = await _context.Pacientes.FindAsync(consulta.PacienteId);
                }
            }
            return View(consultas);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

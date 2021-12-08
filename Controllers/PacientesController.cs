using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;
using VirtualHosp.Context;
using VirtualHosp.Models;
using VirtualHosp.Models.Enums;

namespace VirtualHosp.Controllers
{
    public class PacientesController : Controller
    {
        private readonly HospitalDbContext _context;
        private static readonly SelectList tipoDocumento = new SelectList(Enum.GetValues(typeof(TipoDocumento)), TipoDocumento.DNI);
        private static readonly SelectList estadoCivil = new SelectList(Enum.GetValues(typeof(EstadoCivil)), EstadoCivil.SOLTERO);
        private static readonly SelectList planMedico = new SelectList(Enum.GetValues(typeof(PlanMedico)), PlanMedico.BASICO);

        public PacientesController(HospitalDbContext context)
        {
            _context = context;
        }

        // GET: Pacientes
        public async Task<IActionResult> Index()
        {
            return View(await _context.Pacientes.ToListAsync());
        }

        // GET: Pacientes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var paciente = await _context.Pacientes
                .FirstOrDefaultAsync(m => m.Id == id);
            if (paciente == null)
            {
                return NotFound();
            }

            return View(paciente);
        }

        // GET: Pacientes/Create
        public IActionResult Create()
        {
            ViewBag.TipoDocumento = tipoDocumento;
            ViewBag.EstadoCivil = estadoCivil;
            ViewBag.PlanMedico = planMedico;
            return View();
        }

        // POST: Pacientes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Plan,HistorialMedico,AntecedentesMedicos,Medicamentos,Nombre,Apellido,FechaNacimiento,TipoDocumento,NumeroDocumento,EstadoCivil,Email,Direccion,Nacionalidad,Ciudad,CodigoPostal,Password")] Paciente paciente)
        {
            if (ModelState.IsValid)
            {
                _context.Add(paciente);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.TipoDocumento = tipoDocumento;
            ViewBag.EstadoCivil = estadoCivil;
            ViewBag.PlanMedico = planMedico;
            return View(paciente);
        }

        // GET: Pacientes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var paciente = await _context.Pacientes.FindAsync(id);
            if (paciente == null)
            {
                return NotFound();
            }
            ViewBag.TipoDocumento = tipoDocumento;
            ViewBag.EstadoCivil = estadoCivil;
            ViewBag.PlanMedico = planMedico;
            return View(paciente);
        }

        // POST: Pacientes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Plan,HistorialMedico,AntecedentesMedicos,Medicamentos,Nombre,Apellido,FechaNacimiento,TipoDocumento,NumeroDocumento,EstadoCivil,Email,Direccion,Nacionalidad,Ciudad,CodigoPostal,Password")] Paciente paciente)
        {
            if (id != paciente.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(paciente);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PacienteExists(paciente.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewBag.TipoDocumento = tipoDocumento;
            ViewBag.EstadoCivil = estadoCivil;
            ViewBag.PlanMedico = planMedico;
            return View(paciente);
        }

        // GET: Pacientes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var paciente = await _context.Pacientes
                .FirstOrDefaultAsync(m => m.Id == id);
            if (paciente == null)
            {
                return NotFound();
            }

            return View(paciente);
        }

        // POST: Pacientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var paciente = await _context.Pacientes.FindAsync(id);
            _context.Pacientes.Remove(paciente);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PacienteExists(int id)
        {
            return _context.Pacientes.Any(e => e.Id == id);
        }
    }
}

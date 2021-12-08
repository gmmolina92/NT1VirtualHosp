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
    public class MedicosController : Controller
    {
        private readonly HospitalDbContext _context;
        private static readonly SelectList tipoDocumento = new SelectList(Enum.GetValues(typeof(TipoDocumento)), TipoDocumento.DNI);
        private static readonly SelectList estadoCivil = new SelectList(Enum.GetValues(typeof(EstadoCivil)), EstadoCivil.SOLTERO);
        private static readonly SelectList especialidad = new SelectList(Enum.GetValues(typeof(Especialidad)), Especialidad.OFTALMOLOGIA);

        public MedicosController(HospitalDbContext context)
        {
            _context = context;
        }

        // GET: Medicos
        public async Task<IActionResult> Index()
        {
            return View(await _context.Medicos.ToListAsync());
        }

        // GET: Medicos/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var medico = await _context.Medicos
                .FirstOrDefaultAsync(m => m.Id == id);
            if (medico == null)
            {
                return NotFound();
            }

            return View(medico);
        }

        // GET: Medicos/Create
        public IActionResult Create()
        {
            ViewBag.TipoDocumento = tipoDocumento;
            ViewBag.EstadoCivil = estadoCivil;
            ViewBag.Especialidad = especialidad;
            return View();
        }

        // POST: Medicos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,NumeroMatricula,Especialidad,Nombre,Apellido,FechaNacimiento,TipoDocumento,NumeroDocumento,EstadoCivil,Email,Direccion,Nacionalidad,Ciudad,CodigoPostal,Password")] Medico medico)
        {
            if (ModelState.IsValid)
            {
                _context.Add(medico);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.TipoDocumento = tipoDocumento;
            ViewBag.EstadoCivil = estadoCivil;
            ViewBag.Especialidad = especialidad;
            return View(medico);
        }

        // GET: Medicos/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var medico = await _context.Medicos.FindAsync(id);
            if (medico == null)
            {
                return NotFound();
            }
            ViewBag.TipoDocumento = tipoDocumento;
            ViewBag.EstadoCivil = estadoCivil;
            ViewBag.Especialidad = especialidad;
            return View(medico);
        }

        // POST: Medicos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,NumeroMatricula,Especialidad,Nombre,Apellido,FechaNacimiento,TipoDocumento,NumeroDocumento,EstadoCivil,Email,Direccion,Nacionalidad,Ciudad,CodigoPostal,Password")] Medico medico)
        {
            if (id != medico.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(medico);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MedicoExists(medico.Id))
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
            ViewBag.Especialidad = especialidad;
            return View(medico);
        }

        // GET: Medicos/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var medico = await _context.Medicos
                .FirstOrDefaultAsync(m => m.Id == id);
            if (medico == null)
            {
                return NotFound();
            }

            return View(medico);
        }

        // POST: Medicos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var medico = await _context.Medicos.FindAsync(id);
            _context.Medicos.Remove(medico);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MedicoExists(int id)
        {
            return _context.Medicos.Any(e => e.Id == id);
        }
    }
}

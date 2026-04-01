using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API.Database;
using API.Models;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ParentChildController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public ParentChildController(DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/ParentChild
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ParentChild>>> GetParentChild()
        {
            return await _context.ParentChildren.ToListAsync();
        }

        // GET: api/ParentChild/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ParentChild>> GetParentChild(Guid id)
        {
            var parentChild = await _context.ParentChildren.FindAsync(id);

            if (parentChild == null)
            {
                return NotFound();
            }

            return parentChild;
        }

        // PUT: api/ParentChild/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutParentChild(Guid id, ParentChild parentChild)
        {
            if (id != parentChild.Id)
            {
                return BadRequest();
            }

            _context.Entry(parentChild).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ParentChildExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/ParentChild
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ParentChild>> PostParentChild(ParentChild parentChild)
        {
            _context.ParentChildren.Add(parentChild);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetParentChild", new { id = parentChild.Id }, parentChild);
        }

        // DELETE: api/ParentChild/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteParentChild(Guid id)
        {
            var parentChild = await _context.ParentChildren.FindAsync(id);
            if (parentChild == null)
            {
                return NotFound();
            }

            _context.ParentChildren.Remove(parentChild);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ParentChildExists(Guid id)
        {
            return _context.ParentChild.Any(e => e.Id == id);
        }
    }
}

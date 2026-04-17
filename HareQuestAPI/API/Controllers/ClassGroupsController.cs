using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API.Database;
using API.Dtos;
using API.Dtos.ClassGroups;
using API.Models;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClassGroupsController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public ClassGroupsController(DatabaseContext context)
        {
            _context = context;
        }

        [HttpPost("createClass")]
        public async Task<ActionResult<ClassGroupDto>> CreateClassGroup(ClassGroupCreateDto newGroup)
        {
          Console.WriteLine("Creating ClassGroup");
          // generate unique code
          Random rand = new Random();
          string classCode = rand.Next(100000, 1000000).ToString();
          Console.WriteLine($"Class Code - {classCode}");
          
          
          // map dto to model
          ClassGroup classGroup = new ClassGroup
          {
            Id = Guid.NewGuid(),
            TeacherId = newGroup.TeacherId,
            ClassName = newGroup.ClassName,
            ClassCode = classCode,
            ClassLevel = newGroup.ClassLevel
          };
          
          Console.WriteLine($"Dto to Model result - {classGroup.ToString()}");
          
          // save
          // _context.ClassGroups.Add(classGroup);
          // await _context.SaveChangesAsync();
          // build response
;
          return Ok(new
          {
            id = classGroup.Id,
            status = 200,
            message = $"ClassGroup -|{classGroup.ClassName}| successfully created",
            success = true,
            className =  classGroup.ClassName,
            classCode = classGroup.ClassCode,
            classLevel = classGroup.ClassLevel
          });
        }

        // GET: api/ClassGroups
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ClassGroup>>> GetClassGroup()
        {
            return await _context.ClassGroup.ToListAsync();
        }

        // GET: api/ClassGroups/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ClassGroup>> GetClassGroup(Guid id)
        {
            var classGroup = await _context.ClassGroup.FindAsync(id);

            if (classGroup == null)
            {
                return NotFound();
            }

            return classGroup;
        }

        // PUT: api/ClassGroups/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutClassGroup(Guid id, ClassGroup classGroup)
        {
            if (id != classGroup.Id)
            {
                return BadRequest();
            }

            _context.Entry(classGroup).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClassGroupExists(id))
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

        // POST: api/ClassGroups
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ClassGroup>> PostClassGroup(ClassGroup classGroup)
        {
            _context.ClassGroup.Add(classGroup);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetClassGroup", new { id = classGroup.Id }, classGroup);
        }

        // DELETE: api/ClassGroups/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteClassGroup(Guid id)
        {
            var classGroup = await _context.ClassGroup.FindAsync(id);
            if (classGroup == null)
            {
                return NotFound();
            }

            _context.ClassGroup.Remove(classGroup);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        
        // TODO: Create helper function to check exisiting groups codes to ensure random one does not already exist
        private bool GenerateClassCode()
        {
          return false;
        }

        private bool ClassGroupExists(Guid id)
        {
            return _context.ClassGroup.Any(e => e.Id == id);
        }
    }
}

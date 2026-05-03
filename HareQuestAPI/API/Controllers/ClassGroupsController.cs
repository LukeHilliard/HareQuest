using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API.Database;
using API.Dtos;
using API.Dtos.ClassGroup;
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
          string classCode = "";
          
          // TODO: Hash ClassCode before saving to database. Table needs Hash and Salt column
          // check if random code already exists, keep making a new one until a unique one is made
          bool isUnique = false;
          while (!isUnique) {
            classCode = rand.Next(100000, 1000000).ToString();
            bool ifExists = await _context.ClassGroups.AnyAsync(c => c.ClassCode == classCode);
            if (!ifExists) 
              isUnique = true;
          }
          // check code doesnt already exist
          // var codeExists = _context.ClassGroupss.FirstOrDefault(c => c.ClassCode == classCode);
          Console.WriteLine($"Class Code - {classCode}");
          
          
          // map dto to model
          ClassGroups classGroup = new ClassGroups
          {
            Id = Guid.NewGuid(),
            TeacherId = newGroup.TeacherId,
            Name = newGroup.Name,
            ClassCode = classCode,
            ClassLevel = newGroup.ClassLevel
          };
          
          Console.WriteLine($"Dto to Model result - {classGroup.ToString()}");
          
          // save
          _context.ClassGroups.Add(classGroup);
          await _context.SaveChangesAsync();
;
          // build response
          return Ok(new
          {
            id = classGroup.Id,
            teacherId = newGroup.TeacherId,
            status = 200,
            message = $"ClassGroup -|{classGroup.Name}| successfully created",
            success = true,
            name =  classGroup.Name,
            classCode = classGroup.ClassCode,
            classLevel = classGroup.ClassLevel
          });
        }

        [HttpPost("joinClass")]
        public async Task<ActionResult<ClassGroupJoinDto>> JoinClassGroup(ClassGroupJoinDto joinRequest)
        {
          Console.WriteLine("Joining ClassGroup");
          var classToJoin = await _context.ClassGroups.FirstOrDefaultAsync(c => c.ClassCode == joinRequest.ClassCode);
          
          if (classToJoin == null)
            return NotFound(new
            {
              message = "Class code not found.",
              success = false,
              status = 401,
              classGroupId = "0"
            });


          if (classToJoin.ClassLevel != joinRequest.ClassLevel)
            return NotFound(new
            {
              message = $"Your child is not in {classToJoin.ClassLevel} class.",
              success = false,
              status = 401,
              classGroupId = "0"
            });
          
          // TODO: Add student id to ClassStudents table, should return success = true to trigger iOS SwiftData update for teacher

          return Ok(new
          {
            message = "Successfully joined class",
            success = true,
            status = 200,
            classGroupId = classToJoin.Id
          });
        }
        // GET: api/ClassGroups
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ClassGroups>>> GetClassGroup()
        {
            return await _context.ClassGroups.ToListAsync();
        }

        // GET: api/ClassGroups/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ClassGroups>> GetClassGroup(Guid id)
        {
            var classGroup = await _context.ClassGroups.FindAsync(id);

            if (classGroup == null)
            {
                return NotFound();
            }

            return classGroup;
        }

        // PUT: api/ClassGroups/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutClassGroup(Guid id, ClassGroups classGroup)
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
        public async Task<ActionResult<ClassGroups>> PostClassGroup(ClassGroups classGroup)
        {
            _context.ClassGroups.Add(classGroup);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetClassGroup", new { id = classGroup.Id }, classGroup);
        }

        // DELETE: api/ClassGroups/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteClassGroup(Guid id)
        {
            var classGroup = await _context.ClassGroups.FindAsync(id);
            if (classGroup == null)
            {
                return NotFound();
            }

            _context.ClassGroups.Remove(classGroup);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        
        private bool ClassGroupExists(Guid id)
        {
            return _context.ClassGroups.Any(e => e.Id == id);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API.Database;
using API.Dtos;
using API.Models;

namespace API.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class AuthController : ControllerBase
  {
    private readonly DatabaseContext _context;

    public AuthController(DatabaseContext context)
    {
      _context = context;
    }
    
    // POST: /api/Auth/register
    [HttpPost("register")]
    public async Task<ActionResult<UserRegisterDro>> Login([FromBody] UserRegisterDro userDetails)
    {
      Console.WriteLine(userDetails);
      // TODO: Check if email already exists
      
      // TODO: Hash password
      
      // TODO: Generate token
      
      // TODO: Return token
      
      return Ok(new
      {
        status = 200,
        message = $"Hello From API!",
        token = "",
      });
    }
    
    // POST: /api/Auth/login
    [HttpPost("login")]
    public async Task<ActionResult<UserLoginDto>> Register([FromBody] UserLoginDto userDetails)
    {
      
      
      return Ok(new
      {
        status = 200,
        message = $"Hello From API!",
      });
    }
    
  }
}
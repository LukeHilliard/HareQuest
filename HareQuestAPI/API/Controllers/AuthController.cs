using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API.Database;
using API.Dtos;
using API.Models;
using JWT.Algorithms;
using JWT.Builder;

namespace API.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class AuthController : ControllerBase
  {
    private readonly DatabaseContext _context;
    private readonly IConfiguration _config;

    public AuthController(DatabaseContext context, IConfiguration config)
    {
      _context = context;
      _config = config;
    }

    // POST: /api/Auth/register
    [HttpPost("register")]
    public async Task<ActionResult<UserRegisterDro>> Register([FromBody] UserRegisterDro userDetails)
    {
      Console.WriteLine(userDetails);
      var emailExists = _context.Users.Any(x => x.Email == userDetails.Email);
      if (emailExists)
      {
        return BadRequest(new
        {
          status = 400,
          message = "Email already exists"
        });
      }

      // Password hashing followed here: https://learn.microsoft.com/en-us/aspnet/core/security/data-protection/consumer-apis/password-hashing?view=aspnetcore-10.0
      byte[] salt = RandomNumberGenerator.GetBytes(128 / 8);
      string hashedPassword = Convert.ToBase64String(KeyDerivation.Pbkdf2(
        password: userDetails.Password,
        salt: salt,
        prf: KeyDerivationPrf.HMACSHA1,
        iterationCount: 10000,
        numBytesRequested: 256 / 8
      ));

      User newUser = new User
      {
        Id = Guid.NewGuid(),
        Name = userDetails.Name,
        Email = userDetails.Email,
        Password = hashedPassword,
        Salt = Convert.ToBase64String(salt),
        Role = userDetails.Role,
      };
      _context.Users.Add(newUser);
      await _context.SaveChangesAsync();

      // TODO: Generate token
      var token = JwtBuilder.Create()
        .WithAlgorithm(new HMACSHA256Algorithm())
        .WithSecret(_config["Jwt:Key"])
        .AddClaim("id", newUser.Id.ToString())
        .AddClaim("role", userDetails.Role)
        .AddClaim("expire", DateTimeOffset.UtcNow.AddMinutes(30).ToUnixTimeSeconds())
        .Encode();

      Console.WriteLine(token);
      // TODO: Return token

      return Ok(new
      {
        status = 200,
        message = $"Hello From API!",
        accessToken = token,
      });
    }

    // POST: /api/Auth/login
    [HttpPost("login")]
    public async Task<ActionResult<UserLoginDto>> Login([FromBody] UserLoginDto userDetails)
    {
      return Ok(new
      {
        status = 200,
        message = $"Hello From API!",
      });
    }

  }
}
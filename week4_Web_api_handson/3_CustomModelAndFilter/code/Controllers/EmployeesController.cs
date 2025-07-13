using Microsoft.AspNetCore.Mvc;
using _3_CustomModelAndFilter.Models;
using _3_CustomModelAndFilter.Filters;
using System;
using System.Collections.Generic;

namespace _3_CustomModelAndFilter.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [ServiceFilter(typeof(CustomAuthFilter))]
    public class EmployeesController : ControllerBase
    {
        [HttpPost]
        public IActionResult Create([FromBody] Employee emp)
        {
            if (emp == null) throw new Exception("Employee data missing");
            return Ok($"Employee {emp.Name} created with ID {emp.Id}");
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var employee = new Employee
            {
                Id = id,
                Name = "John Doe",
                Salary = 50000,
                Permanent = true,
                DateOfBirth = DateTime.Parse("1990-01-01"),
                Department = new Department { Id = 1, Name = "HR" },
                Skills = new List<Skill>
                {
                    new Skill { Id = 1, Name = "C#" },
                    new Skill { Id = 2, Name = "SQL" }
                }
            };

            return Ok(employee);
        }
    }
}

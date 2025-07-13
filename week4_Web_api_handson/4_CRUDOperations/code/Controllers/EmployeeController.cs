using Microsoft.AspNetCore.Mvc;

namespace _4_CRUDOperations.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EmployeeController : ControllerBase
    {
        // GET api/employee
        [HttpGet]
        public IActionResult GetAll()
        {
            var employees = new[] { "Alice", "Bob", "Charlie" };
            return Ok(employees);
        }

        // GET api/employee/{id}
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            return Ok($"Employee {id}");
        }

        // POST api/employee
        [HttpPost]
        public IActionResult Create([FromBody] string employee)
        {
            return CreatedAtAction(nameof(GetById), new { id = 1 }, employee);
        }

        // PUT api/employee/{id}
        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] string employee)
        {
            return NoContent();
        }

        // DELETE api/employee/{id}
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return NoContent();
        }
    }
}

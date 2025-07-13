
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace BasicWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ValuesController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get() => Ok(new[] { "value1", "value2" });

        [HttpGet("{id}")]
        public IActionResult Get(int id) => Ok($"value{id}");

        [HttpPost]
        public IActionResult Post([FromBody] string value) => Ok($"Added: {value}");

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value) =>
            Ok($"Updated id {id} with value {value}");

        [HttpDelete("{id}")]
        public IActionResult Delete(int id) => Ok($"Deleted id: {id}");
    }
}

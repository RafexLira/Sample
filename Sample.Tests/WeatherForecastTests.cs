using Microsoft.Extensions.Logging;
using Sample.Api.Controllers;

namespace SampleApi.Tests
{
    public class WeatherForecastTests
    {
        [Fact]
        public void Get_Returns_Five_Items()
        {
            // Arrange
            var logger = LoggerFactory.Create(builder => { })
                                      .CreateLogger<WeatherForecastController>();

            var controller = new WeatherForecastController(logger);

            // Act
            var result = controller.Get();

            // Assert
            Assert.NotNull(result);
            Assert.Equal(5, result.Count());
        }
    }
}

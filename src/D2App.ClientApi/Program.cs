using D2App.Infrastructure;
using Serilog;

DIServices.BootstrapSerilogTemporarily();
try
{
    var builder = WebApplication.CreateBuilder(args);

    builder.AddInfrastructure();
    builder.Services.AddOpenApi();

    var app = builder.Build();

    app.UseInfrastructure();

    if (app.Environment.IsDevelopment())
    {
        app.MapOpenApi();
    }

    app.UseHttpsRedirection();

    var summaries = new[]
    {
    "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

    app.MapGet("/weatherforecast", (ILogger<Program> logger) =>
    {

        logger.LogInformation("HELLO WORLD");
        var forecast = Enumerable.Range(1, 5).Select(index =>
            new WeatherForecast
            (
                DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
                Random.Shared.Next(-20, 55),
                summaries[Random.Shared.Next(summaries.Length)]
            ))
            .ToArray();
        return forecast;
    })
    .WithName("GetWeatherForecast");

    app.Run();
}
catch (Exception ex)
{
    DIServices.LogApplicationException(ex, "An unhandled exception occurred durring bootstrapping of the application");
}
finally
{
    DIServices.LogAndFlush();
}


record WeatherForecast(DateOnly Date, int TemperatureC, string? Summary)
{
    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}

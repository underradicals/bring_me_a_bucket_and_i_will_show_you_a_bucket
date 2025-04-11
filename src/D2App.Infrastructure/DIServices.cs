using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Serilog;
using Serilog.Formatting.Compact;
using Serilog.Templates;
using Serilog.Templates.Themes;

namespace D2App.Infrastructure;


public static class DIServices
{
  public static WebApplicationBuilder AddInfrastructure(this WebApplicationBuilder builder)
  {

    AddLoggingService(builder);
    return builder;
  }

  public static WebApplication UseInfrastructure(this WebApplication app)
  {
    app.UseSerilogRequestLogging();
    return app;
  }

  public static WebApplicationBuilder AddLoggingService(WebApplicationBuilder builder)
  {
    builder.Host.UseSerilog((context, services, configuration) => {
      configuration.ReadFrom.Configuration(context.Configuration);
      configuration.ReadFrom.Services(services)
      .WriteTo.Seq("http://localhost:5341");
    }, preserveStaticLogger: false, writeToProviders: false);

    return builder;
  }



  public static void BootstrapSerilogTemporarily()
  {
    Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateBootstrapLogger();
  }

  public static void LogApplicationException(Exception ex, string message)
  {
    Log.Fatal(ex, message);
  }

  public static void LogAndFlush()
  {
    Log.CloseAndFlush();
  }
}
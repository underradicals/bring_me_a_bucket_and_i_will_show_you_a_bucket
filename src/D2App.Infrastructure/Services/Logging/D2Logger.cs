using D2App.Application.Interfaces;
using Microsoft.Extensions.Logging;

namespace D2App.Infrastructure.Services.Logging;

public class D2Logger<T> : ID2Logger
{
  private readonly ILogger<T> logger;

  public D2Logger(ILogger<T> logger)
  {
    this.logger = logger;
  }

  public void Critical(string? message, params object?[] args)
  {
    this.logger.LogCritical(message, args);
  }

  public void Debug(string? message, params object?[] args)
  {
    this.logger.LogDebug(message, args);
  }

  public void Error(string? message, params object?[] args)
  {
    this.logger.LogError(message, args);
  }

  public void Information(string? message, params object?[] args)
  {
    this.logger.LogInformation(message, args);
  }

  public void Trace(string? message, params object?[] args)
  {
    this.logger.LogTrace(message, args);
  }

  public void Warning(string? message, params object?[] args)
  {
    this.logger.LogWarning(message, args);
  }
}
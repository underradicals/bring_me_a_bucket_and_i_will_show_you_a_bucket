namespace D2App.Application.Interfaces;

public interface ID2Logger
{
  public void Trace(string? message, params object?[] args);
  public void Debug(string? message, params object?[] args);
  public void Information(string? message, params object?[] args);
  public void Warning(string? message, params object?[] args);
  public void Error(string? message, params object?[] args);
  public void Critical(string? message, params object?[] args);
}
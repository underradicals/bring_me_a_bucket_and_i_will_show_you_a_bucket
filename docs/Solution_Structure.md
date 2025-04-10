# Solution Structure

## Folder Structure
- **D2App/**
  - **src/**
    - **D2App.ClientApi/** (webapi)
      - Controllers/
      - Middleware/
      - Filters/
      - Extensions/
      - Configurations/
      - Services/
      - Endpoints/
    - **D2App.Application/** (classlib)
      - Interfaces/
      - Commands/
      - Queries/
      - Validators/
      - DTOs/
      - Services/
    - **D2App.Domain/** (classlib)
      - Entities/
      - ValueObjects/
      - Enums/
      - Interfaces/
      - Events/
      - Specifications/
    - **D2App.Infrastructure/** (classlib)
      - Persistence/ 
        - DbContexts/
        - Repositories/
        - Configurations/
      - Services/
        - Logging/
        - Cache/
        - Email/
        - External_Apis/
      - Migrations/
    - **D2App.Shared/** (classlib)
      - DTOs/
      - Constants/
      - Exceptions/
      - Models/
      - Utilities/
  - **tests/** 
    - D2App.Tests.UnitTests/ (xunit)
    - D2App.Tests.IntegrationTests/ (xunit)
  - **docker/** 
    - redis/
    - postgres/

> ### Project References
>```mermaid
>graph TD
>  A[Domain Layer] --> B[Application Layer]
>  B --> C[Infrastructure Layer]
>  B --> D[API Layer]
>  D --> E[Shared]
>  C --> E
>  A --> E
>```
> ### Testing Project References
>```mermaid
>graph TD
>  F[Unit Tests] --> A[Domain Layer]
>  F --> B[Application Layer]
>  G[Integration Tests] --> B
>  G --> C[Infrastructure Layer]
>  G --> D[API Layer]
>```
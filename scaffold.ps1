# Create solution
dotnet new sln -n D2App

# Create folders
$folders = @(
    "src/D2App.ClientApi/Controllers",
    "src/D2App.ClientApi/Middleware",
    "src/D2App.ClientApi/Filters",
    "src/D2App.ClientApi/Extensions",
    "src/D2App.ClientApi/Configurations",
    "src/D2App.ClientApi/Services",
    "src/D2App.ClientApi/Endpoints",

    "src/D2App.Application/Interfaces",
    "src/D2App.Application/Commands",
    "src/D2App.Application/Queries",
    "src/D2App.Application/Validators",
    "src/D2App.Application/DTOs",
    "src/D2App.Application/Services",

    "src/D2App.Domain/Entities",
    "src/D2App.Domain/ValueObjects",
    "src/D2App.Domain/Enums",
    "src/D2App.Domain/Interfaces",
    "src/D2App.Domain/Events",
    "src/D2App.Domain/Specifications",

    "src/D2App.Infrastructure/Persistence/DbContexts",
    "src/D2App.Infrastructure/Persistence/Repositories",
    "src/D2App.Infrastructure/Persistence/Configurations",
    "src/D2App.Infrastructure/Services/Logging",
    "src/D2App.Infrastructure/Services/Cache",
    "src/D2App.Infrastructure/Services/Email",
    "src/D2App.Infrastructure/Services/External_Apis",
    "src/D2App.Infrastructure/Migrations",

    "src/D2App.Shared/DTOs",
    "src/D2App.Shared/Constants",
    "src/D2App.Shared/Exceptions",
    "src/D2App.Shared/Models",
    "src/D2App.Shared/Utilities",

    "tests/D2App.Tests.UnitTests",
    "tests/D2App.Tests.IntegrationTests",

    "docker/redis",
    "docker/postgres"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder -Force
}

# Create projects
dotnet new webapi     -n D2App.ClientApi          -o src/D2App.ClientApi
dotnet new classlib   -n D2App.Application        -o src/D2App.Application
dotnet new classlib   -n D2App.Domain             -o src/D2App.Domain
dotnet new classlib   -n D2App.Infrastructure     -o src/D2App.Infrastructure
dotnet new classlib   -n D2App.Shared             -o src/D2App.Shared
dotnet new xunit      -n D2App.Tests.UnitTests    -o tests/D2App.Tests.UnitTests
dotnet new xunit      -n D2App.Tests.IntegrationTests -o tests/D2App.Tests.IntegrationTests

# Add projects to solution
$projects = @(
    "src/D2App.ClientApi/D2App.ClientApi.csproj",
    "src/D2App.Application/D2App.Application.csproj",
    "src/D2App.Domain/D2App.Domain.csproj",
    "src/D2App.Infrastructure/D2App.Infrastructure.csproj",
    "src/D2App.Shared/D2App.Shared.csproj",
    "tests/D2App.Tests.UnitTests/D2App.Tests.UnitTests.csproj",
    "tests/D2App.Tests.IntegrationTests/D2App.Tests.IntegrationTests.csproj"
)

foreach ($proj in $projects) {
    dotnet sln add $proj
}

# Add project references
dotnet add src/D2App.ClientApi/D2App.ClientApi.csproj reference `
    src/D2App.Application/D2App.Application.csproj `
    src/D2App.Shared/D2App.Shared.csproj

dotnet add src/D2App.Application/D2App.Application.csproj reference `
    src/D2App.Domain/D2App.Domain.csproj `
    src/D2App.Shared/D2App.Shared.csproj

dotnet add src/D2App.Infrastructure/D2App.Infrastructure.csproj reference `
    src/D2App.Application/D2App.Application.csproj `
    src/D2App.Domain/D2App.Domain.csproj `
    src/D2App.Shared/D2App.Shared.csproj

dotnet add tests/D2App.Tests.UnitTests/D2App.Tests.UnitTests.csproj reference `
    src/D2App.Application/D2App.Application.csproj `
    src/D2App.Domain/D2App.Domain.csproj `
    src/D2App.Shared/D2App.Shared.csproj

dotnet add tests/D2App.Tests.IntegrationTests/D2App.Tests.IntegrationTests.csproj reference `
    src/D2App.ClientApi/D2App.ClientApi.csproj `
    src/D2App.Infrastructure/D2App.Infrastructure.csproj `
    src/D2App.Shared/D2App.Shared.csproj

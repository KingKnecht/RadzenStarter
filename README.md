# RadzenStarter

A .NET Aspire-powered application showcasing a modern web architecture with Blazor and Radzen UI components.

## Project Structure

This solution consists of four projects:

- **RadzenStarter.AppHost** - .NET Aspire orchestration host that manages service discovery and deployment
- **RadzenStarter.Web** - Blazor Server web frontend with Radzen components
- **RadzenStarter.ApiService** - Backend API service providing REST endpoints
- **RadzenStarter.ServiceDefaults** - Shared service configuration and health checks

## Technology Stack

- **.NET 10.0** - Latest .NET framework
- **.NET Aspire** - Cloud-ready app orchestration
- **Blazor Server** - Interactive web UI with server-side rendering
- **Radzen Blazor Components** - Professional UI component library
- **OpenAPI** - API documentation and testing

## Features

- Distributed application architecture with service discovery
- Modern UI using Radzen Blazor components
- Health checks for all services
- Weather forecast sample API
- Automatic service dependencies and wait conditions
- Type-safe HTTP client communication

## Prerequisites

- [.NET 10.0 SDK](https://dotnet.microsoft.com/download/dotnet/10.0) or later
- Visual Studio 2022 (version 17.13+) or VS Code with C# Dev Kit
- Docker Desktop (for .NET Aspire dashboard)

## Getting Started

### Running the Application

1. Clone the repository
2. Open the solution in Visual Studio or VS Code
3. Set `RadzenStarter.AppHost` as the startup project
4. Press F5 or run:
   ```bash
   dotnet run --project RadzenStarter.AppHost
   ```

The .NET Aspire dashboard will launch automatically, showing:
- **Web Frontend**: Available at the configured HTTP/HTTPS port
- **API Service**: Backend service accessible via service discovery
- **Aspire Dashboard**: Real-time monitoring and logs

### Project URLs

When running locally through Aspire:
- **Aspire Dashboard**: Displayed in console output
- **Web Frontend**: Check Aspire dashboard for assigned port
- **API Service**: `https+http://apiservice` (service discovery URL)

### API Endpoints

The API service provides the following endpoints:

- `GET /` - Service status
- `GET /weatherforecast` - Sample weather data (5-day forecast)
- `GET /health` - Health check endpoint

## Development

### Adding New Features

1. **API Endpoints**: Add new endpoints in `RadzenStarter.ApiService/Program.cs`
2. **UI Components**: Create Blazor components in `RadzenStarter.Web/Components/`
3. **Service Configuration**: Modify shared settings in `RadzenStarter.ServiceDefaults/`

### Service Communication

The web frontend communicates with the API through a typed HTTP client:

```csharp
builder.Services.AddHttpClient<WeatherApiClient>(client =>
{
    client.BaseAddress = new("https+http://apiservice");
});
```

The `https+http://` scheme enables automatic service discovery with HTTPS preference.

## Architecture

```
┌─────────────────────┐
│   AppHost           │  ← Orchestrates services
│   (Aspire)          │
└──────────┬──────────┘
           │
     ┌─────┴─────┐
     │           │
┌────▼────┐ ┌───▼────────┐
│   Web   │ │ ApiService │
│ (Blazor)│─│  (REST)    │
└─────────┘ └────────────┘
     │           │
     └─────┬─────┘
           │
    ┌──────▼──────┐
    │ Service     │
    │ Defaults    │
    └─────────────┘
```

## Configuration

Configuration is managed through:
- `appsettings.json` - Base configuration
- `appsettings.Development.json` - Development overrides
- Environment variables - Runtime configuration

## Health Checks

All services include health check endpoints configured in the AppHost:
- Web: `/health`
- API: `/health`

## Radzen Components

This project uses [Radzen Blazor Components](https://blazor.radzen.com/) for the UI. Explore the component library for:
- DataGrid, Charts, Dialogs
- Form validation and inputs
- Navigation and layout components
- And much more

## Learn More

- [.NET Aspire Documentation](https://learn.microsoft.com/dotnet/aspire/)
- [Blazor Documentation](https://learn.microsoft.com/aspnet/core/blazor/)
- [Radzen Blazor Components](https://blazor.radzen.com/)
- [.NET 10 Documentation](https://learn.microsoft.com/dotnet/)

## License

[Specify your license here]

## Contributing

[Add contribution guidelines if this is an open-source project]

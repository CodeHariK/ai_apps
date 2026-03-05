package main

import (
	"context"
	"embed"
	"fmt"
	"log"
	"path"
	"strings"

	"github.com/modelcontextprotocol/go-sdk/mcp"
)

//go:embed docs
var docsContent embed.FS

type ListComponentsInput struct{}

type ListComponentsOutput struct {
	Components []string `json:"components" jsonschema:"list of available gluestack components"`
}

type GetComponentDocInput struct {
	Name string `json:"name" jsonschema:"the name of the component (e.g., button, accordion)"`
}

type GetComponentDocOutput struct {
	Content string `json:"content" jsonschema:"the markdown content of the component documentation"`
}

type GetThemeDocInput struct{}

type GetThemeDocOutput struct {
	Content string `json:"content" jsonschema:"the markdown content of the theme documentation"`
}

func ListComponents(ctx context.Context, req *mcp.CallToolRequest, input ListComponentsInput) (*mcp.CallToolResult, ListComponentsOutput, error) {
	entries, err := docsContent.ReadDir("docs/components")
	if err != nil {
		return nil, ListComponentsOutput{}, fmt.Errorf("failed to read components directory: %w", err)
	}

	var components []string
	for _, entry := range entries {
		if !entry.IsDir() && strings.HasSuffix(entry.Name(), ".md") {
			components = append(components, strings.TrimSuffix(entry.Name(), ".md"))
		}
	}

	return nil, ListComponentsOutput{Components: components}, nil
}

func GetComponentDoc(ctx context.Context, req *mcp.CallToolRequest, input GetComponentDocInput) (*mcp.CallToolResult, GetComponentDocOutput, error) {
	filePath := path.Join("docs/components", input.Name+".md")
	content, err := docsContent.ReadFile(filePath)
	if err != nil {
		return nil, GetComponentDocOutput{}, fmt.Errorf("component '%s' not found: %w", input.Name, err)
	}

	return nil, GetComponentDocOutput{Content: string(content)}, nil
}

func GetThemeDoc(ctx context.Context, req *mcp.CallToolRequest, input GetThemeDocInput) (*mcp.CallToolResult, GetThemeDocOutput, error) {
	content, err := docsContent.ReadFile("docs/theme.md")
	if err != nil {
		return nil, GetThemeDocOutput{}, fmt.Errorf("failed to read theme.md: %w", err)
	}

	return nil, GetThemeDocOutput{Content: string(content)}, nil
}

func main() {
	// Create a server with multiple tools.
	server := mcp.NewServer(&mcp.Implementation{Name: "gluestack-mcp", Version: "v1.0.0"}, nil)

	mcp.AddTool(server, &mcp.Tool{
		Name:        "list_components",
		Description: "list all available gluestack UI components documentation",
	}, ListComponents)

	mcp.AddTool(server, &mcp.Tool{
		Name:        "get_component_doc",
		Description: "get the markdown documentation for a specific gluestack UI component",
	}, GetComponentDoc)

	mcp.AddTool(server, &mcp.Tool{
		Name:        "get_theme_doc",
		Description: "get the documentation for gluestack theming and design tokens",
	}, GetThemeDoc)

	// Run the server over stdin/stdout, until the client disconnects.
	if err := server.Run(context.Background(), &mcp.StdioTransport{}); err != nil {
		log.Fatal(err)
	}
}

.PHONY: setup install build serve clean help

# Default target
help:
	@echo "Available targets:"
	@echo "  setup    - Setup Ruby environment and install dependencies"
	@echo "  install  - Install Ruby dependencies with Bundler"
	@echo "  build    - Process pre_md file and build site"
	@echo "  serve    - Start Jekyll development server"
	@echo "  clean    - Clean built files"
	@echo "  help     - Show this help message"

# Setup Ruby environment
setup:
	@echo "Setting up Ruby environment..."
	@if command -v rbenv >/dev/null 2>&1; then \
		echo "Initializing rbenv..."; \
		eval "$$(rbenv init -)"; \
	fi
	@echo "Ruby version: $$(ruby -v)"
	@echo "Bundler version: $$(bundle -v)"

# Install dependencies
install: setup
	@echo "Installing dependencies..."
	bundle install
	@echo "Dependencies installed successfully!"

# Build site (process pre_md and build)
build: pages/index.md
	@echo "Building site..."
	bundle exec jekyll build

# Process source markdown to pages (convert citations)
pages/index.md: source_pages/index.md
	@echo "Processing citations in source_pages/index.md..."
	@perl -pe 's/\\cite\{([^}]*)\}/join("", map {" {% cite $$_ %}"} split(\/,\/, $$1))/ge; s/^ //g' $< > $@
	@echo "Converted citations and created pages/index.md"
		
serve: pages/index.md
	@echo "Starting Jekyll development server..."
	bundle exec jekyll serve --livereload

# Clean built files
clean:
	@echo "Cleaning built files..."
	rm -rf _site
	rm -f pages/index.md

# Development workflow (install + serve)
dev: install serve

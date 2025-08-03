#!/bin/bash

# SuperAgent-Zero 2.0 Global Installer
# Installs the agent library and tools globally at ~/.superagent-zero-2/

set -e  # Exit on any error

# Configuration
INSTALL_DIR="$HOME/.superagent-zero-2"
REPO_URL="https://github.com/Gravicity/SuperAgent-Zero-2.git"
VERSION="2.0.0"

# Color codes for output - detect terminal capabilities  
# Check for --no-color flag or terminals that don't support ANSI colors properly
if [ "$1" = "--no-color" ] || [ -n "$CURSOR_TERMINAL" ] || [ -n "$VSCODE_INJECTION" ] || [ "$TERM_PROGRAM" = "cursor" ] || [ "$TERM_PROGRAM" = "vscode" ] || [ "$TERM" = "dumb" ] || [ ! -t 1 ]; then
    # Disable colors for problematic terminals or when requested
    GREEN=''
    BLUE=''
    YELLOW=''
    RED=''
    NC=''
    NO_COLOR=true
else
    # Enable colors for supported terminals
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    YELLOW='\033[1;33m'
    RED='\033[0;31m'
    NC='\033[0m'
    NO_COLOR=false
fi

# Output functions
print_header() {
    printf "${BLUE}╔═══════════════════════════════════════════════════════════╗${NC}\n"
    printf "${BLUE}║          🧠 SuperAgent-Zero 2.0 Global Installer          ║${NC}\n"
    printf "${BLUE}╚═══════════════════════════════════════════════════════════╝${NC}\n"
    printf "\n"
}

print_status() {
    printf "${BLUE}[INFO]${NC} %s\n" "$1"
}

print_success() {
    printf "${GREEN}[✓]${NC} %s\n" "$1"
}

print_warning() {
    printf "${YELLOW}[!]${NC} %s\n" "$1"
}

print_error() {
    printf "${RED}[✗]${NC} %s\n" "$1"
}

# Check prerequisites
check_prerequisites() {
    print_status "Checking prerequisites..."
    
    local missing=()
    
    # Check for required commands
    command -v git >/dev/null 2>&1 || missing+=("git")
    command -v node >/dev/null 2>&1 || missing+=("node")
    command -v claude >/dev/null 2>&1 || print_warning "Claude Code CLI not found - install from claude.ai/code"
    
    # Check Node.js version
    if command -v node >/dev/null 2>&1; then
        local node_version=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
        if [ "$node_version" -lt 18 ]; then
            missing+=("node v18+")
        fi
    fi
    
    if [ ${#missing[@]} -ne 0 ]; then
        print_error "Missing required tools: ${missing[*]}"
        printf "\n"
        printf "%s\n" "Please install the missing tools:"
        printf "%s\n" "  - Git: https://git-scm.com/"
        printf "%s\n" "  - Node.js v18+: https://nodejs.org/"
        printf "%s\n" "  - Claude Code: https://claude.ai/code"
        printf "\n"
        exit 1
    fi
    
    print_success "Prerequisites check completed"
}

# Handle existing installation
handle_existing_installation() {
    if [ ! -d "$INSTALL_DIR" ]; then
        return 0 # No existing installation
    fi
    
    print_warning "Existing installation found at $INSTALL_DIR"
    
    # Check if this is an update scenario
    local current_version="unknown"
    if [ -f "$INSTALL_DIR/VERSION" ]; then
        current_version=$(cat "$INSTALL_DIR/VERSION")
    fi
    
    printf "%s\n" "Current version: $current_version"
    printf "%s\n" "Installing version: $VERSION"
    printf "\n"
    
    # If versions are the same and no --force flag, default to smart update
    if [ "$current_version" = "$VERSION" ] && [ "$1" != "--force" ]; then
        printf "%s\n" "Same version detected. Performing smart update to refresh files..."
        choice="1"
    else
        printf "%s\n" "Update options:"
        printf "%s\n" "1) Smart update (recommended) - Preserve customizations, update core files"
        printf "%s\n" "2) Clean install - Remove everything and reinstall"
        printf "%s\n" "3) Cancel installation"
        printf "\n"
        
        read -p "Choose option (1/2/3): " choice
    fi
    
    while true; do
        case $choice in
            1)
                print_status "Performing smart update..."
                backup_user_data
                update_core_files
                return 1 # Indicate update mode
                ;;
            2)
                print_status "Performing clean install..."
                rm -rf "$INSTALL_DIR"
                return 0 # Indicate fresh install
                ;;
            3)
                print_error "Installation cancelled"
                exit 0
                ;;
            *)
                printf "%s\n" "Please enter 1, 2, or 3"
                ;;
        esac
    done
}

# Backup user customizations
backup_user_data() {
    print_status "Backing up user customizations..."
    
    local backup_dir="/tmp/superagent-backup-$(date +%s)"
    mkdir -p "$backup_dir"
    
    # Backup custom agents if they exist
    if [ -d "$INSTALL_DIR/agents/custom" ] && [ "$(ls -A "$INSTALL_DIR/agents/custom")" ]; then
        cp -r "$INSTALL_DIR/agents/custom" "$backup_dir/"
        print_success "Backed up custom agents"
    fi
    
    # Store backup location for restoration
    echo "$backup_dir" > "/tmp/superagent-backup-location"
}

# Update core files while preserving customizations
update_core_files() {
    print_status "Updating core framework files..."
    
    # Update specific core files without touching custom directory
    local core_dirs=("starter" "engineering" "design" "marketing" "product" "testing" "bonus" "project-management" "studio-operations")
    
    for dir in "${core_dirs[@]}"; do
        if [ -d "$(dirname "$0")/agents/$dir" ]; then
            mkdir -p "$INSTALL_DIR/agents/$dir"
            cp -r "$(dirname "$0")/agents/$dir/"* "$INSTALL_DIR/agents/$dir/" 2>/dev/null || true
        fi
    done
    
    # Update scripts and catalog
    if [ -f "$(dirname "$0")/setup.sh" ]; then
        cp "$(dirname "$0")/setup.sh" "$INSTALL_DIR/"
        chmod +x "$INSTALL_DIR/setup.sh"
    fi
    
    if [ -f "$(dirname "$0")/agent-catalog.json" ]; then
        cp "$(dirname "$0")/agent-catalog.json" "$INSTALL_DIR/"
    fi
    
    # Restore custom agents
    if [ -f "/tmp/superagent-backup-location" ]; then
        local backup_dir=$(cat "/tmp/superagent-backup-location")
        if [ -d "$backup_dir/custom" ]; then
            cp -r "$backup_dir/custom/"* "$INSTALL_DIR/agents/custom/" 2>/dev/null || true
            print_success "Restored custom agents"
        fi
        rm -rf "$backup_dir" "/tmp/superagent-backup-location"
    fi
    
    print_success "Core files updated"
}

# Create directory structure
create_directory_structure() {
    print_status "Creating directory structure..."
    
    # Create directories (existing ones won't be affected)
    mkdir -p "$INSTALL_DIR"/{agents/{starter,engineering,design,marketing,product,testing,bonus,project-management,studio-operations,custom},bin,docs}
    
    print_success "Directory structure created"
}

# Download or copy agent files
install_agents() {
    print_status "Installing agent library..."
    
    # If we're running from the repo, copy files
    if [ -d "$(dirname "$0")/agents" ]; then
        print_status "Installing from local repository..."
        cp -r "$(dirname "$0")/agents/"* "$INSTALL_DIR/agents/"
        
        # Also copy the agent catalog
        if [ -f "$(dirname "$0")/agent-catalog.json" ]; then
            cp "$(dirname "$0")/agent-catalog.json" "$INSTALL_DIR/"
        fi
    else
        # Download from GitHub
        print_status "Downloading agents from GitHub..."
        download_from_github
    fi
    
    print_success "Agent library installed"
}

# Download agents from GitHub repository
download_from_github() {
    local temp_dir="/tmp/superagent-download-$$"
    mkdir -p "$temp_dir"
    
    print_status "Cloning repository..."
    if command -v git >/dev/null 2>&1; then
        # Use git if available
        git clone --depth 1 "$REPO_URL" "$temp_dir" >/dev/null 2>&1
    else
        # Fallback to curl and unzip
        curl -sL "https://github.com/Gravicity/SuperAgent-Zero-2/archive/main.zip" -o "$temp_dir/repo.zip"
        cd "$temp_dir" && unzip -q repo.zip && mv SuperAgent-Zero-2-main/* . && rm repo.zip
    fi
    
    # Copy agents and catalog
    if [ -d "$temp_dir/agents" ]; then
        print_status "Installing all 37 agents..."
        cp -r "$temp_dir/agents/"* "$INSTALL_DIR/agents/"
    fi
    
    if [ -f "$temp_dir/agent-catalog.json" ]; then
        cp "$temp_dir/agent-catalog.json" "$INSTALL_DIR/"
    fi
    
    if [ -f "$temp_dir/setup.sh" ]; then
        cp "$temp_dir/setup.sh" "$INSTALL_DIR/"
        chmod +x "$INSTALL_DIR/setup.sh"
    fi
    
    # Cleanup
    rm -rf "$temp_dir"
    
    print_status "Downloaded complete agent library"
}


# Create utility scripts  
create_scripts() {
    print_status "Creating utility scripts..."
    
    # Only create update.sh since setup.sh is downloaded from GitHub
    cat > "$INSTALL_DIR/update.sh" << 'EOF'
#!/bin/bash
# SuperAgent-Zero 2.0 Updater

echo "🔄 Updating SuperAgent-Zero 2.0..."
curl -sSL https://raw.githubusercontent.com/Gravicity/SuperAgent-Zero-2/main/install.sh | bash
echo "✅ Update completed!"
EOF
    chmod +x "$INSTALL_DIR/update.sh"
    
    print_success "Created utility scripts"
}


# Add to PATH
setup_path() {
    print_status "Setting up PATH..."
    
    local shell_rc=""
    if [ -n "$BASH_VERSION" ]; then
        shell_rc="$HOME/.bashrc"
    elif [ -n "$ZSH_VERSION" ]; then
        shell_rc="$HOME/.zshrc"
    fi
    
    if [ -n "$shell_rc" ] && [ -f "$shell_rc" ]; then
        if ! grep -q "superagent-zero-2" "$shell_rc"; then
            echo "" >> "$shell_rc"
            echo "# SuperAgent-Zero 2.0" >> "$shell_rc"
            echo "export PATH=\"\$HOME/.superagent-zero-2:\$PATH\"" >> "$shell_rc"
            print_success "Added to PATH in $shell_rc"
            print_warning "Run 'source $shell_rc' or restart your terminal"
        fi
    fi
}

# Main installation
main() {
    print_header
    
    print_status "Installing SuperAgent-Zero 2.0..."
    printf "\n"
    
    check_prerequisites
    
    # Handle existing installation
    handle_existing_installation "$1"
    local update_mode=$?
    
    if [ $update_mode -eq 0 ]; then
        # Fresh installation
        create_directory_structure
        install_agents
        create_scripts
        setup_path
    else
        # Update mode - only update VERSION and INSTALLED
        printf "\n"
    fi
    
    # Create VERSION file
    echo "$VERSION" > "$INSTALL_DIR/VERSION"
    echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" > "$INSTALL_DIR/INSTALLED"
    
    printf "\n"
    if [ $update_mode -eq 0 ]; then
        print_success "SuperAgent-Zero 2.0 installation completed!"
        printf "\n"
        printf "%s\n" "📋 Installation Summary:"
        printf "%s\n" "   📂 Location: $INSTALL_DIR"
        printf "%s\n" "   📦 Version: $VERSION"
        printf "%s\n" "   🤖 Agents: All 39 agents across 8 categories"
        printf "%s\n" "   🔧 Scripts: setup.sh, update.sh"
        printf "\n"
        printf "%s\n" "🚀 Quick Start:"
        printf "%s\n" "   1. cd your-project"
        printf "%s\n" "   2. ~/.superagent-zero-2/setup.sh"
        printf "%s\n" "   3. claude"
        printf "\n"
    else
        print_success "SuperAgent-Zero 2.0 update completed!"
        printf "\n"
        printf "%s\n" "📋 Update Summary:"
        printf "%s\n" "   📂 Location: $INSTALL_DIR"
        printf "%s\n" "   📦 Updated to: $VERSION"
        printf "%s\n" "   🤖 Core agents updated, custom agents preserved"
        printf "%s\n" "   🔧 Scripts and catalog updated"
        printf "\n"
        printf "%s\n" "🔄 Next Steps:"
        printf "%s\n" "   - Existing projects will use updated framework automatically"
        printf "%s\n" "   - Run setup.sh in new projects to use latest version"
        printf "\n"
    fi
    
    printf "%s\n" "✨ SuperAgent Zero will transform Claude Code into your AI superintendent!"
    printf "\n"
    printf "%s\n" "📚 For more information:"
    printf "%s\n" "   - README: https://github.com/Gravicity/SuperAgent-Zero-2"
    printf "%s\n" "   - Agents: https://github.com/Gravicity/SuperAgent-Zero-2/tree/main/agents"
    printf "\n"
}

# Run installation
main "$@"
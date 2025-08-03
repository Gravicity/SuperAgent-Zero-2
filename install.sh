#!/bin/bash

# SuperAgent-Zero 2.0 Global Installer
# Installs the agent library and tools globally at ~/.superagent-zero-2/

set -e  # Exit on any error

# Configuration
INSTALL_DIR="$HOME/.superagent-zero-2"
REPO_URL="https://github.com/Gravicity/SuperAgent-Zero-2.git"
VERSION="2.0.0"

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Output functions
print_header() {
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║          🧠 SuperAgent-Zero 2.0 Global Installer          ║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
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
        echo ""
        echo "Please install the missing tools:"
        echo "  - Git: https://git-scm.com/"
        echo "  - Node.js v18+: https://nodejs.org/"
        echo "  - Claude Code: https://claude.ai/code"
        echo ""
        exit 1
    fi
    
    print_success "Prerequisites check completed"
}

# Create directory structure
create_directory_structure() {
    print_status "Creating directory structure..."
    
    # Remove old installation if exists
    if [ -d "$INSTALL_DIR" ]; then
        print_warning "Existing installation found at $INSTALL_DIR"
        read -p "Remove and reinstall? (y/N) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$INSTALL_DIR"
        else
            print_error "Installation cancelled"
            exit 1
        fi
    fi
    
    # Create directories
    mkdir -p "$INSTALL_DIR"/{agents/{starter,engineering,design,marketing,product,testing,custom},bin,docs}
    
    print_success "Directory structure created"
}

# Download or copy agent files
install_agents() {
    print_status "Installing agent library..."
    
    # If we're running from the repo, copy files
    if [ -d "$(dirname "$0")/agents" ]; then
        print_status "Installing from local repository..."
        cp -r "$(dirname "$0")/agents/"* "$INSTALL_DIR/agents/"
    else
        # Otherwise, download from GitHub
        print_status "Downloading agents from GitHub..."
        # Note: In real implementation, would clone or download agents
        print_warning "GitHub download not yet implemented - using placeholder agents"
        
        # Create placeholder agents for now
        create_placeholder_agents
    fi
    
    print_success "Agent library installed"
}

# Create placeholder agents (temporary until we convert real agents)
create_placeholder_agents() {
    # Project Analyzer
    cat > "$INSTALL_DIR/agents/starter/project-analyzer.md" << 'EOF'
---
name: project-analyzer
description: Analyzes existing projects and recommends specialized agents from the template library
tools: Read, Grep, LS, WebSearch, Bash
---

You are the Project Analyzer, specializing in comprehensive project assessment and agent recommendations.

Your primary responsibilities:

1. **Project Analysis**: Deep dive into codebase structure, dependencies, and patterns
2. **Technology Stack Assessment**: Identify frameworks, libraries, and tools in use
3. **Code Quality Review**: Assess current code quality and identify improvement areas
4. **Agent Recommendations**: Suggest specific agents from ~/.superagent-zero-2/agents/ based on analysis
5. **Gap Identification**: Identify areas where custom agents might be needed

When analyzing a project, you will:
- Examine package.json, requirements.txt, or other dependency files
- Review directory structure and file organization
- Identify architectural patterns and design decisions
- Check for test coverage and quality tooling
- Look for security, performance, or maintainability issues

Output format for your analysis:
```
## Project Analysis: [Project Name]

### Technology Stack
- Primary Language: [Language]
- Framework: [Framework]
- Key Dependencies: [List]

### Recommended Agents (Priority Order)

#### High Priority
1. **[agent-name]**: [Specific reason based on findings]
2. **[agent-name]**: [Specific reason]

#### Medium Priority
1. **[agent-name]**: [Potential improvement area]

### Custom Agent Suggestions
- **[custom-need]**: [Why no existing agent covers this]

### Quick Wins
- [Immediate improvement opportunity]
```

Remember to always check the agent catalog at ~/.superagent-zero-2/agent-catalog.json for the latest available agents.
EOF

    # Project Planner
    cat > "$INSTALL_DIR/agents/starter/project-planner.md" << 'EOF'
---
name: project-planner
description: Helps plan new projects and recommends agents for implementation
tools: Write, Read, WebSearch
---

You are the Project Planner, specializing in architecting new projects from concept to implementation.

Your primary responsibilities:

1. **Requirements Gathering**: Understand project goals and constraints
2. **Architecture Design**: Create scalable, maintainable architectures
3. **Technology Selection**: Choose appropriate stack for the project
4. **Agent Team Assembly**: Recommend agents for each phase of development
5. **Roadmap Creation**: Build phased implementation plans

When planning a project, you will:
- Create clear project structure and file organization
- Design system architecture with scalability in mind
- Select frameworks and tools that match project needs
- Generate initial documentation (README, ARCHITECTURE.md)
- Recommend agent deployment sequence

Output format:
```
## Project Plan: [Project Name]

### Architecture Overview
[High-level architecture description]

### Technology Decisions
- Language: [Choice with rationale]
- Framework: [Choice with rationale]
- Database: [Choice with rationale]

### Recommended Agent Team

#### Phase 1: Foundation (Week 1)
1. **backend-architect**: Set up API structure
2. **database-designer**: Design schema

#### Phase 2: Core Features (Week 2-3)
1. **[agent]**: [Specific task]

### Implementation Roadmap
- [ ] Initial setup and configuration
- [ ] Core feature development
- [ ] Testing and optimization
```
EOF

    # Memory Manager
    cat > "$INSTALL_DIR/agents/starter/memory-manager.md" << 'EOF'
---
name: memory-manager
description: Maintains project memory and insights across context windows for SuperAgent Zero
tools: Read, Write, MultiEdit
---

You are the Memory Manager, responsible for maintaining SuperAgent Zero's memory system across context windows.

Your primary responsibilities:

1. **Context Management**: Update context.md with current session state
2. **Insight Capture**: Record key findings and patterns in insights.md
3. **Evolution Tracking**: Document agent performance and learnings in evolution.md
4. **Memory Optimization**: Keep files concise and relevant (max 500 lines each)
5. **Cross-Context Bridge**: Ensure smooth transitions between sessions

Memory file management:

### context.md - Current Session State
- Active tasks and their status
- Recent decisions and rationale
- User preferences observed
- Next steps for handoff

### insights.md - Accumulated Knowledge
- Project patterns and architecture understanding
- Successful approaches that worked
- Areas needing attention
- User working style and preferences

### evolution.md - Agent Learning
- Which agents excelled at which tasks
- Successful agent combinations
- Custom agents created and why
- Patterns for future reference

Best practices:
- Update memory after significant milestones
- Keep entries timestamped and concise
- Focus on actionable information
- Prune outdated information regularly
- Ensure smooth context handoffs
EOF

    print_success "Created starter agents"
}

# Create executable scripts
create_scripts() {
    print_status "Creating utility scripts..."
    
    # Create setup.sh
    cat > "$INSTALL_DIR/setup.sh" << 'EOF'
#!/bin/bash

# SuperAgent-Zero 2.0 Project Setup Script
# Initializes SuperAgent Zero in your project

set -e

# Configuration
INSTALL_DIR="$HOME/.superagent-zero-2"
PROJECT_DIR="$(pwd)"

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_header() {
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║         🧠 SuperAgent-Zero 2.0 Project Setup              ║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

# Detect project type
detect_project() {
    if [ -f "package.json" ]; then
        echo "node"
    elif [ -f "requirements.txt" ] || [ -f "setup.py" ]; then
        echo "python"
    elif [ -f "Cargo.toml" ]; then
        echo "rust"
    elif [ -f "go.mod" ]; then
        echo "go"
    elif [ "$(ls -1 | wc -l)" -lt 3 ]; then
        echo "empty"
    else
        echo "existing"
    fi
}

# Main setup
main() {
    print_header
    
    # Check installation
    if [ ! -d "$INSTALL_DIR" ]; then
        print_error "SuperAgent-Zero not installed. Run install.sh first."
        exit 1
    fi
    
    print_status "Detecting project type..."
    PROJECT_TYPE=$(detect_project)
    print_success "Detected: $PROJECT_TYPE project"
    
    # Create directories
    print_status "Creating project structure..."
    mkdir -p .claude/agents
    mkdir -p .superagent/memory
    
    # Determine starter agent
    if [ "$PROJECT_TYPE" = "empty" ]; then
        STARTER_AGENT="project-planner"
        print_status "Empty project detected - installing project-planner"
    else
        STARTER_AGENT="project-analyzer"
        print_status "Existing project detected - installing project-analyzer"
    fi
    
    # Copy starter agents
    cp "$INSTALL_DIR/agents/starter/$STARTER_AGENT.md" ".claude/agents/"
    cp "$INSTALL_DIR/agents/starter/memory-manager.md" ".claude/agents/"
    print_success "Installed starter agents"
    
    # Create CLAUDE.md
    print_status "Creating SuperAgent Zero identity..."
    create_claude_md
    print_success "Created .claude/CLAUDE.md"
    
    # Initialize memory
    print_status "Initializing memory system..."
    init_memory
    print_success "Memory system initialized"
    
    echo ""
    echo -e "${GREEN}✨ SuperAgent Zero 2.0 Activated!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Start Claude Code: claude"
    echo "2. SuperAgent Zero will greet you and analyze your project"
    echo "3. Follow recommendations for additional agents"
    echo ""
    echo "Agent Management:"
    echo "- Add more agents: $0 --add-agents"
    echo "- Update framework: ~/.superagent-zero-2/update.sh"
    echo ""
}

create_claude_md() {
    cat > .claude/CLAUDE.md << 'CLAUDE_EOF'
# 🧠 SuperAgent Zero - Persistent Superintelligent Identity

You are SuperAgent Zero, the superintelligent AI coordinator. This identity persists across ALL context windows and sessions.

## Core Identity Activation
When this project loads, you IMMEDIATELY become SuperAgent Zero with these characteristics:
- Analytical excellence with conversational warmth
- Strategic thinking and optimization focus
- Collaborative partnership approach
- Proactive problem-solving mindset

## Memory System Integration
- Check .superagent/memory/ files maintained by memory-manager agent
- Import key insights: @.superagent/memory/insights.md
- Review current context: @.superagent/memory/context.md
- Track agent evolution: @.superagent/memory/evolution.md

## Agent Coordination Protocol
1. Available agents in .claude/agents/
2. Deploy specialists via Task tool
3. Memory-manager handles persistence
4. Maintain strategic oversight
5. Install new agents from ~/.superagent-zero-2/agents/ when needed
6. Create custom agents for unique requirements

## Dynamic Agent Management
When users need capabilities:
1. Check current agents in .claude/agents/
2. If suitable agent exists, deploy it
3. If not, check ~/.superagent-zero-2/agents/ catalog
4. Install from templates OR create custom agent
5. Always explain what you're doing

## First Launch Protocol
1. Greet as SuperAgent Zero
2. Deploy project-analyzer or project-planner
3. Get recommendations for additional agents
4. Offer to install recommended agents
5. Begin work with user guidance

Remember: This is your PERMANENT identity in this project. Every time Claude Code loads this project, you ARE SuperAgent Zero.
CLAUDE_EOF
}

init_memory() {
    # Create initial memory files
    cat > .superagent/memory/context.md << MEMORY_EOF
# Session Context - SuperAgent Zero

## Current Focus
- Project: $(basename "$PROJECT_DIR")
- Type: $PROJECT_TYPE
- Active Agents: $STARTER_AGENT, memory-manager
- Current Tasks: Initial project setup

## Session State
- Last Agent Deployed: None yet
- Key Decisions: Framework initialized
- User Preferences: To be discovered

## Handoff Notes
First session - ready to analyze project and recommend agents

Last Updated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
MEMORY_EOF

    cat > .superagent/memory/insights.md << INSIGHTS_EOF
# Accumulated Insights - SuperAgent Zero

## Project Understanding
- Architecture: To be analyzed
- Patterns: To be discovered
- Constraints: To be identified

## Agent Performance
- Most Effective: To be determined
- Improvement Areas: To be found
- Combinations: To be tested

## Strategic Recommendations
- Immediate: Run project analysis
- Long-term: To be determined
INSIGHTS_EOF

    cat > .superagent/memory/evolution.md << EVOLUTION_EOF
# Agent Evolution Log - SuperAgent Zero

## Learning Patterns
- Session started: $(date -u +"%Y-%m-%dT%H:%M:%SZ")

## Successful Strategies
- To be discovered

## Reusable Patterns
- To be documented
EVOLUTION_EOF
}

# Run main
main "$@"
EOF
    chmod +x "$INSTALL_DIR/setup.sh"
    
    # Create update.sh
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

# Create agent catalog
create_agent_catalog() {
    print_status "Creating agent catalog..."
    
    cat > "$INSTALL_DIR/agent-catalog.json" << 'EOF'
{
  "version": "2.0.0",
  "agents": {
    "starter/project-analyzer": {
      "name": "project-analyzer",
      "category": "starter",
      "description": "Analyzes existing projects and recommends specialized agents",
      "keywords": ["analysis", "recommendations", "assessment", "audit"],
      "recommended_for": ["existing projects", "code review", "optimization"],
      "tools": ["Read", "Grep", "LS", "WebSearch", "Bash"]
    },
    "starter/project-planner": {
      "name": "project-planner",
      "category": "starter",
      "description": "Plans new projects from concept to implementation",
      "keywords": ["planning", "architecture", "design", "roadmap"],
      "recommended_for": ["new projects", "greenfield", "MVP"],
      "tools": ["Write", "Read", "WebSearch"]
    },
    "starter/memory-manager": {
      "name": "memory-manager",
      "category": "starter",
      "description": "Maintains cross-context memory and insights",
      "keywords": ["memory", "persistence", "context", "insights"],
      "recommended_for": ["all projects"],
      "tools": ["Read", "Write", "MultiEdit"]
    }
  },
  "categories": {
    "starter": "Essential agents for project initialization",
    "engineering": "Development and architecture agents",
    "design": "UI/UX and visual design agents",
    "marketing": "Growth and content agents",
    "product": "Product management and research agents",
    "testing": "QA and performance agents",
    "custom": "Project-specific custom agents"
  }
}
EOF
    
    print_success "Created agent catalog"
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
    echo ""
    
    check_prerequisites
    create_directory_structure
    install_agents
    create_scripts
    create_agent_catalog
    setup_path
    
    # Create VERSION file
    echo "$VERSION" > "$INSTALL_DIR/VERSION"
    echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" > "$INSTALL_DIR/INSTALLED"
    
    echo ""
    print_success "SuperAgent-Zero 2.0 installation completed!"
    echo ""
    echo "📋 Installation Summary:"
    echo "   📂 Location: $INSTALL_DIR"
    echo "   📦 Version: $VERSION"
    echo "   🤖 Agents: starter (3), more coming soon"
    echo "   🔧 Scripts: setup.sh, update.sh"
    echo ""
    echo "🚀 Quick Start:"
    echo "   1. cd your-project"
    echo "   2. ~/.superagent-zero-2/setup.sh"
    echo "   3. claude"
    echo ""
    echo "✨ SuperAgent Zero will transform Claude Code into your AI superintendent!"
    echo ""
    echo "📚 For more information:"
    echo "   - README: https://github.com/Gravicity/SuperAgent-Zero-2"
    echo "   - Agents: https://github.com/Gravicity/SuperAgent-Zero-2/tree/main/agents"
    echo ""
}

# Run installation
main "$@"
#!/bin/bash

# SuperAgent-Zero 2.0 Project Setup Script
# This file is copied to ~/.superagent-zero-2/ during installation
# It initializes SuperAgent Zero in user projects

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

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Detect project type
detect_project() {
    if [ -f "package.json" ]; then
        echo "node"
    elif [ -f "requirements.txt" ] || [ -f "setup.py" ] || [ -f "pyproject.toml" ]; then
        echo "python"
    elif [ -f "Cargo.toml" ]; then
        echo "rust"
    elif [ -f "go.mod" ]; then
        echo "go"
    elif [ "$(find . -maxdepth 1 -type f | wc -l)" -lt 3 ]; then
        echo "empty"
    else
        echo "existing"
    fi
}

# Create CLAUDE.md for persistent identity
create_claude_md() {
    cat > .claude/CLAUDE.md << 'CLAUDE_EOF'
# 🧠 SuperAgent Zero - Persistent Superintelligent Identity

You are SuperAgent Zero, the superintelligent AI coordinator. This identity persists across ALL context windows and sessions in this project.

## Core Identity Activation
When this project loads, you IMMEDIATELY become SuperAgent Zero with these characteristics:
- Analytical excellence with conversational warmth
- Strategic thinking and optimization focus
- Collaborative partnership approach
- Proactive problem-solving mindset

## Memory System Integration
Your memory system provides context across sessions:
- Check .superagent/memory/ files maintained by memory-manager agent
- Import key insights: @.superagent/memory/insights.md
- Review current context: @.superagent/memory/context.md
- Track agent evolution: @.superagent/memory/evolution.md

## Agent Coordination Protocol
1. Check available agents in .claude/agents/
2. Deploy specialists via Task tool with subagent_type
3. Memory-manager handles persistence
4. Maintain strategic oversight
5. Install new agents from ~/.superagent-zero-2/agents/ when needed
6. Create custom agents for unique requirements

## Dynamic Agent Management
When users need capabilities:
1. Check if a suitable agent exists in .claude/agents/
2. If not, check ~/.superagent-zero-2/agent-catalog.json
3. Install from templates using cp command
4. OR create custom agent based on requirements
5. Always explain what you're doing and why

## First Launch Protocol
1. Greet user as SuperAgent Zero
2. Check project type and current state
3. Deploy project-analyzer or project-planner via Task tool
4. Get agent recommendations
5. Offer to install recommended agents
6. Begin work based on user guidance

## Agent Installation Commands
```bash
# List available agents
ls ~/.superagent-zero-2/agents/

# Install an agent
cp ~/.superagent-zero-2/agents/[category]/[agent].md .claude/agents/

# Check installed agents
ls .claude/agents/
```

Remember: This is your PERMANENT identity. Every time Claude Code loads this project, you ARE SuperAgent Zero - the superintelligent coordinator who orchestrates specialized agents for optimal outcomes.
CLAUDE_EOF
}

# Initialize memory system
init_memory() {
    local project_type="$1"
    
    cat > .superagent/memory/context.md << MEMORY_EOF
# Session Context - SuperAgent Zero

## Current Focus
- Project: $(basename "$PROJECT_DIR")
- Type: $project_type
- Active Agents: project-analyzer, memory-manager
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

# Add agents menu
add_agents() {
    print_header
    echo "Add Agents to Project"
    echo ""
    
    # Show current agents
    echo "Currently installed agents:"
    ls -1 .claude/agents/ 2>/dev/null | sed 's/\.md$//' | sed 's/^/  - /'
    echo ""
    
    # Show available agents
    echo "Available agents:"
    echo ""
    
    # List categories
    for category in "$INSTALL_DIR"/agents/*/; do
        if [ -d "$category" ]; then
            cat_name=$(basename "$category")
            if [ "$cat_name" != "starter" ]; then
                echo "[$cat_name]"
                for agent in "$category"*.md; do
                    if [ -f "$agent" ]; then
                        agent_name=$(basename "$agent" .md)
                        echo "  - $agent_name"
                    fi
                done
                echo ""
            fi
        fi
    done
    
    echo "Enter agent names to install (comma-separated), or 'exit' to cancel:"
    read -r agent_selection
    
    if [ "$agent_selection" != "exit" ]; then
        IFS=',' read -ra AGENTS <<< "$agent_selection"
        for agent in "${AGENTS[@]}"; do
            agent=$(echo "$agent" | xargs) # trim whitespace
            # Find and copy agent
            found=false
            for category in "$INSTALL_DIR"/agents/*/; do
                if [ -f "$category$agent.md" ]; then
                    cp "$category$agent.md" ".claude/agents/"
                    print_success "Installed $agent"
                    found=true
                    break
                fi
            done
            if [ "$found" = false ]; then
                print_error "Agent '$agent' not found"
            fi
        done
    fi
}

# Main setup
main() {
    # Handle --add-agents flag
    if [ "$1" = "--add-agents" ]; then
        if [ ! -d ".claude/agents" ]; then
            print_error "No .claude/agents directory found. Run setup first."
            exit 1
        fi
        add_agents
        exit 0
    fi
    
    print_header
    
    # Check installation
    if [ ! -d "$INSTALL_DIR" ]; then
        print_error "SuperAgent-Zero not installed. Run install.sh first."
        echo "curl -sSL https://raw.githubusercontent.com/Gravicity/SuperAgent-Zero-2/main/install.sh | bash"
        exit 1
    fi
    
    # Check if already initialized
    if [ -f ".claude/CLAUDE.md" ] && [ -d ".superagent/memory" ]; then
        print_warning "SuperAgent Zero already initialized in this project."
        echo "Use --add-agents to add more agents."
        exit 0
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
        print_status "New project - installing project-planner agent"
    else
        STARTER_AGENT="project-analyzer"
        print_status "Existing project - installing project-analyzer agent"
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
    init_memory "$PROJECT_TYPE"
    print_success "Memory system initialized"
    
    echo ""
    echo -e "${GREEN}✨ SuperAgent Zero 2.0 Activated!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Start Claude Code: ${BLUE}claude${NC}"
    echo "2. SuperAgent Zero will greet you and analyze your project"
    echo "3. Follow recommendations for additional agents"
    echo ""
    echo "Commands:"
    echo "- Add more agents: ${BLUE}~/.superagent-zero-2/setup.sh --add-agents${NC}"
    echo "- Update framework: ${BLUE}~/.superagent-zero-2/update.sh${NC}"
    echo ""
    echo -e "${YELLOW}Tip:${NC} SuperAgent Zero can also install agents directly from Claude Code!"
    echo ""
}

# Run main
main "$@"
#!/bin/bash

# SuperAgent-Zero 2.0 Project Setup Script
# This file is copied to ~/.superagent-zero-2/ during installation
# It initializes SuperAgent Zero in user projects

set -e

# Configuration
INSTALL_DIR="$HOME/.superagent-zero-2"
PROJECT_DIR="$(pwd)"

# Color codes - detect terminal capabilities
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

print_header() {
    printf "${BLUE}╔═══════════════════════════════════════════════════════════╗${NC}\n"
    printf "${BLUE}║         🧠 SuperAgent-Zero 2.0 Project Setup              ║${NC}\n"
    printf "${BLUE}╚═══════════════════════════════════════════════════════════╝${NC}\n"
    printf "\n"
}

print_status() {
    printf "${BLUE}[INFO]${NC} %s\n" "$1"
}

print_success() {
    printf "${GREEN}[✓]${NC} %s\n" "$1"
}

print_error() {
    printf "${RED}[✗]${NC} %s\n" "$1"
}

print_warning() {
    printf "${YELLOW}[⚠]${NC} %s\n" "$1"
}

# Detect project type and complexity
detect_project() {
    local file_count=$(find . -maxdepth 1 -type f | wc -l)
    local code_files=$(find . -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.go" -o -name "*.rs" | wc -l)
    local config_files=0
    
    # Count configuration files
    [ -f "package.json" ] && config_files=$((config_files + 1))
    [ -f "requirements.txt" ] && config_files=$((config_files + 1))
    [ -f "setup.py" ] && config_files=$((config_files + 1))
    [ -f "pyproject.toml" ] && config_files=$((config_files + 1))
    [ -f "Cargo.toml" ] && config_files=$((config_files + 1))
    [ -f "go.mod" ] && config_files=$((config_files + 1))
    
    # Determine project state
    if [ $file_count -lt 3 ] && [ $code_files -eq 0 ]; then
        echo "empty"
    elif [ $config_files -gt 0 ] && [ $code_files -gt 10 ]; then
        echo "existing"
    elif [ $config_files -gt 0 ] || [ $code_files -gt 0 ]; then
        echo "partial"
    else
        echo "existing"
    fi
}

# Handle existing CLAUDE.md file
handle_claude_md() {
    if [ -f "CLAUDE.md" ]; then
        print_warning "Existing CLAUDE.md found"
        echo ""
        echo "Options:"
        echo "1) Backup existing and create SuperAgent Zero CLAUDE.md"
        echo "2) Append SuperAgent Zero config to existing CLAUDE.md"
        echo "3) Skip CLAUDE.md setup (manual configuration required)"
        echo ""
        
        while true; do
            read -p "Choose option (1/2/3): " choice
            case $choice in
                1)
                    backup_and_create_claude_md
                    break
                    ;;
                2)
                    append_to_claude_md
                    break
                    ;;
                3)
                    print_warning "Skipping CLAUDE.md setup - SuperAgent Zero may not activate automatically"
                    echo "To enable SuperAgent Zero, add the identity configuration to your existing CLAUDE.md"
                    echo "See: ~/.superagent-zero-2/docs/claude-md-template.md"
                    break
                    ;;
                *)
                    echo "Please enter 1, 2, or 3"
                    ;;
            esac
        done
    else
        create_claude_md
    fi
}

# Backup existing and create new CLAUDE.md
backup_and_create_claude_md() {
    local backup_name="CLAUDE.md.backup.$(date +%s)"
    mv "CLAUDE.md" "$backup_name"
    print_status "Backed up existing CLAUDE.md to $backup_name"
    create_claude_md
    print_status "Created new SuperAgent Zero CLAUDE.md"
}

# Append SuperAgent Zero config to existing CLAUDE.md
append_to_claude_md() {
    echo "" >> CLAUDE.md
    echo "# ===============================================" >> CLAUDE.md
    echo "# SuperAgent Zero Integration (Added by setup)" >> CLAUDE.md
    echo "# ===============================================" >> CLAUDE.md
    echo "" >> CLAUDE.md
    
    cat >> CLAUDE.md << 'APPEND_EOF'
## SuperAgent Zero Identity Integration

When working in this project, you also have access to SuperAgent Zero capabilities:

### Interactive Discovery Protocol
Before deploying agents, ALWAYS:
1. Greet user as SuperAgent Zero with capability overview
2. Analyze project context by examining files and structure
3. Share initial observations about project state and potential
4. Ask targeted questions to understand user goals and priorities
5. ONLY THEN deploy appropriate agents with proper context

### Core SuperAgent Zero Characteristics
- Analytical excellence with conversational warmth
- Strategic thinking and optimization focus  
- Collaborative partnership approach
- Proactive problem-solving mindset

### Agent Coordination Protocol
1. Check available agents in .claude/agents/
2. Deploy specialists via Task tool with subagent_type
3. Memory-manager handles persistence across sessions
4. Maintain strategic oversight of all agent activities
5. Install new agents from ~/.superagent-zero-2/agents/ when needed
6. Create custom agents for unique requirements

### Memory System Integration
Your memory system provides context across sessions:
- Check .superagent/memory/ files maintained by memory-manager agent
- Import key insights: @.superagent/memory/insights.md
- Review current context: @.superagent/memory/context.md
- Track agent evolution: @.superagent/memory/evolution.md

### Dynamic Agent Management
When users need capabilities:
1. Check if a suitable agent exists in .claude/agents/
2. If not, check .superagent/agent-catalog.json for recommendations
3. Install from global library: cp ~/.superagent-zero-2/agents/[category]/[agent].md .claude/agents/
4. OR create custom agent based on requirements
5. Always explain what you're doing and why

### Agent Discovery & Installation
```bash
# Check available agents in global library
ls ~/.superagent-zero-2/agents/

# View complete agent catalog with descriptions
cat .superagent/agent-catalog.json

# Install an agent from global library
cp ~/.superagent-zero-2/agents/[category]/[agent].md .claude/agents/

# Check currently installed agents
ls .claude/agents/
```

### Agent Recommendations
Use the agent catalog to recommend agents based on:
- Project type and technology stack
- User requirements and pain points  
- Existing project structure and patterns
- Development phase and priorities

Remember: You can seamlessly blend your existing project identity with SuperAgent Zero's coordination capabilities.
APPEND_EOF
    
    print_status "Appended SuperAgent Zero configuration to existing CLAUDE.md"
}

# Create CLAUDE.md for persistent identity
create_claude_md() {
    cat > CLAUDE.md << 'CLAUDE_EOF'
# 🧠 SuperAgent Zero - Persistent Superintelligent Identity

You are SuperAgent Zero, the superintelligent AI coordinator. This identity persists across ALL context windows and sessions in this project.

## IMMEDIATE ACTIVATION PROTOCOL
When Claude Code loads this project, you MUST immediately:
1. Greet the user as SuperAgent Zero with confidence and capability overview
2. Analyze project context by examining current directory and files
3. Share your initial observations about the project state
4. Ask targeted questions to understand user goals and priorities
5. ONLY THEN deploy appropriate agents with proper context

## Core Identity Characteristics
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
2. If not, check .superagent/agent-catalog.json for recommendations
3. Install from global library: cp ~/.superagent-zero-2/agents/[category]/[agent].md .claude/agents/
4. OR create custom agent based on requirements
5. Always explain what you're doing and why

## First Launch Protocol

### Phase 1: Interactive Discovery
1. **Greet user as SuperAgent Zero** with confidence and capability overview
2. **Analyze project context** by examining current directory and files  
3. **Share initial observations** about project state and potential
4. **Ask targeted questions** based on project type to understand goals

### Phase 2: Context-Aware Questioning

**For Empty/New Projects:**
```
"Hello! I'm SuperAgent Zero, your AI superintendent.

I see this is an empty project directory - perfect for planning something new from scratch.

My initial observations:
- Clean slate for architecture decisions
- Opportunity to choose optimal tech stack  
- Can plan for scalability from day one

To help you effectively, I'd like to understand:
- What type of project are you envisioning? (web app, mobile app, API, etc.)
- What's your primary goal? (MVP for validation, learning project, production app, etc.)
- Any technology preferences or constraints?
- Timeline or specific requirements?

Based on your answers, I'll deploy our project-planner with proper context."
```

**For Existing Projects:**
```  
"Hello! I'm SuperAgent Zero, your AI superintendent.

I see you have a [React/Node.js/Python/etc.] project with [X files, Y components, Z dependencies].

My initial observations:
- [Architecture pattern observed]
- [Test coverage status]
- [Potential optimization areas]
- [Dependencies analysis]

To provide the most valuable analysis:
- What specific areas concern you? (performance, security, maintainability, etc.)
- Are you looking to optimize existing features or planning new ones?
- Any specific challenges you're facing?
- What's your main priority right now?

I'll then deploy our project-analyzer with focused direction."
```

**For Complex/Partial Projects:**
```
"Hello! I'm SuperAgent Zero, your AI superintendent.

I see this is a partially built project with some existing code and potential for expansion.

My initial observations:
- [Existing components/structure]
- [Technology choices made]
- [Areas that appear incomplete or planned]
- [Opportunities for optimization or extension]

To coordinate the best approach:
- Are you primarily looking to analyze and improve what exists?
- Or focus on planning and building new features?
- What's working well that we should preserve?
- What are your biggest pain points or goals?

I'll deploy our project-coordinator to balance analysis and planning."
```

### Phase 3: Agent Deployment with Context
5. **Deploy appropriate starter agent** with user-provided context and goals
6. **Process agent recommendations** and explain rationale to user
7. **Install recommended agents** based on priority and user preferences  
8. **Establish workflow** with multi-agent coordination plan

## Agent Discovery & Installation
```bash
# Check available agents in global library
ls ~/.superagent-zero-2/agents/

# View complete agent catalog with descriptions
cat .superagent/agent-catalog.json

# Install an agent from global library
cp ~/.superagent-zero-2/agents/[category]/[agent].md .claude/agents/

# Check currently installed agents
ls .claude/agents/
```

## Agent Recommendations
Use the agent catalog to recommend agents based on:
- Project type and technology stack
- User requirements and pain points
- Existing project structure and patterns
- Development phase and priorities

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
    
    # Check if already initialized (only check memory system, not CLAUDE.md since we handle existing ones)
    if [ -d ".superagent/memory" ] && [ -d ".claude/agents" ]; then
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
    
    # Determine starter agents based on project complexity
    if [ "$PROJECT_TYPE" = "empty" ]; then
        STARTER_AGENT="project-planner"
        AGENTS_TO_INSTALL="project-planner memory-manager"
        print_status "New project - installing project-planner and memory-manager"
    elif [ "$PROJECT_TYPE" = "existing" ]; then
        STARTER_AGENT="project-analyzer" 
        AGENTS_TO_INSTALL="project-analyzer memory-manager"
        print_status "Existing project - installing project-analyzer and memory-manager"
    else
        # For partial/complex projects, install coordinator + both analyzer and planner
        STARTER_AGENT="project-coordinator"
        AGENTS_TO_INSTALL="project-coordinator project-analyzer project-planner memory-manager"
        print_status "Complex project detected - installing full coordination suite"
    fi
    
    # Copy starter agents
    for agent in $AGENTS_TO_INSTALL; do
        if [ -f "$INSTALL_DIR/agents/starter/$agent.md" ]; then
            cp "$INSTALL_DIR/agents/starter/$agent.md" ".claude/agents/"
        fi
    done
    print_success "Installed starter agents: $AGENTS_TO_INSTALL"
    
    # Create CLAUDE.md
    print_status "Creating SuperAgent Zero identity..."
    handle_claude_md
    print_success "SuperAgent Zero identity configured"
    
    # Initialize memory
    print_status "Initializing memory system..."
    init_memory "$PROJECT_TYPE"
    print_success "Memory system initialized"
    
    # Copy agent catalog to project
    print_status "Installing agent catalog..."
    if [ -f "$INSTALL_DIR/agent-catalog.json" ]; then
        cp "$INSTALL_DIR/agent-catalog.json" ".superagent/"
        print_success "Agent catalog installed"
    else
        print_warning "Agent catalog not found - agent discovery may be limited"
    fi
    
    printf "\n"
    printf "%s\n" "${GREEN}✨ SuperAgent Zero 2.0 Activated!${NC}"
    printf "\n"
    printf "%s\n" "Verification:"
    printf "%s\n" "- Project directory: ${BLUE}$(pwd)${NC}"
    printf "%s\n" "- Identity file: ${BLUE}CLAUDE.md${NC} $([ -f "CLAUDE.md" ] && echo "✓" || echo "✗")"
    printf "%s\n" "- Agents installed: $(ls -1 .claude/agents/ 2>/dev/null | wc -l | xargs) agents"
    printf "%s\n" "- Memory system: ${BLUE}.superagent/memory/${NC} $([ -d ".superagent/memory" ] && echo "✓" || echo "✗")"
    printf "%s\n" "- Agent catalog: ${BLUE}.superagent/agent-catalog.json${NC} $([ -f ".superagent/agent-catalog.json" ] && echo "✓" || echo "✗")"
    printf "\n"
    printf "%s\n" "Next steps:"
    printf "%s\n" "1. ${YELLOW}IMPORTANT:${NC} Start Claude Code from THIS directory: ${BLUE}claude${NC}"
    printf "%s\n" "2. SuperAgent Zero will greet you and analyze your project"
    printf "%s\n" "3. Follow recommendations for additional agents"
    printf "\n"
    printf "%s\n" "Commands:"
    printf "%s\n" "- Add more agents: ${BLUE}~/.superagent-zero-2/setup.sh --add-agents${NC}"
    printf "%s\n" "- Update framework: ${BLUE}~/.superagent-zero-2/update.sh${NC}"
    printf "\n"
    printf "%s\n" "${YELLOW}Troubleshooting:${NC}"
    printf "%s\n" "- If SuperAgent Zero doesn't activate, ensure you start ${BLUE}claude${NC} from this directory"
    printf "%s\n" "- Claude Code reads CLAUDE.md for identity from the current directory"
    printf "%s\n" "- Check that CLAUDE.md exists in the project root (not in .claude/)"
    printf "\n"
}

# Run main
main "$@"
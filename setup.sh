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
        echo "1) Move existing CLAUDE.md to .superagent/memory/project.md and create SuperAgent Zero CLAUDE.md"
        echo "2) Backup existing CLAUDE.md and create SuperAgent Zero CLAUDE.md"
        echo "3) Append SuperAgent Zero config to existing CLAUDE.md"
        echo "4) Skip CLAUDE.md setup (manual configuration required)"
        echo ""
        
        while true; do
            read -p "Choose option (1/2/3/4): " choice
            case $choice in
                1)
                    move_to_project_md_and_create_claude_md
                    break
                    ;;
                2)
                    backup_and_create_claude_md
                    break
                    ;;
                3)
                    append_to_claude_md
                    break
                    ;;
                4)
                    print_warning "Skipping CLAUDE.md setup - SuperAgent Zero may not activate automatically"
                    echo "To enable SuperAgent Zero, add the identity configuration to your existing CLAUDE.md"
                    echo "See: ~/.superagent-zero-2/docs/claude-md-template.md"
                    break
                    ;;
                *)
                    echo "Please enter 1, 2, 3, or 4"
                    ;;
            esac
        done
    else
        create_claude_md
    fi
}

# Move existing CLAUDE.md to project.md and create new SuperAgent Zero CLAUDE.md
move_to_project_md_and_create_claude_md() {
    # Ensure memory directory exists
    mkdir -p .superagent/memory
    
    # Create project.md header and move existing content
    cat > .superagent/memory/project.md << PROJECT_HEADER
# Project Configuration & Evolution

## Original Project Instructions
The following are the original project instructions that were in CLAUDE.md before SuperAgent Zero setup:

---

PROJECT_HEADER
    
    # Append the existing CLAUDE.md content
    cat CLAUDE.md >> .superagent/memory/project.md
    
    cat >> .superagent/memory/project.md << PROJECT_FOOTER

---

## SuperAgent Zero Project Profile
- Setup Date: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
- Project Type: To be determined through discovery
- Technology Stack: To be analyzed
- Primary Goals: To be discovered through user interaction

## Agent Deployment History
- Initial Agents: To be installed based on project type
- Successful Patterns: To be documented
- User Preferences: To be learned over time

## Project Evolution Log
This section will be maintained by the memory-manager agent to track:
- Key decisions and rationale
- Architecture evolution
- User feedback and preferences
- Successful agent combinations
- Project milestones and insights

Last Updated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
PROJECT_FOOTER

    print_status "Moved existing CLAUDE.md to .superagent/memory/project.md"
    create_claude_md
    print_status "Created new SuperAgent Zero CLAUDE.md"
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
- Import key insights: .superagent/memory/insights.md
- Review session todos: Use TodoWrite tool for current tasks
- Check user preferences: .superagent/memory/superagent.md

### Dynamic Agent Management
When users need capabilities:
1. **Use Claude Code's native agent discovery** - you can see available agents
2. **Deploy existing agents** via Task tool when capability matches
3. **Let starter agents handle installation** - they analyze needs and install specialists
4. **Only manually install for custom requirements** or unique needs
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
    # Copy CLAUDE.md from template if it exists, otherwise create from embedded content
    if [ -f "$INSTALL_DIR/memory-templates/CLAUDE.md" ]; then
        cp "$INSTALL_DIR/memory-templates/CLAUDE.md" CLAUDE.md
        print_status "Created CLAUDE.md from template"
    else
        print_error "CLAUDE.md template not found in installation directory"
        print_error "SuperAgent Zero may not activate properly"
        print_error "Please reinstall SuperAgent Zero or check installation"
        exit 1
    fi
}

# Initialize memory system
init_memory() {
    local project_type="$1"
    
    # Only create project.md if it doesn't exist (might have been created by move function)
    if [ ! -f ".superagent/memory/project.md" ]; then
        # Copy project.md from template if it exists, otherwise create basic version
        if [ -f "$INSTALL_DIR/memory-templates/project.md" ]; then
            cp "$INSTALL_DIR/memory-templates/project.md" .superagent/memory/project.md
            # Update with setup-specific information
            sed -i '' "s/\[Date\]/$(date -u +"%Y-%m-%dT%H:%M:%SZ")/g" .superagent/memory/project.md
            sed -i '' "s/\[Project Name\]/$project_type project/g" .superagent/memory/project.md
            sed -i '' "s/\[Timestamp\]/$(date -u +"%Y-%m-%dT%H:%M:%SZ")/g" .superagent/memory/project.md
        else
            # Fallback if template not found
            cat > .superagent/memory/project.md << PROJECT_EOF
# Project Configuration & Evolution

## SuperAgent Zero Project Profile
- Setup Date: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
- Project Type: $project_type
- Technology Stack: To be analyzed
- Primary Goals: To be discovered through user interaction

For comprehensive project tracking template, see memory-templates/project.md

Last Updated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
PROJECT_EOF
        fi
    fi
    

    # Copy insights.md from template if it exists, otherwise create basic version
    if [ -f "$INSTALL_DIR/memory-templates/insights.md" ]; then
        cp "$INSTALL_DIR/memory-templates/insights.md" .superagent/memory/insights.md
        sed -i '' "s/\[Timestamp\]/$(date -u +"%Y-%m-%dT%H:%M:%SZ")/g" .superagent/memory/insights.md
    else
        # Fallback if template not found
        cat > .superagent/memory/insights.md << INSIGHTS_EOF
# Accumulated Insights - SuperAgent Zero

## Note
For comprehensive insights template with agent-specific sections, see memory-templates/insights.md

## Project Understanding
- Architecture: To be analyzed
- Patterns: To be discovered

## Technical Decisions
- To be documented as discovered

Last Updated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
INSIGHTS_EOF
    fi

    # Copy superagent.md from template if it exists, otherwise create basic version
    if [ -f "$INSTALL_DIR/memory-templates/superagent.md" ]; then
        cp "$INSTALL_DIR/memory-templates/superagent.md" .superagent/memory/superagent.md
        sed -i '' "s/\[Timestamp\]/$(date -u +"%Y-%m-%dT%H:%M:%SZ")/g" .superagent/memory/superagent.md
    else
        # Fallback if template not found
        cat > .superagent/memory/superagent.md << SUPERAGENT_EOF
# SuperAgent Zero Self-Improvement Log

## Adaptive Configuration Updates
This log tracks modifications to the Adaptive Configuration section in CLAUDE.md

### Update History
- Setup Date: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
- Initial Configuration: Default settings

## Learning Patterns
### User Preferences
- Communication style: To be learned
- Technical depth: To be discovered
- Workflow pace: To be observed

### Effective Strategies
- What works: To be documented
- What to avoid: To be learned
- Optimizations: To be discovered

## Protocol Evolution
Track how SuperAgent Zero's approaches evolve based on user feedback and outcomes.

Last Updated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
SUPERAGENT_EOF
    fi

    # Copy workflows.md from template if it exists, otherwise create basic version
    if [ -f "$INSTALL_DIR/memory-templates/workflows.md" ]; then
        cp "$INSTALL_DIR/memory-templates/workflows.md" .superagent/memory/workflows.md
        # Add timestamp to copied file
        echo -e "\n\nLast Updated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> .superagent/memory/workflows.md
    else
        # Fallback if template not found
        cat > .superagent/memory/workflows.md << WORKFLOWS_EOF
# Agent Workflow Management

## Agent Installation Protocol

### CRITICAL: Context Restart Required
**Task tool only recognizes agents available at startup. After installing new agents, you MUST restart Claude Code context.**

### Note
For comprehensive workflow patterns, see memory-templates/workflows.md

Last Updated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
WORKFLOWS_EOF
    fi
}

# Project-type agent recommendations
get_project_recommendations() {
    local project_type="$1"
    
    case "$project_type" in
        "web-app")
            echo "frontend-developer backend-architect test-writer-fixer ui-designer"
            ;;
        "mobile-app")
            echo "mobile-app-builder ui-designer app-store-optimizer test-writer-fixer"
            ;;
        "ai-ml")
            echo "ai-engineer backend-architect performance-benchmarker test-writer-fixer"
            ;;
        "api-service")
            echo "backend-architect api-tester devops-automator performance-benchmarker"
            ;;
        "data-analytics")
            echo "ai-engineer analytics-reporter performance-benchmarker test-writer-fixer"
            ;;
        "devops")
            echo "devops-automator infrastructure-maintainer performance-benchmarker test-writer-fixer"
            ;;
        "marketing")
            echo "growth-hacker content-creator app-store-optimizer analytics-reporter"
            ;;
        "ecommerce")
            echo "frontend-developer backend-architect ui-designer finance-tracker"
            ;;
        *)
            echo "frontend-developer backend-architect test-writer-fixer ui-designer"
            ;;
    esac
}

# Show project-type specific recommendations
show_recommendations() {
    printf "%s\n" "${BLUE}💡 Project-Type Recommendations:${NC}"
    echo ""
    echo "Choose a project type for optimized agent selection:"
    echo "1) Web Application (frontend-developer, backend-architect, test-writer-fixer, ui-designer)"
    echo "2) Mobile App (mobile-app-builder, ui-designer, app-store-optimizer, test-writer-fixer)"
    echo "3) AI/ML Project (ai-engineer, backend-architect, performance-benchmarker, test-writer-fixer)"
    echo "4) API Service (backend-architect, api-tester, devops-automator, performance-benchmarker)"
    echo "5) Data Analytics (ai-engineer, analytics-reporter, performance-benchmarker, test-writer-fixer)"
    echo "6) DevOps/Infrastructure (devops-automator, infrastructure-maintainer, performance-benchmarker, test-writer-fixer)"
    echo "7) Marketing/Growth (growth-hacker, content-creator, app-store-optimizer, analytics-reporter)"
    echo "8) E-commerce (frontend-developer, backend-architect, ui-designer, finance-tracker)"
    echo "9) Custom selection"
    echo ""
    
    read -p "Select project type (1-9): " project_choice
    
    case $project_choice in
        1) get_project_recommendations "web-app" ;;
        2) get_project_recommendations "mobile-app" ;;
        3) get_project_recommendations "ai-ml" ;;
        4) get_project_recommendations "api-service" ;;
        5) get_project_recommendations "data-analytics" ;;
        6) get_project_recommendations "devops" ;;
        7) get_project_recommendations "marketing" ;;
        8) get_project_recommendations "ecommerce" ;;
        9) echo "custom" ;;
        *) echo "" ;;
    esac
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
    
    # Show recommendations first
    recommended_agents=$(show_recommendations)
    
    if [ "$recommended_agents" = "custom" ]; then
        # Show available agents for custom selection
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
        
        if [ "$agent_selection" = "exit" ]; then
            return
        fi
    elif [ -n "$recommended_agents" ]; then
        agent_selection="$recommended_agents"
        printf "%s\n" "${GREEN}Installing recommended agents: $agent_selection${NC}"
        echo ""
    else
        return
    fi
    
    # Install selected agents
    if [ -n "$agent_selection" ]; then
        printf "%s\n" "${YELLOW}⚠️  IMPORTANT: Context Restart Required${NC}"
        printf "%s\n" "${YELLOW}After installation, you must restart Claude Code context to use new agents.${NC}"
        printf "%s\n" "${YELLOW}Reason: Task tool only recognizes agents available at startup.${NC}"
        echo ""
        
        read -p "Continue with installation? (y/n): " confirm
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            return
        fi
        
        IFS=',' read -ra AGENTS <<< "$agent_selection"
        installed_count=0
        
        for agent in "${AGENTS[@]}"; do
            agent=$(echo "$agent" | xargs) # trim whitespace
            # Find and copy agent
            found=false
            for category in "$INSTALL_DIR"/agents/*/; do
                if [ -f "$category$agent.md" ]; then
                    cp "$category$agent.md" ".claude/agents/"
                    print_success "Installed $agent"
                    found=true
                    installed_count=$((installed_count + 1))
                    break
                fi
            done
            if [ "$found" = false ]; then
                print_error "Agent '$agent' not found"
            fi
        done
        
        if [ $installed_count -gt 0 ]; then
            echo ""
            printf "%s\n" "${GREEN}✅ Successfully installed $installed_count agents${NC}"
            echo ""
            printf "%s\n" "${YELLOW}🔄 NEXT STEPS:${NC}"
            printf "%s\n" "1. ${BLUE}Exit Claude Code${NC} (Ctrl+C or close terminal)"
            printf "%s\n" "2. ${BLUE}Restart Claude Code${NC} from this directory: ${BLUE}claude${NC}"
            printf "%s\n" "3. ${BLUE}Verify agents${NC} are available with: 'What agents do I have?'"
            echo ""
            printf "%s\n" "${GREEN}💡 TIP: Install related agents together to minimize restarts!${NC}"
        fi
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
    
    # Framework update protection - detect existing installations
    EXISTING_INSTALLATION=false
    if [ -d ".superagent/memory" ] && [ -d ".claude/agents" ]; then
        EXISTING_INSTALLATION=true
        
        # Check version compatibility
        if [ -f ".superagent/VERSION" ]; then
            INSTALLED_VERSION=$(cat .superagent/VERSION 2>/dev/null || echo "unknown")
            FRAMEWORK_VERSION=$(cat "$INSTALL_DIR/VERSION" 2>/dev/null || echo "2.0.0")
            
            if [ "$INSTALLED_VERSION" = "$FRAMEWORK_VERSION" ]; then
                print_warning "SuperAgent Zero v$INSTALLED_VERSION already initialized."
                echo "Use --add-agents to add more agents."
                exit 0
            else
                print_warning "Detected SuperAgent Zero v$INSTALLED_VERSION (framework v$FRAMEWORK_VERSION available)"
                echo ""
                echo "Update options:"
                echo "1) Update framework while preserving user configurations"
                echo "2) Fresh installation (backup existing configurations)"
                echo "3) Cancel and use --add-agents instead"
                echo ""
                
                while true; do
                    read -p "Choose option (1/2/3): " update_choice
                    case $update_choice in
                        1)
                            print_status "Updating framework with configuration preservation..."
                            # Create backup of user memory files
                            if [ -d ".superagent/memory" ]; then
                                cp -r .superagent/memory .superagent/memory.backup.$(date +%s)
                                print_status "Backed up existing memory files"
                            fi
                            break
                            ;;
                        2)
                            print_status "Fresh installation - backing up existing configuration..."
                            if [ -d ".superagent" ]; then
                                mv .superagent .superagent.backup.$(date +%s)
                                print_status "Backed up existing .superagent directory"
                            fi
                            if [ -d ".claude" ]; then
                                mv .claude .claude.backup.$(date +%s)
                                print_status "Backed up existing .claude directory"
                            fi
                            EXISTING_INSTALLATION=false
                            break
                            ;;
                        3)
                            echo "Use --add-agents to add more agents without framework changes."
                            exit 0
                            ;;
                        *)
                            echo "Please enter 1, 2, or 3"
                            ;;
                    esac
                done
            fi
        else
            print_warning "SuperAgent Zero already initialized (version unknown)."
            echo "Use --add-agents to add more agents."
            exit 0
        fi
    fi
    
    print_status "Analyzing project complexity..."
    PROJECT_TYPE=$(detect_project)
    
    # Enhanced complexity assessment
    local file_count=$(find . -maxdepth 2 -type f | wc -l)
    local code_files=$(find . -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.go" -o -name "*.rs" -o -name "*.java" -o -name "*.cpp" | wc -l)
    local config_complexity=0
    
    # Advanced configuration detection
    [ -f "package.json" ] && config_complexity=$((config_complexity + 2))
    [ -f "package-lock.json" ] && config_complexity=$((config_complexity + 1))
    [ -f "yarn.lock" ] && config_complexity=$((config_complexity + 1))
    [ -f "requirements.txt" ] && config_complexity=$((config_complexity + 2))
    [ -f "pyproject.toml" ] && config_complexity=$((config_complexity + 3))
    [ -f "Cargo.toml" ] && config_complexity=$((config_complexity + 2))
    [ -f "go.mod" ] && config_complexity=$((config_complexity + 2))
    [ -f "docker-compose.yml" ] && config_complexity=$((config_complexity + 2))
    [ -f "Dockerfile" ] && config_complexity=$((config_complexity + 1))
    [ -d ".github/workflows" ] && config_complexity=$((config_complexity + 2))
    [ -f "webpack.config.js" ] && config_complexity=$((config_complexity + 1))
    [ -f "vite.config.js" ] && config_complexity=$((config_complexity + 1))
    
    # Calculate complexity score
    complexity_score=$((file_count / 10 + code_files / 5 + config_complexity))
    
    print_success "Project Analysis: $PROJECT_TYPE (complexity: $complexity_score)"
    
    # Create directories
    print_status "Creating project structure..."
    mkdir -p .claude/agents
    mkdir -p .superagent/memory
    
    # Enhanced starter agent selection logic
    if [ "$PROJECT_TYPE" = "empty" ] && [ $complexity_score -lt 3 ]; then
        # Simple new project
        STARTER_AGENT="project-planner"
        AGENTS_TO_INSTALL="project-planner custom-agent-builder memory-manager"
        print_status "Simple new project - installing project-planner + custom-agent-builder"
    elif [ "$PROJECT_TYPE" = "existing" ] && [ $complexity_score -lt 5 ]; then
        # Simple existing project
        STARTER_AGENT="project-analyzer"
        AGENTS_TO_INSTALL="project-analyzer custom-agent-builder memory-manager"
        print_status "Simple existing project - installing project-analyzer + custom-agent-builder"
    elif [ "$PROJECT_TYPE" = "empty" ] && [ $complexity_score -ge 3 ]; then
        # Complex new project - might need both planning and custom solutions
        STARTER_AGENT="project-planner"
        AGENTS_TO_INSTALL="project-planner custom-agent-builder memory-manager"
        print_status "Complex new project - installing planner + custom-agent-builder"
    elif [ "$PROJECT_TYPE" = "existing" ] && [ $complexity_score -ge 5 ]; then
        # Complex existing project - needs coordination
        STARTER_AGENT="project-coordinator"
        AGENTS_TO_INSTALL="project-coordinator project-analyzer custom-agent-builder memory-manager"
        print_status "Complex existing project - installing coordination suite + custom-agent-builder"
    else
        # Partial/mixed projects or moderate complexity - full coordination
        STARTER_AGENT="project-coordinator"
        AGENTS_TO_INSTALL="project-coordinator project-analyzer project-planner custom-agent-builder memory-manager"
        print_status "Mixed/partial project - installing full coordination suite + custom-agent-builder"
    fi
    
    # Add custom-agent-builder for high complexity scenarios
    if [ $complexity_score -ge 8 ]; then
        if [[ ! $AGENTS_TO_INSTALL =~ "custom-agent-builder" ]]; then
            AGENTS_TO_INSTALL="$AGENTS_TO_INSTALL custom-agent-builder"
            print_status "High complexity detected - adding custom-agent-builder"
        fi
    fi
    
    # Copy starter agents (preserve existing if update)
    installed_agents=""
    for agent in $AGENTS_TO_INSTALL; do
        if [ -f "$INSTALL_DIR/agents/starter/$agent.md" ]; then
            if [ "$EXISTING_INSTALLATION" = "true" ] && [ -f ".claude/agents/$agent.md" ]; then
                # During updates, backup existing agent if modified
                if ! cmp -s "$INSTALL_DIR/agents/starter/$agent.md" ".claude/agents/$agent.md" 2>/dev/null; then
                    cp ".claude/agents/$agent.md" ".claude/agents/$agent.md.backup.$(date +%s)"
                    print_status "Backed up modified $agent.md"
                fi
            fi
            cp "$INSTALL_DIR/agents/starter/$agent.md" ".claude/agents/"
            installed_agents="$installed_agents $agent"
        else
            print_warning "Starter agent $agent.md not found in installation"
        fi
    done
    print_success "Installed starter agents:$installed_agents"
    
    # Create CLAUDE.md
    print_status "Creating SuperAgent Zero identity..."
    handle_claude_md
    print_success "SuperAgent Zero identity configured"
    
    # Initialize memory
    print_status "Initializing memory system..."
    init_memory "$PROJECT_TYPE"
    print_success "Memory system initialized"
    
    # Update project.md with installed agents list for SuperAgent Zero awareness
    if [ -f ".superagent/memory/project.md" ] && [ -n "$installed_agents" ]; then
        # Update the installed agents section in project.md
        sed -i '' "s/\*\*Starter Agents\*\*: \[To be populated during setup\]/\*\*Starter Agents\*\*:$installed_agents/g" .superagent/memory/project.md
        print_status "Updated project.md with installed starter agents list"
        
        # Also update the Session Discoveries section with setup timestamp
        sed -i '' "s/\*\*Date\*\*: \[Session date\/time\]/\*\*Date\*\*: $(date -u +"%Y-%m-%dT%H:%M:%SZ") - Initial Setup/g" .superagent/memory/project.md
        sed -i '' "s/\*\*Context\*\*: \[What the session focused on\]/\*\*Context\*\*: SuperAgent Zero initial setup for $PROJECT_TYPE project/g" .superagent/memory/project.md
    fi
    
    # Copy agent catalog and version info to project
    print_status "Installing agent catalog..."
    if [ -f "$INSTALL_DIR/agent-catalog.json" ]; then
        cp "$INSTALL_DIR/agent-catalog.json" ".superagent/"
        print_success "Agent catalog installed (51 agents available)"
    else
        print_warning "Agent catalog not found - agent discovery may be limited"
    fi
    
    # Install version tracking
    if [ -f "$INSTALL_DIR/VERSION" ]; then
        cp "$INSTALL_DIR/VERSION" ".superagent/"
        print_status "Version tracking enabled"
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
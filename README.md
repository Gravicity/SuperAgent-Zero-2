# 🧠 SuperAgent-Zero 2.0

Transform Claude Code into a persistent superintelligent AI coordinator with access to specialized agents. Built natively for Claude Code's SubAgent system.

## ✨ What is SuperAgent-Zero?

SuperAgent-Zero turns Claude Code into your personal AI superintendent - a persistent, intelligent coordinator that manages a team of specialized agents. Each agent is an expert in their domain, from backend architecture to UI design, from AI integration to growth hacking.

### Key Features

- 🤖 **Persistent Identity**: Claude Code becomes SuperAgent Zero across all sessions
- 🧠 **Interactive Discovery**: Engages users before deploying agents for better context
- 🎯 **Smart Agent Recommendations**: Analyzes your project and suggests the right specialists
- 📦 **50 Pre-built Agents**: Engineering, design, marketing, product, testing, and business operations experts
- 🛠️ **Custom Agent Creation**: Build specialized agents for your unique needs
- 🧬 **Adaptive Learning**: Evolves based on user feedback and project patterns
- 🔍 **Memory System**: Sophisticated knowledge updates and retrieval across project history
- 🚀 **Native Integration**: Built specifically for Claude Code's SubAgent system

## 🎬 Quick Start

### 1. Install Globally (One Time)

```bash
curl -sSL https://raw.githubusercontent.com/Gravicity/SuperAgent-Zero-2/main/install.sh | bash
```

This installs the agent library to `~/.superagent-zero-2/`

### 2. Initialize Your Project

```bash
cd your-project
~/.superagent-zero-2/setup.sh
```

**Enhanced Setup Features:**
- 🧠 **Intelligent Project Detection**: Analyzes complexity and selects optimal starter agents
- 🔒 **Framework Update Protection**: Preserves user configurations during updates
- ⚡ **Smart Agent Selection**: Deploys elite coordination suite for complex projects
- 📊 **50-Agent Catalog Integration**: Full access to specialized agent library

### 3. Start Claude Code

```bash
claude init
```

**Note**: `claude init` is required (not just `claude`) so that Claude Code reads the project files and CLAUDE.md identity configuration that was installed in step 2.\n\nThat's it! Claude Code now identifies as SuperAgent Zero and has access to specialized agents.

## 🎭 How It Works

### Enhanced Setup Intelligence

SuperAgent-Zero 2.0 features an intelligent setup system that analyzes your project and deploys optimal agents:

**Project Complexity Assessment:**
- **File count analysis**: Counts project files and code files
- **Configuration detection**: Identifies 12+ different config file types with weighted scoring
- **Technology stack analysis**: Detects frameworks, databases, and deployment configurations

**Smart Agent Selection:**
- **Simple projects** (complexity <3-5): Single elite agent (analyzer OR planner)
- **Complex projects** (complexity ≥5): Coordination suite with multi-agent workflows
- **High complexity** (≥8): Full orchestration + custom-agent-builder integration
- **Automatic custom-agent-builder**: Added for projects needing unique solutions

### First Launch

**For Existing Projects:**
```
SuperAgent Zero: "Hello! I'm SuperAgent Zero, your superintelligent AI coordinator. 

I see you have a Node.js project with 25 files, Express server, and MongoDB.

My initial observations:
- RESTful API structure with middleware pattern
- No test coverage detected
- Database queries could benefit from optimization
- Missing error handling in some endpoints

To provide the most valuable analysis:
- What specific areas concern you? (performance, security, maintainability, etc.)
- Are you looking to optimize existing features or planning new ones?
- Any specific challenges you're facing?

Based on your answers, I'll deploy our project-analyzer with focused direction."
```

**For New Projects:**
```
SuperAgent Zero: "Hello! I'm SuperAgent Zero, your AI superintendent.

I see this is an empty project directory - perfect for planning something new from scratch.

My initial observations:
- Clean slate for architecture decisions
- Opportunity to choose optimal tech stack  
- Can plan for scalability from day one

To help you build exactly what you need, I'd like to understand your project:

1. **What type of project are you envisioning?** 
   (web app, mobile app, API service, desktop app, CLI tool, library, etc.)

2. **What's your primary goal with this project?** 
   (MVP for validation, learning project, production app, client work, personal tool, etc.)

3. **Do you have any technology preferences or constraints?** 
   (specific languages, frameworks, platforms, deployment requirements, etc.)

4. **What's your timeline and scope?** 
   (days, weeks, months? core features vs full feature set?)

Based on your answers, I'll deploy our project-planner with proper context."
```

**For Complex Projects:**
```
SuperAgent Zero: "I see this is a partially built project with some existing code and new requirements. 
Let me deploy our project coordinator to strategically balance analysis and planning..."

[Coordinates assessment and planning]

Project Coordinator: "I've analyzed your existing React components and planned your new AI features.
Here's the integrated approach:
- project-analyzer: Assess current frontend architecture
- ai-engineer: Design new ML integration  
- frontend-developer: Bridge existing and new components"
```

### Installing Agents
```
User: "Install the backend architect"

SuperAgent Zero: "⚠️  IMPORTANT: After installing agents, you'll need to restart Claude Code context.
Reason: Task tool only recognizes agents available at startup.

I recommend installing related agents together to minimize restarts.
For your project type, I suggest: backend-architect, frontend-developer, test-writer-fixer, ui-designer

Shall I install this complete set?"

User: "Yes"

SuperAgent Zero: "Installing web development agent set... Done!

🔄 NEXT STEPS:
1. Exit Claude Code (Ctrl+C)
2. Restart Claude Code from this directory: claude
3. Verify agents with: 'What agents do I have?'

💡 TIP: These agents work great together for full-stack development!"
```

### Deploying Agents (After Restart)
```
User: "Design the mobile app architecture"

SuperAgent Zero: "I'll deploy our mobile-app-builder to create the technical architecture."

[Uses Task tool with:]
- description: "Design mobile app architecture" 
- prompt: "Create technical architecture for MindCoach AI..."
- subagent_type: "mobile-app-builder"

mobile-app-builder: "I've designed a comprehensive Flutter-based architecture..."
```

**🚨 IMPORTANT: SuperAgent Zero uses Claude Code's native Task tool for agent deployment. It should NEVER generate Python scripts or custom handlers.**

### Creating Custom Agents
```
User: "I need help migrating from jQuery to React"

SuperAgent Zero: "I don't see a specific jQuery-to-React migration agent. 
Let me create a custom one for you. This agent will understand both 
jQuery patterns and React best practices..."

[Creates specialized migration agent]
```

## 📂 Project Structure

After initialization, your project will have:

```
your-project/
├── CLAUDE.md                  # SuperAgent Zero identity (auto-loaded)
├── .claude/
│   └── agents/                # Your specialized agents
│       ├── project-analyzer.md    (for existing projects)
│       ├── project-planner.md     (for new projects)  
│       ├── project-coordinator.md (for complex projects)
│       ├── memory-manager.md      (knowledge retrieval specialist)
│       └── [additional agents].md
└── .superagent/
    ├── agent-catalog.json     # Complete agent library catalog
    └── memory/                # Persistent memory system
        ├── project.md         # Project evolution & milestones
        ├── superagent.md      # User preferences & learning patterns  
        ├── workflows.md       # Proven agent coordination patterns
        └── insights.md        # Agent discoveries organized by domain
```

## 🤝 Available Agents

### Starter Agents (5)
- **project-analyzer** (Elite Project Intelligence Specialist): Deep codebase analysis, architecture assessment, tech debt identification
- **project-planner** (Elite Strategic Project Architect): Vision-to-roadmap transformation, scalable architecture design
- **project-coordinator** (Elite Strategic Orchestration Specialist): Complex scenario management, multi-agent conflict resolution
- **custom-agent-builder**: Create bespoke agents for unique requirements beyond the 50-agent catalog
- **memory-manager**: RAG-like search, pattern analysis, complex handoffs, and knowledge synthesis

### Engineering Agents (12)
- **ai-engineer**: AI/ML integration specialist
- **backend-architect**: API and system design expert
- **frontend-developer**: Modern UI framework specialist
- **mobile-app-builder**: iOS/Android development expert
- **devops-automator**: CI/CD and infrastructure specialist
- **rapid-prototyper**: Fast MVP development and validation
- **test-writer-fixer**: Comprehensive test coverage and bug fixes
- **security-auditor**: Security analysis and vulnerability assessment
- **data-engineer**: Database design and data pipeline optimization
- **documentation-architect**: Technical documentation and API docs
- **blockchain-developer**: Smart contracts and DeFi development
- **game-developer**: Game mechanics and interactive experience design

### Design Agents (6)
- **ui-designer**: Interface and component design
- **ux-researcher**: User experience optimization
- **visual-storyteller**: Data visualization and narrative design
- **brand-guardian**: Brand consistency and guidelines
- **whimsy-injector**: User delight and micro-interactions
- **accessibility-specialist**: WCAG compliance and inclusive design

### Marketing Agents (9)
- **content-creator**: Multi-platform content strategy
- **growth-hacker**: User acquisition and retention
- **app-store-optimizer**: Organic discovery and ASO
- **instagram-curator**: Visual content and social growth
- **reddit-community-builder**: Authentic community engagement
- **tiktok-strategist**: Viral content and trends
- **twitter-engager**: Real-time engagement and thought leadership
- **seo-optimizer**: Search engine optimization and organic traffic
- **email-marketing-specialist**: Email campaigns and automation

### Product Agents (5)
- **trend-researcher**: Market analysis and opportunities
- **feedback-synthesizer**: User research and insights
- **sprint-prioritizer**: Agile planning and feature prioritization
- **competitive-intelligence-researcher**: Deep competitive analysis and market intelligence
- **product-clone-architect**: Strategic clone planning and technical implementation

### Testing & QA Agents (5)
- **api-tester**: API testing and validation
- **performance-benchmarker**: Speed and optimization
- **test-results-analyzer**: Quality metrics and reporting
- **tool-evaluator**: Development tool assessment
- **workflow-optimizer**: Process improvement

### Studio Operations (6)
- **analytics-reporter**: Data analysis and performance tracking
- **finance-tracker**: Budget management and cost optimization
- **infrastructure-maintainer**: System reliability and scaling
- **legal-compliance-checker**: Regulatory compliance and risk management
- **support-responder**: Customer support optimization
- **customer-success-manager**: Client relationship management and retention

### Team Dynamics (2)
- **joker**: Tech humor and team morale
- **studio-coach**: Performance coaching and coordination

### Project Management (3)
- **experiment-tracker**: A/B testing and feature validation
- **project-shipper**: Release management and deployment
- **studio-producer**: End-to-end project coordination

[View all agents →](https://github.com/Gravicity/SuperAgent-Zero-2/tree/main/agents)

## 🧬 Memory System

SuperAgent Zero maintains a sophisticated memory system across sessions:

- **Adaptive Learning**: Evolves based on user feedback and preferences
- **Workflow Intelligence**: Starter agents document coordination patterns; SuperAgent validates and refines them
- **Project Evolution**: Tracks architectural decisions and milestones
- **Knowledge Retrieval**: RAG-like search across all project memory
- **Context Preservation**: Maintains session continuity and handoffs
- **Self-Improving Coordination**: Learns optimal agent deployment patterns over time

SuperAgent Zero manages memory directly for efficiency, while the memory-manager agent provides specialized knowledge retrieval and synthesis capabilities.

## 🧠 Advanced Capabilities

### Interactive Discovery Protocol
SuperAgent Zero engages in meaningful conversation before deploying agents:
- Analyzes your project context and shares observations
- Asks targeted questions based on project type
- Gathers user goals and priorities
- Deploys agents with proper context and direction

### Adaptive Learning System
- **User Preference Learning**: Adapts communication style and technical depth
- **Workflow Optimization**: Learns which agent combinations work best
- **Self-Improvement**: Updates its own approach based on feedback
- **Pattern Recognition**: Identifies successful strategies for different scenarios

### RAG Knowledge Retrieval
Deploy memory-manager for sophisticated operations:
- "Find all our authentication implementations across the project"
- "What patterns emerge from our successful deployments?"
- "Create a comprehensive brief for the ai-engineer about our ML pipeline"
- "Generate a technical report from our collective memory"

## 🛠️ Advanced Usage

### Adding More Agents

**⚠️ CRITICAL: Context Restart Required**

After installing new agents, you **MUST restart Claude Code** context since the Task tool only recognizes agents available at startup.

```bash
# Guided installation with project-type recommendations
~/.superagent-zero-2/setup.sh --add-agents
```

**Project-Type Agent Combinations:**

```bash
# Web Application
cp ~/.superagent-zero-2/agents/engineering/frontend-developer.md .claude/agents/
cp ~/.superagent-zero-2/agents/engineering/backend-architect.md .claude/agents/
cp ~/.superagent-zero-2/agents/engineering/test-writer-fixer.md .claude/agents/
cp ~/.superagent-zero-2/agents/design/ui-designer.md .claude/agents/

# Mobile App
cp ~/.superagent-zero-2/agents/engineering/mobile-app-builder.md .claude/agents/
cp ~/.superagent-zero-2/agents/design/ui-designer.md .claude/agents/
cp ~/.superagent-zero-2/agents/marketing/app-store-optimizer.md .claude/agents/
cp ~/.superagent-zero-2/agents/engineering/test-writer-fixer.md .claude/agents/

# AI/ML Project
cp ~/.superagent-zero-2/agents/engineering/ai-engineer.md .claude/agents/
cp ~/.superagent-zero-2/agents/engineering/backend-architect.md .claude/agents/
cp ~/.superagent-zero-2/agents/testing/performance-benchmarker.md .claude/agents/
cp ~/.superagent-zero-2/agents/engineering/test-writer-fixer.md .claude/agents/

# Then restart Claude Code context
```

**Installation Workflow:**
1. **Analyze project type** (use project-analyzer if needed)
2. **Install related agents together** (minimize restarts)
3. **Exit Claude Code** (Ctrl+C or close terminal)
4. **Restart Claude Code** from project directory: `claude`
5. **Verify agents available**: "What agents do I have?"

### Creating Project-Specific Agents

```bash
# In Claude Code
User: "Create an agent for our specific database schema migrations"

SuperAgent Zero: "I'll create a custom agent tailored to your database architecture..."
```

### Updating the Framework

```bash
# Smart update (preserves custom agents)
~/.superagent-zero-2/update.sh

# Or re-run installer
curl -sSL https://raw.githubusercontent.com/Gravicity/SuperAgent-Zero-2/main/install.sh | bash
```

## 🔧 Configuration

### For Teams

Share agents across your team by committing SuperAgent Zero setup to version control:

```bash
git add CLAUDE.md .claude/agents/ .superagent/
git commit -m "Add SuperAgent Zero setup and project agents"
```

**Note**: Consider what memory files to share:
- `.superagent/memory/project.md` - Project evolution, milestones, and preserved original instructions
- `.superagent/memory/insights.md` - Technical discoveries organized by agent domain  
- `.superagent/memory/workflows.md` - Starter agent coordination recommendations and validated patterns
- `.superagent/memory/superagent.md` - Usually add to `.gitignore` (personal preferences and learning patterns)

### Custom Agent Templates

Add your own agent templates to the global library:

```bash
cd ~/.superagent-zero-2/agents/custom/
# Add your agent templates here
```

## 🚀 Why SuperAgent-Zero?

### Before SuperAgent-Zero
- Start fresh with each Claude Code session
- Manually coordinate complex tasks
- Lose context between sessions
- No specialized expertise
- No understanding of user preferences

### With SuperAgent-Zero
- Persistent AI superintendent identity
- Interactive discovery before agent deployment
- Adaptive learning from user feedback
- Sophisticated knowledge retrieval (RAG)
- Workflow intelligence and optimization
- 50 specialized agents for every domain
- Continuous improvement and evolution

## 📚 Examples

### Web Development Project
```bash
# Initialize
~/.superagent-zero-2/setup.sh

# In Claude Code
"Analyze my React app and optimize performance"
# → Deploys project-analyzer, recommends performance-benchmarker
# → Installs and deploys performance agent
# → Provides specific optimization recommendations
```

### AI Integration
```bash
# In Claude Code
"Add AI-powered search to my app"
# → Deploys ai-engineer agent
# → Implements semantic search with embeddings
# → Sets up vector database and search UI
```

### From Scratch
```bash
# Empty directory
mkdir my-startup && cd my-startup
~/.superagent-zero-2/setup.sh

# In Claude Code
"Help me build a SaaS product"
# → Deploys project-planner
# → Creates architecture documents
# → Recommends initial agent team
# → Builds project foundation
```

## 🤔 FAQ

**Q: How is this different from regular Claude Code?**  
A: SuperAgent Zero provides persistent identity, specialized agents, and memory across sessions. Claude Code becomes a true AI superintendent.

**Q: Do I need to install agents for every project?**  
A: No, agents are installed from a global library as needed. Install once, use everywhere.

**Q: Can I create my own agents?**  
A: Yes! SuperAgent Zero can create custom agents on demand or you can add templates to the global library.

**Q: Is my data private?**  
A: All data stays local. Memory and agents are stored in your project directory.

**Q: How do updates work?**  
A: Run `~/.superagent-zero-2/update.sh` or re-run the installer. Smart updates preserve your custom agents while updating the core framework.

## 🐛 Troubleshooting

### Claude Code doesn't recognize SuperAgent Zero
- Ensure `CLAUDE.md` exists in project root (not in .claude/)
- Start Claude Code from the project directory containing CLAUDE.md
- Check that setup.sh completed successfully
- Restart Claude Code if needed

### Agents not deploying
- **MOST COMMON**: Restart Claude Code context after installing new agents
- Task tool only recognizes agents available at startup
- Verify `.claude/agents/` directory exists
- Check agent file format (proper frontmatter)
- Ensure Claude Code has file system access
- Use "What agents do I have?" to verify availability

### Memory not persisting
- Check `.superagent/memory/` directory exists with 4 memory files (project.md, insights.md, workflows.md, superagent.md)
- Verify SuperAgent Zero can write to memory files
- Ensure agent-catalog.json exists in `.superagent/` 
- Look for file permission issues or corrupted memory file format
- Memory-manager agent should be available for knowledge retrieval operations

## 🤝 Contributing

We welcome contributions! Add new agents, improve existing ones, or enhance the framework:

1. Fork the repository
2. Create your agent in the appropriate category
3. Follow the agent format guidelines
4. Submit a pull request

## 📄 License

MIT License - see [LICENSE](LICENSE) file

## 🙏 Acknowledgments

Built for the Claude Code community by developers who wanted a better AI partnership.

---

<p align="center">
  <strong>Transform Claude Code into your superintelligent AI partner.</strong><br>
  <a href="https://github.com/Gravicity/SuperAgent-Zero-2">GitHub</a> • 
  <a href="https://github.com/Gravicity/SuperAgent-Zero-2/wiki">Documentation</a> • 
  <a href="https://github.com/Gravicity/SuperAgent-Zero-2/discussions">Community</a>
</p>
# 🧠 SuperAgent-Zero 2.0

Transform Claude Code into a persistent superintelligent AI coordinator with access to specialized agents. Built natively for Claude Code's SubAgent system.

## ✨ What is SuperAgent-Zero?

SuperAgent-Zero turns Claude Code into your personal AI superintendent - a persistent, intelligent coordinator that manages a team of specialized agents. Each agent is an expert in their domain, from backend architecture to UI design, from AI integration to growth hacking.

### Key Features

- 🤖 **Persistent Identity**: Claude Code becomes SuperAgent Zero across all sessions
- 🎯 **Smart Agent Recommendations**: Analyzes your project and suggests the right specialists
- 📦 **39 Pre-built Agents**: Engineering, design, marketing, product, testing, and business operations experts
- 🛠️ **Custom Agent Creation**: Build specialized agents for your unique needs
- 🧬 **Cross-Context Memory**: Maintains knowledge and context between sessions
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

### 3. Start Claude Code

```bash
claude
```

That's it! Claude Code now identifies as SuperAgent Zero and has access to specialized agents.

## 🎭 How It Works

### First Launch

**For Existing Projects:**
```
SuperAgent Zero: "Hello! I'm SuperAgent Zero, your superintelligent AI coordinator. 
I see you're working on a Node.js project. Let me deploy our project analyzer to 
assess your codebase and recommend specialized agents..."

[Analyzes project]

Project Analyzer: "Based on my analysis, I recommend:
- backend-architect: Your API structure could be optimized
- test-writer-fixer: No test coverage detected  
- ai-engineer: Opportunity to add AI features"
```

**For New Projects:**
```
SuperAgent Zero: "Hello! I'm SuperAgent Zero. I see this is an empty project directory. 
Let me deploy our project planner to help architect your vision from concept to implementation..."

[Plans project architecture]

Project Planner: "Here's your development roadmap:
Phase 1: backend-architect + devops-automator  
Phase 2: frontend-developer + ui-designer
Phase 3: test-writer-fixer + performance-benchmarker"
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

SuperAgent Zero: "Installing backend-architect agent... Done! 
This agent specializes in designing scalable APIs and microservices. 
Shall I deploy it to review your current architecture?"
```

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
│       ├── memory-manager.md
│       └── [additional agents].md
└── .superagent/
    ├── agent-catalog.json     # Complete agent library catalog
    └── memory/                # Persistent memory system
        ├── context.md         # Current session state
        ├── insights.md        # Accumulated knowledge
        └── evolution.md       # Agent performance tracking
```

## 🤝 Available Agents

### Starter Agents (5)
- **project-analyzer**: Analyzes existing codebases and recommends improvements
- **project-planner**: Helps plan new projects from concept to implementation
- **project-coordinator**: Manages complex scenarios (migrations, refactoring, partial projects)
- **memory-manager**: Maintains context and insights across sessions
- **agent-enhancer**: Enhances existing agents with memory integration

### Engineering Agents (7)
- **ai-engineer**: AI/ML integration specialist
- **backend-architect**: API and system design expert
- **frontend-developer**: Modern UI framework specialist
- **mobile-app-builder**: iOS/Android development expert
- **devops-automator**: CI/CD and infrastructure specialist
- **rapid-prototyper**: Fast MVP development and validation
- **test-writer-fixer**: Comprehensive test coverage and bug fixes

### Design Agents (5)
- **ui-designer**: Interface and component design
- **ux-researcher**: User experience optimization
- **visual-storyteller**: Data visualization and narrative design
- **brand-guardian**: Brand consistency and guidelines
- **whimsy-injector**: User delight and micro-interactions

### Marketing Agents (7)
- **content-creator**: Multi-platform content strategy
- **growth-hacker**: User acquisition and retention
- **app-store-optimizer**: Organic discovery and ASO
- **instagram-curator**: Visual content and social growth
- **reddit-community-builder**: Authentic community engagement
- **tiktok-strategist**: Viral content and trends
- **twitter-engager**: Real-time engagement and thought leadership

### Product Agents (3)
- **trend-researcher**: Market analysis and opportunities
- **feedback-synthesizer**: User research and insights
- **sprint-prioritizer**: Agile planning and feature prioritization

### Testing & QA Agents (5)
- **api-tester**: API testing and validation
- **performance-benchmarker**: Speed and optimization
- **test-results-analyzer**: Quality metrics and reporting
- **tool-evaluator**: Development tool assessment
- **workflow-optimizer**: Process improvement

### Business Operations (5)
- **analytics-reporter**: Data analysis and performance tracking
- **finance-tracker**: Budget management and cost optimization
- **infrastructure-maintainer**: System reliability and scaling
- **legal-compliance-checker**: Regulatory compliance and risk management
- **support-responder**: Customer support optimization

### Team Dynamics (2)
- **joker**: Tech humor and team morale
- **studio-coach**: Performance coaching and coordination

### Project Management (3)
- **experiment-tracker**: A/B testing and feature validation
- **project-shipper**: Release management and deployment
- **studio-producer**: End-to-end project coordination

[View all agents →](https://github.com/Gravicity/SuperAgent-Zero-2/tree/main/agents)

## 🧬 Memory System

SuperAgent Zero maintains persistent memory across sessions:

- **Session Context**: What you're working on right now
- **Accumulated Insights**: Learned patterns and preferences
- **Agent Evolution**: Performance tracking and improvements

Memory is automatically managed by the memory-manager agent and imported into every session.

## 🛠️ Advanced Usage

### Adding More Agents

```bash
~/.superagent-zero-2/setup.sh --add-agents
```

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

**Note**: Only commit `.superagent/memory/` if you want to share project context. Usually you'll want to add it to `.gitignore`.

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

### With SuperAgent-Zero
- Persistent AI superintendent identity
- Automatic expert agent deployment
- Continuous learning and memory
- Specialized agents for every task

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
- Verify `.claude/agents/` directory exists
- Check agent file format (proper frontmatter)
- Ensure Claude Code has file system access

### Memory not persisting
- Check `.superagent/memory/` directory exists
- Verify memory-manager agent is installed in `.claude/agents/`
- Ensure agent-catalog.json exists in `.superagent/` 
- Look for errors in memory file format

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
# 🧠 SuperAgent-Zero 2.0

Transform Claude Code into a persistent superintelligent AI coordinator with access to specialized agents. Built natively for Claude Code's SubAgent system.

## ✨ What is SuperAgent-Zero?

SuperAgent-Zero turns Claude Code into your personal AI superintendent - a persistent, intelligent coordinator that manages a team of specialized agents. Each agent is an expert in their domain, from backend architecture to UI design, from AI integration to growth hacking.

### Key Features

- 🤖 **Persistent Identity**: Claude Code becomes SuperAgent Zero across all sessions
- 🎯 **Smart Agent Recommendations**: Analyzes your project and suggests the right specialists
- 📦 **40+ Pre-built Agents**: Engineering, design, marketing, product, and testing experts
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
```
SuperAgent Zero: "Hello! I'm SuperAgent Zero, your superintelligent AI coordinator. 
I see you're working on a Node.js project. Let me deploy our project analyzer to 
assess your codebase and recommend specialized agents..."

[Analyzes project]

Project Analyzer: "Based on my analysis, I recommend:
- backend-architect: Your API structure could be optimized
- test-writer: No test coverage detected
- ai-engineer: Opportunity to add AI features"
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
├── .claude/
│   ├── CLAUDE.md              # SuperAgent Zero identity (auto-loaded)
│   └── agents/                # Your specialized agents
│       ├── project-analyzer.md
│       ├── memory-manager.md
│       └── [your agents].md
└── .superagent/
    └── memory/                # Persistent memory system
        ├── context.md         # Current session state
        ├── insights.md        # Accumulated knowledge
        └── evolution.md       # Agent performance tracking
```

## 🤝 Available Agents

### Starter Agents
- **project-analyzer**: Analyzes existing codebases and recommends improvements
- **project-planner**: Helps plan new projects from scratch
- **memory-manager**: Maintains context across sessions

### Engineering Agents
- **ai-engineer**: AI/ML integration specialist
- **backend-architect**: API and system design expert
- **frontend-developer**: Modern UI framework specialist
- **mobile-app-builder**: iOS/Android development expert
- **devops-automator**: CI/CD and infrastructure specialist

### Design Agents
- **ui-designer**: Interface and component design
- **ux-researcher**: User experience optimization
- **brand-guardian**: Brand consistency and guidelines

### Product & Marketing
- **growth-hacker**: User acquisition and retention
- **content-creator**: Technical and marketing content
- **trend-researcher**: Market analysis and opportunities
- **product-strategist**: Product roadmap and features

### Testing & Quality
- **test-writer-fixer**: Comprehensive test coverage
- **performance-benchmarker**: Speed and optimization
- **security-auditor**: Vulnerability assessment

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
~/.superagent-zero-2/update.sh
```

## 🔧 Configuration

### For Teams

Share agents across your team by committing `.claude/agents/` to version control:

```bash
git add .claude/agents/
git commit -m "Add project-specific agents"
```

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
A: Run `update.sh` to get the latest agents and improvements without affecting your existing setup.

## 🐛 Troubleshooting

### Claude Code doesn't recognize SuperAgent Zero
- Ensure `.claude/CLAUDE.md` exists
- Restart Claude Code
- Check file permissions

### Agents not deploying
- Verify `.claude/agents/` directory exists
- Check agent file format (proper frontmatter)
- Ensure Claude Code has file system access

### Memory not persisting
- Check `.superagent/memory/` directory
- Verify memory-manager agent is installed
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
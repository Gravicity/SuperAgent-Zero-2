# 🚀 SuperAgent-Zero 2.0 Quick Start

Get up and running with SuperAgent Zero in 2 minutes!

## Installation (One Time)

```bash
# Clone and run installer
git clone https://github.com/Gravicity/SuperAgent-Zero-2.git
cd SuperAgent-Zero-2
./install.sh
```

Or use the one-liner:
```bash
curl -sSL https://raw.githubusercontent.com/Gravicity/SuperAgent-Zero-2/main/install.sh | bash
```

## Initialize Your Project

```bash
# Navigate to your project
cd ~/my-project

# Run setup
~/.superagent-zero-2/setup.sh

# Start Claude Code
claude
```

## What Happens Next?

When Claude Code starts, it automatically:
1. ✅ Loads your SuperAgent Zero identity from `.claude/CLAUDE.md`
2. ✅ Becomes your AI superintendent
3. ✅ Checks memory from previous sessions
4. ✅ Offers to analyze your project
5. ✅ Recommends specialized agents

## Your First Conversation

```
SuperAgent Zero: "Hello! I'm SuperAgent Zero, your superintelligent AI coordinator. 
I see you're working on a [project type] project. Let me deploy our project analyzer 
to assess your codebase and recommend specialized agents..."

You: "Yes, analyze the project"

[Project Analyzer deploys and provides recommendations]

SuperAgent Zero: "Based on the analysis, I recommend installing these agents:
- backend-architect: To optimize your API structure
- test-writer: To add missing test coverage
Shall I install them?"

You: "Install the backend architect"

SuperAgent Zero: "Installing backend-architect... Done! This agent specializes in 
API design and scalability. Shall I deploy it to review your current architecture?"
```

## Common Commands

### In Your Terminal
```bash
# Add more agents to current project
~/.superagent-zero-2/setup.sh --add-agents

# Update SuperAgent Zero
~/.superagent-zero-2/update.sh
```

### In Claude Code
```
# Install an agent
"Install the ai-engineer agent"

# Create a custom agent
"Create an agent for database migrations"

# Deploy an agent
"Deploy the backend architect to review my API"
```

## Project Structure After Setup

```
your-project/
├── .claude/
│   ├── CLAUDE.md              # SuperAgent Zero identity (auto-loaded)
│   └── agents/                # Your specialized agents
│       ├── project-analyzer.md
│       └── memory-manager.md
└── .superagent/
    └── memory/                # Persistent memory
        ├── context.md
        ├── insights.md
        └── evolution.md
```

## Tips

1. **Let SuperAgent Zero guide you** - It knows which agents to recommend
2. **Memory persists** - Your progress carries between sessions
3. **Agents work together** - Deploy multiple agents for complex tasks
4. **Custom agents** - Create specialized agents for unique needs
5. **Share with team** - Commit `.claude/agents/` to share agents

## Troubleshooting

**Claude doesn't recognize SuperAgent Zero**
- Check that `.claude/CLAUDE.md` exists
- Restart Claude Code

**Can't find agents**
- Ensure `~/.superagent-zero-2/` exists
- Run the installer again

**Memory not persisting**
- Check `.superagent/memory/` directory
- Verify memory-manager agent is installed

## Next Steps

1. 📖 Read the full [README](README.md)
2. 🤖 Explore available [agents](agents/)
3. 💬 Join the [discussion](https://github.com/Gravicity/SuperAgent-Zero-2/discussions)
4. ⭐ Star the repo if you find it useful!

---

**Remember**: SuperAgent Zero is not just a tool - it's your AI partner that learns and grows with your project!
# SuperAgent Zero Workflow Patterns

## Starter Agent Coordination Workflows

### Project Analysis Workflows
<!-- project-analyzer adds proven analysis workflows here -->

### Project Planning Workflows  
<!-- project-planner adds proven planning workflows here -->

### Project Coordination Workflows
<!-- project-coordinator adds complex coordination patterns here -->

## Agent Deployment Patterns

### Multi-Agent Deployment
```markdown
# Deploy multiple agents in SINGLE message:
Task(mobile-app-builder, "Build iOS video feed component")
Task(backend-architect, "Design video upload API")  
Task(ui-designer, "Create video player interface")
```

### Agent Briefing Template
**Context**: What user is building and current state
**Memory Guidance**: Which sections to check in insights.md/project.md
**Task**: Exactly what this agent should deliver  
**Constraints**: Timeline, tech stack, preferences
**Handoff**: What to deliver back and where to document

### Project-Type Workflow Patterns

**Web Application Development:**
- Phase 1 (Parallel): backend-architect + ui-designer
- Phase 2 (Sequential): frontend-developer → test-writer-fixer
- Phase 3 (Parallel): performance-benchmarker + devops-automator

**Mobile App Development:**
- Phase 1: mobile-app-builder + backend-architect (parallel - different focuses)
- Phase 2: ui-designer + test-writer-fixer (parallel - UI and functionality)
- Phase 3: app-store-optimizer (sequential - needs completed app)

**Existing Project Optimization:**
- Phase 1: project-analyzer (solo analysis)
- Phase 2 (Parallel): Based on analysis - test-writer-fixer + performance-benchmarker
- Phase 3: Specialized agents based on findings

**Complex Transformations:**
- Workstream 1: project-analyzer → specialist agents (parallel within stream)
- Workstream 2: project-planner → architecture agents (parallel within stream)  
- Integration: project-coordinator → bridge workstreams

## Proven Workflow Patterns
<!-- Starter agents document successful patterns here -->

### Speed Optimization Guidelines

**Parallel Execution Opportunities:**
- Frontend and Backend development (independent components)
- Testing and Performance analysis (different focus areas)
- UI Design and Content creation (complementary work)
- Security and Performance audits (different scopes)

**Sequential Dependencies:**  
- Backend API design → Frontend implementation
- Test writing → Performance benchmarking
- Architecture decisions → Implementation agents
- Content strategy → Marketing execution

**Validated Fast Patterns:**
<!-- SuperAgent Zero updates these with proven combinations -->
<!-- Format: [Pattern Name] - ✅ Validated [Date] / ⚠️ Needs refinement -->

**Anti-Patterns to Avoid:**
<!-- Document problematic combinations here -->
<!-- Example: security-auditor + backend-architect = file conflicts when parallel -->
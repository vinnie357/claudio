# Claude 4 Prompting Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Inconsistent or Low-Quality Responses
- **Symptoms**: Claude 4 provides generic, incomplete, or inconsistent responses despite clear instructions
- **Diagnosis**: Check prompt structure, specificity level, and context clarity
- **Solution**: 
  1. Add explicit quality modifiers: "Include comprehensive details and examples"
  2. Use XML tags to clearly structure prompt sections
  3. Provide specific context about desired output quality and depth
  4. Replace vague instructions with precise, actionable directives
- **Prevention**: Always include context explaining why specific behavior is important and what success looks like

### Issue 2: Claude 4 Not Using Advanced Features
- **Symptoms**: No evidence of thinking modes, parallel processing, or advanced reasoning despite complex tasks
- **Diagnosis**: Missing trigger phrases or insufficient complexity indicators in prompts
- **Solution**:
  1. Add thinking triggers: "think hard about this problem" or "ultrathink through all approaches"
  2. Explicitly request parallel execution: "invoke all relevant tools simultaneously"
  3. Use prefill patterns: Start response with `<thinking>` tag
  4. Provide complexity context that justifies advanced feature usage
- **Prevention**: Match prompt complexity indicators with actual task requirements

### Issue 3: Poor Performance with Large Context Windows
- **Symptoms**: Decreased response quality, missed information, or irrelevant responses in long sessions
- **Diagnosis**: Context window overload, irrelevant information accumulation, or poor information prioritization
- **Solution**:
  1. Use `/clear` command to reset context between unrelated tasks
  2. Implement context summarization for essential information retention
  3. Place most important information early in the conversation
  4. Use XML tags to highlight critical context sections
- **Prevention**: Regularly clean context window and maintain clear information hierarchy

### Issue 4: Inconsistent XML Tag Recognition
- **Symptoms**: Claude 4 ignoring or misinterpreting XML-structured prompts
- **Diagnosis**: Malformed XML syntax, inconsistent tag usage, or conflicting tag purposes
- **Solution**:
  1. Validate XML syntax using proper opening/closing tag pairs
  2. Use consistent tag names throughout the session
  3. Avoid nested tags with similar functions
  4. Test XML structure with simple examples before complex prompts
- **Prevention**: Establish standard XML template patterns and validate structure before use

### Issue 5: Security and Safety Limitations
- **Symptoms**: Claude 4 refusing tasks, providing overly cautious responses, or missing security considerations
- **Diagnosis**: Insufficient safety context, unclear security requirements, or inadequate risk assessment
- **Solution**:
  1. Provide clear security context and requirements
  2. Explicitly state legitimate use cases and constraints
  3. Include security framework references (OWASP, security best practices)
  4. Use structured security prompts with clear authorization context
- **Prevention**: Always include security context and legitimate use case justification in sensitive tasks

## Advanced Troubleshooting

### Performance Issues

**Latency Optimization Problems**
- **Issue**: Slow response times despite appropriate model selection
- **Diagnosis**: Inefficient prompt structure, excessive thinking mode usage, or suboptimal model choice
- **Solutions**:
  - Optimize prompt length while maintaining clarity
  - Use thinking modes only when complexity truly requires it
  - Consider Sonnet 4 for high-throughput scenarios requiring speed over maximum capability
  - Implement prompt caching for repeated operations

**Cost Management Challenges**  
- **Issue**: Higher than expected API costs or inefficient token usage
- **Diagnosis**: Overuse of advanced features, inefficient prompt patterns, or poor model selection
- **Solutions**:
  - Audit prompt efficiency and remove unnecessary verbosity
  - Use appropriate model tiers (Sonnet 4 for efficiency, Opus 4.1 for maximum capability)
  - Implement batch processing for similar tasks
  - Monitor token usage patterns and optimize accordingly

### Integration Problems

**API Integration Failures**
- **Issue**: Connection errors, rate limiting, or authentication problems
- **Diagnosis**: Improper API configuration, rate limit exceeded, or authentication issues  
- **Solutions**:
  - Implement proper error handling and retry mechanisms
  - Add rate limiting and backoff strategies
  - Validate API keys and endpoint configurations
  - Use connection pooling for high-throughput applications

**Development Workflow Integration Issues**
- **Issue**: Claude 4 responses don't integrate well with existing development tools
- **Diagnosis**: Format mismatches, incompatible output structures, or workflow conflicts
- **Solutions**:
  - Create standardized output templates for different tools
  - Use format-specific prompts (JSON, Markdown, XML) based on downstream requirements  
  - Implement validation layers between Claude 4 output and tool input
  - Develop prompt templates aligned with existing workflow patterns

### Edge Cases

**Multi-Language and Internationalization**
- **Issue**: Inconsistent behavior with non-English content or mixed-language scenarios
- **Diagnosis**: Language context confusion, encoding issues, or cultural context misunderstanding
- **Solutions**:
  - Explicitly specify language requirements and cultural context
  - Provide language-specific examples and formatting expectations
  - Use Unicode-safe text processing in integration layers
  - Test with representative international content samples

**Domain-Specific Technical Content**
- **Issue**: Inaccurate or insufficient responses for highly specialized technical domains
- **Diagnosis**: Limited domain context, insufficient technical specifications, or missing authoritative sources
- **Solutions**:
  - Provide comprehensive domain context and technical specifications
  - Include references to authoritative sources and standards
  - Use domain-specific terminology consistently
  - Validate technical accuracy against domain expertise

**Complex State Management**
- **Issue**: Inconsistent behavior across multi-turn conversations with complex state requirements  
- **Diagnosis**: State information loss, context confusion, or inadequate state tracking
- **Solutions**:
  - Implement explicit state management in prompts using structured context sections
  - Use conversation summarization techniques for long sessions
  - Create state tracking templates with consistent formatting
  - Periodically validate and refresh state information

## Diagnostic Tools

### Prompt Analysis Framework
```python
def analyze_prompt_quality(prompt):
    """
    Diagnostic framework for Claude 4 prompt optimization
    """
    checks = {
        'has_xml_structure': '<' in prompt and '>' in prompt,
        'includes_context': 'context' in prompt.lower() or 'because' in prompt.lower(),
        'has_quality_modifiers': any(mod in prompt.lower() for mod in 
            ['comprehensive', 'detailed', 'thorough', 'complete']),
        'uses_thinking_triggers': any(trigger in prompt.lower() for trigger in 
            ['think', 'analyze', 'consider', 'evaluate']),
        'includes_examples': 'example' in prompt.lower() or 'for instance' in prompt.lower(),
        'specifies_format': any(fmt in prompt.lower() for fmt in 
            ['format', 'structure', 'template', 'json', 'xml', 'markdown'])
    }
    
    score = sum(checks.values()) / len(checks) * 100
    recommendations = []
    
    if not checks['has_xml_structure']:
        recommendations.append("Add XML tags for better structure")
    if not checks['includes_context']:  
        recommendations.append("Include context explaining why this task is important")
    if not checks['has_quality_modifiers']:
        recommendations.append("Add quality enhancement modifiers")
    
    return {
        'quality_score': score,
        'checks': checks,
        'recommendations': recommendations
    }
```

### Response Quality Validation
```python
def validate_claude4_response(response, expected_criteria):
    """
    Validate Claude 4 response against expected quality criteria
    """
    validation_results = {
        'completeness': len(response.strip()) > 100,
        'structure': any(marker in response for marker in ['1.', '-', '*', '\n\n']),
        'thinking_evidence': '<thinking>' in response or 'reasoning:' in response.lower(),
        'specificity': response.count('specific') + response.count('example') > 0,
        'actionability': any(action in response.lower() for action in 
            ['step', 'implement', 'use', 'apply', 'configure'])
    }
    
    return validation_results
```

### Performance Monitoring Tools
```python
import time
from anthropic import Anthropic

def monitor_claude4_performance(prompts, model="claude-4-opus-20241120"):
    """
    Monitor Claude 4 performance metrics for prompt optimization
    """
    client = Anthropic()
    results = []
    
    for i, prompt in enumerate(prompts):
        start_time = time.time()
        
        try:
            response = client.messages.create(
                model=model,
                max_tokens=4000,
                messages=[{"role": "user", "content": prompt}]
            )
            
            end_time = time.time()
            latency = end_time - start_time
            
            results.append({
                'prompt_id': i,
                'latency': latency,
                'token_count': len(response.content[0].text.split()),
                'response_length': len(response.content[0].text),
                'success': True
            })
            
        except Exception as e:
            results.append({
                'prompt_id': i,
                'error': str(e),
                'success': False
            })
    
    return results
```

### Context Window Analysis
```python
def analyze_context_usage(conversation_history):
    """
    Analyze context window usage and optimization opportunities
    """
    total_tokens = sum(len(msg['content'].split()) for msg in conversation_history)
    
    analysis = {
        'total_estimated_tokens': total_tokens,
        'context_utilization': min(total_tokens / 200000, 1.0),  # Claude 4 context window
        'needs_cleanup': total_tokens > 150000,
        'optimization_suggestions': []
    }
    
    if analysis['needs_cleanup']:
        analysis['optimization_suggestions'].extend([
            'Consider using /clear command to reset context',
            'Implement conversation summarization',
            'Prioritize most relevant information'
        ])
    
    # Identify repetitive content
    content_frequency = {}
    for msg in conversation_history:
        words = msg['content'].lower().split()
        for word in words:
            if len(word) > 4:  # Focus on meaningful words
                content_frequency[word] = content_frequency.get(word, 0) + 1
    
    repeated_content = [(word, count) for word, count in content_frequency.items() if count > 5]
    if repeated_content:
        analysis['optimization_suggestions'].append('Remove repetitive content to optimize context')
    
    return analysis
```

## When to Escalate

### Technical Escalation Triggers
- **Persistent API errors** despite proper configuration and retry mechanisms
- **Consistent model behavior deviation** from documented best practices
- **Performance degradation** not explained by prompt complexity or context size
- **Security vulnerabilities** discovered in Claude 4 responses or integrations
- **Integration compatibility issues** with critical development tools

### Expert Consultation Requirements
- **Complex enterprise integrations** requiring specialized architecture guidance
- **Advanced security implementations** needing specialized security expertise
- **Custom prompt framework development** for organization-specific workflows
- **Performance optimization** for high-throughput production environments
- **Specialized domain applications** requiring domain expert validation

### Community Resources for Support
- **Anthropic Developer Documentation**: Official technical documentation and updates
- **Claude AI Community Forums**: Peer support and shared experiences
- **GitHub Repositories**: Open-source prompt templates and integration examples
- **Stack Overflow**: Technical implementation questions and debugging help
- **Professional Claude 4 Consultants**: Specialized expertise for enterprise deployments

### Critical Issue Identification
Contact Anthropic directly for:
- **Security vulnerabilities** in Claude 4 models or API
- **Model safety concerns** or unexpected harmful outputs
- **Critical API service outages** affecting production systems
- **Data privacy questions** related to prompt processing and storage
- **Compliance requirements** for regulated industries and sensitive applications

### Documentation and Reporting
When escalating issues, provide:
- **Complete prompt examples** demonstrating the problem
- **Expected vs actual behavior** with specific examples
- **Environment details** including model version, API version, integration tools
- **Reproduction steps** with consistent results
- **Impact assessment** on workflows and business operations
- **Previous troubleshooting attempts** and their outcomes

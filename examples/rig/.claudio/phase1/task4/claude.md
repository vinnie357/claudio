# Task 1.4: WebSocket Communication Layer Agent

You are a specialized agent focused exclusively on completing Task 1.4: WebSocket Communication Layer. Your expertise is tailored to implementing robust WebSocket communication with Phoenix channels while maintaining awareness of the broader Phase 1 context.

## Task Overview
- **Description**: Implement WebSocket client for Phoenix channels communication with reconnection logic
- **Priority**: High
- **Estimated Effort**: 6 days
- **Dependencies**: Task 1.3 (Authentication System)

## Acceptance Criteria
- [ ] WebSocket connection establishment with Phoenix channels protocol
- [ ] Message serialization/deserialization using serde JSON
- [ ] Automatic reconnection with exponential backoff and jitter
- [ ] Connection state management (connecting, connected, disconnected, error)
- [ ] Integration with authentication system for secure connections
- [ ] Heartbeat/ping-pong implementation for connection health monitoring
- [ ] Graceful handling of network interruptions and timeouts

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: Task 1.3 provides authentication integration
- **External Resources**: Phoenix channels protocol documentation, tokio-tungstenite docs

## Implementation Guidelines

### WebSocket Client Architecture
```rust
// src/websocket.rs - Phoenix channels client
use tokio_tungstenite::{connect_async, WebSocketStream};
use serde_json::{Value, json};

pub struct PhoenixClient {
    connection: Option<WebSocketStream<_>>,
    state: ConnectionState,
    auth_token: String,
    heartbeat_interval: Duration,
}

#[derive(Debug, Clone)]
pub enum ConnectionState {
    Disconnected,
    Connecting,
    Connected,
    Error(String),
}
```

### Reconnection Strategy
- Exponential backoff starting at 1 second, max 30 seconds
- Jitter to prevent thundering herd
- Configurable retry limits with graceful degradation
- Connection health monitoring with automatic recovery

### Message Protocol
- Phoenix channels message format compliance
- JSON serialization/deserialization with error handling
- Message acknowledgment and response correlation
- Topic subscription and message routing

## Technical Requirements
- **WebSocket**: tokio-tungstenite for async WebSocket communication
- **Protocol**: Phoenix channels message format and lifecycle compliance
- **Async Runtime**: tokio with proper async/await patterns throughout
- **Error Recovery**: Exponential backoff with configurable retry limits and jitter

## Quality Requirements
- Connection must be stable under network interruptions
- All messages must be properly serialized/deserialized
- Error states must be clearly communicated to calling code
- Connection health must be actively monitored

## Completion Checklist
- [ ] WebSocket connection with Phoenix channels protocol
- [ ] Message serialization/deserialization working
- [ ] Automatic reconnection with exponential backoff
- [ ] Connection state management implemented
- [ ] Authentication integration complete
- [ ] Heartbeat/ping-pong mechanism working
- [ ] Integration tests with mock Phoenix server
- [ ] Error handling for all connection scenarios

## Integration Points
- **Task 1.3**: Uses authentication tokens for secure connections
- **Task 1.5**: Provides communication layer for network commands
- **Task 1.6**: Enables real-time communication for app management

## Success Metrics
- Connection establishes reliably with Max platform
- Automatic reconnection works under network failures
- Message throughput meets performance requirements
- Error states are handled gracefully with user feedback

Focus on creating a robust, production-ready WebSocket client that can handle the real-world challenges of network communication while providing the real-time features that rig users expect.
# PostgreSQL Optimization Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Slow Query Performance Despite Proper Indexes

**Symptoms**: 
- Queries with appropriate indexes still executing slowly
- EXPLAIN ANALYZE shows index scans but high execution times
- Inconsistent query performance across similar data patterns

**Diagnosis**: 
```sql
-- Check index usage and selectivity
SELECT schemaname, tablename, indexname, idx_scan, idx_tup_read, idx_tup_fetch
FROM pg_stat_user_indexes 
WHERE tablename = 'your_table'
ORDER BY idx_tup_read DESC;

-- Analyze query plan for cost estimation accuracy
EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM your_table WHERE condition;

-- Check table and index statistics freshness
SELECT schemaname, tablename, last_analyze, last_autoanalyze
FROM pg_stat_user_tables
WHERE tablename = 'your_table';
```

**Solution**: 
1. **Update Statistics**: Run `ANALYZE your_table` to refresh query planner statistics
2. **Adjust Cost Parameters**: Tune `random_page_cost` for your storage type (1.1-2.0 for SSDs)
3. **Check Index Bloat**: Rebuild fragmented indexes using `REINDEX INDEX CONCURRENTLY`
4. **Review Index Design**: Ensure column order matches query patterns (most selective first)

**Prevention**: 
- Schedule regular ANALYZE operations via cron or pg_cron extension
- Monitor pg_stat_user_tables for stale statistics
- Set appropriate autovacuum and autoanalyze thresholds
- Use pg_stat_statements to track query performance trends

### Issue 2: Index Not Being Used by Query Planner

**Symptoms**: 
- Sequential scans on tables with relevant indexes
- Query planner chooses table scan over available index
- EXPLAIN shows high cost estimation for index usage

**Diagnosis**: 
```sql
-- Check if index supports the query operation
SELECT indexname, indexdef 
FROM pg_indexes 
WHERE tablename = 'your_table';

-- Verify query condition matches index structure
EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM your_table WHERE your_condition;

-- Check table statistics and data distribution
SELECT n_distinct, most_common_vals, most_common_freqs
FROM pg_stats 
WHERE tablename = 'your_table' AND attname = 'your_column';
```

**Solution**: 
1. **Index Type Mismatch**: Create appropriate index type (GIN for arrays, GiST for ranges)
2. **Low Selectivity**: Add WHERE clause to create partial index for specific conditions
3. **Function Usage**: Create expression index for functions used in WHERE clause
4. **Cost Model Adjustment**: Reduce `random_page_cost` if using fast storage (SSDs)
5. **Force Index Usage**: Use `SET enable_seqscan = off` for testing (not production)

**Prevention**: 
- Design indexes to match exact query patterns including functions
- Create partial indexes for frequently queried subsets
- Monitor query execution plans regularly with pg_stat_statements
- Test index effectiveness during development with realistic data volumes

### Issue 3: High Memory Usage and Out-of-Memory Errors

**Symptoms**: 
- PostgreSQL processes killed by OOM killer
- "out of memory" errors in PostgreSQL logs
- System performance degradation during complex queries

**Diagnosis**: 
```sql
-- Check current memory parameter settings
SELECT name, setting, unit 
FROM pg_settings 
WHERE name IN ('shared_buffers', 'work_mem', 'maintenance_work_mem', 'effective_cache_size');

-- Identify memory-intensive queries
SELECT query, calls, mean_time, max_time, temp_blks_written
FROM pg_stat_statements 
ORDER BY temp_blks_written DESC
LIMIT 10;

-- Monitor active connections and their memory usage
SELECT pid, usename, application_name, state, query_start, query
FROM pg_stat_activity 
WHERE state = 'active';
```

**Solution**: 
1. **Reduce work_mem**: Lower per-operation memory limit for sorts and hash operations
2. **Optimize Queries**: Rewrite queries to use less memory (avoid large sorts)
3. **Connection Limits**: Implement connection pooling to reduce memory per connection
4. **Index Optimization**: Create indexes to avoid memory-intensive operations
5. **System Memory**: Increase physical RAM or adjust memory allocation

**Prevention**: 
- Set work_mem conservatively (start with 4-8MB per connection)
- Use connection pooling (PgBouncer) to limit concurrent connections
- Monitor temp_blks_written in pg_stat_statements for excessive temporary file usage
- Implement query timeouts to prevent runaway memory consumption

### Issue 4: Lock Contention and Blocking Queries

**Symptoms**: 
- Queries waiting indefinitely for locks
- High number of blocked sessions
- Application timeouts and deadlock errors

**Diagnosis**: 
```sql
-- Identify blocking and blocked queries
SELECT blocked_locks.pid AS blocked_pid,
       blocked_activity.usename AS blocked_user,
       blocking_locks.pid AS blocking_pid,
       blocking_activity.usename AS blocking_user,
       blocked_activity.query AS blocked_statement,
       blocking_activity.query AS current_statement_in_blocking_process
FROM pg_catalog.pg_locks blocked_locks
JOIN pg_catalog.pg_stat_activity blocked_activity ON blocked_activity.pid = blocked_locks.pid
JOIN pg_catalog.pg_locks blocking_locks ON blocking_locks.locktype = blocked_locks.locktype
JOIN pg_catalog.pg_stat_activity blocking_activity ON blocking_activity.pid = blocking_locks.pid
WHERE NOT blocked_locks.granted;

-- Check for deadlocks in logs
SELECT * FROM pg_stat_database_conflicts WHERE datname = current_database();
```

**Solution**: 
1. **Query Optimization**: Reduce transaction duration with faster queries and proper indexes
2. **Index Creation**: Use `CREATE INDEX CONCURRENTLY` to avoid blocking writes
3. **Batch Processing**: Break large operations into smaller transactions
4. **Lock Timeout**: Set `lock_timeout` to prevent indefinite waits
5. **Connection Pooling**: Use transaction-level pooling to reduce lock duration

**Prevention**: 
- Keep transactions short and focused
- Access tables in consistent order to prevent deadlocks
- Use appropriate isolation levels (READ COMMITTED vs REPEATABLE READ)
- Monitor pg_stat_activity regularly for long-running queries

### Issue 5: Index Bloat and Storage Growth

**Symptoms**: 
- Database size growing faster than data volume
- Index performance degrading over time
- High disk space usage despite data deletion

**Diagnosis**: 
```sql
-- Check index bloat
SELECT schemaname, tablename, indexname,
       pg_size_pretty(pg_relation_size(indexrelid)) as index_size,
       idx_scan, idx_tup_read
FROM pg_stat_user_indexes 
ORDER BY pg_relation_size(indexrelid) DESC;

-- Identify tables with high bloat
SELECT schemaname, tablename,
       pg_size_pretty(pg_total_relation_size(oid)) as total_size,
       n_tup_ins, n_tup_upd, n_tup_del,
       last_vacuum, last_autovacuum
FROM pg_stat_user_tables 
ORDER BY pg_total_relation_size(oid) DESC;

-- Check vacuum and analyze activity
SELECT schemaname, tablename, last_vacuum, last_autovacuum, 
       vacuum_count, autovacuum_count, n_dead_tup
FROM pg_stat_user_tables
WHERE n_dead_tup > 0;
```

**Solution**: 
1. **Manual Vacuum**: Run `VACUUM FULL` during maintenance windows (locks table)
2. **Index Rebuild**: Use `REINDEX INDEX CONCURRENTLY` for online index rebuilding
3. **Autovacuum Tuning**: Adjust autovacuum thresholds for high-update tables
4. **pg_repack**: Use extension for online table reorganization without locking
5. **Partitioning**: Implement table partitioning for large, high-churn tables

**Prevention**: 
- Configure aggressive autovacuum for high-update tables
- Monitor dead tuple ratios regularly
- Schedule maintenance windows for VACUUM FULL operations
- Consider table partitioning for large tables with deletion patterns

## Advanced Troubleshooting

### Performance Issues

**Query Planner Problems**
- **Symptom**: Suboptimal execution plans despite proper statistics
- **Diagnosis**: Use `EXPLAIN (ANALYZE, BUFFERS, FORMAT JSON)` for detailed analysis
- **Solution**: Adjust cost parameters, use query hints with pg_hint_plan extension
- **Advanced**: Create extended statistics for correlated columns with `CREATE STATISTICS`

**Connection Pool Exhaustion**
- **Symptom**: "remaining connection slots are reserved" errors
- **Diagnosis**: Monitor `pg_stat_activity` for connection patterns
- **Solution**: Implement PgBouncer with appropriate pool sizing
- **Advanced**: Use session vs transaction pooling based on application behavior

**Checkpoint Performance Impact**
- **Symptom**: Periodic performance spikes during checkpoint operations
- **Diagnosis**: Monitor checkpoint frequency in pg_stat_bgwriter
- **Solution**: Adjust `checkpoint_completion_target` and `wal_buffers`
- **Advanced**: Implement checkpoint scheduling during low-traffic periods

### Integration Problems

**ORM Query Optimization**
- **Symptom**: N+1 query problems causing excessive database roundtrips
- **Diagnosis**: Use pg_stat_statements to identify repetitive similar queries
- **Solution**: Implement eager loading, query optimization in ORM layer
- **Advanced**: Create materialized views for complex aggregations

**Replication Lag Issues**
- **Symptom**: Read replicas falling behind master during high write load
- **Diagnosis**: Monitor `pg_stat_replication` for lag metrics
- **Solution**: Tune wal_sender_timeout, increase replica hardware resources
- **Advanced**: Implement logical replication for selective data synchronization

**Backup Performance Impact**
- **Symptom**: Application performance degradation during backup operations
- **Diagnosis**: Monitor I/O utilization and backup duration
- **Solution**: Use pg_basebackup with rate limiting, schedule during low traffic
- **Advanced**: Implement streaming backup solutions with minimal performance impact

### Edge Cases

**Large Object Performance**
- **Symptom**: Slow performance with BLOB/CLOB data operations
- **Diagnosis**: Monitor large object access patterns in application logs
- **Solution**: Use TOAST optimization, consider external storage for large objects
- **Advanced**: Implement object storage integration (S3) with database references

**Time Zone and Locale Issues**
- **Symptom**: Query performance varies by time zone or locale settings
- **Diagnosis**: Check timezone and collation settings impact on index usage
- **Solution**: Use UTC internally, create locale-specific indexes
- **Advanced**: Implement ICU collations for consistent sorting performance

**Parallel Query Limitations**
- **Symptom**: Parallel queries not executing as expected or causing contention
- **Diagnosis**: Check `max_parallel_workers` and query complexity
- **Solution**: Tune parallel query parameters, optimize queries for parallelization
- **Advanced**: Implement custom parallel execution patterns for specific workloads

## Diagnostic Tools

### Built-in PostgreSQL Tools

**pg_stat_statements**
```sql
-- Enable extension and track query performance
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- Find slowest queries by total time
SELECT query, calls, total_time, mean_time, min_time, max_time
FROM pg_stat_statements 
ORDER BY total_time DESC 
LIMIT 10;

-- Find queries with highest I/O
SELECT query, calls, shared_blks_read, shared_blks_written, temp_blks_written
FROM pg_stat_statements 
ORDER BY (shared_blks_read + shared_blks_written + temp_blks_written) DESC 
LIMIT 10;
```

**EXPLAIN Analysis Tools**
```sql
-- Comprehensive query analysis
EXPLAIN (ANALYZE, BUFFERS, FORMAT JSON) SELECT * FROM complex_query;

-- Cost comparison for different approaches
EXPLAIN (COSTS, FORMAT TEXT) SELECT * FROM table WHERE condition1;
EXPLAIN (COSTS, FORMAT TEXT) SELECT * FROM table WHERE condition2;
```

**System Statistics Monitoring**
```sql
-- Database-wide statistics
SELECT * FROM pg_stat_database WHERE datname = current_database();

-- Table-level access patterns
SELECT schemaname, tablename, seq_scan, seq_tup_read, idx_scan, idx_tup_fetch
FROM pg_stat_user_tables 
ORDER BY seq_scan DESC;

-- Index usage effectiveness
SELECT schemaname, tablename, indexname, idx_scan, idx_tup_read, idx_tup_fetch
FROM pg_stat_user_indexes 
WHERE idx_scan > 0 
ORDER BY idx_tup_read DESC;
```

### External Monitoring Solutions

**pgBadger Log Analysis**
```bash
# Analyze PostgreSQL logs for performance insights
pgbadger -f stderr /var/log/postgresql/postgresql.log

# Generate HTML report with detailed statistics
pgbadger -o report.html -f stderr /var/log/postgresql/*.log
```

**Prometheus Monitoring Queries**
```promql
# Database connection count
pg_stat_database_numbackends{datname="myapp"}

# Cache hit ratio
rate(pg_stat_database_blks_hit[5m]) / (rate(pg_stat_database_blks_hit[5m]) + rate(pg_stat_database_blks_read[5m]))

# Slow query count
increase(pg_stat_statements_total_time[5m]) > 1000
```

**Connection Pool Monitoring**
```bash
# PgBouncer statistics
psql -h pgbouncer_host -p 6432 -U pgbouncer pgbouncer -c "SHOW STATS;"
psql -h pgbouncer_host -p 6432 -U pgbouncer pgbouncer -c "SHOW POOLS;"
psql -h pgbouncer_host -p 6432 -U pgbouncer pgbouncer -c "SHOW CLIENTS;"
```

## When to Escalate

### Performance Degradation Scenarios

**Immediate Escalation Required:**
- Query response times increasing by >50% without obvious cause
- Connection pool exhaustion causing application downtime
- Out-of-memory kills affecting database availability
- Replication lag exceeding recovery time objectives

**Database Expert Consultation Needed:**
- Complex query optimization requiring advanced indexing strategies
- Storage and hardware sizing for high-performance workloads
- Custom extension development for specialized optimization needs
- Database architecture decisions for scaling beyond single instance

**Vendor Support Engagement:**
- PostgreSQL bug suspected in query planner or optimizer
- Performance regression after PostgreSQL version upgrade
- Hardware-specific optimization requiring vendor collaboration
- Enterprise feature requirements for high availability and performance

### Escalation Preparation

**Information to Gather:**
1. Complete EXPLAIN ANALYZE output for problematic queries
2. pg_stat_statements summary for workload characterization
3. System resource utilization graphs (CPU, memory, I/O)
4. Database configuration parameters and recent changes
5. Application architecture and connection patterns
6. Hardware specifications and storage configuration

**Diagnostic Commands for Support:**
```sql
-- Complete system information
SELECT version();
SHOW ALL;
SELECT * FROM pg_stat_bgwriter;
SELECT * FROM pg_stat_database;
SELECT * FROM pg_settings WHERE source \!= 'default';
```

**Log Configuration for Troubleshooting:**
```postgresql
# Enable detailed logging temporarily
log_min_duration_statement = 100
log_checkpoints = on
log_connections = on
log_disconnections = on
log_lock_waits = on
log_temp_files = 0
log_autovacuum_min_duration = 0
```
EOF < /dev/null
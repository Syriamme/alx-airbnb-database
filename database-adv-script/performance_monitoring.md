# Performance Control and Management
## Objective:
To monitor and optimize the performance of database and the queries that I run by checking the execution plans and cidling the schema as needed.
### What I Did:
1.	Monitored Query Performance:
o	    To analyze how often run, I used the command like EXPLAIN and EXPLAIN ANALYZE on my tables in the database.
o	    I looked at slow queries which had fully scanned tables or had employed suboptimal join techniques.
2.	Identified Bottlenecks:
o	    When inspecting the execution plans, I searched to see if there were any omissions on indices on the used groups of columns.
o	    I recognized queries with wrong join conditions – they perform poorly, and require better indexes, different queries, or even different schema.
3.	Suggested Schema Adjustments:
o	    Therefore, I suggested making columns frequently used in WHERE, JOIN or ORDER BY clauses indexed or selective such as the user_id, property_id, and start_date.
o	    I also identified those relatively large tables that require partitioning or denormalization to minimize the level of cross-table joins and simplify recovery.
4.	Implemented Changes:
o	    I indexed columns by creating them to make it easy to filter and join data.
o	    I optimize on queries and make changes to the schema every now and then in a bid to enhance the populance’s data acquisition.
5.	Measured Improvements:
o	    I then rerun the queries and evaluated the new strategies in the execution plan following the changes described above.
o	    To quantify the gains, I made a comparison of the execution times and the resources consumed in both situations.
As I kept on using the queries using the EXPLAIN ANALYZE I realized that there were performance bottlenecks. There are examples when it was needed to add indexes and optimize queries and such decisions appeared to help to improve schema performance and efficiency of queries performed.
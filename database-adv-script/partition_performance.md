# Brief Report on Improvements:

## Observations Before Partitioning:
•	As mentioned in the previous section the Query on the Booking table took time mostly when sorting results or when searching records in the start_date column due to large quantity of records.
•	Comparison queries with date intervals were causing full table scan and hence slowing down the speed of the process, especially with large date intervals.
## Observations After Partitioning:
•	Therefore, since I partitioned the Booking table by start_date, those queries that are highly selective for date (e.g., bookings in 2022) only have to scan the partition containing that data for high performance.
•	From the query plan which was generated using EXPLAIN ANALYZE the optimizer used partition pruning which in turn helped to optimize the query by eliminating any less useful partitioning.
•	Therefore, when dividing the Booking table, a substantial performance benefit was observed for date-filtered queries, particularly as the data size increases.
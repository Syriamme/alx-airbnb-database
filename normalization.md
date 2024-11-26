##Potential Issues in Current Schema:
##Booking Table – 3NF:
The total_price field in the Booking table is calculated from pricepernight in the Property table and the booking duration, which is the difference between the end_date and start_date.
According to the third normal form, it is required that every non key attribute of a table should depend on the key, the whole key and nothing but the key.
The booking table has an ID, which a unique number is assigned to each booking done, for instance we can use booking_id. The total_price is also there in the Booking table. However, total_price depends on property_id which is a foreign key field to the Property table.
This means total_price can in turn be seen as parasite to the Property table (since property_id provides information about the property and/or its price, which are in a way, incorporated in total_price). The total_price is not primary key dependent on the booking_id which is Key of Booking table only.
In 3NF, every column should require the primary key and nothing more in order to be determined. In this case total_price is functions of property_id, a non-key column. This is a transitive dependency, and therefore we are not in 3NF. This setup can lead to redundancy and inconsistencies, such as:
###Insertion anomaly: There will be a problem when inserting data into a table without having all unrelated data. For instance, one cannot insert a booking without having to first determine the price details of the property thus preventing partial data entry due to the unnecessary dependency between the property and booking tables.
###Update anomaly: Whenever there is a change on the pricing detail in the Property table, the total_price in the Booking table must also be updated to provide truthfulness to the data presented. Omission of the same could lead to some blunders being committed in the course of doing the business.
###Delete anomaly: In case of deleted property from the property table, all the related data such as total price in the booking table will be orphaned data or meaningless since it has no reference.
##How to Fix It?
To remove the violation it is recommended not to store total_price in the Booking table. Instead compute it at the run time if required by Current Date and property_id and the price data available in Property table.
There is no reason to store total_price in the database, unless there are historical data reasons; if total_price depends on property_id, be sure to derive it on the DAL side from other stored data. 
All the detail related to it like the fare per night, the number of nights, all should be contained in the Booking table only.

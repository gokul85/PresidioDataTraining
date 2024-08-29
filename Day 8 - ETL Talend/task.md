# Talend

|**Talend**|**ADF**|
|----------|-------|
| On-Premises & Cloud| Cloud-Native, Serverless|
| Broad Connectivity, Custom Integration | Azure Ecosystem Integration, Connector Library  |
| Coding Flexibility| No-Code/Low-Code|
| Embedded ETL| Data Flow, External Processing|
| Custom Scalability| Automatic Scaling|
| License-Based | Consumption-Based |
| Multi-Cloud & Hybrid | Azure-Centric |


### ETL Real Time Scenarios
- Company data(eg: sales, inventory, customer data) into a centralized data warehouse for reporting & analytics

- Company wants unified customer profile for mobile apps, web interactions, call centers, & branch visits

- On-premises systems to a new cloud platform

- Company can analyze customer behavior (email, social media, search engines)

- Analyzing data from suppliers, warehouses, & transportation networks

- Content recommendations by analyzing user behavior


### ETL vs ELT

|**ETL**|**ELT**|
|-------|-------|
|Transform before load into target system|Transform happens in loaded target system|
|Compute power required|Compute power does't required|
|has latency|low latency faster access to raw data|
|smaller or medium sized datasets|larger datasets|
|Talend|BigQuery,Snowflake|
|analysed ready for reporting|analyzed and reported after loaded|
|encrypted before loading into a compliant data warehouse|loading transaction data into a cloud & validations post load|
|batch processing of IoT sensor data for daily reports|streaming service loading user interaction data into a data lake in real-time, used for personal recommedation|


### ADF vs SSIS

- ***SSIS***: Targets organizations with existing investments in on-premises infrastructure, particularly those with a strong reliance on SQL Server. SSIS is tailored for environments where data is mostly on-premises, and where there is a need for complex ETL processes tightly integrated with SQL Server.

- ***ADF***: Aimed at organizations moving to the cloud or operating in hybrid environments, where data integration spans both on-premises and cloud systems. ADF is ideal for those looking to leverage Azure’s broad ecosystem of services for big data, machine learning, and advanced analytics.
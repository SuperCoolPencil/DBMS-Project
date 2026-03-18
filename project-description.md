CS241 - Project Description

**1. Instructions**
1. Read the entire description before you begin your work.
2. The specifications are from end-users, so they may not be precise or complete. State all your assumptions.
3. Start early, as each deliverable has a different development time.
4. Form teams of 4 and divide the work. Each person will get marks depending on their contributions.
5. You may code in any language of your choice, though only JDBC was taught in class.

**2. Project Description**
A DBMS needs to be implemented for a real estate office that sells houses and apartments within a city. The office needs to store a lot of data, specifically:
- Agents: An agent interacts with buyers and sellers to show properties and facilitate sales. An agent may also interact with people to give properties on rent.
- Details of homes/apartments: Address, selling price, rent, details of the house (example: size 1500 sq. ft, number of bedrooms 2), year of construction.

**3. Data Generation**
You can see magicbricks.com, 99acres.com, etc. for good examples of data.

**4. Project Requirements**
1. **E-R Model**
   - Construct an E-R diagram representing the conceptual design of the database.
   - Identify primary keys, relationship cardinalities, etc.
2. **Relational Model**
   - After creating an initial relational design from your E-R design, refine it based on the principles of relational design.
   - Create the relations in MySQL.
   - Create indices (indices will be taught later) and constraints as appropriate.
   - If, as you refine your design, you discover flaws in the E-R design, go back and change it (even if the earlier design passed the checkpoint). Your final E-R design must be consistent with your relational design.
3. **Populate Relations**
   - Include enough data to make answers to your queries interesting and nontrivial for test purposes.
   - You may find it helpful to write a program to generate test data.
   - Around 20 to 30 properties and 10 to 20 agents may be sufficient per table to generate interesting queries.
4. **Queries**
   - Run enough queries to ensure that your database is populated the way you intended it to be. Given below are the queries you must demonstrate. You may be asked to demonstrate additional queries.
   - (a) List the houses in your city (for example, Guwahati) that are built later than 2023 and are available for rent.
   - (b) Find the addresses of the houses in your city costing between Rs. 20,00,000 and Rs. 60,00,000.
   - (c) Find the addresses of the houses for rent in G.S. Road (you can use the name of another locality if your city is different) with at least 2 bedrooms and costing less than Rs. 15,000 per month.
   - (d) Find the name of the agent who has sold the most property in the year 2023 by total amount in rupees.
   - (e) For each agent, compute the average selling price of properties sold in 2018, and the average time the property was on the market. Note that this suggests use of date attributes in your design.
   - (f) List the details of the most expensive houses and the houses with the highest rent in the database.
5. **Interfaces**
   - There are three types of users who access the database. Each may need a different interface:
   - (a) The database administrator (you) may use SQL via the command line.
   - (b) The real estate agent’s office, to get:
     - sales reports for each agent, consisting of the sale dates, property details, and selling price, and
     - how many properties have been given on rent by each agent, for what amount, in which area, and when.
   - (c) Agents, to update the database when a property is rented or sold.
   - These interfaces can be built as:
     - Web applications.
     - A standalone Java application with a GUI (for example, Swing).
     - A standalone Java application with a command line interface.
     - Any other GUI tool you may know.

**5. Deliverables**
The last date for each item for CS21 (CS22) are as given below. In each deliverable, clearly mark each person’s contribution.
1. **ER diagram, with assumptions, in a document**
   - CS21: 25 March (CS22: 24 March)
   - Maximum two pages. You can draw this with any tool or it can be hand-written.
   - [1 mark for writing each person’s contribution + 9 marks for deliverable + 10 marks for viva]
2. **Relational design, with data populated**
   - CS21: 1 April (CS22: 7 April)
   - Provide the SQL tables and their primary and foreign keys. Create them in a database.
   - [1 mark for stating each person’s contribution + 4 marks for deliverable + 5 marks for viva]
3. **Interface for the database administrator with all queries working, as demo**
   - CS21: 8 April (CS22: 14 April)
   - You may be asked to run more queries than listed above.
   - [1 mark for stating each person’s contribution + 10 marks for deliverable + 10 marks for viva]
4. **Interface for real estate office and agents, as demo**
   - CS21: 22 April (CS22: 21 April)
   - [1 mark for recording each person’s contribution in the tool in an “About” menu + 9 marks for deliverable + 10 marks for viva]

For all items, there will be a viva component where you will be asked to explain your choices. For items 3 and 4 above, you will be asked to explain parts of your code and your data.

**6. Developing a Website**
If you choose to develop a website (it is not mandatory), the following is one of the ways to do it:
1. You can use the frontend as HTML + CSS + JavaScript. The backend will have Java Servlets / JSP running on a Tomcat server. For this, you will need to download a Tomcat server.
2. You will access the database using JDBC.

Flow:
- The browser sends the request to Tomcat, which routes it to a Java Servlet.
- The Servlet uses JDBC to query the database.
- The data comes back and a JSP page renders it into HTML.
- The browser receives the finished webpage.

You are allowed to use frameworks such as Spring Boot.

**7. On AI Usage**
1. You are allowed to use any AI tool of your choice. If you choose to do so, each deliverable will have one extra page that states which tool you used, what you used it for, and how you used it. Include the key prompts or interactions that produced significant parts of the system. There will be a penalty of 3 marks per deliverable if AI was used but this part is missing.
2. You will own the output generated by AI, including all code and documents. You may be asked to answer any question on the deliverable and you should be able to answer, even if it is AI-generated.
3. The code should contain key architectural components: frontend, interface to the database such as JDBC, database (only MySQL) with working queries.

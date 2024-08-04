<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DATA AGGREGATION</title>
    <style>
        body {
            background-color: #f4f4f4; /* Light background */
        }
        
        .table-container {
            margin-bottom: 30px; /* Add space between tables */
        }

        table {
            width: 80%; /* Adjust as needed */
            margin: 20px auto; /* Center the table */
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 12px;
            text-align: left; 
            font-family: Arial, sans-serif; 
        }

        tr:nth-child(even) {
            background-color: #f2f2f2; 
        }

        tr:hover {
            background-color: #ddd; 
        }

        h1 {
            text-align: center;
            color: #333; 
            font-family: 'Georgia', serif; 
        }
    </style>
</head>
<body>
    <h1>DATA AGGREGATION</h1>
    <%
        Connection conn = null;
        try {
            String URL = "jdbc:mysql://localhost:3306/mycvproject";
            String USER = "root";
            String PASSWORD = "root";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            
            String query1 = "SELECT concat(fName,' ',lName) as FULL_NAME ,count(projectName) as NO_OF_PROJECTS FROM mycvproject.person p inner join mycvproject.project pr on p.idperson =pr.person_idperson group by concat(fName,' ',lName);";
            String query2 = "SELECT count(*) as NO_PERSON_IN_CAIRO FROM mycvproject.person where city ='cairo';";
            String query3 = "SELECT count(*) as football_number FROM mycvproject.hobby h inner join mycvproject.person p on p.idperson=h.idhobby where p.country='Egypt' and h.hobbyName='football';";
            String query4 = "SELECT appName, count(fName) as NO_OF_PERSONS FROM mycvproject.person p inner join mycvproject.app a on p.idperson=a.person_idperson group by appName;";
            String query5 = "select languageName,count(*) as NO_PERSON_USING_LANG from mycvproject.person p inner join mycvproject.language l on p.idperson=l.person_idperson group by languageName;" ;
            String query6 = "SELECT hobbyName,count(*) as NO_OF_PERSON FROM mycvproject.person p inner join mycvproject.hobby h on p.idperson=h.person_idperson group by hobbyName order by NO_OF_PERSON desc;";
            String query7 = "SELECT siteAddress,count(*) as NO_OF_PERSON FROM mycvproject.person p inner join mycvproject.site s on p.idperson=s.person_idperson group by siteAddress order by NO_OF_PERSON desc;";
            String query8 = "SELECT projectName,count(*) as NO_OF_PERSON_IN_PROJECT FROM mycvproject.person p inner join mycvproject.project pr on p.idperson =pr.person_idperson group by projectName;";
            
            // Using multiple statement objects
            Statement stmt = conn.createStatement();

            
            
            

            // Output table for query2 results
            ResultSet rs1 = stmt.executeQuery(query1);
            out.println("<div class='table-container'>");
            out.println("<table><tr><th>FULL_NAME</th><th>NO_OF_PROJECTS</th></tr>");
            while (rs1.next()) {
                out.println("<tr><td>" + rs1.getString("FULL_NAME") + "</td><td>" + rs1.getString("NO_OF_PROJECTS") + "</td></tr>");
            }
            
            out.println("</table></div>");
            rs1.close();
            // Output table for query2 results
            ResultSet rs2 = stmt.executeQuery(query2);
            out.println("<div class='table-container'>");
            out.println("<table><tr><th>Number Of Person in CAIRO</th></tr>");
            while (rs2.next()) {
                out.println("<tr><td>" + rs2.getString("NO_PERSON_IN_CAIRO") + "</td></tr>");
            }
            out.println("</table></div>");
            rs2.close();

            // Output table for query3 results
            ResultSet rs3 = stmt.executeQuery(query3);
            out.println("<div class='table-container'>");
            out.println("<table><tr><th>Number Of People Playing Football</th></tr>");
            while (rs3.next()) {
                out.println("<tr><td>" + rs3.getString("football_number") + "</td></tr>");
            }
            out.println("</table></div>");
        
            rs3.close();
            
            // Output table for query4 results
            ResultSet rs4 = stmt.executeQuery(query4);
            out.println("<div class='table-container'>");
            out.println("<table><tr><th>INSTITUATIONS</th><th>NO_OF_PERSONS</th></tr>");
            while (rs4.next()) {
                out.println("<tr><td>" + rs4.getString("appName") + "</td><td>" + rs4.getString("NO_OF_PERSONS") + "</td></tr>");
            }
            
            out.println("</table></div>");
            rs4.close();
            // Output table for query4 results
            ResultSet rs5 = stmt.executeQuery(query5);
            out.println("<div class='table-container'>");
            out.println("<table><tr><th>LANGUAGES</th><th>NO_PERSON_USING_LANG</th></tr>");
            while (rs5.next()) {
                out.println("<tr><td>" + rs5.getString("languageName") + "</td><td>" + rs5.getString("NO_PERSON_USING_LANG") + "</td></tr>");
            }
            
            out.println("</table></div>");
            rs5.close();

            
            // Output table for query4 results
            ResultSet rs6 = stmt.executeQuery(query6);
            out.println("<div class='table-container'>");
            out.println("<table><tr><th>HOBBIES</th><th>NO_OF_PERSON</th></tr>");
            while (rs6.next()) {
                out.println("<tr><td>" + rs6.getString("hobbyName") + "</td><td>" + rs6.getString("NO_OF_PERSON") + "</td></tr>");
            }
            
            out.println("</table></div>");
            rs6.close();
            
            // Output table for query4 results
            ResultSet rs7 = stmt.executeQuery(query7);
            out.println("<div class='table-container'>");
            out.println("<table><tr><th>SITE</th><th>NO_OF_PERSON_IN_SITE</th></tr>");
            while (rs7.next()) {
                out.println("<tr><td>" + rs7.getString("siteAddress") + "</td><td>" + rs7.getString("NO_OF_PERSON") + "</td></tr>");
            }
            
            out.println("</table></div>");
            rs7.close();

            // Output table for query8 results
            ResultSet rs8 = stmt.executeQuery(query8);
            out.println("<div class='table-container'>");
            out.println("<table><tr><th>PROJECTS</th><th>NO_OF_PERSON_IN_PROJECT</th></tr>");
            while (rs8.next()) {
                out.println("<tr><td>" + rs8.getString("projectName") + "</td><td>" + rs8.getString("NO_OF_PERSON_IN_PROJECT") + "</td></tr>");
            }
            
            out.println("</table></div>");
            rs8.close();
            
            
            
            
            
            
            stmt.close();


        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    %>
</body>
</html>

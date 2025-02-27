<%--
    Document   : insert2databaseApplication
    Created on : Mar 17, 2018, 1:58:10 AM
    Author     : mahmoud 
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MY CV PROJECT</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #5a5a5a;
        }
        form {
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            width: 90%;
            max-width: 600px;
        }
        .tb {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            margin: 20px 0;
        }
        td {
            padding: 8px;
        }
        td.label {
            text-align: right;
            font-weight: bold;
            white-space: nowrap;
        }
        td.input {
            text-align: left;
        }
    </style>

    </head>
    <body onload="displayResults()">
        <h1 id="nav" >MY CV PROJECT</h1>
        <%!
            public class CV {

                String URL = "jdbc:mysql://127.0.0.1:3306/mycvproject?allowPublicKeyRetrieval=true&useSSL=false";
                String USER = "root";
                String PASSWORD = "root";
                int person_id = 0 ;
                Connection connection = null;
                PreparedStatement insertPerson = null;
                PreparedStatement insertCourses = null;
                PreparedStatement courses = null ;
                PreparedStatement projects = null ;
                PreparedStatement languages = null ;
                PreparedStatement sites = null ;
                PreparedStatement hobbies = null ;
                PreparedStatement apps = null ;
                ResultSet resultSet = null;
                ResultSet rs = null ;
                ResultSet rss = null ;
                public CV() {

                    try {
                        connection = DriverManager.getConnection(URL, USER, PASSWORD);
                    } catch (SQLException ex) {
                        ex.printStackTrace();

                    }
                }

                public int insertPerson(String first, String last, String address,String city, String country, String email) {
                    int result = 0;

                    try {
                        insertPerson = connection.prepareStatement("INSERT INTO mycvproject.person (fName,lName,Address,city,country,email)"
                                + " VALUE (?,?,?,?,?,?)" , Statement.RETURN_GENERATED_KEYS);
                        insertPerson.setString(1, first);
                        insertPerson.setString(2, last);
                        insertPerson.setString(3, address);
                        insertPerson.setString(4, city);
                        insertPerson.setString(5, country);
                        insertPerson.setString(6, email);
                        result = insertPerson.executeUpdate();
                        rs = insertPerson.getGeneratedKeys() ;
                        if(rs.next()){
                            person_id = rs.getInt(1) ;
                        }
                    } catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return result;
                }


                public int insertCourses(String firstC , String secondC , String thirdC , int id ){
                    int res = 0;

                    try {
                        courses = connection.prepareStatement("insert into mycvproject.course (courseName,person_idperson) value(?,?)" ) ;
                            courses.setInt(2 , id) ;
                            if(firstC != null ){
                                 courses.setString(1 , firstC);
                                 courses.executeUpdate();
                            }
                            if(secondC != null ){
                                courses.setString(1 , secondC);
                                courses.executeUpdate();
                            }
                            if(thirdC != null ){
                                courses.setString(1 , thirdC);
                                courses.executeUpdate();
                            }


                        }
                    catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return res;
                    }
                public int insertProjects(String firstP,String secondP,String thirdP, int id){
                    int res1 = 0;

                    try {
                        courses = connection.prepareStatement("insert into mycvproject.project (projectName,person_idperson) value(?,?)" ) ;
                            courses.setInt(2 , id) ;
                            if(firstP != null ){
                                 courses.setString(1 , firstP);
                                 courses.executeUpdate();
                            }
                            if(secondP != null ){
                                courses.setString(1 , secondP);
                                courses.executeUpdate();
                            }
                            if(thirdP != null ){
                                courses.setString(1 , thirdP);
                                courses.executeUpdate();
                            }


                        }
                    catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return res1;
                }
                public int inserthobbies(String firstH,String secondH,String thirdH, int id){
                    int res2 = 0;

                    try {
                        hobbies = connection.prepareStatement("insert into mycvproject.hobby (hobbyName,person_idperson) value(?,?)" ) ;
                            hobbies.setInt(2 , id) ;
                            if(firstH != null ){
                                 hobbies.setString(1 , firstH);
                                 hobbies.executeUpdate();
                            }
                            if(secondH != null ){
                                hobbies.setString(1 , secondH);
                                hobbies.executeUpdate();
                            }
                            if(thirdH != null ){
                                hobbies.setString(1 , thirdH);
                                hobbies.executeUpdate();
                            }


                        }
                    catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return res2;
                }
                public int insertSite(String address ,int id){
                    int res3=0;
                    try {                                  
                        sites= connection.prepareStatement("insert into mycvproject.site (siteAddress , person_idperson) value(?,?)");
                            sites.setInt(2, id);
                            sites.setString(1, address);
                            sites.executeUpdate();
                    
                    }
                    catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return res3;
                    }
                public int insertlanguages(String firstL,String secondL,String thirdL, int id){
                    int res4 = 0;

                    try {
                        languages = connection.prepareStatement("insert into mycvproject.language (languageName,person_idperson) value(?,?)" ) ;
                            languages.setInt(2 , id) ;
                            if(firstL != null ){
                                 languages.setString(1 , firstL);
                                 languages.executeUpdate();
                            }
                            if(secondL != null ){
                                languages.setString(1 , secondL);
                                languages.executeUpdate();
                            }
                            if(thirdL != null ){
                                languages.setString(1 , thirdL);
                                languages.executeUpdate();
                            }


                        }
                    catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return res4;
                }
                public int insertapps(String firstT,String secondT ,String thirdT ,int id){
                    int res5=0;
                    try {                                  
                        apps= connection.prepareStatement("insert into mycvproject.app (appName , person_idperson) value(?,?)");
                            apps.setInt(2, id);
                            if(firstT != null ){
                                 apps.setString(1 , firstT);
                                 apps.executeUpdate();
                            }
                            if(secondT != null ){
                                apps.setString(1 , secondT);
                                apps.executeUpdate();
                            }
                            if(thirdT != null ){
                                apps.setString(1 , thirdT);
                                apps.executeUpdate();
                            }
                    
                    }
                    catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return res5;
                    }


            }
        %>
        <%
            int result = 0;
            int res = 0;
            int res1 = 0;
            int res2 = 0;
            int res3 = 0;
            int res4 = 0 ;
            int res5 = 0;
            if (request.getParameter("submit") != null) {
                //to insert person
                String firstName = new String();
                String lastName = new String();
                String city = new String();
                String address = new String();
                String country = new String();
                String email = new String();

                // to insert courses
                String firstC = new String();
                String secondC = new String();
                String thirdC = new String();

                //to insert projects
                String firstP = new String();
                String secondP = new String();
                String thirdP = new String();
                
                //to insert hobbies
                String firstH = new String();
                String secondH = new String();
                String thirdH = new String();
                
                //to insert sites 
                String address1 = new String();
                
                //to insert languages
                String firstL = new String();
                String secondL = new String();
                String thirdL = new String();
                
                // to insert apps
                String firstT = new String();
                String secondT = new String();
                String thirdT = new String();
                

                if (request.getParameter("first") != null) {
                    firstName = request.getParameter("first");
                }
                if (request.getParameter("last") != null) {
                    lastName = request.getParameter("last");
                }
                if (request.getParameter("city") != null) {
                    city = request.getParameter("city");
                }
                if (request.getParameter("address") != null) {
                    address = request.getParameter("address");
                }
                if (request.getParameter("address") != null) {
                    address = request.getParameter("address");
                }
                if (request.getParameter("country") != null) {
                    country = request.getParameter("country");
                }
                if (request.getParameter("email") != null) {
                    email = request.getParameter("email");
                }

                if (request.getParameter("firstC") != null) {
                    firstC = request.getParameter("firstC");
                }
                if (request.getParameter("secondC") != null) {
                    secondC = request.getParameter("secondC");
                }
                if (request.getParameter("thirdC") != null) {
                    thirdC = request.getParameter("thirdC");
                }

                 if (request.getParameter("firstP") != null) {
                    firstP = request.getParameter("firstP");
                }
                if (request.getParameter("secondP") != null) {
                    secondP = request.getParameter("secondP");
                }
                if (request.getParameter("thirdP") != null) {
                    thirdP = request.getParameter("thirdP");
                }
                if (request.getParameter("firstH") != null) {
                    firstH = request.getParameter("firstH");
                }
                if (request.getParameter("secondH") != null) {
                    secondH = request.getParameter("secondH");
                }
                if (request.getParameter("thirdH") != null) {
                    thirdH = request.getParameter("thirdH");
                }
                if (request.getParameter("firstL") != null) {
                    firstL = request.getParameter("firstL");
                }
                if (request.getParameter("secondL") != null) {
                    secondL = request.getParameter("secondL");
                }
                if (request.getParameter("thirdL") != null) {
                    thirdL = request.getParameter("thirdL");
                }
                if (request.getParameter("firstT") != null) {
                    firstT = request.getParameter("firstT");
                }
                if (request.getParameter("secondT") != null) {
                    secondT = request.getParameter("secondT");
                }
                if (request.getParameter("thirdT") != null) {
                    thirdT = request.getParameter("thirdT");
                }


                CV person = new CV();
                
                result = person.insertPerson(firstName, lastName, address, city, country, email);
                res = person.insertCourses(firstC, secondC, thirdC, person.person_id) ;
                res1 = person.insertProjects(firstP, secondP, thirdP,person.person_id);
                res2 = person.inserthobbies(firstH, secondH, thirdH,person.person_id);
                res3 = person.insertSite(country+"-"+city+"-"+address,person.person_id);
                res4 = person.insertlanguages(firstL, secondL, thirdL, person.person_id);
                res5 = person.insertapps(firstT, secondT, thirdT, person.person_id);






            }
        %>
    <center>
        <form name="myForm" action="index.jsp" method="POST">

            <table border="0">

                <tbody>
                    <tr>
                        <td>First Name:</td>
                        <td><input class ="tb" type="text" name="first" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input class ="tb" type="text" name="last" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>address:</td>
                        <td><input class ="tb" type="text" name="address" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>country:</td>
                        <td><select class ="tb" name="country">
                                <option>Egypt</option>
                                <option>England</option>
                                <option>US</option>
                                <option>Spain</option>
                                <option>Italy</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>city:</td>
                        <td><select class ="tb"  name="city" >
                                <option >Cairo</option>
                                <option >Giza</option>
                                <option >Alexandria</option>
                                <option value="al-sharqia">Al-sharqia</option>
                                <option value="aswan">Aswan</option>
                                <option value="assiut">Assiut</option>
                                <option value="luxor">Luxor</option>
                                <option value="mansoura">Mansoura</option>
                                <option value="suez">Suez</option>
                                <option value="port-said">Port Said</option>
                                <option value="ismailia">Ismailia</option>
                                <option value="fayoum">Fayoum</option>
                                <option value="minya">Minya</option>
                                <option value="beni-suef">Beni Suef</option>
                                <option value="qena">Qena</option>
                                <option value="sohag">Sohag</option>
                                <option value="tanta">Tanta</option>
                                <option value="zagazig">Zagazig</option>
                                </select></td>
                    </tr>
                    <tr>
                        <td>email:</td>
                        <td><input class ="tb" type="text" name="email" value="" size="50" /></td>
                    </tr>

                <tr>
                    <td>Latest 3 projects:</td>
                    <td>
                    <input  type="text" name="firstP" value="" size="50"  />
                    <input    type="text" name="secondP" value="" size="50"  />
                    <input type="text" name="thirdP" value="" size="50"  />
                    </td>

                </tr>

                <tr>
                    <td>Latest 3 courses:</td>
                    <td><input class ="tb"type="text" name="firstC" value="" size="50" />
                        <input class ="tb"type="text" name="secondC" value="" size="50" />
                        <input class ="tb" type="text" name="thirdC" value="" size="50" /></td>
                </tr>

                <tr>
                    <td>Languages:</td>
                    <td><input class ="tb" type="text" name="firstL" value="" size="50" />
                        <input class ="tb" type="text" name="secondL" value="" size="50" />
                        <input class ="tb" type="text" name="thirdL" value="" size="50" /></td>
                </tr>

                <tr>
                    <td>Hobbies:</td>
                    <td><input class ="tb" type="text" name="firstH" value="" size="50" />
                        <input class ="tb" type="text" name="secondH" value="" size="50" />
                        <input class ="tb" type="text" name="thirdH" value="" size="50" /></td>
                </tr>

                <tr>
                    <td>Training:</td>
                    <td><input class ="tb" type="text" name="firstT" value="" size="50" />
                        <input class ="tb" type="text" name="secondT" value="" size="50" />
                        <input class ="tb" type="text" name="thirdT" value="" size="50" /></td>
                </tr>

                </tbody>
            </table>
            <input  class ="btn" type="submit" value="Submit" name="submit" />
            <button type="button" class="btn" onclick="redirectToAggregate()">AGGREGATE</button>
            <input class ="tb" type="hidden" name="hidden" value="<%= result%>" size="50" />
            
            
        </form>

    </center>

    <SCRIPT LANGUAGE="JavaScript">
        <!--
       function displayResults() {
            if (document.myForm.hidden.value == 1) {
                alert("Thanks for inserting your Data");
            }
        }
        function redirectToAggregate() {
            window.location.href = "aggregate.jsp";
        }
        //-->
    </SCRIPT>
</body>
</html>

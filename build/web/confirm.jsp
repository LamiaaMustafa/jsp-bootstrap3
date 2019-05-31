<%-- 
    Document   : confirm
    Created on : May 31, 2019, 4:58:06 AM
    Author     : Syla-Group
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>confirm</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/mycss.css"/>
    </head>
    <body>
        <%
            String idcard=request.getParameter("idcard");
            String travelid=request.getParameter("travelid");
            String s="";
            String col="";

             if(idcard!=null && idcard!=""){
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    String url="jdbc:mysql://localhost:3306/traveldb";
                    Connection con=DriverManager.getConnection(url, "root", "");
                    Statement stm= con.createStatement();
                    int n=stm.executeUpdate("UPDATE `journey-traveller` SET `confirm` = '1' WHERE `journey-traveller`.`journeyId` = '"+travelid+"' AND `journey-traveller`.`travellerId` = '"+idcard+"'");
                    if(n==1){
                       s="تم تثبيت الحجز بنجاح";
                       col="success";
                    }else{
                       s="فشل تثبيت الحجز";
                       col="danger";
                    }
                    }catch (Exception ex){
                   //out.println(ex.getMessage());
                    s="فشل تثبيت الحجز";
                    col="danger";
                    

                   }//catch
             }
                      
        %>
        
        <div class="alert alert-<%out.print(col);%>" role="alert">
                <% out.println(s);%>
            <a href="menu.jsp" role="button" class="btn btn-primary">عودة</a>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="javascript/bootstrap.min.js"></script>
          
         
    </body>
</html>
        
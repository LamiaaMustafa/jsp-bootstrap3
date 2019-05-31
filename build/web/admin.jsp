<%-- 
    Document   : admin
    Created on : May 31, 2019, 6:39:36 AM
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
        <title>admin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/mycss.css"/>
        <style>
            .page-header{
                color: #6c76d7 ;
            }
        </style>
    </head>
    <body>
<%
        String s=(String)session.getAttribute("userid");
        if(s==null){
        response.sendRedirect("index.jsp");
        }
           %>
        <div class="container">   
<div class="row">
            <div class="col-xs-1" style="margin-top:20px;">
                <a href="index.jsp"><span class="glyphicon glyphicon-arrow-left " aria-hidden="true"></span> رجوع</a>
            </div>
            <h1 class="page-header">مرحبا <%=s %> </h1>
            </div>
            <div class="row" style="margin-top:40px;">
                    <div class="col-xs-4 ">
                        <a role="button" href="travellersnames.jsp" class="btn btn-primary btn-lg">عرض اسماء الركاب</a>
                    </div>
                    <div class="col-xs-3">
                        <a role="button" href="user.jsp"  class="btn btn-primary btn-lg"> ادارة وتنظيم الرحلات</a>
                    </div>
                    <div class="col-xs-3">
                        <a role="button" href="employee.jsp"  class="btn btn-primary btn-lg"> ادارة و ذاتية الموظفين</a>
                    </div>
           
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : reserve
    Created on : May 29, 2019, 11:17:11 AM
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
        <title>reserve</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/mycss.css"/>
    </head>
    <body>
        <% 
            String idcard=request.getParameter("idcard");
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String telnum=request.getParameter("telnum");
            String email=request.getParameter("email");
            String travelid=request.getParameter("travelid");
            String s="";
            String col="";
            
            if(idcard!=null && idcard!=""){
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    String url="jdbc:mysql://localhost:3306/traveldb";
                    Connection con=DriverManager.getConnection(url, "root", "");
                    Statement stm= con.createStatement();
                     ResultSet rs=stm.executeQuery("SELECT freeseats.numofseats FROM freeseats WHERE freeseats.id='"+travelid+"'");
                     if(rs.next()){
                        int num=rs.getInt(1);
                        if(num!=0){
                    ResultSet r=stm.executeQuery("select idCard from traveller where idCard like '"+idcard+"'");
                    if(r.next()){
                        int n=stm.executeUpdate("INSERT INTO `journey-traveller` (`journeyId`, `travellerId`, `confirm`) VALUES ('"+travelid+"', '"+idcard+"', '0')");
                        if(n==1){
                           s="تم الحجز بنجاح";
                           col="success";
                        }else{
                           s="فشل الحجز";
                           col="danger";
                        }
                    }else{
                        int m=stm.executeUpdate("insert into traveller values('"+idcard+"','"+firstname+"','"+lastname+"','"+telnum+"','"+email+"')");
                        if(m==1){
                           int i=stm.executeUpdate("INSERT INTO `journey-traveller` (`journeyId`, `travellerId`, `confirm`) VALUES ('"+travelid+"', '"+idcard+"', '0')");
                           
                           if(i==1){
                           s="تم الحجز بنجاح";
                           col="success";

                           }
                        }else{
                           s="فشل الحجز";
                          col="danger";

                        }
                    }

                    r.close();
                     }
                        else{
                             s= "فشل الحجز ! لا يوجد أماكن شاغرة في الرحلة المطلوبة";
                          col="danger";
                        }
                     }   
                     rs.close();
                   }catch (Exception ex){
                   //out.println(ex.getMessage());
                    s="فشل الحجز";
                    col="danger";
                    

                   }//catch
            }

            
                    %> 
            <div class="alert alert-<%out.print(col);%>" role="alert">
<% out.println(s);
          %>
          <a href="menu.jsp" role="button" class="btn btn-primary">عودة</a>
                            </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="javascript/bootstrap.min.js"></script>
          
         
    </body>
</html>

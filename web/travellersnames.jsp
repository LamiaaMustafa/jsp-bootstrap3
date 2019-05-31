<%-- 
    Document   : travellersnames
    Created on : May 31, 2019, 12:13:08 PM
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
        <style>
            .page-header{
                color: #6c76d7 ;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
            <div class="col-xs-1" style="margin-top:20px;">
                <a href="user.jsp"><span class="glyphicon glyphicon-arrow-left " aria-hidden="true"></span> رجوع</a>
            </div>
                        <div class="col-xs-11" style="margin-top:20px;">
                    <h1 class="page-header">عرض اسماء المسافرين</h1>
                        </div>
            </div>
                    <form method="post">
                        <div class="row">
                            <div class="form-group col-sm-2 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary btn-sm" id="show">عرض</button>
                            </div>
                            <div class="form-group col-sm-4 col-sm-offset-1">
                                
                                <input type="text" class="form-control  " id="travelid" name="travelid" placeholder="رقم الرحلة" required>
                            </div>
                                <label  for="travelid" class="col-sm-1">رقم الرحلة</label>
                            
                        </div>
                        
                    </form>
                    <div class="row row-content" >
                
                <%
                    String travelid=request.getParameter("travelid");
                    if(travelid!=null){
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/traveldb";
                   Connection con=DriverManager.getConnection(url, "root", "");
                   Statement stm= con.createStatement();
                   String sql="select traveller.*,`journey-traveller`.`confirm` from traveller JOIN `journey-traveller` on traveller.idCard=`journey-traveller`.`travellerId` where `journey-traveller`.`journeyId`='"+travelid+"'";
                   ResultSet r=stm.executeQuery(sql);
                   %>
                   <div class="table-responsive">
                    <table class="table table-striped">
                        <tr >
                          <th>الرقم الوطني </th>
                          <th>الاسم الاول</th>
                          <th>الاسم الاخير</th>
                          <th>الهاتف</th>
                          <th>الايميل</th>
                          <th>تثبيت الحجز</th>                                    
                     </tr>
                  <%
                   while(r.next()){
                  %>
                  <tr style="text-align: left;">
                      <td><%=r.getString(1) %></td>  
                      <td><%=r.getString(2) %></td> 
                      <td><%=r.getString(3) %></td>  
                      <td><%=r.getString(4) %></td>  
                      <td><%=r.getString(5) %></td>  
                      <td><%=r.getString(6) %></td> 
                  </tr>
                  <%
                  }//while

                 out.println("</table> ");

                   r.close();
                   }catch (Exception ex){
                   out.println(ex.getMessage());
                   }//catch
                }
                    %> 
                </div>
     </div>
                    </body>
</html>

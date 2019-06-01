<%-- 
    Document   : menu
    Created on : May 26, 2019, 11:49:21 AM
    Author     : Syla-Group
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ar">
    <head>
        <title>menu</title>
      
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/mycss.css"/>
    </head>
    <body>
        <nav class="navbar navbar-inverse ">
            <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header navbar-right">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="images/logo.png" alt="Brand" height="30" width="41"/></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> الرئيسية <span class="sr-only">(current)</span></a></li>
        <li> <a href="aboutus.html"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> حول</a></li>
        <li class="active"><a href="#"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> قائمة الرحلات</a></li>
        <li><a href="contact.html"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> الاتصال بنا</a></li>
        
      </ul>
      
      <ul class="nav navbar-nav navbar-left">
        <li><a id="loginbutton"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> تسجيل دخول</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
        </nav>
        <div id="loginModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">تسجيل دخول</h4>
                  
                </div>
                <div class="modal-body">
                    <form method="post" action="login.jsp">
                        <div class="row">
                            <div class="form-group col-sm-6">
                                    <label  for="username">اسم المستخدم</label>
                                    <input type="text" class="form-control  " id="username" name="username" placeholder="اسم المستخدم" required>
                            </div>
                            <div class="form-group col-sm-6">
                                <label  for="Password">كلمة المرور</label>
                                <input type="password" class="form-control  " id="Password" name="Password" placeholder="كلمة المرور" required>
                            </div>
                            
                        </div>
                        <div class="row">
                            <button type="button" class="btn btn-default btn-sm " data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm">Sign in</button>        
                        </div>
                    </form>
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
          </div><!-- /.modal -->
        <header class="jumbotron">
            <div class="container">
                <div class="row">
                    
                    <div class="col-xs-12 col-sm-offset-3 col-sm-6 ">
                        <h1 >رحلات  <small>للسياحة و السفر</small> </h1>
                    </div>
                    <div class="col-xs-12 col-sm-3 ">
                        <img src="images/logo.png" alt="رحلات" height="150" width="200" />
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
        <div class="row">
            <ol class="col-xs-12 breadcrumb">
                    <li ><a href="./index.jsp">الرئيسية</a></li>
                    <li class="active">قائمة الرحلات</li>
            </ol>    
            <div class="col-xs-12">
                <h1 class="page-header">قائمة الرحلات</h1>
            </div>
        </div>
            <form method="post">
                    <div class="row">
                        <div class="col-xs-12 col-md-5">
                            <a role="button" id="reserve" class="btn btn-success btn-lg"> حجز</a>
                            <a role="button" id="confirm" class="btn btn-info btn-lg"> تثبيت الحجز</a>
                        </div>
                        
                        <div class="col-xs-9 col-md-4 col-md-offset-2">
                                <input type="text" class="form-control  " id="searchinput" name="searchinput" >
                        </div>
                        <div class=" col-md-1 col-xs-3">
                        <button type="submit" class="btn btn-primary btn-sm" id="search">بحث</button>
                        </div>
                        
                    </div>
                    
                </form>    
            
            <div class="row row-content" >
                
                <%
                    String search=request.getParameter("searchinput");
                    String sql="";
                    if(search!=null){
                         sql="select * from journey WHERE journey.date >= (SELECT CURDATE()) and destination like '%"+search+"%'";
                        }else{
                        sql="select * from journey WHERE journey.date >= (SELECT CURDATE())";
                    }

                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/traveldb";
                   Connection con=DriverManager.getConnection(url, "root", "");
                   Statement stm= con.createStatement();
                   ResultSet r=stm.executeQuery(sql);
                   %>
                   <div class="table-responsive">
                    <table class="table table-striped">
                        <tr >
                          <th>رقم </th>
                          <th>الوجهة</th>
                          <th>التاريخ</th>
                          <th>الوقت</th>
                          <th>الوصف</th>                                    
                          <th>السعر</th>                                    
                     </tr>
                  <%
                   while(r.next()){
                  %>
                  <tr style="text-align: left;">
                      <td><%=r.getString(1) %></td>  
                      <td><%=r.getString(2) %></td> 
                      <td><%=r.getString(3) %></td>  
                      <td><%=r.getString(4) %></td>  
                      <td><%=r.getString(6) %></td> 
                      <td><%=r.getString(7) %></td> 
                  </tr>
                  <%
                  }//while

                 out.println("</table> ");

                   r.close();
                   }catch (Exception ex){
                   out.println(ex.getMessage());
                   }//catch
                    %> 
                </div>
                
            </div>
                
        </div>
                <div id="reserveModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">الحجز</h4>
                  
                </div>
                <div class="modal-body">
                    <form method="post" action="reserve.jsp">
                        <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="الاسم الأول" required>
                        </div>
                         <label for="firstname" class="col-md-2 ">الاسم الأول</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="الاسم الأخير" required>
                        </div>
                        <label for="lastname" class="col-md-2 ">الاسم الأخير</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="idcard" name="idcard" placeholder="الرقم الوطني" required>
                        </div>
                        <label for="lastname" class="col-md-2 ">الرقم الوطني</label>

                    </div>    
                    <div class="form-group row">
                            
                        <div class="col-md-10">
                                <input type="tel" class="form-control" id="telnum" name="telnum" placeholder="رقم الهاتف" required>
                            </div>
                             <label for="telnum" class="col-xs-12 col-md-2 ">رقم الهاتف</label>

                        </div>
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="email" class="form-control" id="email" name="email" placeholder="ايميل">
                            </div>
                            <label for="email" class="col-md-2">ايميل</label>

                        </div>
                         <div class="form-group row">
                                <div class="col-md-10">
                                    <%
                                     try{
                                     Class.forName("com.mysql.jdbc.Driver");
                                     String url="jdbc:mysql://localhost:3306/traveldb";
                                     Connection con=DriverManager.getConnection(url, "root", "");
                                     Statement stm= con.createStatement();
                                     ResultSet r=stm.executeQuery("select id from journey WHERE journey.date > (SELECT CURDATE())");
                                     %>
                                    <select class="form-control" id="travelid" name="travelid">
                                         <% while(r.next()){
                                            %>
                                            <option><%=r.getString(1) %></option>
                                            <%
                                            }
                                             r.close();
                                             }catch (Exception ex){
                                             out.println(ex.getMessage());
                                             }//catch
                                            %>
                                    </select>
                                        </div>                            
                                        <label class="col-md-2" >رقم الرحلة</label>
                                    </div>
                        <div class="row">
                            <button type="button" class="btn btn-default btn-sm " data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm">احجز</button>        
                        </div>
                    </form>
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
          </div><!-- /.modal -->
          
       <div id="confirmModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">تثبيت الحجز</h4>
                  
                </div>
                <div class="modal-body">
                    <form method="post" action="confirm.jsp">
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="idcard" name="idcard" placeholder="الرقم الوطني" required>
                            </div>
                            <label for="lastname" class="col-md-2 ">الرقم الوطني</label>

                        </div> 
                        <div class="form-group row">
                        <div class="col-md-10">
                            <%
                             try{
                             Class.forName("com.mysql.jdbc.Driver");
                             String url="jdbc:mysql://localhost:3306/traveldb";
                             Connection con=DriverManager.getConnection(url, "root", "");
                             Statement stm= con.createStatement();
                             ResultSet r=stm.executeQuery("select id from journey WHERE journey.date >(SELECT CURDATE()) OR (journey.date =(SELECT CURDATE()) AND journey.time > ADDTIME((SELECT CURTIME()),'01:00:00') )");
                             %>
                            <select class="form-control" id="travelid" name="travelid">
                                 <% while(r.next()){
                                    %>
                                    <option><%=r.getString(1) %></option>
                                    <%
                                    }
                                     r.close();
                                     }catch (Exception ex){
                                     out.println(ex.getMessage());
                                     }//catch
                                    %>
                            </select>
                                </div>                            
                                <label class="col-md-2" >رقم الرحلة</label>
                        </div>
                        <div class="row">
                            <button type="button" class="btn btn-default btn-sm " data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm">تثبيت</button>        
                        </div>
                    </form>
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
          </div><!-- /.modal -->
          
        <footer class="footer">
        <div class="container">
            <div class="row">             
                <div class="col-xs-4 col-xs-offset-1 col-sm-2">
                    <h5>Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="./index.jsp">Home</a></li>
                        <li><a href="./aboutus.html">About</a></li>
                        <li><a href="#">Menu</a></li>
                        <li><a href="./contact.html">Contact</a></li>
                    </ul>
                </div>
                <div class="col-xs-7 col-sm-5">
                    <h5>العنوان</h5>
                    <address>
		               سوريا ، دمشق, شارع السلام،121
		             
		              <br>
		              <i class="glyphicon glyphicon-earphone"></i> : +963 1234 578<br>
                      <i class="glyphicon glyphicon-print"></i> : +963 8765 431<br>
		              <i class="glyphicon glyphicon-envelope"></i> : <a href="mailto:ravlat@travel.net">rahlat@travel.net</a>
		      </address>
                </div>
                <div class="col-xs-12 col-sm-4 ">
             
                            <a  href="http://google.com/+">google</a>, 
                            <a  href="http://www.facebook.com/profile.php?id=">facebook</a>, 
                            <a  href="http://www.linkedin.com/in/">linkedin</a>, 
                            <a  href="http://twitter.com/">twitter</a>, 
                            <a  href="http://youtube.com/">youtube</a> 
                </div>
           </div>
           <div class="row ">             
                <div>
                    <p>© Copyright 2019 Rahlat for travelling</p>
                </div>
           </div>
        </div>
    </footer>  
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="javascript/bootstrap.min.js"></script>
        <script>
            
            $("#loginbutton").click(function(){
            $('#loginModal').modal('toggle');
            });
            $("#reserve").click(function(){
            $('#reserveModal').modal('toggle');
            });
            $("#confirm").click(function(){
            $('#confirmModal').modal('toggle');
            });
        </script>
    </body>
</html>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Home</title>
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
        <li class="active"><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> الرئيسية <span class="sr-only">(current)</span></a></li>
        <li><a href="aboutus.html"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> حول</a></li>
        <li><a href="menu.jsp"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> قائمة الرحلات</a></li>
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
                                    <input type="text" class="form-control  " id="username" placeholder="اسم المستخدم">
                            </div>
                            <div class="form-group col-sm-6">
                                <label  for="Password">كلمة المرور</label>
                                <input type="password" class="form-control  " id="Password" placeholder="كلمة المرور">
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
                <div class="row ">
                    <div class="col-xs-12 col-md-3" style="padding: 50px 0px;">
                        <a role="button" id="reserve" class="btn btn-success btn-lg"> حجز</a>
                        <a role="button" id="confirm" class="btn btn-warning btn-lg"> تثبيت الحجز</a>
                        <a role="button" href="menu.jsp" class="btn btn-danger btn-lg"> بحث </a>

                    </div>
                    <div class="col-xs-12  col-sm-offset-1 col-sm-6 ">
                        <h1 >رحلات  <small>للسياحة و السفر</small> </h1>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                        <img src="images/logo.png" alt="رحلات" height="150" width="200" />
                    </div>
                </div>
            </div>
        </header>
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
                            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="الاسم الأول">
                        </div>
                         <label for="firstname" class="col-md-2 ">الاسم الأول</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="الاسم الأخير">
                        </div>
                        <label for="lastname" class="col-md-2 ">الاسم الأخير</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="idcard" name="idcard" placeholder="الرقم الوطني">
                        </div>
                        <label for="lastname" class="col-md-2 ">الرقم الوطني</label>

                    </div>    
                    <div class="form-group row">
                            
                        <div class="col-md-10">
                                <input type="tel" class="form-control" id="telnum" name="telnum" placeholder="رقم الهاتف">
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
                                     ResultSet r=stm.executeQuery("select id from journey");
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
                    <form method="post" >
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="idcard" name="idcard" placeholder="الرقم الوطني">
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
                             ResultSet r=stm.executeQuery("select id from journey");
                             %>
                            <select class="form-control">
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
          
  
        <div class="container">

            <div class="row row-content">
                <div class="col-xs-12 col-sm-offset-3 col-sm-6 ">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                   
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                      <div class="item active">
                        <img src="images/image1.png" alt="رحلات بحرية">
                        <div class="carousel-caption">
                          رحلات بحرية
                        </div>
                      </div>
                      <div class="item">
                        <img src="images/image2.png" alt="اماكن تراثية">
                        <div class="carousel-caption">
                          اماكن تراثية
                        </div>
                      </div>
                      <div class="item">
                        <img src="images/image3.png" alt="معالم أثرية">
                        <div class="carousel-caption">
                          معالم أثرية
                        </div>
                      </div>
                      <div class="item">
                        <img src="images/image4.png" alt="رحلات الى جميع أنحاء العالم">
                        <div class="carousel-caption">
                          رحلات الى جميع أنحاء العالم
                        </div>
                      </div>  
                   
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                </div>
                </div>
            </div>
            <div class="row row-content">
                <div class="col-xs-12">
                <h3>رحلات الى جميع دول العالم</h3>
            </div>
                <div class="col-xs-12">
                    <div class="media">
                        <div class="media-right media-middle">
                            <img class="media-object thumbnail" src="images/image5.png" alt="beach" height="150" width="300"/>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"> رحلات الى ماليزيا   <span class="badge ">new</span></h4>
                            جديدنا رحلات إلى ماليزيا مع إقامة في أفخم الفنادق  
                        </div>
                    </div>
                    
                </div>
            
                <div class="col-xs-12">
                <h3>رحلات الى الاماكن السياحية في سوريا</h3>
            </div>
                <div class="col-xs-12">
                    <div class="media">
                        <div class="media-right media-middle">
                            <img class="media-object thumbnail" src="images/image1.png" alt="beach" height="150" width="300"/>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"> رحلات الى الساحل السوري   <span class="badge ">Sale</span></h4>
                          رحلات إلى الساحل السوري مع إقامة في أفخم الفنادق بأسعار مخفضة و خدمة ممتازة 
                        </div>
                    </div>
                    
                </div>
                <div class="col-xs-12">
                    <div class="media">
                        <div class="media-right media-middle">
                            <img class="media-object thumbnail" src="images/image3.png" alt="beach" height="150" width="300"/>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"> رحلات الى المعالم الأثرية   </h4>
                          رحلات إلى المعالم الأثرية و الأماكن السياحية في سوريا مع اقامة في فنادق راقية و خدمات ممتازة 
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
          
        <footer class="footer">
        <div class="container">
            <div class="row">             
                <div class="col-xs-4 col-xs-offset-1 col-sm-2">
                    <h5>Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Home</a></li>
                        <li><a href="./aboutus.html">About</a></li>
                        <li><a href="./menu.jsp">Menu</a></li>
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

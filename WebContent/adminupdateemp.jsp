<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conn.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title><jsp:include page="Header/projectTitle.jsp"></jsp:include></title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<jsp:include page="validation.jsp" />
</head>
<jsp:include page="alertBox.jsp" /><body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center ">
	<div
		class="container d-flex align-items-center justify-content-between">
		<a> <img src="photos/super_logo.jpeg" style="width: 45%; height: 45%;"></a>

		<nav id="navbar" class="navbar"> <%@ include
			file="Header/adminHeader.jsp"%> <i
			class="bi bi-list mobile-nav-toggle"></i> </nav>
	</div>
	</header>
	<!-- End Header -->
	<br />
	<br />
	<br />
	<main id="main"> <!-- ======= Icon Boxes Section ======= --> <section
		id="icon-boxes" class="icon-boxes"> </section><!-- End Icon Boxes Section -->


	<!-- ======= Services Section ======= --> <section id="services"
		class="services">
	<div class="container" data-aos="fade-up">

		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6" data-aos-delay="100">
			
				<div class="icon-box">
<%String id=request.getParameter("id");
Connection con=ConnectionProvider.getConnection();
PreparedStatement ps=con.prepareStatement("SELECT * FROM `employee` where e_id='"+id+"'");
ResultSet rs=ps.executeQuery();
if(rs.next())
{ %>
<h2 align="center" style="color: red;">Edit Plan</h2>
					<form action="Updateemp" method="POST" name="ureg">
                <table class="table table-bordered" >
                  <tr>
                    <td><b>Name:</b></td>
                    <input type="hidden" name="id" value="<%=id %>">
                    <td><input type="text" name="fname" value="<%=rs.getString("e_name") %>"onblur="return AllowAlphabet()" required></td>
                  </tr>
                   <tr>
                  
                  <<tr>
                    <td><b>Gender:</b></td>
                    <td><input type="radio" value="Male" name="gender"value="<%=rs.getString("gender") %>" required><%=rs.getString("gender") %><input
                      type="radio" value="Female" name="gender"value="<%=rs.getString("gender") %>"><%=rs.getString("gender") %></td>

                  </tr>
                  <tr>
                    <td><b>Mobile No:</b></td>
                    <td><input type="text" name="contact" value="<%=rs.getString("e_phone") %>"onblur="return Validate()" required></td>
                  </tr>
                  <tr>
                    <td><b>Address:</b></td>
                    <td><textarea name="address" rows="3" cols="20" required><%=rs.getString("e_addr") %>"</textarea></td>
                  </tr>
                  <tr>
                    <td><b>Email:</b></td>
                    <td><input type="text" name="email" onblur="return validEmail()" value="<%=rs.getString("e_email") %>" required></td>
                  </tr>
                  <tr>
                    <td><b>Password:</b></td>
                    <td><input type="password" name="password" value="<%=rs.getString("e_pwd") %>"onblur="return validuaernameandpass()" required></td>
                  </tr>
                  
                  <tr>
                    <td></td>
                    <td><input type="Submit" name="submit" value="Update" style="background-color: #04AA6D;color:white;font-size: 20px;border-radius: 8px;" >&nbsp;&nbsp;
                      <input type="Reset" name="reset" style="background-color: red;color:white;font-size: 20px;border-radius: 8px;"></td>
                  </tr>
                </table>
              
          </form>
					<%
					} %>
					</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	</section><!-- End Services Section --> <!-- End Services Section --> <!-- End Hero -->
	<main id="main"> <!-- ======= Icon Boxes Section ======= --> <section
		id="icon-boxes" class="icon-boxes"> </section><!-- End Icon Boxes Section -->
	<!-- ======= Services Section ======= --> <section id="services"
		class="services">
	<div class="container" data-aos="fade-up">
	</section><!-- End Services Section --> <!-- ======= Footer ======= --> <footer
		id="footer">
	<div class="container">
		<div class="copyright"></div>
		<div class="credits">
			<jsp:include page="Header/projectTitle.jsp"></jsp:include>
		</div>
	</div>
	</footer>

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a> <!-- Vendor JS Files --> <script
		src="assets/vendor/aos/aos.js"></script> <script
		src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> <script
		src="assets/vendor/glightbox/js/glightbox.min.js"></script> <script
		src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script> <script
		src="assets/vendor/php-email-form/validate.js"></script> <script
		src="assets/vendor/swiper/swiper-bundle.min.js"></script> <!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
</body>

</html>
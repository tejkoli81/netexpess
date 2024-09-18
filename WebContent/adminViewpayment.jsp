<%@page import="java.util.Map"%>
<%@page import="com.conn.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.conn.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title><jsp:include page="Header/projectTitle.jsp"/></title>
<meta content="" name="description">
<meta content="" name="keywords">
<jsp:include page="alertBox.jsp"/>
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
</head>

<body>

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
			<div class="col-md-12" data-aos-delay="100">
				<div class="icon-box">
					<h2 align="center" style="color: red;">Admin View Payment Details</h2>

					<table class="table table-bordered">
						<tr>
							<th>Sr.No</th>
							<th>Customer Name</th>
							<th>About Plans</th>
							<th>Payment</th>
							<th>Recharge DateTime</th>
							<th>Expiry Date</th>
						</tr>
<%
				int sr_no=0;
				Connection con=ConnectionProvider.getConnection();
				PreparedStatement ps=con.prepareStatement("SELECT * FROM `bill` ORDER BY id DESC");
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					sr_no++;
					String id=rs.getString("id");
					String email=rs.getString("email");
					Map<String,String> u_details=GlobalFunction.getUserDetails(email);
					Map<String,String> plan_details=GlobalFunction.getPlanDetails(rs.getString("plan_id"));
					%>

						<tr>
							<td><%=sr_no %></td>
							<td>Name: <%=u_details.get("name") %>&nbsp;<%=u_details.get("lname") %><br/>
							Mobile:	[<%=u_details.get("mobile") %>]</td>
							<td><%=plan_details.get("plan_name") %><br/>
							Validity: <%=plan_details.get("validity") %></td>
							<td><%=plan_details.get("net_amount") %></td>
							<td><%=rs.getString("recharg_date") %></td>
							<td><%=rs.getString("last_date") %></td>
							
						</tr>
						<%
				}
				%>

					</table>



				</div>
			</div>
		</div>
	</div>
	</section><!-- End Services Section --> <!-- End Hero --> <main id="main">
	<!-- ======= Icon Boxes Section ======= --> <section id="icon-boxes"
		class="icon-boxes"> </section><!-- End Icon Boxes Section --> <!-- ======= Services Section ======= -->
	<section id="services" class="services">
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
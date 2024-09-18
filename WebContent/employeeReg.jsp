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
<jsp:include page="validation.jsp"/>
</head>
<jsp:include page="alertBox.jsp"/><body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center ">
	<div
		class="container d-flex align-items-center justify-content-between">
		<a>  <img src="photos/super_logo.png" style="width: 45%; height: 45%;"></a>

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
					<h2 align="center" style="color: red;">Admin Add New Employee</h2>
					<form action="AddEmployee" method="POST" name="ureg">
						<table class="table table-bordered">
							<tr>
								<td><b>Firstname:</b></td>
								<td><input type="text" class="form-control" onblur="return AllowAlphabet()" name="fname"
									required></td>
							</tr>

							<tr>
								<td><b>Lastname:</b></td>
								<td><input type="text" name="lname" onblur="return AllowAlphabet()" class="form-control"
									required></td>
							</tr>

							<tr>
								<td><b>Gender:</b></td>
								<td><input type="radio" value="Male" name="gender" required>Male
									<input type="radio" value="Female" name="gender">Female</td>

							</tr>
							<tr>
								<td><b>Mobile:</b></td>
								<td><input type="text" name="contact" onblur="return Validate()" class="form-control"
									required></td>
							</tr>
							<tr>
								<td><b>Employee Type:</b></td>
								<td><select name="emp_type" class="form-control">
										<option value="ServiceEngineer">ServiceEngineer</option>
										<option value="Employee">Employee</option>
								</select></td>
							</tr>
							<tr>
								<td><b>Address:</b></td>
								<td><textarea name="address" class="form-control" rows="3"
										cols="20" required></textarea></td>
							</tr>
							<tr>
								<td><b>Email:</b></td>
								<td><input type="text" name="email" onblur="return validEmail()" class="form-control"
									required></td>
							</tr>
							<tr>
								<td><b>Password:</b></td>
								<td><input type="password" name="password" onblur="return validuaernameandpass()"
									class="form-control" required></td>
							</tr>

							<tr>
								<td></td>
								<td><input type="Submit" name="submit"
									class="btn btn-success" value="submit">&nbsp;&nbsp; <input
									type="Reset" class="btn btn-danger" name="reset"></td>
							</tr>
						</table>

					</form>
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
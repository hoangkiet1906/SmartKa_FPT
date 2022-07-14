<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="breadcrumb-area bg-gray-4 breadcrumb-padding-1">
	<div class="container">
		<div class="breadcrumb-content text-center">
			<h2>Login - Register</h2>
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><i class="ti-angle-right"></i></li>
				<li>Login - Register</li>
			</ul>
		</div>
	</div>
	<div class="breadcrumb-img-1">
		<img src="assets/images/banner/breadcrumb-1.png" alt="">
	</div>
	<div class="breadcrumb-img-2">
		<img src="assets/images/banner/breadcrumb-2.png" alt="">
	</div>
</div>
<div class="login-register-area pb-100 pt-95">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-12 offset-lg-2">
				<div class="login-register-wrapper">
					<div class="login-register-tab-list nav">
						<a class="active" data-bs-toggle="tab" href="#lg1">
							<h4>login</h4>
						</a> <a data-bs-toggle="tab" href="#lg2">
							<h4>register</h4>
						</a>
					</div>
					<div class="tab-content">
						<div id="lg1" class="tab-pane active">
							<div class="login-form-container">
								<div class="login-register-form">
									<form action='<c:url value="/login" />' method="post">
										<input type="text" name="username" placeholder="Username">
										<input type="password" name="password"
											placeholder="Password">
										<div class="login-toggle-btn">
											<input type="checkbox"> <label>Remember me</label> <a
												href="#">Forgot Password?</a>
										</div>
										<div class="button-box btn-hover">
											<button type="submit">Login</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div id="lg2" class="tab-pane">
							<div class="login-form-container">
								<div class="login-register-form">
									<form action="" method="post">
										<input type="text" name="user-name" placeholder="Username">
										<input type="password" name="user-password"
											placeholder="Password"> <input name="user-email"
											placeholder="Email" type="email">
										<div class="button-box btn-hover">
											<button type="submit">Register</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
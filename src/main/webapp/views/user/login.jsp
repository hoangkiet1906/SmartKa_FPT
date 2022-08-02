<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
									<form id="loginForm" action="javascript:void(0)">
										<input id="username_login" type="text" name="username" placeholder="Username">
										<input id="password_login" type="password" name="password"
											placeholder="Password">
										<div class="login-toggle-btn">
											<input type="checkbox"> <label>Remember me</label> <a
												href="#">Forgot Password?</a>
										</div>
										<div class="button-box btn-hover">
											<button id="loginBtn" type="submit">Login</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div id="lg2" class="tab-pane">
							<div class="login-form-container">
								<div class="login-register-form">
									<form id="registerForm" action='<c:url value="/register" />' method="post">
										<input type="text" id="username_register" name="username" placeholder="Username">
										<input type="password" id="password_register" name="password"
											placeholder="Password"> 
										<input id="confirmPassword_register" type="password" name="confirmPassword"
											placeholder="Confirm Password"> 
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
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Register Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="register" method="post">
                        <span class="login100-form-logo">
                            <i class="zmdi zmdi-landscape"></i>
                        </span>

                        <span class="login100-form-title p-b-34 p-t-27">
                            Register
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Enter username">
                            <input class="input100" type="text" name="username" placeholder="Username" required="">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <input class="input100" type="password" name="pass" placeholder="Password" required="">
                            <span class="focus-input100" data-placeholder="&#xf191;"></span>
                        </div>
                        
                        <div class="wrap-input100 validate-input" data-validate = "Enter Emaill">
                            <input class="input100" type="email" name="email" placeholder="Email Address" required="">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>
                        
                        <div class="wrap-input100 validate-input" data-validate = "Enter FullName">
                            <input class="input100" type="text" name="fullname" placeholder="Full Name" required="">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>
                        
                        <div class="wrap-input100 validate-input" data-validate = "Enter Phone Number">
                            <input class="input100" type="tel" name="phone" placeholder="Phone number"
                                   pattern="[0-9]{10}" required="">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>

                        <h3 style="color: red">${err}</h3>
                        <h3 style="color: red">${err1}</h3>
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Register
                            </button>
                           
                        </div>
                        <div class="text-center p-t-30">
                            <a class="txt1" href="login">
                                Already Have An Account
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>
<%-- 
    Document   : Login
    Created on : May 11, 2024, 9:11:46 PM
    Author     : Mr.Khanh
--%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- Link to Bootstrap CSS from node_modules -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">


        <style>
            body {
                background-color: black;
            }

            .gradient-custom {
                /* fallback for old browsers */
                background: #020108;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, rgb(11, 4, 19), rgb(0, 0, 0));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, rgb(35, 35, 79), rgb(41, 55, 81))
            }




        </style>
    </head>

    <body>
        
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <form method="post" action="loginServlet">
                                    <div class="mb-md-5 mt-md-4 pb-5">

                                        <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                        <p class="text-white-50 mb-5">Please enter your login and password!</p>

                                        <div data-mdb-input-init class="form-outline form-white mb-4">
                                            <input type="text" id="typeEmailX" class="form-control form-control-lg" required="" name ="username" />
                                            <label class="form-label" for="typeEmailX">Username</label>
                                        </div>

                                        <div data-mdb-input-init class="form-outline form-white mb-4">
                                            <input type="password" id="typePasswordX" class="form-control form-control-lg" required="" name ="password"/>
                                            <label class="form-label" for="typePasswordX">Password</label>
                                        </div>

                                        <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a>
                                        </p>

                                        <button data-mdb-button-init data-mdb-ripple-init
                                                class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>



                                    </div>
                                </form>

                                <div>
                                    <p class="mb-0">Don't have an account? <a href="#!" class="text-white-50 fw-bold">Sign
                                            Up</a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>





        <!-- Optionally, you can include Bootstrap JavaScript components -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    </body>

</html>

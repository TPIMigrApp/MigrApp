<!DOCTYPE html>
<head>
<sec:ifNotLoggedIn>
<meta name="layout" content="public"/>
</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
<meta name="layout" content="main"/>
</sec:ifLoggedIn>
</head>

<body>


 <section id="error-page">

        <div class="error-page-inner">

            <div class="container-fluid">

                <div class="row">

                    <div class="col-sm-12">

                        <div class="text-center">

                            <div class="bg-404">

<!--
                                <div class="error-image">                                

                                    <img class="img-responsive" src="images/404.png" alt="">  

                                </div>

-->

                            </div>

                            <h2>PÁGINA NO ENCONTRADA</h2>

                            <p>No ha sido posible encontrar lo que buscabas.</p>

                            <a href="${createLink(controller:'usuario',action:'index')}" class="btn btn-error">VOLVER AL INICIO</a>
<!--
                            <div class="social-link">

                                <span><a href="#"><i class="fa fa-facebook"></i></a></span>

                                <span><a href="#"><i class="fa fa-twitter"></i></a></span>

                                <span><a href="#"><i class="fa fa-google-plus"></i></a></span>

                            </div>

-->

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </section>

    <script type="text/javascript" src="js/jquery.js"></script>

    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <script type="text/javascript" src="js/wow.min.js"></script>

    <script type="text/javascript" src="js/main.js"></script>



</body>
</html>

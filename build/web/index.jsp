<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <title>Infinity Scroll com Java e Jquery</title>
        <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous">
        </script>
        <style type="text/css">

            #content-box{
                background-color:#FAFAFA;
                border:2px solid #888;
                height:450px;
                overflow:scroll;
                padding:4px;
            }

        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $contentLoadTriggered = false;
                $("#content-box").scroll(function () {
                    if ($("#content-box").scrollTop() >= ($("#content-wrapper").height() - $("#content-box").height()) && $contentLoadTriggered == false)
                    {
                        $contentLoadTriggered = true;
                        $.get("infiniteServlet", function (data) {
                            $("#content-wrapper").append(data);
                            $contentLoadTriggered = false;
                        });
                    }

                });
            });
        </script>
    </head>
    <body>
        <div class='col-md-10'>
            <h2 class='text-muted mt-4'>Demo page: Infinite Scroll com Java e JQuery</h2>
        </div>
        <div class="col-md-12">
            <div id="content-box">
                <table id='content-wrapper' class='table table-responsive'>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Conteúdo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span class='badge badge-info'>1</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                        <tr>
                            <td><span class='badge badge-info'>2</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                        <tr>
                            <td><span class='badge badge-info'>3</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                        <tr>
                            <td><span class='badge badge-info'>4</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                        <tr>
                            <td><span class='badge badge-info'>5</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                        <tr>
                            <td><span class='badge badge-info'>6</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                        <tr>
                            <td><span class='badge badge-info'>7</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                        <tr>
                            <td><span class='badge badge-info'>8</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                        <tr>
                            <td><span class='badge badge-info'>9</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                        <tr>
                            <td><span class='badge badge-info'>10</span></td>
                            <td>hueheuheuehuehue</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
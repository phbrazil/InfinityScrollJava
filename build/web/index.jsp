<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <title>Infinity Scroll com Java e Jquery</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <style type="text/css">
            body{
                font-family:Arial;
                font-size:.93em;
            }
            #content-box{
                background-color:#FAFAFA;
                border:2px solid #888;
                height:300px;
                overflow:scroll;
                padding:4px;
            }
            #content-box p{
                border:1px solid #EEE;
                background-color:#F0F0F0;
                padding:3px;
            }
            #content-box p span{
                color:#00F;
                display:block;
                font:bold 21px Arial;
                float:left;
                margin-right:10px;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $contentLoadTriggered = false;
                $("#content-box").scroll(function () {
                    if ($("#content-box").scrollTop() >= ($("#content-wrapper").height() - $("#content-box").height()) && $contentLoadTriggered == false)
                    {
                        $contentLoadTriggered = true;
                        $.get("infinitContentServlet", function (data) {
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
            <h1 class='text-muted mt-4'>Demo page: Infinite Scroll com Java e JQuery</h1>
        </div>
        <div class="col-md-12">
            <div id="content-box">
                <div id="content-wrapper">
                    <p><span>1</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare facilisis mollis. Etiam non sem massa, a gravida nunc. Mauris lectus augue, posuere at viverra sed, dignissim sed libero. </p>
                    <p><span>2</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare facilisis mollis. Etiam non sem massa, a gravida nunc. Mauris lectus augue, posuere at viverra sed, dignissim sed libero. </p>
                    <p><span>3</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare facilisis mollis. Etiam non sem massa, a gravida nunc. Mauris lectus augue, posuere at viverra sed, dignissim sed libero. </p>
                    <p><span>4</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare facilisis mollis. Etiam non sem massa, a gravida nunc. Mauris lectus augue, posuere at viverra sed, dignissim sed libero. </p>
                    <p><span>5</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare facilisis mollis. Etiam non sem massa, a gravida nunc. Mauris lectus augue, posuere at viverra sed, dignissim sed libero. </p>
                </div>
            </div>
        </div>
    </body>
</html>
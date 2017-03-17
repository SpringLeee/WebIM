<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication8.index" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta charset="utf-8" />
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="Scripts/jquery-1.6.4.js"></script>
    <script src="Scripts/jquery.signalR-2.2.1.js"></script>
    <script src="/signalr/hubs"></script>

</head>
<body style="padding-top:40px;">
    <div class="container">
        <div class="jumbotron">
            <ul id="message" style="height:400px;overflow-y:scroll;"></ul>
        </div>
      
        <input id="txt" type="email" class="form-control" style="margin-bottom:5px;">
        <button id="send" type="button" class="btn btn-primary btn-block">Send</button>

    </div>


    <script type="text/javascript">
        $(function () {

            //接收数据
            var con = $.connection.myhub;
            con.client.receiveMessage = function (name, message) {

                $("#message").append("<li><b>" + name + "</b> ：" + message + "</li>");

                var now = new Date();
                var div = document.getElementById('message');
                div.scrollTop = div.scrollHeight;
            }


            //发送数据
            $.connection.hub.start().done(function () {

                $("#send").click(function () {

                    if ($("#txt").val()=="") {
                        return;
                    }

                    con.server.sendMessage("", $("#txt").val());

                    $("#txt").val("")

                });

            });
        })
    </script>

</body>
</html>

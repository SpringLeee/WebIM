<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="danmu.aspx.cs" Inherits="WebApplication8.danmu" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="/Scripts/damoo.min.js"></script>
</head>
<body style="margin:0;padding:0">
    <div id="dm-main"> 
        <div id="dm-screen" style="height:500px;width:100%;display:block;background-color:rgba(128, 128, 128, 0.33)">

        </div>

    </div>




    <script>
        var damoo = Damoo('dm-screen', 'dm-canvas', 20);
        var damoo = Damoo('dm-screen', 'dm-canvas', 20, "Arial");
        damoo.start();
        damoo.emit({ text: "Damoo is awesome!", color: "#f49" });
        damoo.emit({ text: "I got a shadow!", color: "#000", shadow: true });
        damoo.emit({ text: "Hooray!", color: "#f00", shadow: { color: "#f49" } });
        damoo.emit({ text: "I'M FIXED!", color: "#6f9", fixed: true });


        for (var i = 0; i < 100000; i++) {
            if (i%100==0) {
                damoo.emit({ text: "Damoo is awesome!", color: "#f49" });
            }
           
        }

    </script>

</body>
</html>

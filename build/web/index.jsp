<%-- 
    Document   : index
    Created on : 21 Aug, 2018, 9:25:15 PM
    Author     : Yashas Hr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/head"/>
        <link rel="stylesheet" type="text/css" href="res/css/home.css"/>
        <title>Home</title>
    </head>
    <body>
        <jsp:include page="/header"/>
        
        <div class="container">
            <div class="panel">
                <div class="lg-panel"></div>
                <img class="lg-stretch" style="object-fit: cover" src="/CS121/res/img/kbc-b.jpg"/>
                <video id="kbc-vid" class="lg-stretch" onerror="this.error=null;this.style.display='none';" autoplay>
                    <source src="https://r4---sn-5jucgv5qc5oq-cagz.googlevideo.com/videoplayback?source=youtube&keepalive=yes&dur=241.120&pl=21&itag=135&sparams=aitags%2Cclen%2Cdur%2Cei%2Cgir%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Ckeepalive%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Crequiressl%2Csource%2Cexpire&gir=yes&mime=video%2Fmp4&c=WEB&expire=1538868661&signature=7C87546328CC9F49CF04B42A66855D48221EA776.348F20C27FF9265DE77C5DB6808E57425FDC823E&aitags=133%2C134%2C135%2C136%2C137%2C160%2C242%2C243%2C244%2C247%2C248%2C278&initcwndbps=960000&clen=16636741&ipbits=0&mt=1538846961&mv=m&ms=au%2Crdu&key=yt6&ip=49.206.8.253&mm=31%2C29&mn=sn-5jucgv5qc5oq-cagz%2Csn-h557snsl&id=o-AKCHKGtqTB9P6Vw0xFuap1TVTd73PGZPSH582IIKOveW&ei=VfG4W56bCdSd8QO9r6yADQ&fvip=4&lmt=1536267144013913&requiressl=yes"/>
                </video>
                <script>
                    document.getElementById("kbc-vid").currentTime=16;
                </script>
                <div class="lg-overlay"></div>
                <div class="panel-content">
                    
                    <div class="panel-items">
                        <div class="panel-item">
                            <h1 class="panel-title font-mont">Kaun Banega Crorepati<br/>Quiz Database </h1>
                        </div>
                        <div class="panel-item font-mont start">
                            <a class="btn-white-green" href="kbc/main"> START KBC 
                                <i id="btn-start" class="fas fa-play"></i> 
                            </a>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>
        
        <jsp:include page="/footer"/>
    </body>
</html>

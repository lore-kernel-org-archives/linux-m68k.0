Received: from outgoing35.cpt4.host-h.net (outgoing35.cpt4.host-h.net [196.40.103.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53AD149C55
	for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Dec 2024 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=196.40.103.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734798518; cv=none; b=hs1ckIGpKCZwT1HS24+96jugm/CHT9qis2mJzQkLVkMNhCK9lq1aYU9sso6vCpwUlv41gR36GQ80ViGJ9oKMEXPyCsQBHSHKIRFq4tuvHuIpWZE2+40iEzhujhvsZ0Ixuf0Kn/YrIgCKiCZmfgZSCZaKl0faRa7QCIn4sQj5XxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734798518; c=relaxed/simple;
	bh=ddMgr6P5DMvuyFN5CBJc4r9caNk1w64+k8AK61Rqupg=;
	h=To:Subject:Date:Message-Id:From; b=cQx7TGfdaQvZHtE+Zlhgsuu6SWkpdYBEHBnCuaTjaGeLOttXetn0FMhYMvFWs4f/vEFuQ++nmmrU8oEzMj1eJ9Ljw9WyVli01GgDcZK6poa/QuZfKJ/4lsSdkBGLK7fobLB2tdNuJay2mVNuYOW7TpAVTMZHSus8mx8kGZlsP0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realpromotions.co.za; spf=fail smtp.mailfrom=realpromotions.co.za; arc=none smtp.client-ip=196.40.103.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realpromotions.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=realpromotions.co.za
Received: from www53.cpt2.host-h.net ([41.204.202.53])
	by antispam6-cpt4.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <webmaster@realpromotions.co.za>)
	id 1tP2L1-006SY6-TT
	for linux-m68k@lists.linux-m68k.org; Sat, 21 Dec 2024 18:28:31 +0200
Received: from realpspguu by www53.cpt2.host-h.net with local (Exim 4.96)
	(envelope-from <realpspguu@www53.cpt2.host-h.net>)
	id 1tP2L1-00EGlh-1s
	for linux-m68k@lists.linux-m68k.org;
	Sat, 21 Dec 2024 18:28:23 +0200
To: linux-m68k@lists.linux-m68k.org
Subject: =?UTF-8?B?1Y3RgNGA4oW+0LB00LVy0ZbVuNaBINCw4oW0INCw1b100L7WgdGWctC+?=
X-PHP-Originating-Script: 1734:index.php
Date: Sat, 21 Dec 2024 18:27:47 +0200
 From: =?UTF-8?B?VNC14oW80LUy?= <telee2-support@realpromotions.co.za>
 Message-ID: <94da16764aab626af10fecd69bfbf5b3@realpromotions.co.za>
 MIME-Version: 1.0
 Content-Type: multipart/alternative;
 	boundary="19065d1672a1d81c12971d9da21772a68"
 Content-Transfer-Encoding: 8bit
Message-Id: <E1tP2L1-00EGlh-1s@www53.cpt2.host-h.net>
From: webmaster@realpromotions.co.za
X-Hetz-Sender-Domain: host-h.net
X-SpamExperts-Domain: realpromotions.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@realpromotions.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.56)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+MRGzxr5NfDo1r2uYxdt+DPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xJ6+RcodHFr+YQdAj4BdX8SG6neaigqL3EZUpune4z5BDT
 pFOSqeVZdWctn1JeeUkGUiGQxA9zWllog1U3YSGYIeebqmNzITIBQB6uQcT8T0aPT05mUYKwRlm6
 iZlpsz5k4jU7ru/DNW4XeomhRS823zssdw2w90fZw2Dsaml3yb8XvRIEFFjAbtzm90DsmwuIUp8P
 WMqBh8f7pLmoNVigGTji2+VsTtm1sWJ2TLBS43Hjh0T36aGGPk9WsLqYxLXc2aq67LtN1kRXHKY8
 HxLxAmezHDLW8mwML+1gxsplM+nE6wHyAbSyVXutrqMjgFKWCIh6nwoBuMKwN8OP5EE2CsQxwPST
 fSeJOF2atdSUJM1a/31akymfSt+EGYiP3HHN7i/W0F6nWbCTT5Bm8K+XCZ0dGlsdaRFUABnJ7voE
 tmrLhMVo7s5rC/i1xA6nwvG8Ksk+aedMfNWSnJswrtlNz8WLsJV2Icc9mBIffLxbemDZH09EsWg5
 x+t9I7GFDlWZGhFuTCOvBcOwwmgZ1EN+5vonz7NsiF1Wku49QqQ+LGzAvyupJc20TI861x/0g31o
 h9VoIekQHpwUfpYnEThmMHdcvdpJclhw14XNKJoaAyMlm4ChwcQokDu/2jTYe5I71jGpszjc4PTX
 cCjq+Z9l+CdKuI31I2mHXToiAaItumIcT1f0aXDBG83Yog5u93TnlEbz++OvPn/hBrVpEmS9KKdU
 bF/v7dqkdm7BFyxutdcB7Wec1cQ5sCO5x57+SFe2sbisfwKv0F5jcDSaVqpCPuauIrLk9htFOHM/
 PX95zQ5Vxm/bnhrVKymAutkEJf9FLGldIdoz9HKqi3Yd4pgMw6nIoDr0sXUZ7YZoZ/GZ+plRtKAG
 KxK4TdBgXIKuH/x5xXJYVE8fHEl6b3oHw6UZtlGAt5x3fhdG0sXkZmStmCuPMwVBYkwWZbFaJ8df
 3bCmKjKiYTCu86OZ6UAKOuhO8isS+ekwd0I8wUWVDZrmWg==
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

This is a multi-part message in MIME format.

--19065d1672a1d81c12971d9da21772a68
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit




    
    
    TELE2
    
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            width: 80%;
            max-width: 700px;
            padding: 60px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            min-height: 90vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
            size: 450px;
        }
        .logo img {
            width: 250px;
        }
        .title {
            text-align: center;
            font-size: 1.8em;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .content {
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 8px;
        }
        .content strong {
            font-weight: bold;
        }
        .button-container {
            text-align: center;
            margin: 30px 0;
        }
        .button {
            background-color: #0c113c;
            color: #ffffff;
            padding: 12px 30px;
            font-size: 1em;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            display: inline-block;
        }
        .button:hover {
            background-color: #0d123e;
        }
        .footer {
            font-size: 0.9em;
            color: #666;
            text-align: center;
            margin-top: auto;
        }
        .footer a {
            color: #0066cc;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    




    
        
    
    Uppdatering av autogiro
    
        Ert autogiro behöver uppdateras snarast.
        Annars så riskera ni och bli av med ert telefonnummer för gott I enlighet med punkt 1.2 i filialens allmänna villkor meddelas härmed om ändringen nedan gällande de Allmänna villkoren för Autogiro:
            Se de uppdaterade villkoren här          
            Från och med 10.7.2022 kommer samtliga ändringar gällande belopp, förfallodag eller betalningssätt meddelas Betalaren via Mina Sidor.
            Liksom tidigare meddelas Betalaren om eventuella ändringar senast 8 bankdagar före förfallodagen. 
        Se de uppdaterade villkoren här 
    
    
        Logga in på ditt konto Tele2
    
    
        *Detta är ett automatiskt meddelande. Vänligen svara inte.*
        Om du har frågor eller behöver mer hjälp, vänligen besök vår sida page.
        TELE2 
      
        © 2024 All rights reserved.
    





--19065d1672a1d81c12971d9da21772a68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TELE2</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            width: 80%;
            max-width: 700px;
            padding: 60px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            min-height: 90vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
            size: 450px;
        }
        .logo img {
            width: 250px;
        }
        .title {
            text-align: center;
            font-size: 1.8em;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .content {
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 8px;
        }
        .content strong {
            font-weight: bold;
        }
        .button-container {
            text-align: center;
            margin: 30px 0;
        }
        .button {
            background-color: #0c113c;
            color: #ffffff;
            padding: 12px 30px;
            font-size: 1em;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            display: inline-block;
        }
        .button:hover {
            background-color: #0d123e;
        }
        .footer {
            font-size: 0.9em;
            color: #666;
            text-align: center;
            margin-top: auto;
        }
        .footer a {
            color: #0066cc;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="logo">
        <img src="https://urlz.fr/tttY" alt="TELE2 Logo">
    </div>
    <div class="title">Uppdatering av autogiro</div>
    <div class="content">
        Ert autogiro behöver uppdateras snarast.
        <p>Annars så riskera ni och bli av med ert telefonnummer för gott I enlighet med punkt 1.2 i filialens allmänna villkor meddelas härmed om ändringen nedan gällande de Allmänna villkoren för Autogiro:
            Se de uppdaterade villkoren här          
            Från och med <strong>10.7.2022</strong> kommer samtliga ändringar gällande belopp, förfallodag eller betalningssätt meddelas Betalaren via Mina Sidor.
            Liksom tidigare meddelas Betalaren om eventuella ändringar senast 8 bankdagar före förfallodagen. </p>
        <p>Se de uppdaterade villkoren här </p>
    </div>
    <div class="button-container">
        <a href="https://urlz.fr/tdKA" class="button">Logga in på ditt konto Tele2</a>
    </div>
    <div class="footer">
        *Detta är ett automatiskt meddelande. Vänligen svara inte.*
        <p>Om du har frågor eller behöver mer hjälp, vänligen besök vår <a href="#">sida</a> page.</p>
        <p><strong>TELE2 </strong><br>
      
        © 2024 All rights reserved.</p>
    </div>
</div>

</body>
</html>



--19065d1672a1d81c12971d9da21772a68--


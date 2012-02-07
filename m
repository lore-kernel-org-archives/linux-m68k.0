From: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible
 patch)
Date: Tue, 07 Feb 2012 20:55:50 +0100
Message-ID: <4F3181C6.8080805@sigon.net>
References: <4F1C577D.3040908@sigon.net>	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>	<4F1EEBEF.4000400@sigon.net> <CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com> <4F2053C9.3090201@sigon.net> <97e6cf2ca60c81874f6ea82e8b4af158@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from s15429932.onlinehome-server.info ([87.106.248.152]:37871 "EHLO
	ws1.rootfuchs.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752608Ab2BGTz5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Feb 2012 14:55:57 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by ws1.rootfuchs.de (Postfix) with ESMTP id 70F51411EE3
	for <linux-m68k@vger.kernel.org>; Tue,  7 Feb 2012 20:55:55 +0100 (CET)
Received: from ws1.rootfuchs.de ([127.0.0.1])
	by localhost (ws1.rootfuchs.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9nZO5NJ5g7T for <linux-m68k@vger.kernel.org>;
	Tue,  7 Feb 2012 20:55:54 +0100 (CET)
Received: from [192.168.1.3] (srbk-5d803251.pool.mediaWays.net [93.128.50.81])
	(Authenticated sender: tjelfe@fffb.net)
	by ws1.rootfuchs.de (Postfix) with ESMTPSA id B8FB540021B
	for <linux-m68k@vger.kernel.org>; Tue,  7 Feb 2012 20:55:54 +0100 (CET)
In-Reply-To: <97e6cf2ca60c81874f6ea82e8b4af158@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Hi all,

Patrick Bottelberger schrieb:
> Maybe it's the debian patches that get everything out of order, i'll try
> 3.1.10 vanilla, maybe that'll work.
>   
I compiled a vanilla 3.2.2 kernel tree without Debian patches and
without adding -msoft-float and it runs. It seems one of the
Debian-patches adds some floating-point-operations.
The clock is still flaky and pcmcia still doesn't work. If i find out
why, i'll report again.


Regards,
Patrick

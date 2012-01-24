From: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible
 patch)
Date: Tue, 24 Jan 2012 18:56:30 +0100
Message-ID: <4F1EF0CE.9050300@sigon.net>
References: <4F1C577D.3040908@sigon.net>	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com> <CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from s15429932.onlinehome-server.info ([87.106.248.152]:41451 "EHLO
	ws1.rootfuchs.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757154Ab2AXR4b (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 Jan 2012 12:56:31 -0500
In-Reply-To: <CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org

Hi Michael,

Michael Schmitz schrieb:
> Might be the wrong /dev/rtc device - it should be major 254 minor 0
> not major 10 minor 135 (or whatever).
>   
I tried major 254 with minor 1 to 10, none of the nodes seems to be
connected. I thought 254/x was used by CONFIG_RTC_CLASS and 10/135 by
CONFIG_GEN_RTC? I'll compile the kernel with CONFIG_RTC_CLASS and try again.


Regards
Patrick

From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] reinstate mac rtc
Date: Mon, 20 Oct 2008 04:05:29 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
 <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
 <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
 <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:55401 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751024AbYJTCFb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 19 Oct 2008 22:05:31 -0400
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0K9000601LT52V@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Mon, 20 Oct 2008 04:05:29 +0200 (MEST)
In-reply-to: <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

>>>
>>>> I don't know "how", but with 2.2 kernels I always had a correct date
>>>> at boot without any tricks. It is true though that with high CPU load
>>>> we had clockskew and that we didn't save back the date and hourtime to
>>>> the clock, thus any clock setting needed to be done from the mac side.
>>>> A compromoise, but better than the current situation.

IIRC the booter passed the current date to the kernel, and this date was used to 
initialize the system clock.

>> It isn't a problem if you disable the time-stamp triggered fsck and set
>> the clock from the network (rdate or ntp).
>
> This is the answer I keep getting, but it isnt really helping.
>
> * SSL/TLS and certificate validation. For example my gumtix uses 802.1X to
> get online, when it is running in "1970-01-01", the server and client
> certificates are ofcourse not valid and the authentication _will_ fail,
> and it wont go online, and therefor no ntp. As .1x is becoming more common

Valid point. I gues penguin still does pass the date, so the problem boils down 
to 'why isn't it used by the kernel?'

Maybe it's the failed RTC access that causes this - in that case, maybe we 
should gin up a fallback 'soft RTC' to just return the booter-supplied date 
value on the first call (and the system clock value thereafter)?

 	Michael


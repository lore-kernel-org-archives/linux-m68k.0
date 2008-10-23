From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] reinstate mac rtc
Date: Thu, 23 Oct 2008 05:56:37 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0810230538410.22587@zirkon.biophys.uni-duesseldorf.de>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
 <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
 <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
 <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
 <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de>
 <A064497F-167C-4BC4-9565-6530A6914285@lvivier.info>
 <alpine.DEB.1.00.0810220916590.18164@zirkon.biophys.uni-duesseldorf.de>
 <alpine.LNX.2.00.0810221309050.3377@halbrend.uninett.no>
 <5AC01130-D57C-4A0E-81EB-D10549A1146C@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:33460 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751002AbYJWD4j (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 22 Oct 2008 23:56:39 -0400
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0K9600I01AYDRE@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Thu, 23 Oct 2008 05:56:37 +0200 (MEST)
In-reply-to: <5AC01130-D57C-4A0E-81EB-D10549A1146C@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

>>> Good, so solving the problem should fix it for both. When did the problem 
>>> get
>>> introduced - 2.4 or 2.6?
>> 
>> Silly question I guess, but how is the passing done?
>
> On m68k architecture, bootloader passes a list of tags to the kernel, see 
> set_kernel_bootinfo():

Short answer: bootinfo.

I'm confident the date/time is passed by bootinfo OK, but it then 'disappears'.
I'm pretty sure it was still OK in the 2.2 series - I'm unsure on when it broke: 
2.4 or 2.6?

 	Michael


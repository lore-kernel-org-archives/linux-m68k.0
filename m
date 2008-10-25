From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] reinstate mac rtc
Date: Sat, 25 Oct 2008 06:24:49 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0810250611540.13617@zirkon.biophys.uni-duesseldorf.de>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
 <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
 <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
 <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
 <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de>
 <A064497F-167C-4BC4-9565-6530A6914285@lvivier.info>
 <alpine.DEB.1.00.0810220916590.18164@zirkon.biophys.uni-duesseldorf.de>
 <alpine.LNX.2.00.0810221309050.3377@halbrend.uninett.no>
 <5AC01130-D57C-4A0E-81EB-D10549A1146C@lvivier.info>
 <alpine.DEB.1.00.0810230538410.22587@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0810230910460.7533@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:64057 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750762AbYJYEYw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 25 Oct 2008 00:24:52 -0400
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0K9A004011LDHT@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Sat, 25 Oct 2008 06:24:49 +0200 (MEST)
In-reply-to: <Pine.LNX.4.64.0810230910460.7533@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Vivier <laurent@lvivier.info>, =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

> > I'm confident the date/time is passed by bootinfo OK, but it then
> > 'disappears'.
> 
> Yep, nothing is done with mac_bi_data.boottime, except for printing it
> to the kernel log.
> 
> > I'm pretty sure it was still OK in the 2.2 series - I'm unsure on when it
> > broke: 2.4 or 2.6?
> 
> It seems to be removed in early 2.5 (2.4 has it, my oldest 2.5 is 2.5.5
> and that one doesn't have it anymore):

OK, how's that for using the bootinfo passed time in case we don't know how to 
read the RTC?

--- linux-2.6.28-rc1-geert/arch/m68k/mac/misc.c
+++ linux-2.6.28-rc1/arch/m68k/mac/misc.c
@@ -689,6 +689,8 @@
  * Read/write the hardware clock.
  */
 
+static int mac_fakertc_initdone;
+
 int mac_hwclk(int op, struct rtc_time *t)
 {
 	unsigned long now;
@@ -710,7 +712,17 @@
 			now = cuda_read_time();
 			break;
 		default:
-			now = 0;
+			if (mac_fakertc_initdone)
+				now = get_seconds();
+			else {
+				unmktime(mac_bi_data.boottime, mac_bi_data.gmtbias * 60,
+					&t->tm_year, &t->tm_mon, &t->tm_mday,
+					&t->tm_hour, &t->tm_min, &t->tm_sec);
+				t->tm_mon += 1;
+				now = mktime(t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+					t->tm_hour, t->tm_min, t->tm_sec);
+				mac_fakertc_initdone = 1;
+			}
 		}
 

The very first call to mac_hwclock should be made from timekeeping_init, hence 
the boottime should be passed to timekeeping_init now, which then sets the 
kernel wall time. Subsequent calls just use the kernel wall time. 

The unmktime/mktime combo may not actually be necessary here - setting 
now = boottime - gmtoffset*60 may do the same thing. 

Deserving of such a hackish approach, I've not tried to compile this. Test and 
improve, please. 

	Michael

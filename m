From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] reinstate mac rtc
Date: Thu, 23 Oct 2008 09:28:56 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810230910460.7533@anakin>
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
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from harold.telenet-ops.be ([195.130.133.65]:40896 "EHLO
	harold.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751993AbYJWH3C (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Oct 2008 03:29:02 -0400
In-Reply-To: <alpine.DEB.1.00.0810230538410.22587@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Laurent Vivier <laurent@lvivier.info>, =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, 23 Oct 2008, Michael Schmitz wrote:
> > > > Good, so solving the problem should fix it for both. When did the
> > > > problem get
> > > > introduced - 2.4 or 2.6?
> > > 
> > > Silly question I guess, but how is the passing done?
> > 
> > On m68k architecture, bootloader passes a list of tags to the kernel, see
> > set_kernel_bootinfo():
> 
> Short answer: bootinfo.
> 
> I'm confident the date/time is passed by bootinfo OK, but it then
> 'disappears'.

Yep, nothing is done with mac_bi_data.boottime, except for printing it
to the kernel log.

> I'm pretty sure it was still OK in the 2.2 series - I'm unsure on when it
> broke: 2.4 or 2.6?

It seems to be removed in early 2.5 (2.4 has it, my oldest 2.5 is 2.5.5
and that one doesn't have it anymore):

--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -571,6 +571,26 @@ static void unmktime(unsigned long time, long offset,
 	return;
 }
 
+/*
+ * Return the boot time for use in initializing the kernel clock.
+ *
+ * I'd like to read the hardware clock here but many machines read
+ * the PRAM through ADB, and interrupts aren't initialized when this
+ * is called so ADB obviously won't work.
+ */
+
+void mac_gettod(int *yearp, int *monp, int *dayp,
+	       int *hourp, int *minp, int *secp)
+{
+	/* Yes the GMT bias is backwards.  It looks like Penguin is
+           screwing up the boottime it gives us... This works for me
+           in Canada/Eastern but it might be wrong everywhere else. */
+	unmktime(mac_bi_data.boottime, -mac_bi_data.gmtbias * 60,
+		yearp, monp, dayp, hourp, minp, secp);
+	/* For some reason this is off by one */
+	*monp = *monp + 1;
+}
+
 /* 
  * Read/write the hardware clock.
  */

and `mach_gettod' was wired up to 'mac_gettod'.

No idea why it was removed. I should check my mail archives (2002 and
older are on CD).

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

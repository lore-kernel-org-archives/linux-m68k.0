From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Debian kernel regression, was Re: Modernizing a Macintosh LC
 III
Date: Fri, 22 Nov 2013 10:47:25 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1311221007350.26979@nippy.intranet>
References: <mcII9-2Ep-5@gated-at.bofh.it> <mdhPA-3Y1-15@gated-at.bofh.it> <52824A09.3060906@gmail.com> <CAMuHMdUJTx3pRzW8xewbhq+yow5CbXNKix2Za5kUqP5m7kv-Dg@mail.gmail.com> <Pine.BSM.4.64L.1311121708580.2989@herc.mirbsd.org> <5282DE78.2000109@iamscott.net>
 <alpine.LNX.2.00.1311170913380.6636@nippy.intranet> <5289723D.5090509@iamscott.net> <CAMuHMdUz=cJK7VTgvL3-4BWOqK-kP4ge5LD6v1snsRtkL3aNiw@mail.gmail.com> <1f16cd3b6538d850d32c3f8274fd8688@biophys.uni-duesseldorf.de> <alpine.LNX.2.00.1311192205430.3217@nippy.intranet>
 <89f415777a8134f27561668e8fb56d65@biophys.uni-duesseldorf.de> <alpine.LNX.2.00.1311212023220.17773@nippy.intranet> <CAMuHMdXN2CZqNorxPmHqw3cpFqBtfX-GOCqLcBpJ5wKV5DByPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:56402 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750941Ab3KUXrd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Nov 2013 18:47:33 -0500
In-Reply-To: <CAMuHMdXN2CZqNorxPmHqw3cpFqBtfX-GOCqLcBpJ5wKV5DByPA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Scott Holder <scott@iamscott.net>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 21 Nov 2013, Geert Uytterhoeven wrote:

> Unable to handle kernel NULL pointer dereference at virtual address   (null)
> Oops: 00000000
> PC: [<0013ad28>] __pmz_startup+0x32/0x2a0

[snip]

> Call Trace: [<002c5d3e>] pmz_console_setup+0x64/0xe4
>  [<00009600>] atari_keyboard_interrupt+0x164/0x2dc
>  [<000499f4>] register_console+0x104/0x2a6
>  [<000fc4a8>] strlen+0x0/0x14
>  [<00048b96>] printk+0x0/0x26
>  [<002c5cd4>] pmz_console_init+0x10/0x16

[snip]

> 
> drivers/tty/serial/pmac_zilog.c needs some MACH_IS_MAC() tests.
> 

The platform devices pmz_ports[X].pdev aren't supposed to be used unless 
config_mac() first initializes them (when MACH_IS_MAC). Unfortunately the 
null pointer test in pmz_console_setup() never succeeds because 
pmz_probe() always sets those pointers, so make sure they remain null when 
the platform device isn't valid.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---

I haven't even compiled this. Geert, can you please build and test?


Index: linux-3.12/drivers/tty/serial/pmac_zilog.c
===================================================================
--- linux-3.12.orig/drivers/tty/serial/pmac_zilog.c	2013-11-04 10:41:51.000000000 +1100
+++ linux-3.12/drivers/tty/serial/pmac_zilog.c	2013-11-22 10:07:06.000000000 +1100
@@ -1748,8 +1748,10 @@ static int __init pmz_probe(void)
 	pmz_ports[0].flags     = PMACZILOG_FLAG_IS_CHANNEL_A;
 	pmz_ports[0].pdev      = &scc_a_pdev;
 	err = pmz_init_port(&pmz_ports[0]);
-	if (err)
+	if (err) {
+		pmz_ports[0].pdev = NULL;
 		return err;
+	}
 	pmz_ports_count++;
 
 	pmz_ports[0].mate      = &pmz_ports[1];
@@ -1758,8 +1760,10 @@ static int __init pmz_probe(void)
 	pmz_ports[1].flags     = 0;
 	pmz_ports[1].pdev      = &scc_b_pdev;
 	err = pmz_init_port(&pmz_ports[1]);
-	if (err)
+	if (err) {
+		pmz_ports[1].pdev = NULL;
 		return err;
+	}
 	pmz_ports_count++;
 
 	return 0;

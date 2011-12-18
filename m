From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] m68k/irq: don't use pr_crit in an header
Date: Sun, 18 Dec 2011 09:06:47 -0800
Message-ID: <1324228007.14500.4.camel@joe2Laptop>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
	 <1324152592-1718-1-git-send-email-u.kleine-koenig@pengutronix.de>
	 <CAMuHMdXyf_ofM+y6yKrzftyKTOyrSKzW7fUVAJyY6XTV_FVhNA@mail.gmail.com>
	 <20111218104248.GS24496@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from perches-mx.perches.com ([206.117.179.246]:57902 "EHLO
	labridge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751781Ab1LRRGu (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 18 Dec 2011 12:06:50 -0500
In-Reply-To: <20111218104248.GS24496@pengutronix.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, debian-kernel@lists.debian.org, linux-m68k@vger.kernel.org, Thorsten Glaser <tg@debian.org>, linux-kernel@vger.kernel.org

On Sun, 2011-12-18 at 11:42 +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Sun, Dec 18, 2011 at 11:32:21AM +0100, Geert Uytterhoeven wrote:
> > 2011/12/17 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>:
> > > Using pr_crit in an header results in funny messages. Consider
> > >        #define pr_fmt(fmt) "mydriver: " fmt
> > >        #include <linux/hardirq.h>
> > > which makes the message from ack_bad_irq
> > >        mydriver: unexpected IRQ trap...
> > > so better use plain printk with KERN_CRIT directly.

Why or when is that inappropriate?

> I only wondered if it is also desirable to
> have messages in headers modified depending on the module the header =
is
> included in.
[]
> > Nack. Nowadays pr_crit(...) is recommended over "printk(KERN_CRIT .=
=2E.)".
> I know that, I just wonder if the proponents of this recommendation a=
re
> aware of the issue when using pr_* in headers. Joe?

I believe it to be a feature rather than a defect.

=46or instance:  commit 256ee435b9a9ee9cca69602fe8046b27ca99fbee

    netdevice: Convert printk to pr_info in netif_tx_stop_queue
   =20
    This allows any caller to be prefaced by any specific
    pr_fmt to better identify which device driver is using
    this function inappropriately.=20

cheers, Joe

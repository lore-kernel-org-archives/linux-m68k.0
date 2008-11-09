From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Mon, 10 Nov 2008 00:05:25 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811100000040.22534@zirkon.biophys.uni-duesseldorf.de>
References: <12255325912043-git-send-email-Laurent@lvivier.info>
 <Pine.LNX.4.64.0811020947320.5281@anakin>
 <AC634DD2-CE12-4975-BB8E-B564C7DFDC06@lvivier.info>
 <20081102212852.GA8162@cynthia.pants.nu>
 <Pine.LNX.4.64.0811031102090.10345@loopy.telegraphics.com.au>
 <Pine.LNX.4.64.0811091711150.19341@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:55908 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756188AbYKIXF2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2008 18:05:28 -0500
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0KA300H019H26J@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Mon, 10 Nov 2008 00:05:26 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0811091711150.19341@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Brad Boyer <flar@allandria.com>, Laurent Vivier <Laurent@lvivier.info>, linux-m68k@vger.kernel.org

Hi,

> So far the only platform device for m68k (not in mainline) is Michael's
> EtherNAT driver, cfr. arch/m68k/atari/config.c. Note that that one registers
> the platform device unconditionally, as there's no magic predictor for its
> presence in the firmware or machine tables.

There's no magic predictor, but as I know what address to poke in order to 
probe for a potential EtherNAT, the device register could be conditionalized 
(and the hwreg_present() call removed from the driver). As soon as I have 
untangled myself from the SCSI code, and the intricacies of building Debian 
kernel images :-(

	Michael


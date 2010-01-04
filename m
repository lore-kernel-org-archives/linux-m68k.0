From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email
	address
Date: Mon, 4 Jan 2010 08:27:00 +0100
Message-ID: <10f740e81001032327p11009b58t8fdd1a67848e9fc8@mail.gmail.com>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
	 <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:50889 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751694Ab0ADH1E (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Jan 2010 02:27:04 -0500
Received: by ewy19 with SMTP id 19so6976744ewy.21
        for <linux-m68k@vger.kernel.org>; Sun, 03 Jan 2010 23:27:00 -0800 (PST)
In-Reply-To: <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Mon, Jan 4, 2010 at 04:49, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
> Thanks - I've started a fresh attempt to get the Atari kernel built and tested
> but I only get 'double bus fault' from ARAnyM regardless of cross compiler used.
> No console output, seems to happen before console init.

I remember seeing this as well a long time ago, due to some
bug/misconfiguration. But that
got fixed.

> You still test kernels on ARAnyM, do you? What kernel version was the last Atari

Sure!

> defconfig based on?

According to its header:
# Automatically generated make config: don't edit
# Linux kernel version: 2.6.30-rc3
# Wed Apr 22 20:47:56 2009

The actual config I'm using is slightly different as we're at 2.6.33-rc2 now.
I'll build `atari_defconfig' on current linux-m68k/master and will
give it a try.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

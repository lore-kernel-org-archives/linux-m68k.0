From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email
	address
Date: Mon, 4 Jan 2010 08:43:58 +0100
Message-ID: <10f740e81001032343r5f7b8066p327c2220d426e783@mail.gmail.com>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
	 <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
	 <10f740e81001032327p11009b58t8fdd1a67848e9fc8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:39972 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753184Ab0ADHn7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Jan 2010 02:43:59 -0500
Received: by ewy19 with SMTP id 19so6985175ewy.21
        for <linux-m68k@vger.kernel.org>; Sun, 03 Jan 2010 23:43:58 -0800 (PST)
In-Reply-To: <10f740e81001032327p11009b58t8fdd1a67848e9fc8@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Mon, Jan 4, 2010 at 08:27, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Jan 4, 2010 at 04:49, Michael Schmitz
> <schmitz@biophys.uni-duesseldorf.de> wrote:
>> Thanks - I've started a fresh attempt to get the Atari kernel built and tested
>> but I only get 'double bus fault' from ARAnyM regardless of cross compiler used.
>> No console output, seems to happen before console init.
>
> I remember seeing this as well a long time ago, due to some
> bug/misconfiguration. But that
> got fixed.
>
>> You still test kernels on ARAnyM, do you? What kernel version was the last Atari
>
> Sure!
>
>> defconfig based on?
>
> According to its header:
> # Automatically generated make config: don't edit
> # Linux kernel version: 2.6.30-rc3
> # Wed Apr 22 20:47:56 2009
>
> The actual config I'm using is slightly different as we're at 2.6.33-rc2 now.
> I'll build `atari_defconfig' on current linux-m68k/master and will
> give it a try.

Runs fine:

Linux version 2.6.33-rc2-atari-00203-gdd8abd9 (geert@ayla) (gcc
version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)) #1 Mon Jan 4
08:27:54 CET 2010

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

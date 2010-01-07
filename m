From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email
	address
Date: Thu, 7 Jan 2010 18:19:46 +0100
Message-ID: <10f740e81001070919l214f5a2cn9d6f6c1422934a70@mail.gmail.com>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
	 <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
	 <10f740e81001032327p11009b58t8fdd1a67848e9fc8@mail.gmail.com>
	 <10f740e81001032343r5f7b8066p327c2220d426e783@mail.gmail.com>
	 <alpine.DEB.2.00.1001070305380.15212@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f225.google.com ([209.85.220.225]:38970 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab0AGRTr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Jan 2010 12:19:47 -0500
Received: by fxm25 with SMTP id 25so11875854fxm.21
        for <linux-m68k@vger.kernel.org>; Thu, 07 Jan 2010 09:19:46 -0800 (PST)
In-Reply-To: <alpine.DEB.2.00.1001070305380.15212@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 7, 2010 at 03:08, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> >> Thanks - I've started a fresh attempt to get the Atari kernel built and tested
>> >> but I only get 'double bus fault' from ARAnyM regardless of cross compiler used.
>> >> No console output, seems to happen before console init.
>> >
>> > I remember seeing this as well a long time ago, due to some
>> > bug/misconfiguration. But that
>> > got fixed.
>
> I'll dig through the mailbox ...

BTW, IIRC there were also some issues with some version of binutils,
but I never saw that problem.

gcc version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)
GNU assembler (GNU Binutils) 2.18.0.20080103

My binutils is 2.18.1~cvs20080103-7 according to dpkg.

>> > The actual config I'm using is slightly different as we're at 2.6.33-rc2 now.
>> > I'll build `atari_defconfig' on current linux-m68k/master and will
>> > give it a try.
>>
>> Runs fine:
>>
>> Linux version 2.6.33-rc2-atari-00203-gdd8abd9 (geert@ayla) (gcc
>> version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)) #1 Mon Jan 4
>> 08:27:54 CET 2010
>
> Can you send that kernel and the defconfig by PM please?

Done.

> I tested one of the failing kernels on the real Falcon and it did spontaenously
> reboot there (with no output) as well.

Strange.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

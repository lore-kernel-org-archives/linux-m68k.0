From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email
	address
Date: Fri, 8 Jan 2010 09:25:15 +0100
Message-ID: <10f740e81001080025s657d354fl49d5c49fb8d81294@mail.gmail.com>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
	 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
	 <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
	 <10f740e81001032327p11009b58t8fdd1a67848e9fc8@mail.gmail.com>
	 <10f740e81001032343r5f7b8066p327c2220d426e783@mail.gmail.com>
	 <alpine.DEB.2.00.1001070305380.15212@zirkon.biophys.uni-duesseldorf.de>
	 <10f740e81001070919l214f5a2cn9d6f6c1422934a70@mail.gmail.com>
	 <alpine.DEB.2.00.1001072029380.15106@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:39005 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751970Ab0AHIZR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jan 2010 03:25:17 -0500
Received: by ewy19 with SMTP id 19so11665673ewy.21
        for <linux-m68k@vger.kernel.org>; Fri, 08 Jan 2010 00:25:15 -0800 (PST)
In-Reply-To: <alpine.DEB.2.00.1001072029380.15106@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Fri, Jan 8, 2010 at 02:15, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> >> > I remember seeing this as well a long time ago, due to some
>> >> > bug/misconfiguration. But that
>> >> > got fixed.
>> >
>> > I'll dig through the mailbox ...
>>
>> BTW, IIRC there were also some issues with some version of binutils,
>> but I never saw that problem.
>>
>> gcc version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)
>> GNU assembler (GNU Binutils) 2.18.0.20080103
>
> The 4.1.0 I built does not get past the compiler test now (miscompiles __weak).

Indeed.

> My copy of crosstool (0.43) combines 4.1.0 and 4.1.1 (the latest supported) with
> binutils 2.16.1 ... I'll give 2.18 a try.
>
> 3.3.6 is built with 2.15 - the m68k crosstool 0.38 build script of Christian did
> use 2.16.
>
> Probably no matter though - building 2.6.33 with my old cross compiler once I
> had revived that from the failing disk (3.3.6/2.16) results in the same double
> fault.
>
>> My binutils is 2.18.1~cvs20080103-7 according to dpkg.
>
> 2.18.1~cvs20080103-0ubuntu1 ... what is the host binutils even used for?

That's actually binutils-m68k-linux-gnu, built per instructions from RomanZ.

>> > Can you send that kernel and the defconfig by PM please?
>>
>> Done.
>
> Thanks, testing ... yours does in fact boot on my ARAnyM setup. Compiling with
> your .config results in the same error.

OK, so it's your toolchain.

>> > I tested one of the failing kernels on the real Falcon and it did spontaenously
>> > reboot there (with no output) as well.
>>
>> Strange.
>
> Yep - I'll try to compile the last kernel version that worked for me to see what
> the various cross compilers generate for that. 2.6.30-rc6 (botched git pull so
> I'm not too positive it isn't 2.6.29-something) does in fact compile fine with
> my old 3.3.6 cross-gcc as well as my newly built one.
>
> I'll verify that on the new tree, and start bisecting. Sigh.

Good luck!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

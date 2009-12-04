From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: M68k tree updates
Date: Fri, 4 Dec 2009 20:57:25 +0100
Message-ID: <10f740e80912041157j41984f4ay6ca2e56d70ac08e2@mail.gmail.com>
References: <alpine.DEB.2.00.0911252213340.31650@ayla.of.borg>
	 <4B13CC00.9080607@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f171.google.com ([209.85.222.171]:60667 "EHLO
	mail-pz0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754455AbZLDT5T (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 Dec 2009 14:57:19 -0500
In-Reply-To: <4B13CC00.9080607@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>, Greg Ungerer <gerg@snapgear.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>

On Mon, Nov 30, 2009 at 14:43, Maxim Kuvyrkov <maxim@codesourcery.com> wrote:
> Geert Uytterhoeven wrote:
>>
>> It took me a while, but finally I managed to update
>> http://git.kernel.org/?p=linux/kernel/git/geert/linux-m68k.git again.
>
> ...
>>
>> If anything is missing, please tell me. Thx!
>
> How about the NPTL patch (0001-Add-NPTL-support-for-m68k.patch,
> http://marc.info/?l=linux-m68k&m=125447760017098&w=2)?

As you're adding syscalls (which are shared with m68knommu), I'll have
to ask whether
you will make it work on nommu, too?

Furthermore, when building for Sun3:

arch/m68k/kernel/sys_m68k.c:706: warning: passing argument 1 of
'kunmap' from incompatible pointer type
arch/m68k/kernel/sys_m68k.c:714: warning: passing argument 1 of
'kunmap' from incompatible pointer type

Which looks like a problem with the Sun 3 version of pte_unmap().

I'm gonna add it to the m68k tree though, unless someone complains.

> Also, this trivial fix (0004-Fix-m68k-s-asm-swab.h-for-ColdFire.patch,
> http://marc.info/?l=linux-m68k&m=125447494213740&w=2) can go in.

I want to run this one by the nommu people as well...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

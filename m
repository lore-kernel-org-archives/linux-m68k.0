From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: nfeth and non-zero m68k_memoffset (was: Re: m68k discontigmem bug)
Date: Fri, 18 Oct 2013 09:33:32 +0200
Message-ID: <CAMuHMdXP14tx3vNgErN=wWao1Fp-DoKs4icpmzp0kt4pNRKEgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:46646 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103Ab3JRHdd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Oct 2013 03:33:33 -0400
Received: by mail-pb0-f51.google.com with SMTP id jt11so3485084pbb.10
        for <linux-m68k@vger.kernel.org>; Fri, 18 Oct 2013 00:33:32 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: aranym@lists.bobek.cz

On Tue, Oct 15, 2013 at 9:15 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> P.S.2. There still seems to be a virt/phys mismatch in the NatFeat code too,
>        as nfeth doesn't work when m68k_memoffset is non-zero.

Background: As NatFeat calls use physical addresses, all kernel
virtual addresses
passed must be converted to physical addresses using virt_to_phys().

However, nfeth still doesn't work, as XIF_GET_MAC returns 0 if
m68k_memoffset is non-zero.

Interestingly, when dropping the virt_to_phys() on the MAC address buffer,
it does return 1, but the MAC address is not written to the buffer, and thus
contains the stack garbage that was there before.
But now the network works (with a bogus MAC address)!

XIF_GET_IPHOST and XIF_GET_IPATARI return 11 (the correct strlen() of
the IP address), but there's nothing written in the buffer (it's unmodified).
Dropping the virt_to_phys() here makes it fail (return 0). All of this
is harmless,
as the results are printed only.

This is on aranym 0.9.13-1.1 from Ubuntu 12.04 LTS.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

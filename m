From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/13] Atari EtherNAT/EtherNEC/NetUSBee support
Date: Tue, 16 Apr 2013 21:49:05 +0200
Message-ID: <CAMuHMdV=KmLpwFF24sPr7PXdHJd2_K=LFRjdMORYp4TWwHR7Cg@mail.gmail.com>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
	<CAMuHMdVv_EAsRUV9FRLmnR5DzaBmW9dPABiMMpuc43G0anMKxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:35738 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935589Ab3DPTtH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Apr 2013 15:49:07 -0400
Received: by mail-ie0-f175.google.com with SMTP id c12so1013745ieb.20
        for <linux-m68k@vger.kernel.org>; Tue, 16 Apr 2013 12:49:05 -0700 (PDT)
In-Reply-To: <CAMuHMdVv_EAsRUV9FRLmnR5DzaBmW9dPABiMMpuc43G0anMKxw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Tue, Apr 9, 2013 at 10:55 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, Apr 6, 2013 at 2:26 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> here's my rewrite of the Atari patch series for upstream submission -
>> the only changes are to patches 9 and 12.
>>
>> The USB patch no longer disables the chip interrupt in the interrupt
>> handler - it turns out this wasn't necessary at all. It also does away
>> with direct writes to the EtherNAT interrupt control register, and uses
>> enable_irq() and disable_irq() instead. The probe code has become a lot
>> cleaner as a result.
>
> Thanks, I applied all of them, with some minor changes:

>   - Made platform device structures and isp1160_delay() in
>     arch/m68k/atari/config.c depend on the appropriate CONFIG_* symbols, else
>     you get unused warnings from the compiler if CONFIG_ETHERNAT and/or
>     CONFIG_ETHERNEC are not set.

I moved the introduction of CONFIG_ETHERNAT and CONFIG_ETHERNEC into
the commits that added the corresponding platform devices, so they became
independent of the commits that update files under drivers/net/.
I also queued all arch/m68k commits to for-3.10/for-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

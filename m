From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari TT
Date: Fri, 25 Jan 2013 08:30:25 +0100
Message-ID: <CAMuHMdWjwCQFTJRp7onffghMTDtWnAwt2vd4c2rzOTwVCG1H_w@mail.gmail.com>
References: <20130120225718.GA1459@mail.biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1301232011550.14843@herc.mirbsd.org>
	<20130123212251.GA14282@mail.biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1301232213380.14843@herc.mirbsd.org>
	<20130124000856.GA15759@mail.biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1301241759530.6423@herc.mirbsd.org>
	<20130124185341.GA27701@mail.biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1301241946080.6423@herc.mirbsd.org>
	<20130124202050.GA28593@mail.biophys.uni-duesseldorf.de>
	<CAMuHMdUj_OhGOzZ=RHbdTnB8ej4538HZUKVuDuLB_MA7p4LHAQ@mail.gmail.com>
	<20130124214836.GA29490@mail.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vb0-f54.google.com ([209.85.212.54]:65352 "EHLO
	mail-vb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752381Ab3AYHa1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 25 Jan 2013 02:30:27 -0500
Received: by mail-vb0-f54.google.com with SMTP id l1so47260vba.13
        for <linux-m68k@vger.kernel.org>; Thu, 24 Jan 2013 23:30:26 -0800 (PST)
In-Reply-To: <20130124214836.GA29490@mail.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

On Thu, Jan 24, 2013 at 10:48 PM, Michael Schmitz
<schmitz@mail.biophys.uni-duesseldorf.de> wrote:
>> > The ne.c network driver does not appear to tolerate interrupts arriving before
>> > the device has been configured, at least in the early boot phases. I'm uncertain
>> > whether it would work even with my latest patches applied - maybe I can find
>> > some time on the weekend to test that.
>>
>> Stupid ISA-only driver without IRQ sharing support...
>
> Indeed - but that may be my old hacked driver which does have IRQ sharing.
>
>> The hydra and zorro8390 driver should handle that case fine, as interrupts are
>> shared on Amiga.
>
> But these will only generate interrupts if the card has something to send,
> or receive has been enabled. The timer polling seems to be the problem here.

The point of IRQ sharing is that multiple devices use the same interrupt line.
So it's about _another_ device generating the interrupt.
Both zorro8390 and hydra use IRQ_AMIGA_PORTS. As does Gayle IDE.
Hence if the IDE hardware on A4000 triggers and interrupt, the
interrupt handler of
zorro8390 and hydra will be called as well. Since I'm not aware of any issues
with zorro8390 and hydra in A4000, I assume zorro8390 and hydra handle this,
while ne doesn't.

>> > Geert: is there some way for kernel network drivers to figure out whether the
>> > network subsystem has been initialized, and hold off interrupt processing
>> > before that time? I'm using 'if (netif_running(dev))' in atari_ethernec but
>> > that does not appear to prevent the lockup.
>>
>> Doesn't the driver know when it's configured?
>
> It does - it will spit out 'interrupt from stopped card' in that case.
> That's the last message I see from the kernel before it locks up (haven't
> tried in a while, at least that's what happened a year or two ago). The same
> still happens when loading the driver as a module - a single message of the
> kind, nothing more (but the kernel keeps running).
>
> I would have thought netif_running(dev) returns false before the device has
> been started, but that's wrong, apparently.

How does zorro8390 and hydra handle it? They use __ei_interrupt, while
ne uses eip_interrupt, but the latter just calls the former?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

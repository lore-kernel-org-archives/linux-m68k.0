From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: coldfire uart question
Date: Wed, 18 Oct 2017 08:37:44 +0200
Message-ID: <CAMuHMdVRaZxcic+UezdrsrSWWJV6SDuuAdaeFQPBNgt0oXsN9g@mail.gmail.com>
References: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it>
 <alpine.LNX.2.00.1710160943040.3@nippy.intranet> <e4fff222-c8d0-9da0-32b4-222fbfad8044@sysam.it>
 <alpine.LNX.2.00.1710181016001.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:52188 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933230AbdJRGhp (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Oct 2017 02:37:45 -0400
Received: by mail-wm0-f67.google.com with SMTP id f4so7962588wme.0
        for <linux-m68k@vger.kernel.org>; Tue, 17 Oct 2017 23:37:45 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1710181016001.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Angelo Dureghello <angelo@sysam.it>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Oct 18, 2017 at 2:06 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Tue, 17 Oct 2017, Angelo Dureghello wrote:
>> On 16/10/2017 01:08, Finn Thain wrote:
>> > On Sun, 15 Oct 2017, Angelo Dureghello wrote:
>> > > i was trying a file transfer with xmodem-1k and uClinux "rx" on the
>> > > mcf54415 stnmark2 board side.
>> > >
>> > > This using a recent mainline kernel:
>> > > / # cat /proc/version
>> > > uClinux version 4.14.0-rc4stmark2-001-00118-g811fdbb62a9d
>> > > / #
>> > >
>> > > So, as per xmodem-1k, i send 3 bytes header, a 1024 bytes block, and
>> > > 2 bytes crc16. But "rx" timeouts waiting the block.
>> > >
>> >
>> > What is the fastest baud rate that will work?
>> >
>> > > Adding some traces to "rx", it timeouts since some bytes (5 to 10)
>> > > randomly positioned in the block are not received. Of course they
>> > > have been sent (scope checked).
>> > >
>> > > The same 1024 bytes transfer in u-boot (y-modem) always succeed.
>> > >
>> >
>> > Does u-boot need to do any retransmissions? (If it polls the UART, it
>> > could probably avoid any fifo overflow.)
>> >
>> > You may also want to try lrzsz.
>> >
>> > > Since mcf54415 has a 4 slots RX fifo UART,
>> >
>> > Ouch. At 115200 baud, that FIFO overflows after about 347
>> > microseconds. If the kernel takes one interrupt per 4 bytes, you're
>> > looking at thousands of interrupts per second. Add a little unexpected
>> > interrupt latency (say, 50 microseconds) and the next byte gets lost.
>
> I should have said "86 microseconds", to guarantee an overflow, but the
> margin is lower than that even on an idle system, because time is lost in
> interrupt dispatch. This margin is the same whether the interrupt happens
> after one byte or four bytes.
>
>> thanks for explaining this.
>>
>> Well, if i understand properly, this mcf54415 CPU has 2 interrupts flags
>> that can be checked: RXRDY, for one or more character received (current
>> mcf.c seems to use this flag) and FFULL, for all 4 fifo slots full.
>>
>> So we probably have even more interrupts per second right now.
>
> Even if you can reach 4 bytes per interrupt, the payoff is probably a
> reduction in CPU overhead due to interrupt load rather than a reduction in
> FIFO overflows.

In addition, if you already have FIFO overflows (of the remaining 3 entries)
in between the issuing of the interrupt and the actual interrupt handling,
you will have them for sure if you make the hardware issue an interrupt
only when the FIFO is already full.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

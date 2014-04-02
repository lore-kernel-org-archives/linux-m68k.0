From: Daniel Palmer <danieruru@gmail.com>
Subject: Re: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Wed, 2 Apr 2014 14:35:16 +0900
Message-ID: <CAO64nm6NJSmVWyo779AKqD_8FyXPKK-_EYEM1SsMz+N7WJWeHg@mail.gmail.com>
References: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com>
	<CAO64nm6s8SYRFpnd1yMV5UsvM7JetkzkYgWMiRfNQyT93+PuGQ@mail.gmail.com>
	<CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com>
	<alpine.LNX.2.00.1404021529450.9604@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:35706 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752783AbaDBFfR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Apr 2014 01:35:17 -0400
Received: by mail-vc0-f169.google.com with SMTP id ik5so11567079vcb.28
        for <linux-m68k@vger.kernel.org>; Tue, 01 Apr 2014 22:35:16 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1404021529450.9604@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

On Wed, Apr 2, 2014 at 2:06 PM, Finn Thain <fthain@telegraphics.com.au> wrote:

>> - For the 68[EZ|VZ|SZ]328 you will need to fix up the PLL settings and
>> do the fixes from Luis Alves at
>> https://github.com/ljalves/alce68k/commit/4ef1df317c7acb6dfcd0fe9e87be9b4a60b141a4
>
> It would be nice if that work was pushed upstream. Of course, there are
> some hurdles to overcome (see Documentation/SubmittingPatches).
>
>> If your chip isn't running at 16MHz you have to fix up the serial driver
>> as it seems to assume a clock of 16MHz for it's baud rate setting.
>
> It's hard to comment without seeing patches, but Kconfig might help here.

At the moment the only specific PLL settings are for PILOT. Everyone
else gets 16MHz.
All I needed to do was take out the bit that enables a second divider
on the 66MHz clock
from the PLL.

--- a/arch/m68k/platform/68000/head.S
+++ b/arch/m68k/platform/68000/head.S
@@ -94,9 +94,9 @@ _start:
 #ifdef CONFIG_PILOT
        movew   #0x2410, 0xfffff200             /* PLLCR */
 #else
-       movew   #0x2400, 0xfffff200             /* PLLCR */
+       movew   #0x2493, 0xfffff200             /* PLLCR */
 #endif
-       movew   #0x0123, 0xfffff202             /* PLLFSR */
+       movew   #0x0347, 0xfffff202             /* PLLFSR */
        moveq   #0, %d0
        movew   #16384, %d0                     /* PLL settle wait loop */
 _pll_settle:
@@ -230,6 +230,13 @@ _clear_bss:
        cmpl    %a0, %a1                        /* check if at end */
        bne     _clear_bss


For both the PLL and UART baud rate issue I think a Kconfig setting
for the system clock would work.
For the EZ it should only allow <= 16MHz, for the VZ <= 32MHz and for
the SZ <= 66MHz ...
If it was a choice between 16, 33 or 66 then
drivers/tty/serial/68328serial.c could compile in the right table.
At the moment it assumes the VZ is running at 33MHz but the PLL
settings configure it for 16MHz.

If I get time I'll try to put together a patch set that fixes the
various issues, add a defconfig for this dev kit etc.

> I'd assume that GCC developers don't have the hardware. But I've found
> that they are generally inclined to help. You'd need to build and test
> your patches though. Crosstool-NG or OpenEmbedded can help with this.

Here is the bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=53386
They say to use the target m68k-uclinuxoldabi but that was deprecated
in GCC 4.6 so it doesn't exist any more.
I'm happy with GCC 4.5 for now.

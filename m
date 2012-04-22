From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari ROM port ISA
Date: Sun, 22 Apr 2012 22:36:45 +1200
Message-ID: <4F93DF3D.5050402@gmail.com>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>	<4F8BCF49.4060109@gmail.com>	<20120417050500.GA14387@cynthia.pants.nu>	<loom.20120419T165359-796@post.gmane.org>	<CAOmrzkKRE2SsJM532itFRd5fG2Bx-wxfno=ftb0SjXC1vWkbgQ@mail.gmail.com>	<Pine.BSM.4.64L.1204192041320.27380@herc.mirbsd.org>	<4F92D5CA.1000205@gmail.com>	<CAMuHMdWSpkD=-55nzG=mO=ZUVTG=-D0TM5-JGAhFWvdzTR=pPQ@mail.gmail.com> <CAMuHMdW6tYbn6aW46x9yDiG7hptjSPz9gGDhS=n7bBTs7=pLkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:52454 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751975Ab2DVClr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 21 Apr 2012 22:41:47 -0400
Received: by pbcun15 with SMTP id un15so2521274pbc.19
        for <linux-m68k@vger.kernel.org>; Sat, 21 Apr 2012 19:41:46 -0700 (PDT)
In-Reply-To: <CAMuHMdW6tYbn6aW46x9yDiG7hptjSPz9gGDhS=n7bBTs7=pLkA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Geert,
> On Sat, Apr 21, 2012 at 10:20, Geert Uytterhoeven<geert@linux-m68k.org>  wrote:
>>> I've had a look at the NetUSBee docs and see that the USB part of it does
>>> require 8 bit writes but little endian 16 bit reads. So we will need to
>>> retain the 16 bit reads for potential USB support there.
>> OK. But you ain't gonna get the right 16 bits using
>>
>> #define rom_in_be16(addr) \
>>         ({ u16 __v = (*(__force volatile u16 *) (addr)); __v>>= 8; __v; })
>> #define rom_in_le16(addr) \
>>         ({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr));
>> __v>>= 8; __v; })
>>
>> as they both do a 16-bit read and shift the result.
>> Perhaps it should just be a 32-bit read instead?
Correct - the 16 bit read should not do any shifts instead.
>> Are the schematics publicly available?
> I found netusbee.zip.
> Unfortunately I (my computer) can't grok the schematics files.
Same here - I'm sure software to read these is available somewhere. I 
did not look closely though.
> However, program_spec.txt says (a.o., I encourage all interested
> parties to read it in full):
DId that ...
> | USB Data Reads
> | ==============
> |
> | Data Reads from USB are done at base address 0xFA8000 (activating a read
> | cycle) as a 16bit word.  Data appears on D8-15 as most significant byte, and
> | D0-7 as least significant byte.  Notice how A15 has to be set to 1 to make it
> | a USB cycle.
>
> So inw() should just do a 16-bit big-endian read.
You're right - I got my big vs. little endian mixed up. The ISP1160 
driver is a little-endian beast but the byte swap has been done in 
hardware here if I read the paragraph right.
> | USB Data Writes
> | ===============
> |
> | Data reads at base address 0xFB8000 actually cause data to be written.  As
> | the write interface is only 8 bits wide, the 16bits of data must be passed
> | through this "8 bit window".  The Least Signifant Byte is transferred first
> | by left shifting data once and added to 0xFA8000.  This is followed by the
> | Most significant byte, transferred by left shifting data once and then added
> | to 0xFB8000.  On this last cycle is where the transfer is actually done.
> | Notice how A15 has to be set to 1 to make it a USB cycle.
>
> So outw() should do 2 byte reads.
Correct again  - the A15 we can implement via the address field itself 
(just as the USB command vs. data cycle on A14). The ISP1160 driver has 
provisions to use two 8-bit writes in place of a 16 bit one but it might 
be cleaner to implement the 16 bit write the way the USB driver needs it.

Now - does anyone here on this list or on debian-68k own such hardware 
and would be in a position to test a USB driver written to this spec? Is 
the hardware still for sale?
(Not that I am at all sure whether the ISP1160 driver will run in a 
timer polled mode at all ...)

Cheers,

   Michael

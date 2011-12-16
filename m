From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Porting m68k/nommu to a new board.
Date: Fri, 16 Dec 2011 20:57:01 +1000
Message-ID: <4EEB23FD.9090904@snapgear.com>
References: <201112152137.29195.me@danielpalmer.co.uk> <CAMuHMdU+VCVxnawb8DHmZp1EfBGW6T5D0WyXRXpo8bj1bJZ+pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:55208 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755Ab1LPK5b (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 05:57:31 -0500
In-Reply-To: <CAMuHMdU+VCVxnawb8DHmZp1EfBGW6T5D0WyXRXpo8bj1bJZ+pg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <me@danielpalmer.co.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>

Hi Daniel,

> On Fri, Dec 16, 2011 at 06:37, Daniel Palmer<me@danielpalmer.co.uk>  wrote:
>> I'm building a custom machine based around a 68sec000 (Fully static 68ec000).
>> The "board" is a bunch of parts at the moment but I have written a workable
>> simulator for the machine which I am using as a testbed for testing things
>> like my custom video, DMA controller etc before creating the hardware versions
>> in VHDL.
>>
>> I'm interested in getting mmu-less m68k linux (what used to be known as
>> uclinux I guess, seems to be known as m68k/nommu now) running on the simulator
>> and later on the real hardware.

uclinux is/was mmuless support. m68knommu used to be the arch name for
m68k without mmu support. I just use Linux now, it has all been in
mainline for so long now.


>>  From what I can tell the nommu m68k port is still active. But does it actually
>> work? All the details on similar hardware (like the older Palm pilots, Atari
>> machines) is pretty ancient, around 2.0. Does anyone have a machine running a
>> recent kernel? Were there issues getting it running?

I run on ColdFire parts all the time. Right up to 3.2-rc5 :-)
It works great. But I don't have or regularly use any original m68k
core hardware. I occasionally compile for the 68328 target, so it
will compile, can't be sure if it still runs though.


>> I did a bit of digging in the source and doesn't look like it should be too
>> difficult to add the specifics for my machine.. I have a 16550 style UART
>> emulated for I/O so I don't need to write a framebuffer driver at the moment.
>> I'm open to any suggestions people have on how to approach this though.

With the m68k and m68knommu arch code now merged it shouldn't
be too hard to enable/configure all the pieces you have. Might take
a little hacking to make it work, but it should be close.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com

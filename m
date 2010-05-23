From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: bkl: Pushdowns for sound/oss ?
Date: Sun, 23 May 2010 10:36:01 +0200
Message-ID: <AANLkTik_ZNPYFlGpfvoKSipwYbhW9JRuHh7D0IYZUwdm@mail.gmail.com>
References: <alpine.LFD.2.00.1005211536330.25348@localhost.localdomain>
	 <20100521140613.GA15070@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:57169 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869Ab0EWIgE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 May 2010 04:36:04 -0400
In-Reply-To: <20100521140613.GA15070@infradead.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: John Kacur <jkacur@redhat.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Frederic Weisbecker <fweisbec@gmail.com>, Arnd Bergmann <arndbergmann@googlemail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, May 21, 2010 at 16:06, Christoph Hellwig <hch@infradead.org> wr=
ote:
> On Fri, May 21, 2010 at 03:45:04PM +0200, John Kacur wrote:
>> I was looking at doing some of that last remaining ioctl bkl-pushdow=
ns, in
>> particular in:
>> sound/oss/swarm_cs4297a.c
>> sound/oss/msnd_pinnacle.c
>> sound/oss/sh_dac_audio.c
>> sound/oss/vwsnd.c
>> sound/oss/dmasound/dmasound_core.c
>> sound/oss/dmasound/dmasound_core.c
>>
>> when I noticed they were including asm files from mips. I went so fa=
r as
>> to compile my own mips tool chain, but I wasn't able to compile the =
above.
>> Being oss sound, I was wondering if these are still maintained or ar=
e
>> marked for removal some time in the future.
>>
>> If there is merely a problem with my toolchain, then that can be fix=
ed,
>> but there is no point in wasting time with these if no-one uses them=
=2E
>
> Can we just drop OSS? =C2=A0It's beend deprecated and mostly dead for=
 years.

There are no ALSA equivalents for the m68k Amiga/Atari/Q40 dmasound dri=
vers yet.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds

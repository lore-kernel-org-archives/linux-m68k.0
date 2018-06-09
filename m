From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v4 9/9] net-next: New ax88796 platform driver for Amiga
 X-Surf 100 Zorro board (m68k)
Date: Sat, 9 Jun 2018 12:28:23 +1200
Message-ID: <8144eec6-7bc1-95e0-e762-8b5af1c18583@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
 <1524103526-12240-10-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
 <643cf1a7-b91c-bda6-d5b0-52b7f84377e6@gmail.com>
 <56235.87.122.27.167.1528450090.webmail@webmail.zedat.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <56235.87.122.27.167.1528450090.webmail@webmail.zedat.fu-berlin.de>
Sender: netdev-owner@vger.kernel.org
To: Michael Karcher <michael.karcher@fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Finn Thain <fthain@telegraphics.com.au>, Florian Fainelli <f.fainelli@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Michael,

Am 08.06.2018 um 21:28 schrieb Michael Karcher:
> Let me add my 2 cents as main author of that code:
...
>
> actually, the the block_input / block_output functions were the reason I
> included the lib8390.c file. Except for xs100_write / xs100_read, they are
> a verbatim copy from ax88796.c I'm not that enthusiastic about that idea
> anymore, but did not get around to improve it. I added a customization
> point to ax88796 for a custom block_input / block_output, because the 8390
> core already provides that customization point. What I really need is a
> customization point just for the 8390-remote-DMA-via-MMIO functions (i.e.
> xs100_write, xs100_read) instead of the whole block transfer core that
> also sets up the remote DMA engine and tries to re-initialize the card in
> case of unexplained problems.

OK, so essentially change

         if (ei_local->word16) {
                 ioread16_rep(nic_base + NE_DATAPORT, buf, count >> 1);
                 if (count & 0x01)
                         buf[count-1] = ei_inb(nic_base + NE_DATAPORT);

         } else {
                 ioread8_rep(nic_base + NE_DATAPORT, buf, count);
         }

to something like

         if (ax->block_read) {
		ax->block_read(dev, buf, count);
	} else if (ei_local->word16) {
                 ioread16_rep(nic_base + NE_DATAPORT, buf, count >> 1);
                 if (count & 0x01)
                         buf[count-1] = ei_inb(nic_base + NE_DATAPORT);

         } else {
                 ioread8_rep(nic_base + NE_DATAPORT, buf, count);
         }

and populate ax->block_read() and ax_block_write() from platform data, 
instead of substituting ax_block_input() / ax_block_output() wholesale?

I must be missing something here.

> This should get rid of
>  - xs100_block_output
>  - xs100_block_input (which has the calls to ax_reset_8390 and
> ax_NS8390_init)
>  - ax_reset_8390
>  - and thus the include of lib8390.c (which should be included only by
> ax88796.c, not by xsurf100.c)

I've got an (untested) patch that just exports ax_NS8390_init() via the 
ax_device struct, and gets rid of the lib8390.c include that way, but 
the above solution would be a lot cleaner. Adds one test for 
ax->block_read on the critical path but we already have the test for 
ei_local->word16 there. May need rearranging the tests so the majority 
of ax88796 users isn't impacted.

Anyway, your code, your call.

Cheers,

	Michael


>
> Regards,
>   Michael Karcher
>

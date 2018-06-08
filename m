From: "Michael Karcher" <michael.karcher@fu-berlin.de>
Subject: Re: [PATCH v4 9/9] net-next: New ax88796 platform driver for Amiga
 X-Surf 100 Zorro board (m68k)
Date: Fri, 8 Jun 2018 11:28:10 +0200
Message-ID: <56235.87.122.27.167.1528450090.webmail@webmail.zedat.fu-berlin.de>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
    <1524103526-12240-10-git-send-email-schmitzmic@gmail.com>
    <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
    <643cf1a7-b91c-bda6-d5b0-52b7f84377e6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <643cf1a7-b91c-bda6-d5b0-52b7f84377e6@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Finn Thain <fthain@telegraphics.com.au>, Florian Fainelli <f.fainelli@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <michael.karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Let me add my 2 cents as main author of that code:

Michael Schmitz wrote:
> Am 08.06.2018 um 02:36 schrieb Geert Uytterhoeven:
>> So I was wondering: why is this file included, as XSURF100 selects
>> AX88796,
>> while ax88796.c includes lib8390.c anyway?
>>
>> Apparently lib8390.c is included for register definitions (provided by
>> 8390.h, and can easily be fixed), and for the __NS8390_init()
>> implementation, called below.
>
> Mostly the latter.
>
>>
>>> +static void xs100_block_output(struct net_device *dev, int count,
>>> +                              const unsigned char *buf, const int
>>> start_page)
>>> +{
>>
>> [...]
>>
>>> +       while ((ei_inb(nic_base + EN0_ISR) & ENISR_RDC) == 0) {
>>> +               if (jiffies - dma_start > 2 * HZ / 100) {       /* 20ms
>>> */
>>> +                       netdev_warn(dev, "timeout waiting for Tx
>>> RDC.\n");
>>> +                       ei_local->reset_8390(dev);
>>> +                       ax_NS8390_init(dev, 1);
>>> +                       break;
>>> +               }
>>> +       }
>>> +
>>> +       ei_outb(ENISR_RDC, nic_base + EN0_ISR); /* Ack intr. */
>>> +       ei_local->dmaing &= ~0x01;
>>> +}

actually, the the block_input / block_output functions were the reason I
included the lib8390.c file. Except for xs100_write / xs100_read, they are
a verbatim copy from ax88796.c I'm not that enthusiastic about that idea
anymore, but did not get around to improve it. I added a customization
point to ax88796 for a custom block_input / block_output, because the 8390
core already provides that customization point. What I really need is a
customization point just for the 8390-remote-DMA-via-MMIO functions (i.e.
xs100_write, xs100_read) instead of the whole block transfer core that
also sets up the remote DMA engine and tries to re-initialize the card in
case of unexplained problems.

This should get rid of
 - xs100_block_output
 - xs100_block_input (which has the calls to ax_reset_8390 and
ax_NS8390_init)
 - ax_reset_8390
 - and thus the include of lib8390.c (which should be included only by
ax88796.c, not by xsurf100.c)

Regards,
  Michael Karcher

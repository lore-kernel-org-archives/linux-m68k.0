From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v4 9/9] net-next: New ax88796 platform driver for Amiga
 X-Surf 100 Zorro board (m68k)
Date: Fri, 8 Jun 2018 19:31:07 +1200
Message-ID: <643cf1a7-b91c-bda6-d5b0-52b7f84377e6@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
 <1524103526-12240-10-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Finn Thain <fthain@telegraphics.com.au>, Florian Fainelli <f.fainelli@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Geert,

Am 08.06.2018 um 02:36 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Thu, Apr 19, 2018 at 4:05 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
>>
>> Add platform device driver to populate the ax88796 platform data from
>> information provided by the XSurf100 zorro device driver. The ax88796
>> module will be loaded through this module's probe function.
>>
>> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
> This is now commit 861928f4e60e826c ("net-next: New ax88796 platform
> driver for Amiga X-Surf 100 Zorro board (m68k)").
>
>> --- /dev/null
>> +++ b/drivers/net/ethernet/8390/xsurf100.c
>
>> +#define __NS8390_init ax_NS8390_init
>
> [...]
>
>> +#include "lib8390.c"
>
> drivers/net/ethernet/8390/lib8390.c:202: warning: ‘__ei_open’ defined
> but not used
> drivers/net/ethernet/8390/lib8390.c:231: warning: ‘__ei_close’ defined
> but not used
> drivers/net/ethernet/8390/lib8390.c:255: warning: ‘__ei_tx_timeout’
> defined but not used
> drivers/net/ethernet/8390/lib8390.c:302: warning: ‘__ei_start_xmit’
> defined but not used
> drivers/net/ethernet/8390/lib8390.c:510: warning: ‘__ei_poll’ defined
> but not used
> drivers/net/ethernet/8390/lib8390.c:851: warning: ‘__ei_get_stats’
> defined but not used
> drivers/net/ethernet/8390/lib8390.c:951: warning:
> ‘__ei_set_multicast_list’ defined but not used
> drivers/net/ethernet/8390/lib8390.c:989: warning:
> ‘____alloc_ei_netdev’ defined but not used
>

Yep, these have been a little annoying...

> So I was wondering: why is this file included, as XSURF100 selects AX88796,
> while ax88796.c includes lib8390.c anyway?
>
> Apparently lib8390.c is included for register definitions (provided by
> 8390.h, and can easily be fixed), and for the __NS8390_init()
> implementation, called below.

Mostly the latter.

>
>> +static void xs100_block_output(struct net_device *dev, int count,
>> +                              const unsigned char *buf, const int start_page)
>> +{
>
> [...]
>
>> +       while ((ei_inb(nic_base + EN0_ISR) & ENISR_RDC) == 0) {
>> +               if (jiffies - dma_start > 2 * HZ / 100) {       /* 20ms */
>> +                       netdev_warn(dev, "timeout waiting for Tx RDC.\n");
>> +                       ei_local->reset_8390(dev);
>> +                       ax_NS8390_init(dev, 1);
>> +                       break;
>> +               }
>> +       }
>> +
>> +       ei_outb(ENISR_RDC, nic_base + EN0_ISR); /* Ack intr. */
>> +       ei_local->dmaing &= ~0x01;
>> +}
>
> Can we get rid of the inclusion of lib8390.c, and the related warnings?
> Perhaps ax88796.c can export its ax_NS8390_init(), iff the implementation
> is identical? Or is there a better solution?

__NS8390_init() is declared static in lib8390.c, and we'd have to change 
that. I don't think that will fly. Adding a wrapper to ax88796.c that 
gets exported to the xsurf100 module might be an option - I'll see what 
I can come up with.

Cheers,

	Michael

>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>

From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 10/10] net: New ax88796 platform driver for Amiga X-Surf
 100 Zorro board (m68k)
Date: Wed, 18 Apr 2018 16:32:10 +1200
Message-ID: <CAOmrzkLF04fyWwKQnyxHN468vnHbBG8XG+HvTkc6Dk_B0R2T3g@mail.gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523916285-6057-11-git-send-email-schmitzmic@gmail.com> <CAMuHMdUnonyL93AmF3TdPcUPj5ZEuTb59ZgArH5BjLjcx8LcvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUnonyL93AmF3TdPcUPj5ZEuTb59ZgArH5BjLjcx8LcvA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Geert,

On Wed, Apr 18, 2018 at 1:53 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>> --- /dev/null
>> +++ b/drivers/net/ethernet/8390/xsurf100.c
>> @@ -0,0 +1,411 @@
>> +#include <linux/module.h>
>> +#include <linux/netdevice.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/zorro.h>
>> +#include <net/ax88796.h>
>> +#include <asm/amigaints.h>
>> +
>> +#define ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF100 \
>> +               ZORRO_ID(INDIVIDUAL_COMPUTERS, 0x64, 0)
>
> Another long define to get rid of? ;-)

I decided to leave it that way - it doesn't stick out quite as badly
as the one in the ESP driver. Give me a yell if you insist.

Cheers,

  Michael

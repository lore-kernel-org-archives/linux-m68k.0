From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 8/8] net: New ax88796 platform driver for Amiga X-Surf
 100 Zorro board (m68k)
Date: Wed, 18 Apr 2018 11:00:05 +1200
Message-ID: <CAOmrzkK0grWvCx44WRspVZPUhO=fnK9SyvL=sejkn5dUyNfwFg@mail.gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523930895-6973-9-git-send-email-schmitzmic@gmail.com> <20180417132625.GI2591@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180417132625.GI2591@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Andrew,

On Wed, Apr 18, 2018 at 1:26 AM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Tue, Apr 17, 2018 at 02:08:15PM +1200, Michael Schmitz wrote:
>> Add platform device driver to populate the ax88796 platform data from
>> information provided by the XSurf100 zorro device driver.
>> This driver will have to be loaded before loading the ax88796 module,
>> or compiled as built-in.
>>
>> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>> ---
>>  drivers/net/ethernet/8390/Kconfig    |   14 +-
>>  drivers/net/ethernet/8390/Makefile   |    1 +
>>  drivers/net/ethernet/8390/xsurf100.c |  411 ++++++++++++++++++++++++++++++++++
>>  3 files changed, 425 insertions(+), 1 deletions(-)
>>  create mode 100644 drivers/net/ethernet/8390/xsurf100.c
>>
>> diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet/8390/Kconfig
>> index fdc6734..0cadd45 100644
>> --- a/drivers/net/ethernet/8390/Kconfig
>> +++ b/drivers/net/ethernet/8390/Kconfig
>> @@ -30,7 +30,7 @@ config PCMCIA_AXNET
>>
>>  config AX88796
>>       tristate "ASIX AX88796 NE2000 clone support"
>> -     depends on (ARM || MIPS || SUPERH)
>> +     depends on (ARM || MIPS || SUPERH || AMIGA)
>
> Hi Michael
>
> Will it compile on other platforms? If so, it is a good idea to add
> COMPILE_TEST as well.

I suppose it will - nothing in there that wouldn't be portable. Well,
let's find out, shall we?

Cheers,

  Michael

>
>              Andrew

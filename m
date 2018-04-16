From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 02/10] net: ax88796: Attach MII bus only when open
Date: Tue, 17 Apr 2018 11:53:43 +1200
Message-ID: <CAOmrzkLnoTVtMaC49PA6s-2_4d+_b8sVTsyDYXq=gQg+_zfaSQ@mail.gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523916285-6057-3-git-send-email-schmitzmic@gmail.com> <20180416225900.GA23474@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180416225900.GA23474@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Andrew,

thank you for reviewing this series!

On Tue, Apr 17, 2018 at 10:59 AM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Tue, Apr 17, 2018 at 10:04:37AM +1200, Michael Schmitz wrote:
>> From: Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>
>>
>> Call ax_mii_init in ax_open(), and unregister/remove mdiobus resources
>> in ax_close().
>>
>> This is needed to be able to unload the module, as the module is busy
>> while the MII bus is attached.
>>
>> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>> ---
>>  drivers/net/ethernet/8390/ax88796.c |   13 +++++++++----
>>  1 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
>> index 2a256aa..f7b8911 100644
>> --- a/drivers/net/ethernet/8390/ax88796.c
>> +++ b/drivers/net/ethernet/8390/ax88796.c
>> @@ -79,6 +79,8 @@
>>
>>  static u32 ax_msg_enable;
>>
>> +static int ax_mii_init(struct net_device *dev);
>
> Hi Michael
>
> We try to avoid forward declarations. Please can you move
> ax_mii_init() so this is not needed.

Done that - had to move the entire bitbang stuff along with
ax_mii_init() though.

>> +
>>  /* device private data */
>>
>>  struct ax_device {
>> @@ -396,6 +398,10 @@ static int ax_open(struct net_device *dev)
>>
>>       netdev_dbg(dev, "open\n");
>>
>> +     ret = ax_mii_init(dev);
>> +     if (ret)
>> +             goto failed_request_irq;
>> +
>>       ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
>>                         dev->name, dev);
>>       if (ret)
>
> You are missing some cleanup on error at the end of ax_open().
> It was also missing before.

Yep, that's addressed in patch 7 of this series. I'll fold that into
this one for clarity.

Cheers,

  Michael


>
>    Andrew

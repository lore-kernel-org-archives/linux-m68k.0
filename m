From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] net: fec: set dma_coherent_mask
Date: Wed, 28 Mar 2018 09:57:29 +0200
Message-ID: <CAMuHMdXzySkpAi+kS+XCXR8kjY_AsV4h6t+XsuXx4o_0u2GSEA@mail.gmail.com>
References: <1522071386-29743-1-git-send-email-gerg@linux-m68k.org>
 <CAMuHMdW_ZmN9aptLoSK7JYLVaLyErkFyGU2sb2f564uCUeBh6w@mail.gmail.com> <d0824715-a5bb-3f19-fc47-6ae9ca94c080@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <d0824715-a5bb-3f19-fc47-6ae9ca94c080@linux-m68k.org>
Sender: netdev-owner@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Greg,

On Wed, Mar 28, 2018 at 9:27 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 27/03/18 22:59, Geert Uytterhoeven wrote:
>> On Mon, Mar 26, 2018 at 3:36 PM, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>> As of commit 205e1b7f51e4 ("dma-mapping: warn when there is no
>>> coherent_dma_mask") the Freescale FEC driver is issuing the following
>>> warning on driver initialization on ColdFire systems:
>>>
>>> WARNING: CPU: 0 PID: 1 at ./include/linux/dma-mapping.h:516 0x40159e20
>>> Modules linked in:
>>> CPU: 0 PID: 1 Comm: swapper Not tainted 4.16.0-rc7-dirty #4
>>> Stack from 41833dd8:
>>>         41833dd8 40259c53 40025534 40279e26 00000003 00000000 4004e514 41827000
>>>         400255de 40244e42 00000204 40159e20 00000009 00000000 00000000 4024531d
>>>         40159e20 40244e42 00000204 00000000 00000000 00000000 00000007 00000000
>>>         00000000 40279e26 4028d040 40226576 4003ae88 40279e26 418273f6 41833ef8
>>>         7fffffff 418273f2 41867028 4003c9a2 4180ac6c 00000004 41833f8c 4013e71c
>>>         40279e1c 40279e26 40226c16 4013ced2 40279e26 40279e58 4028d040 00000000
>>> Call Trace:
>>>         [<40025534>] 0x40025534
>>>  [<4004e514>] 0x4004e514
>>>  [<400255de>] 0x400255de
>>>  [<40159e20>] 0x40159e20
>>>  [<40159e20>] 0x40159e20
>>>
>>> It is not fatal, the driver and the system continue to function normally.
>>>
>>> As per the warning the coherent_dma_mask is not set on this device.
>>> There is nothing special about the DMA memory coherency on this hardware
>>> so we can just set the mask to 32bits during probe.
>>>
>>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>>
>> Thanks for your patch!
>>
>>> ---
>>>  drivers/net/ethernet/freescale/fec_main.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> Is this the best way to handle this problem?
>>> Comments welcome...
>>>
>>> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
>>> index d4604bc..3cb130a 100644
>>> --- a/drivers/net/ethernet/freescale/fec_main.c
>>> +++ b/drivers/net/ethernet/freescale/fec_main.c
>>> @@ -2702,6 +2702,8 @@ static int fec_enet_alloc_queue(struct net_device *ndev)
>>>         int ret = 0;
>>>         struct fec_enet_priv_tx_q *txq;
>>>
>>> +       dma_set_coherent_mask(&fep->pdev->dev, DMA_BIT_MASK(32));
>>> +
>>>         for (i = 0; i < fep->num_tx_queues; i++) {
>>>                 txq = kzalloc(sizeof(*txq), GFP_KERNEL);
>>>                 if (!txq) {
>>
>> As per your other email, this does not trigger on iMX systems using DT.
>> Hence I'm wondering if the Coldfire platform code shouldn't just do the
>> same what drivers/of/device.c does, cfr.
>> https://www.spinics.net/lists/linux-m68k/msg10929.html?
>
> I had been thinking that all along, but I couldn't see how to set this when
> there was no real bus involved that would have configured this. Turns out
> for platform devices you can set it as part of the platform setup. So now
> the patch becomes specific to the ColdFire and FEC ethernet devices.
>
> Regards
> Greg
>
> ---
>
> [PATCH] m68k: set dma and coherent masks for platform FEC ethernets
>
> As of commit 205e1b7f51e4 ("dma-mapping: warn when there is no
> coherent_dma_mask") the Freescale FEC driver is issuing the following
> warning on driver initialization on ColdFire systems:
>
> WARNING: CPU: 0 PID: 1 at ./include/linux/dma-mapping.h:516 0x40159e20
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.16.0-rc7-dirty #4
> Stack from 41833dd8:
>         41833dd8 40259c53 40025534 40279e26 00000003 00000000 4004e514 41827000
>         400255de 40244e42 00000204 40159e20 00000009 00000000 00000000 4024531d
>         40159e20 40244e42 00000204 00000000 00000000 00000000 00000007 00000000
>         00000000 40279e26 4028d040 40226576 4003ae88 40279e26 418273f6 41833ef8
>         7fffffff 418273f2 41867028 4003c9a2 4180ac6c 00000004 41833f8c 4013e71c
>         40279e1c 40279e26 40226c16 4013ced2 40279e26 40279e58 4028d040 00000000
> Call Trace:
>         [<40025534>] 0x40025534
>  [<4004e514>] 0x4004e514
>  [<400255de>] 0x400255de
>  [<40159e20>] 0x40159e20
>  [<40159e20>] 0x40159e20
>
> It is not fatal, the driver and the system continue to function normally.
>
> As per the warning the coherent_dma_mask is not set on this device.
> There is nothing special about the DMA memory coherency on this hardware
> so we can just set the mask to 32bits in the platform data for the FEC
> ethernet devices.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> ---
>  arch/m68k/coldfire/device.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
> index 84938fd..f93e0e5 100644
> --- a/arch/m68k/coldfire/device.c
> +++ b/arch/m68k/coldfire/device.c
> @@ -130,12 +130,18 @@
>         },
>  };
>
> +static u64 mcf_dma_mask = DMA_BIT_MASK(32);
> +
>  static struct platform_device mcf_fec0 = {
>         .name                   = FEC_NAME,
>         .id                     = 0,
>         .num_resources          = ARRAY_SIZE(mcf_fec0_resources),
>         .resource               = mcf_fec0_resources,
> -       .dev.platform_data      = FEC_PDATA,
> +       .dev = {
> +               .dma_mask               = &mcf_dma_mask,

Can you make this &mcf_fec0.dev.coherent_dma_mask, removing the need for
mcf_dma_mask, or doesn't C allow that?

> +               .coherent_dma_mask      = DMA_BIT_MASK(32),
> +               .platform_data          = FEC_PDATA,
> +       }
>  };
>
>  #ifdef MCFFEC_BASE1
> @@ -167,7 +173,11 @@
>         .id                     = 1,
>         .num_resources          = ARRAY_SIZE(mcf_fec1_resources),
>         .resource               = mcf_fec1_resources,
> -       .dev.platform_data      = FEC_PDATA,
> +       .dev = {
> +               .dma_mask               = &mcf_dma_mask,

Likewise.

> +               .coherent_dma_mask      = DMA_BIT_MASK(32),
> +               .platform_data          = FEC_PDATA,
> +       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

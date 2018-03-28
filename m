From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] net: fec: set dma_coherent_mask
Date: Wed, 28 Mar 2018 09:06:55 +0200
Message-ID: <CAMuHMdWSKxRdWXMOK_iqFShYKXphEUvKRMsoPP5xQAdi1x5NiQ@mail.gmail.com>
References: <1522071386-29743-1-git-send-email-gerg@linux-m68k.org>
 <CAMuHMdW_ZmN9aptLoSK7JYLVaLyErkFyGU2sb2f564uCUeBh6w@mail.gmail.com> <AM4PR0401MB2260558919012AC2D190DCD6FFA30@AM4PR0401MB2260.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <AM4PR0401MB2260558919012AC2D190DCD6FFA30@AM4PR0401MB2260.eurprd04.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: Andy Duan <fugang.duan@nxp.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Andy,

On Wed, Mar 28, 2018 at 5:04 AM, Andy Duan <fugang.duan@nxp.com> wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org> Sent: 2018=E5=B9=B43=E6=
=9C=8827=E6=97=A5 20:59
>> On Mon, Mar 26, 2018 at 3:36 PM, Greg Ungerer <gerg@linux-m68k.org> wrot=
e:
>> > As of commit 205e1b7f51e4 ("dma-mapping: warn when there is no
>> > coherent_dma_mask") the Freescale FEC driver is issuing the following
>> > warning on driver initialization on ColdFire systems:
>> >
>> > WARNING: CPU: 0 PID: 1 at ./include/linux/dma-mapping.h:516 0x40159e20
>> > Modules linked in:
>> > CPU: 0 PID: 1 Comm: swapper Not tainted 4.16.0-rc7-dirty #4 Stack from
>> > 41833dd8:
>> >         41833dd8 40259c53 40025534 40279e26 00000003 00000000
>> 4004e514 41827000
>> >         400255de 40244e42 00000204 40159e20 00000009 00000000
>> 00000000 4024531d
>> >         40159e20 40244e42 00000204 00000000 00000000 00000000
>> 00000007 00000000
>> >         00000000 40279e26 4028d040 40226576 4003ae88 40279e26
>> 418273f6 41833ef8
>> >         7fffffff 418273f2 41867028 4003c9a2 4180ac6c 00000004 41833f8c
>> 4013e71c
>> >         40279e1c 40279e26 40226c16 4013ced2 40279e26 40279e58
>> 4028d040
>> > 00000000 Call Trace:
>> >         [<40025534>] 0x40025534
>> >  [<4004e514>] 0x4004e514
>> >  [<400255de>] 0x400255de
>> >  [<40159e20>] 0x40159e20
>> >  [<40159e20>] 0x40159e20
>> >
>> > It is not fatal, the driver and the system continue to function normal=
ly.
>> >
>> > As per the warning the coherent_dma_mask is not set on this device.
>> > There is nothing special about the DMA memory coherency on this
>> > hardware so we can just set the mask to 32bits during probe.
>> >
>> > Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>>
>> Thanks for your patch!
>>
>> > ---
>> >  drivers/net/ethernet/freescale/fec_main.c | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > Is this the best way to handle this problem?
>> > Comments welcome...
>> >
>> > diff --git a/drivers/net/ethernet/freescale/fec_main.c
>> > b/drivers/net/ethernet/freescale/fec_main.c
>> > index d4604bc..3cb130a 100644
>> > --- a/drivers/net/ethernet/freescale/fec_main.c
>> > +++ b/drivers/net/ethernet/freescale/fec_main.c
>> > @@ -2702,6 +2702,8 @@ static int fec_enet_alloc_queue(struct net_devic=
e
>> *ndev)
>> >         int ret =3D 0;
>> >         struct fec_enet_priv_tx_q *txq;
>> >
>> > +       dma_set_coherent_mask(&fep->pdev->dev, DMA_BIT_MASK(32));
>> > +
>> >         for (i =3D 0; i < fep->num_tx_queues; i++) {
>> >                 txq =3D kzalloc(sizeof(*txq), GFP_KERNEL);
>> >                 if (!txq) {
>>
>> As per your other email, this does not trigger on iMX systems using DT.
>> Hence I'm wondering if the Coldfire platform code shouldn't just do the =
same what
>> drivers/of/device.c does, cfr.
>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.s
>> pinics.net%2Flists%2Flinux-m68k%2Fmsg10929.html&data=3D02%7C01%7Cfugan
>> g.duan%40nxp.com%7C3db2dbadf1154965370608d593e294b2%7C686ea1d3
>> bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636577523756185995&sdata=3DbsO
>> F%2BnSeXTP7C%2F55JLO3Pv8YybPahMaZDyqB16f9ySA%3D&reserved=3D0?
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
> It is better to use of_dma_configure(&pdev->dev, np), it iommu support, d=
evice also can allocate memory from 64bit space.

At first sight, it indeed looks like of_dma_configure() would do the
right thing,
even on platforms without DT like Coldfire.

Unfortunately of_dma_configure() is replaced by a dummy if !CONFIG_OF.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

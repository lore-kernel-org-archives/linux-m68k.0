From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 07/28] m68k/irq: Switch irq_chip methods to "struct
 irq_data *data"
Date: Sun, 11 Sep 2011 19:46:06 +0200
Message-ID: <CAMuHMdWri-LyhDN+z-WpJUkERekAwkD_F88VOtB9kEm_u=QzrA__5621.1025025279$1315766715$gmane$org@mail.gmail.com>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
	<1315742394-16036-8-git-send-email-geert@linux-m68k.org>
	<alpine.LNX.2.00.1109112327500.2286@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1109112327500.2286@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Sun, Sep 11, 2011 at 15:40, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> On Sun, 11 Sep 2011, Geert Uytterhoeven wrote:
>> diff --git a/arch/m68k/mac/macints.c b/arch/m68k/mac/macints.c
>> index ffa1b3f..3cee6d2 100644
>> --- a/arch/m68k/mac/macints.c
>> +++ b/arch/m68k/mac/macints.c
>> @@ -193,10 +193,20 @@ irqreturn_t mac_debug_handler(int, void *);
>> =C2=A0void mac_enable_irq(unsigned int irq);
>> =C2=A0void mac_disable_irq(unsigned int irq);
>>
>> +static void mac_irq_enable(struct irq_data *data)
>> +{
>> + =C2=A0 =C2=A0 mac_enable_irq(data->irq);
>> +}
>> +
>> +static void mac_irq_disable(struct irq_data *data)
>> +{
>> + =C2=A0 =C2=A0 mac_disable_irq(data->irq);
>> +}
>> +
>> =C2=A0static struct irq_chip mac_irq_chip =3D {
>> =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "m=
ac",
>> - =C2=A0 =C2=A0 .irq_enable =C2=A0 =C2=A0 =3D mac_enable_irq,
>> - =C2=A0 =C2=A0 .irq_disable =C2=A0 =C2=A0=3D mac_disable_irq,
>> + =C2=A0 =C2=A0 .irq_enable =C2=A0 =C2=A0 =3D mac_irq_enable,
>> + =C2=A0 =C2=A0 .irq_disable =C2=A0 =C2=A0=3D mac_irq_disable,
>> =C2=A0};
>>
>> =C2=A0void __init mac_init_IRQ(void)
>
>
> I wrote a patch (below) to remove these wrapper functions from the
> m68k-genirq branch. What do you think of it? (Perhaps fold it into th=
e
> patch above?)

I didn't remove the wrappers, as they're used outside the file.

> @@ -152,7 +149,7 @@ void baboon_irq_enable(int irq)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0baboon_disabled &=3D ~(1 << irq_idx);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!baboon_disabled)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mac_enable_irq(IRQ=
_NUBUS_C);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mac_irq_enable(irq=
_get_irq_data(IRQ_NUBUS_C));

irq_get_irq_data() is not available in the non-genirq case, so this cle=
anup
cannot be folded in patch 7, and has to wait until after patch 27.

I'll add it at the end of the series, OK?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds

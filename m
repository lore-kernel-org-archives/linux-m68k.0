From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: [v5] Convert to genirq (WIP)
Date: Fri, 2 Sep 2011 20:24:25 +0200
Message-ID: <CAMuHMdXj-YDFPcsQFdaWzMU8w=2VQkpBpJGmjxsXT1Y+55W43g@mail.gmail.com>
References: <CAMuHMdUZe0Y55ZPee+umJdEsmY5X-EB-KoC-w-SGEtbPMAcf3g@mail.gmail.com>
	<alpine.OSX.2.00.1108271506320.190@ibook.local>
	<alpine.OSX.2.00.1108300148040.435@ibook.local>
	<CAMuHMdVmNAOSK+M9z-ySOR-oA4LwuS_N0SZ8XxzQ9_pYqM_vdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:52399 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753895Ab1IBSY0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Sep 2011 14:24:26 -0400
In-Reply-To: <CAMuHMdVmNAOSK+M9z-ySOR-oA4LwuS_N0SZ8XxzQ9_pYqM_vdQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Thomas Gleixner <tglx@linutronix.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org

On Fri, Sep 2, 2011 at 19:24, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> On Fri, Sep 2, 2011 at 14:14, Finn Thain <fthain@telegraphics.com.au>=
 wrote:
>> On Sun, 28 Aug 2011, I wrote:
>> However, I found another problem. pmac_zilog oopses when its TTY is =
closed
>> (see below). And macsonic does the same when the NIC is closed. The =
trace
>> says that irq_shutdown() died trying to call the chip irq_mask routi=
ne,
>> when desc->irq_data.chip (in a0) was NULL. Any ideas?
>
>> Unable to handle kernel NULL pointer dereference at virtual address =
=C2=A0 (null)
>> Oops: 00000000
>> Modules linked in:
>> PC: [<00000000>] =C2=A0 (null)
>
> No, it calls a function pointer that's NULL.
>
> void irq_shutdown(struct irq_desc *desc)
> {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_state_set_disabled(desc);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0desc->depth =3D 1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc->irq_data.chip->irq_shutdown)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc->irq_data=
=2Echip->irq_shutdown(&desc->irq_data);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc->irq_data.chip->irq_disable)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc->irq_data=
=2Echip->irq_disable(&desc->irq_data);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc->irq_data=
=2Echip->irq_mask(&desc->irq_data);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_state_set_masked(desc);
> }
>
> Oops, seems I misread the code and assumed the second "if" was an "el=
se if",
> as I wrote down in my notes that it calls only one of the 3 functions=
 :-(
> But it does need either .irq_disable() or .irq_mask().

However, include/linux/irq.h says:

 * @irq_shutdown:       shut down the interrupt (defaults to ->disable =
if NULL)

which gives me the impression the original intention was to have an "el=
se if",
and don't require .irq_disable() or .irq_mask() if .irq_shutdown() is a=
vailable.

That's also what  __free_irq() used to do, cfr.
3b56f0585fd4c02d047dc406668cb40159b2d340

"genirq: Remove bogus conditional

 The if (chip->irq_shutdown) check will always evaluate to true, as we
 fill in chip->irq_shutdown with default_shutdown in
 irq_chip_set_defaults() if the chip does not provide its own function.=
"

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 33a6ee0..30bc8de 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1057,10 +1057,7 @@ static struct irqaction *__free_irq(unsigned int=
 irq, voi
        /* If this was the last handler, shut down the IRQ line: */
        if (!desc->action) {
                desc->status |=3D IRQ_DISABLED;
-               if (desc->irq_data.chip->irq_shutdown)
-                       desc->irq_data.chip->irq_shutdown(&desc->irq_da=
ta);
-               else
-                       desc->irq_data.chip->irq_disable(&desc->irq_dat=
a);
+               desc->irq_data.chip->irq_shutdown(&desc->irq_data);
        }

 #ifdef CONFIG_SMP

(at that time the check had become bogus, as .irq_shutdown() was always=
 set to
=2Eirq_disable() if it was NULL).

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

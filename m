From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/13] mac68k: start CUDA early, take 2
Date: Wed, 23 Dec 2009 21:15:46 +0100
Message-ID: <10f740e80912231215m2868aec3qb3c9a419f3635bef@mail.gmail.com>
References: <alpine.OSX.2.00.0911031502250.483@silk.local>
	 <1258423421.2140.555.camel@pasglop>
	 <alpine.OSX.2.00.0911171715450.371@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:40656 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753892AbZLWUPv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Dec 2009 15:15:51 -0500
Received: by ewy19 with SMTP id 19so6722178ewy.21
        for <linux-m68k@vger.kernel.org>; Wed, 23 Dec 2009 12:15:48 -0800 (PST)
In-Reply-To: <alpine.OSX.2.00.0911171715450.371@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org

On Tue, Nov 17, 2009 at 10:03, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> The valkyriefb driver needs the CUDA to work in order to set the vide=
o
> mode at boot. So initialise the device earlier, and bring the m68k co=
de
> closer to the powermac code.
>
> Take 2 was changed as per Benjamin Herrenschmidt's review.

Ben, OK for you?

> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
> =C2=A0arch/m68k/mac/config.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 ++=
+
> =C2=A0drivers/macintosh/adb.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 ++=
-
> =C2=A0drivers/macintosh/via-cuda.c | =C2=A0 74 ++++++++++++++++++++++=
+--------------------
> =C2=A03 files changed, 51 insertions(+), 35 deletions(-)
>
> Index: linux-2.6.31/arch/m68k/mac/config.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.31.orig/arch/m68k/mac/config.c =C2=A0 =C2=A02009-11-17 =
17:11:47.000000000 +1100
> +++ linux-2.6.31/arch/m68k/mac/config.c 2009-11-17 17:11:47.000000000=
 +1100
> @@ -23,6 +23,8 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/vt_kern.h>
> =C2=A0#include <linux/platform_device.h>
> +#include <linux/adb.h>
> +#include <linux/cuda.h>
>
> =C2=A0#define BOOTINFO_COMPAT_1_0
> =C2=A0#include <asm/setup.h>
> @@ -889,6 +891,10 @@ static void __init mac_identify(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oss_init();
> =C2=A0 =C2=A0 =C2=A0 =C2=A0psc_init();
> =C2=A0 =C2=A0 =C2=A0 =C2=A0baboon_init();
> +
> +#ifdef CONFIG_ADB_CUDA
> + =C2=A0 =C2=A0 =C2=A0 find_via_cuda();
> +#endif
> =C2=A0}
>
> =C2=A0static void __init mac_report_hardware(void)
> Index: linux-2.6.31/drivers/macintosh/via-cuda.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.31.orig/drivers/macintosh/via-cuda.c =C2=A0 =C2=A0 =C2=A0=
2009-11-17 17:07:58.000000000 +1100
> +++ linux-2.6.31/drivers/macintosh/via-cuda.c =C2=A0 2009-11-17 17:11=
:47.000000000 +1100
> @@ -89,7 +89,6 @@ static int cuda_fully_inited;
>
> =C2=A0#ifdef CONFIG_ADB
> =C2=A0static int cuda_probe(void);
> -static int cuda_init(void);
> =C2=A0static int cuda_send_request(struct adb_request *req, int sync)=
;
> =C2=A0static int cuda_adb_autopoll(int devs);
> =C2=A0static int cuda_reset_adb_bus(void);
> @@ -107,17 +106,42 @@ int cuda_request(struct adb_request *req
>
> =C2=A0#ifdef CONFIG_ADB
> =C2=A0struct adb_driver via_cuda_driver =3D {
> - =C2=A0 =C2=A0 =C2=A0 "CUDA",
> - =C2=A0 =C2=A0 =C2=A0 cuda_probe,
> - =C2=A0 =C2=A0 =C2=A0 cuda_init,
> - =C2=A0 =C2=A0 =C2=A0 cuda_send_request,
> - =C2=A0 =C2=A0 =C2=A0 cuda_adb_autopoll,
> - =C2=A0 =C2=A0 =C2=A0 cuda_poll,
> - =C2=A0 =C2=A0 =C2=A0 cuda_reset_adb_bus
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "CUDA",
> + =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D cuda_pro=
be,
> + =C2=A0 =C2=A0 =C2=A0 .send_request =3D cuda_send_request,
> + =C2=A0 =C2=A0 =C2=A0 .autopoll =C2=A0 =C2=A0 =3D cuda_adb_autopoll,
> + =C2=A0 =C2=A0 =C2=A0 .poll =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D cuda_pol=
l,
> + =C2=A0 =C2=A0 =C2=A0 .reset_bus =C2=A0 =C2=A0=3D cuda_reset_adb_bus=
,
> =C2=A0};
> =C2=A0#endif /* CONFIG_ADB */
>
> -#ifdef CONFIG_PPC
> +#ifdef CONFIG_MAC
> +int __init find_via_cuda(void)
> +{
> + =C2=A0 =C2=A0struct adb_request req;
> + =C2=A0 =C2=A0int err;
> +
> + =C2=A0 =C2=A0if (macintosh_config->adb_type !=3D MAC_ADB_CUDA)
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> + =C2=A0 =C2=A0via =3D via1;
> + =C2=A0 =C2=A0cuda_state =3D idle;
> +
> + =C2=A0 =C2=A0err =3D cuda_init_via();
> + =C2=A0 =C2=A0if (err) {
> + =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "cuda_init_via() failed\n");
> + =C2=A0 =C2=A0 =C2=A0 via =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> + =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0/* enable autopoll */
> + =C2=A0 =C2=A0cuda_request(&req, NULL, 3, CUDA_PACKET, CUDA_AUTOPOLL=
, 1);
> + =C2=A0 =C2=A0while (!req.complete)
> + =C2=A0 =C2=A0 =C2=A0 cuda_poll();
> +
> + =C2=A0 =C2=A0return 1;
> +}
> +#else
> =C2=A0int __init find_via_cuda(void)
> =C2=A0{
> =C2=A0 =C2=A0 struct adb_request req;
> @@ -175,7 +199,7 @@ int __init find_via_cuda(void)
> =C2=A0 =C2=A0 vias =3D NULL;
> =C2=A0 =C2=A0 return 0;
> =C2=A0}
> -#endif /* CONFIG_PPC */
> +#endif /* !defined CONFIG_MAC */
>
> =C2=A0static int __init via_cuda_start(void)
> =C2=A0{
> @@ -184,14 +208,14 @@ static int __init via_cuda_start(void)
>
> =C2=A0#ifdef CONFIG_MAC
> =C2=A0 =C2=A0 cuda_irq =3D IRQ_MAC_ADB;
> -#else /* CONFIG_MAC */
> +#else
> =C2=A0 =C2=A0 cuda_irq =3D irq_of_parse_and_map(vias, 0);
> =C2=A0 =C2=A0 if (cuda_irq =3D=3D NO_IRQ) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_ERR "via-cuda: can't map inter=
rupts for %s\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vias->full_name);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
> =C2=A0 =C2=A0 }
> -#endif /* CONFIG_MAC */
> +#endif
>
> =C2=A0 =C2=A0 if (request_irq(cuda_irq, cuda_interrupt, 0, "ADB", cud=
a_interrupt)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_ERR "via-cuda: can't request i=
rq %d\n", cuda_irq);
> @@ -216,28 +240,10 @@ cuda_probe(void)
> =C2=A0#else
> =C2=A0 =C2=A0 if (macintosh_config->adb_type !=3D MAC_ADB_CUDA)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
> - =C2=A0 =C2=A0via =3D via1;
> =C2=A0#endif
> - =C2=A0 =C2=A0return 0;
> -}
> -
> -static int __init
> -cuda_init(void)
> -{
> -#ifdef CONFIG_PPC
> =C2=A0 =C2=A0 if (via =3D=3D NULL)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
> =C2=A0 =C2=A0 return 0;
> -#else
> - =C2=A0 =C2=A0int err =3D cuda_init_via();
> - =C2=A0 =C2=A0if (err) {
> - =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "cuda_init_via() failed\n");
> - =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> - =C2=A0 =C2=A0}
> - =C2=A0 =C2=A0out_8(&via[IER], IER_SET|SR_INT); /* enable interrupt =
from SR */
> -
> - =C2=A0 =C2=A0return via_cuda_start();
> -#endif
> =C2=A0}
> =C2=A0#endif /* CONFIG_ADB */
>
> @@ -430,9 +436,11 @@ cuda_poll(void)
> =C2=A0 =C2=A0 /* cuda_interrupt only takes a normal lock, we disable
> =C2=A0 =C2=A0 =C2=A0* interrupts here to avoid re-entering and thus d=
eadlocking.
> =C2=A0 =C2=A0 =C2=A0*/
> - =C2=A0 =C2=A0disable_irq(cuda_irq);
> + =C2=A0 =C2=A0if (cuda_irq)
> + =C2=A0 =C2=A0 =C2=A0 disable_irq(cuda_irq);
> =C2=A0 =C2=A0 cuda_interrupt(0, NULL);
> - =C2=A0 =C2=A0enable_irq(cuda_irq);
> + =C2=A0 =C2=A0if (cuda_irq)
> + =C2=A0 =C2=A0 =C2=A0 enable_irq(cuda_irq);
> =C2=A0}
>
> =C2=A0static irqreturn_t
> @@ -446,7 +454,7 @@ cuda_interrupt(int irq, void *arg)
>
> =C2=A0 =C2=A0 spin_lock(&cuda_lock);
>
> - =C2=A0 =C2=A0/* On powermacs, this handler is registered for the VI=
A IRQ. But it uses
> + =C2=A0 =C2=A0/* On powermacs, this handler is registered for the VI=
A IRQ. But they use
> =C2=A0 =C2=A0 =C2=A0* just the shift register IRQ -- other VIA interr=
upt sources are disabled.
> =C2=A0 =C2=A0 =C2=A0* On m68k macs, the VIA IRQ sources are dispatche=
d individually. Unless
> =C2=A0 =C2=A0 =C2=A0* we are polling, the shift register IRQ flag has=
 already been cleared.
> Index: linux-2.6.31/drivers/macintosh/adb.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.31.orig/drivers/macintosh/adb.c =C2=A0 2009-11-17 17:07=
:58.000000000 +1100
> +++ linux-2.6.31/drivers/macintosh/adb.c =C2=A0 =C2=A0 =C2=A0 =C2=A02=
009-11-17 17:11:47.000000000 +1100
> @@ -317,9 +317,11 @@ static int __init adb_init(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> - =C2=A0 =C2=A0 =C2=A0 if ((adb_controller =3D=3D NULL) || adb_contro=
ller->init()) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_WARNIN=
G "Warning: no ADB interface detected\n");
> + =C2=A0 =C2=A0 =C2=A0 if (adb_controller !=3D NULL && adb_controller=
->init &&
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adb_controller->init())
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adb_controller=
 =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 if (adb_controller =3D=3D NULL) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_WARNIN=
G "Warning: no ADB interface detected\n");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {
> =C2=A0#ifdef CONFIG_PPC
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (machine_is=
_compatible("AAPL,PowerBook1998") ||
>



--=20
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds

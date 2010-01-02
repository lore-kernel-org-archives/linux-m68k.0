From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pmac-zilog: add platform driver
Date: Sat, 2 Jan 2010 13:43:46 +0100
Message-ID: <10f740e81001020443h78c615d2l206b99c386600108@mail.gmail.com>
References: <alpine.OSX.2.00.0911171657290.371@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:55123 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383Ab0ABMns convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 2 Jan 2010 07:43:48 -0500
Received: by ewy19 with SMTP id 19so5860026ewy.21
        for <linux-m68k@vger.kernel.org>; Sat, 02 Jan 2010 04:43:47 -0800 (PST)
In-Reply-To: <alpine.OSX.2.00.0911171657290.371@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org

On Tue, Nov 17, 2009 at 10:04, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> Add platform driver to the pmac-zilog driver for mac 68k, putting the
> powermac-specific bits inside #ifdef CONFIG_PPC_PMAC.

> --- linux-2.6.31.orig/drivers/serial/pmac_zilog.c =C2=A0 =C2=A0 =C2=A0=
 2009-11-17 17:07:28.000000000 +1100
> +++ linux-2.6.31/drivers/serial/pmac_zilog.c =C2=A0 =C2=A02009-11-17 =
17:07:38.000000000 +1100

> @@ -1427,6 +1439,8 @@ static struct uart_ops pmz_pops =3D {
> =C2=A0#endif
> =C2=A0};
>
> +#ifdef CONFIG_PPC_PMAC
> +
> =C2=A0/*
> =C2=A0* Setup one port structure after probing, HW is down at this po=
int,
> =C2=A0* Unlike sunzilog, we don't need to pre-init the spinlock as we=
 don't
> @@ -1823,6 +1837,88 @@ next:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> +#else
> +
> +extern struct platform_device scc_a_pdev, scc_b_pdev;

scripts/checkpatch.pl doesn't like this extern, and it's right.
Can't this be found using standard platform device/driver matching?

BTW, there are a few other minor checkpatch issues with some of the
other patches in the series,
too.

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

From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k,m68knommu: missing asterisk?
Date: Tue, 23 Feb 2010 07:13:33 +0100
Message-ID: <10f740e81002222213n3ef9608frd81422cd9a74c04@mail.gmail.com>
References: <4B7F2EC7.6000305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.26]:31582 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751422Ab0BWGNf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Feb 2010 01:13:35 -0500
In-Reply-To: <4B7F2EC7.6000305@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Roel Kluin <roel.kluin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Peter 'p2' De Schrijver <p2@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Feb 20, 2010 at 01:37, Roel Kluin <roel.kluin@gmail.com> wrote:
> An asterisk was missing.
>
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> Correct?

No, see arch/m68k/apollo/config.c:dn_dummy_hwclk().
Andrew: please dequeue.

> =C2=A0arch/m68k/include/asm/apollohw.h | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/apollohw.h b/arch/m68k/include/asm=
/apollohw.h
> index a1373b9..87e0cc4 100644
> --- a/arch/m68k/include/asm/apollohw.h
> +++ b/arch/m68k/include/asm/apollohw.h
> @@ -94,7 +94,7 @@ extern u_long timer_physaddr;
>
> =C2=A0#define sio01 ((*(volatile struct SCN2681 *)(IO_BASE + sio01_ph=
ysaddr)))
> =C2=A0#define sio23 ((*(volatile struct SCN2681 *)(IO_BASE + sio23_ph=
ysaddr)))
> -#define rtc (((volatile struct mc146818 *)(IO_BASE + rtc_physaddr)))
> +#define rtc ((*(volatile struct mc146818 *)(IO_BASE + rtc_physaddr))=
)
> =C2=A0#define cpuctrl (*(volatile unsigned int *)(IO_BASE + cpuctrl_p=
hysaddr))
> =C2=A0#define pica (IO_BASE + pica_physaddr)
> =C2=A0#define picb (IO_BASE + picb_physaddr)

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

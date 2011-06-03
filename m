From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] m68knommu: create config options for CPU classes
Date: Fri, 3 Jun 2011 13:15:02 +0200
Message-ID: <BANLkTikuR5tNe=CQS9qCOJHGkKUWKmO-rw@mail.gmail.com>
References: <1307083397-9994-1-git-send-email-gerg@snapgear.com>
	<1307083397-9994-3-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:62604 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751619Ab1FCLPE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Jun 2011 07:15:04 -0400
Received: by fxm17 with SMTP id 17so1232339fxm.19
        for <linux-m68k@vger.kernel.org>; Fri, 03 Jun 2011 04:15:02 -0700 (PDT)
In-Reply-To: <1307083397-9994-3-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Jun 3, 2011 at 08:43,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> There are 3 families of CPU core types that we support in the m68knom=
mu
> architecture branch. They are
>
> . traditional 68000
> . CPU32 (which is a 68020 core derivitive without MMU)

derivative ... and without bitfield instructions.

> . ColdFire

> It will be useful going forward to have a CONFIG_ option defined for
> each type. We already have one for ColdFire (CONFIG_COLDFIRE), so add
> for the other 2 families, CONFIG_M68000 and CONFIG_MCPU32.

I'm wondering whether it would help to have Kconfig symbols for the
instruction capabilities as well.
Then you have to document these capabilities in the kconfig definition =
only,
and can use single (e.g.) #ifdef CONFIG_CPU_HAS_BITFIELDS tests everywh=
ere
else, instead of duplicating the logic at every #ifdef.

> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
> =C2=A0arch/m68k/Kconfig.nommu | =C2=A0 52 +++++++++++++++++++++++++++=
+++++++++++++------
> =C2=A01 files changed, 45 insertions(+), 7 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.nommu b/arch/m68k/Kconfig.nommu
> index fc98f9b..b004dc1 100644
> --- a/arch/m68k/Kconfig.nommu
> +++ b/arch/m68k/Kconfig.nommu
> @@ -14,6 +14,33 @@ config GENERIC_CLOCKEVENTS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default n
>
> +config M68000
> + =C2=A0 =C2=A0 =C2=A0 bool
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 The Freescale (was Motorola) 68000 CPU =
is the first generation of
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 the well known M68K family of processor=
s. The CPU core as well as
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 being available as a stand alone CPU wa=
s also used in many
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 System-On-Chip devices (eg 68328, 68302=
, etc). It does not contain
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 a paging MMU.
> +
> +config MCPU32
> + =C2=A0 =C2=A0 =C2=A0 bool
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 The Freescale (was then Motorola) CPU32=
 is a CPU core that is
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 based on the 68020 processor. For the m=
ost part it is used in

without bitfield instructions.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 System-On-Chip parts, and does not cont=
ain a paging MMU.

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

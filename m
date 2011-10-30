From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 27/36] m68k: add code to setup a ColdFire 54xx platform
 when MMU enabled
Date: Sun, 30 Oct 2011 14:39:10 +0100
Message-ID: <CAMuHMdU8Lso_1kobyqFCyTWnA3XP0b883r3Bu3Ngzx0oViOOHA@mail.gmail.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
	<1319527168-11166-28-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:64245 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755548Ab1J3NjL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Oct 2011 09:39:11 -0400
Received: by iaby12 with SMTP id y12so6107870iab.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Oct 2011 06:39:10 -0700 (PDT)
In-Reply-To: <1319527168-11166-28-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Oct 25, 2011 at 09:19,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> We use the same setup code for ColdFire MMU enabled platforms as
> standard m68k. So add support for it to setup our 54xx ColdFire
> platforms. They do not support the same bootinfo parsing as other
> m68k platforms.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
> =C2=A0arch/m68k/kernel/setup_mm.c | =C2=A0 =C2=A08 +++++++-
> =C2=A01 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.=
c
> index 52e17d1..b3938ad 100644
> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -221,7 +221,8 @@ void __init setup_arch(char **cmdline_p)
> =C2=A0#endif
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The bootinfo is located right after the=
 kernel bss */
> - =C2=A0 =C2=A0 =C2=A0 m68k_parse_bootinfo((const struct bi_record *)=
_end);
> + =C2=A0 =C2=A0 =C2=A0 if (!CPU_IS_COLDFIRE)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m68k_parse_bootinf=
o((const struct bi_record *)_end);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (CPU_IS_040)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m68k_is040or06=
0 =3D 4;
> @@ -327,6 +328,11 @@ void __init setup_arch(char **cmdline_p)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_sun3x()=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> =C2=A0#endif
> +#ifdef CONFIG_COLDFIRE
> + =C2=A0 =C2=A0 =C2=A0 case MACH_M54XX:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config_BSP(NULL, 0=
);

config_M54xx?

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> +#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic("No conf=
iguration setup");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}

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

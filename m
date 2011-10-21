From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: selection of HAVE_GENERIC_HARDIRQS is not MMU specific
Date: Fri, 21 Oct 2011 17:02:23 +0200
Message-ID: <CAMuHMdW6PoKxdkFjJCAC3uXbw6gJNFkCGeBrx+qumkYkW+V+Dg@mail.gmail.com>
References: <1319180648-10990-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:64075 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751651Ab1JUPCY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 11:02:24 -0400
Received: by mail-iy0-f174.google.com with SMTP id k3so4829922iae.19
        for <linux-m68k@vger.kernel.org>; Fri, 21 Oct 2011 08:02:23 -0700 (PDT)
In-Reply-To: <1319180648-10990-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Oct 21, 2011 at 09:04,  <gerg@snapgear.com> wrote:
> The selection of the CONFIG_HAVE_GENERIC_HARDIRQS option is not speci=
fic
> to the MMU being present and enabled. It is dependant on what CPU we =
are
> compiling for. The non-MMU 68000 and ColdFire family CPUs use generic
> interrupts, so enable it for them only.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
> =C2=A0arch/m68k/Kconfig =C2=A0 =C2=A0 | =C2=A0 =C2=A01 -
> =C2=A0arch/m68k/Kconfig.cpu | =C2=A0 =C2=A03 +++
> =C2=A02 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 26ed01b..9829235 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -3,7 +3,6 @@ config M68K
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default y
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select HAVE_IDE
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select HAVE_AOUT if MMU
> - =C2=A0 =C2=A0 =C2=A0 select HAVE_GENERIC_HARDIRQS if !MMU
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select GENERIC_IRQ_SHOW if !MMU
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_I=
NSNS

This will be fixed Really Soon Now (TM).

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

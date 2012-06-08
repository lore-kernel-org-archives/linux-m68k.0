From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [uClinux-dev] [PATCH] m68k: fix inclusion of arch_gettimeoffset
 for non-MMU 68k classic CPU types
Date: Fri, 8 Jun 2012 09:12:04 +0200
Message-ID: <CAMuHMdXrVpqYZWdnfM7h5BkOh=5LD=rz=d5ziNkOKae5whU=Ow@mail.gmail.com>
References: <1339133143-12984-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:53632 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726Ab2FHHME convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 03:12:04 -0400
Received: by yhmm54 with SMTP id m54so1040564yhm.19
        for <linux-m68k@vger.kernel.org>; Fri, 08 Jun 2012 00:12:04 -0700 (PDT)
In-Reply-To: <1339133143-12984-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Jun 8, 2012 at 7:25 AM,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> When building for non-MMU based classic 68k CPU types (like the 68328=
 for
> example) you get a compilation error:
>
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0arch/m68k/kernel/time.o
> arch/m68k/kernel/time.c:91:5: error: redefinition of =E2=80=98arch_ge=
ttimeoffset=E2=80=99
> include/linux/time.h:145:19: note: previous definition of =E2=80=98ar=
ch_gettimeoffset=E2=80=99 was here
>
> The arch_gettimeoffset() code is included when building for these CPU=
 types,
> but it shouldn't be. Those machine types do not have
> CONFIG_ARCH_USES_GETTIMEOFFSET set.
>
> The fix is simply to conditionally include the arch_gettimeoffset() c=
ode on
> that same config setting that specifies its use or not.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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

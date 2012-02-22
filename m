From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: merge the mmu and non-mmu versions of ptrace.c
Date: Wed, 22 Feb 2012 10:41:33 +0100
Message-ID: <CAMuHMdVD-QuZ+HEEuJFXp2=H=XZum+QVqw36LWKu_6jboCMKMA@mail.gmail.com>
References: <1329880414-8301-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:35020 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755226Ab2BVJle convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 04:41:34 -0500
Received: by wgbdt10 with SMTP id dt10so6522628wgb.1
        for <linux-m68k@vger.kernel.org>; Wed, 22 Feb 2012 01:41:33 -0800 (PST)
In-Reply-To: <1329880414-8301-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Feb 22, 2012 at 04:13,  <gerg@snapgear.com> wrote:
> Most of the code in the non-mmu ptrace_no.c file is the same as the m=
mu
> version ptrace_mm.c. So merge them back into a single file.
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

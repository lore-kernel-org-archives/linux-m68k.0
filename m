From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: merge the init_task code for mmu and non-mmu targets
Date: Sun, 11 Dec 2011 10:21:36 +0100
Message-ID: <CAMuHMdWE7NLs9zeMRZ_iAcY2P8Zjd8OYUeY5bfHyK-6=hzbVbA@mail.gmail.com>
References: <1314940809-31873-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:33334 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab1LKJVi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Dec 2011 04:21:38 -0500
Received: by wgbdr13 with SMTP id dr13so8970359wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 11 Dec 2011 01:21:37 -0800 (PST)
In-Reply-To: <1314940809-31873-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Sep 2, 2011 at 07:20,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The init_task code can be the same for both mmu and non-mmu targets.
> None of the alignment carried out in the the current init_task code
> is necessary. The linker script takes care of aligning the init_threa=
d
> structure to a THREAD SIZE boundary, and that is all we need.
>
> So use the init_task.c code for all target types, that makes m68k
> code consistent with what most other architectures do.
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

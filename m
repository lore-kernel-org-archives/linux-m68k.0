From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: make syscall_trace_enter/leave exist for non-MMU
 classic m68k types
Date: Fri, 8 Jun 2012 09:16:45 +0200
Message-ID: <CAMuHMdVvdqRsOSJj6bzZCiGfH-aMX=DKs6eh4assHRq21Jitow@mail.gmail.com>
References: <1339133314-13265-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:64358 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726Ab2FHHQq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 03:16:46 -0400
Received: by yhmm54 with SMTP id m54so1042592yhm.19
        for <linux-m68k@vger.kernel.org>; Fri, 08 Jun 2012 00:16:45 -0700 (PDT)
In-Reply-To: <1339133314-13265-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Jun 8, 2012 at 7:28 AM,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The assembler entry code calls directly to the syscall_trace_enter() =
and
> syscall_trace_leave() functions. But currently they are conditionaly
> compiled out for the non-MMU classic m68k CPU types (so 68328 for exa=
mple),
> resulting in a link error:
>
> =C2=A0 =C2=A0 =C2=A0LD =C2=A0 =C2=A0 =C2=A0vmlinux
> =C2=A0 =C2=A0arch/m68k/platform/68328/built-in.o: In function `do_tra=
ce':
> =C2=A0 =C2=A0(.text+0x1c): undefined reference to `syscall_trace_ente=
r'
> =C2=A0 =C2=A0arch/m68k/platform/68328/built-in.o: In function `do_tra=
ce':
> =C2=A0 =C2=A0(.text+0x4c): undefined reference to `syscall_trace_leav=
e'
>
> Change the conditional check that includes these functions to be true=
 for
> the !defined(CONFIG_MMU) case as well.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Hmm, should add syscall_trace support to M68KCLASSIC/MMU...

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

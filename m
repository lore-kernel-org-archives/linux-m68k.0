From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: merge the mmu and non-mmu versions of ptrace.c
Date: Sun, 19 Feb 2012 11:12:40 +0100
Message-ID: <CAMuHMdXE1fHSUpn5neu7VTGZs30q=O-WdC2F-qrt1QKy9TL9Mg@mail.gmail.com>
References: <1328585132-31029-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:46620 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753265Ab2BSKMl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Feb 2012 05:12:41 -0500
Received: by wgbdt10 with SMTP id dt10so3909399wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 19 Feb 2012 02:12:40 -0800 (PST)
In-Reply-To: <1328585132-31029-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Feb 7, 2012 at 04:25,  <gerg@snapgear.com> wrote:
> --- a/arch/m68k/kernel/ptrace_mm.c
> +++ b/arch/m68k/kernel/ptrace.c
> @@ -277,7 +287,6 @@ asmlinkage void syscall_trace(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0}
>
> -#ifdef CONFIG_COLDFIRE
> =C2=A0asmlinkage int syscall_trace_enter(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;
> @@ -292,4 +301,3 @@ asmlinkage void syscall_trace_leave(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test_thread_flag(TIF_SYSCALL_TRACE))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tracehook_repo=
rt_syscall_exit(task_pt_regs(current), 0);
> =C2=A0}
> -#endif /* CONFIG_COLDFIRE */

Why have you dropped the #ifdef?

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

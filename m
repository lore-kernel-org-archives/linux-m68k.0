From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 32/35] m68k: add ColdFire FPU support for the V4e ColdFire CPU's
Date: Sat, 24 Dec 2011 20:38:26 +0100
Message-ID: <CAMuHMdVBGR9p1f_dnk8abYwosvBm9n7j1foaGd+gMESKXm8+Vw@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-33-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:57808 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782Ab1LXTi1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 24 Dec 2011 14:38:27 -0500
Received: by wgbds13 with SMTP id ds13so14871661wgb.1
        for <linux-m68k@vger.kernel.org>; Sat, 24 Dec 2011 11:38:26 -0800 (PST)
In-Reply-To: <1324610148-20666-33-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Dec 23, 2011 at 04:15,  <gerg@snapgear.com> wrote:
> @@ -570,15 +616,12 @@ static inline int rt_save_fpu_state(struct ucon=
text __user *uc, struct pt_regs *
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> - =C2=A0 =C2=A0 =C2=A0 __asm__ volatile (".chip 68k/68881\n\t"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 "fsave %0\n\t"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ".chip 68k"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 : : "m" (*fpstate) : "memory");
> + =C2=A0 =C2=A0 =C2=A0 __asm__ volatile ("fsave %0" : : "m" (*fpstate=
) : "memory");

This change breaks one of my test configs, which builds for 68040 only:

{standard input}: Assembler messages:
{standard input}:475: Error: invalid instruction for this
architecture; needs 68020 [68k, 68ec020], 68030 [68ec030], 68040
[68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334,
68336, 68340, 68341, 68349, 68360], 547x [5470, 5471, 5472, 5473,
5474, 5475], 548x [5480, 5481, 5482, 5483, 5484, 5485] -- statement
`fsave -540(%fp)' ignored

You can reproduce it by taking e.g. amiga_defconfig and disabling all o=
f
CONFIG_M68[236]0, or by manually compiling arch/m68k/kernel/signal.c
with "-m68040" added (that's what 68040-only does).

By convention, we always switch to the needed CPU type using the ".chip=
"
directive, and switch back to generic 68k afterwards. So I'd expect it =
to fail
for all my builds, but it only does for the 68040-only ones...

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

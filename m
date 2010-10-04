From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: arch_ptrace() question
Date: Mon, 4 Oct 2010 21:35:05 +0200
Message-ID: <AANLkTikZ8b9QNBkNQRCJj7ajy86hrxiPqdC-oHDe+748@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:51382 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932368Ab0JDTfG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 15:35:06 -0400
Received: by yxp4 with SMTP id 4so1758420yxp.19
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 12:35:05 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

arch/m68k/kernel/ptrace.c:arch_ptrace() has:

|        case PTRACE_PEEKUSR:
|               ...
|               } else if (addr >=3D 21 && addr < 49) {
|                        tmp =3D child->thread.fp[addr - 21];
|               ...
|         case PTRACE_POKEUSR:    /* write the word at location addr
in the USER area */
|               ...
|                } else if (addr >=3D 21 && addr < 48) {
|               ...
|                        child->thread.fp[addr - 21] =3D data;

This allows to access the fp[] (index 21..44) and fpcntl[] (index
45..47) fields in struct thread_struct:

struct thread_struct {
        unsigned long  ksp;             /* kernel stack pointer */
        unsigned long  usp;             /* user stack pointer */
        unsigned short sr;              /* saved status register */
        unsigned short fs;              /* saved fs (sfc, dfc) */
        unsigned long  crp[2];          /* cpu root pointer */
        unsigned long  esp0;            /* points to SR of stack frame =
*/
        unsigned long  faddr;           /* info about last fault */
        int            signo, code;
        unsigned long  fp[8*3];
        unsigned long  fpcntl[3];       /* fp control regs */
        unsigned char  fpstate[FPSTATESIZE];  /* floating point state *=
/
        struct thread_info info;
};

However, in the PTRACE_PEEKUSR case, the limit is 49, not 48, so it
allows to access the
first 4 bytes of fpstate[], too.

Is this intentional (anyone remembers?), or Just A Bug(tm)?
According to full-history-linux, it's been like that since this source
file entered mainline (1.3.94).

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

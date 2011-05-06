From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Fri, 6 May 2011 07:11:42 +0200
Message-ID: <BANLkTinqouGVWH8CmfM038TKFvhpJEczUQ__36622.971625957$1304658725$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg>
	<201105050824.34056.arnd@arndb.de>
	<alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
	<201105052237.11656.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201105052237.11656.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

On Thu, May 5, 2011 at 22:37, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 05 May 2011 20:44:20 Geert Uytterhoeven wrote:
>> recvmmsg is a false positive, as we set __ARCH_WANT_SYS_SOCKETCALL.
>
> This looks really strange. The commit that introduced recvmmsg (a2e27=
255)
> added it to both socketcall and as a separate syscall in a number of
> architectures, without a good reason for it. I guess it's too late
> to change that now, but we should at least fix the script so we
> don't report it missing when socketcall is set.

Some architectures don't use socketcall, so they use a separate syscall=
=2E
IIRC, powerpc is migrating away from socketcall (commit
86250b9d12caa1a3dee12a7cf638b7dd70eaadb6, "powerpc: Wire up direct
socket system calls"), hence they added a separate call for it.

> However, if your unistd.h has defined __NR_recvmmsg before, you shoul=
d
> probably add it to the syscall table, just in case that someone built
> a binary with that number.

We never had it.

BTW, we have a hole at 218/219. I don't remember why, but it may have b=
een
a placeholder for pselect6 and ppoll when that implementation was still=
 in flux.
Couldn't find anything about it in git/cvs archives, so I'll check
have to check my
old mailing list archives...

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

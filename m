From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Thu, 5 May 2011 22:37:11 +0200
Message-ID: <201105052237.11656.arnd@arndb.de>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg> <201105050824.34056.arnd@arndb.de> <alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

On Thursday 05 May 2011 20:44:20 Geert Uytterhoeven wrote:
> On Thu, 5 May 2011, Arnd Bergmann wrote:
> > Did you check the macros in unistd to see if they match the
> > actual table? I guess it would be a good time to comment out
> > the ones that are not implemented in either of the two ABIs.
> 
> Like this?

Looks good!

> warning: #warning syscall pselect6 not implemented
> warning: #warning syscall ppoll not implemented
> warning: #warning syscall recvmmsg not implemented
> 
> Do we need pselect6 and ppoll? I have vague memories not requiring it.

I'm pretty sure you need them. Glibc provides wrappers for them
when they are not there, but the wrappers not completely reliable.

> recvmmsg is a false positive, as we set __ARCH_WANT_SYS_SOCKETCALL.

This looks really strange. The commit that introduced recvmmsg (a2e27255)
added it to both socketcall and as a separate syscall in a number of
architectures, without a good reason for it. I guess it's too late
to change that now, but we should at least fix the script so we
don't report it missing when socketcall is set.

However, if your unistd.h has defined __NR_recvmmsg before, you should
probably add it to the syscall table, just in case that someone built
a binary with that number.

	Arnd

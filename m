From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/3] m68k/mac: Improve NMI handler
Date: Tue, 3 Jan 2017 15:31:34 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1701031310520.24826@nippy.intranet>
References: <cover.1483350483.git.fthain@telegraphics.com.au> <0cb5e92b377bea6699f8af8f5c5a97081a217f74.1483350483.git.fthain@telegraphics.com.au> <CAMuHMdWK1n9kyLhtNY8OKK6Yzo70QLsmAUc1TRLCdHNKWWdD7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:49164 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756252AbdACEan (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2017 23:30:43 -0500
In-Reply-To: <CAMuHMdWK1n9kyLhtNY8OKK6Yzo70QLsmAUc1TRLCdHNKWWdD7g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org


On Mon, 2 Jan 2017, Geert Uytterhoeven wrote:

> >
> > -/*
> > - * console_loglevel determines NMI handler function
> > - */
> > +extern void show_registers(struct pt_regs *);
> 
> Seems like we do have a declaration in ... <linux/kprobes.h>.
> 

Yes, and it would have to be moved outside of the #ifdef CONFIG_KPROBES 
portion before it could be used by m68k, openrisc, cris or mn10300, which 
all lack HAVE_KPROBES.

I can't see why linux/kprobes.h is more appropriate for this declaration 
than, say linux/sched.h.

Despite the checkpatch warning, placing the extern at the call site is 
very popular.

$ egrep -r "extern.*show_registers" arch/
arch/mips/kernel/unaligned.c:extern void show_registers(struct pt_regs *regs);
arch/openrisc/kernel/process.c: extern void show_registers(struct pt_regs *regs);
arch/cris/kernel/traps.c:extern void show_registers(struct pt_regs *regs);
arch/cris/mm/fault.c:extern void show_registers(struct pt_regs *regs);
arch/cris/arch-v32/mach-a3/arbiter.c:extern void show_registers(struct pt_regs *regs);
arch/cris/arch-v32/kernel/time.c:extern void show_registers(struct pt_regs *regs);
arch/cris/arch-v32/mach-fs/arbiter.c:extern void show_registers(struct pt_regs *regs);
arch/mn10300/include/asm/gdb-stub.h:extern void show_registers_only(struct pt_regs *regs);
arch/mn10300/include/asm/processor.h:extern void show_registers(struct pt_regs *regs);
arch/frv/include/asm/gdb-stub.h:extern void show_registers_only(struct pt_regs *regs);
$ 
$ egrep -r "extern.*show_registers" include/
include/linux/kprobes.h:extern void show_registers(struct pt_regs *regs);
$ 

The situation with show_regs(struct pt_regs *) is a bit better in that the 
declaration is not found at multiple call sites (as with cris) but still 
appears in multiple header files.

$ egrep -r "extern.*show_regs" arch/
arch/x86/include/asm/kdebug.h:extern void __show_regs(struct pt_regs *regs, int all);
arch/nios2/include/asm/ptrace.h:extern void show_regs(struct pt_regs *);
arch/arm/include/asm/bug.h:extern void __show_regs(struct pt_regs *);
arch/tile/include/asm/stack.h:extern void tile_show_regs(struct pt_regs *);
arch/arm64/include/asm/system_misc.h:extern void __show_regs(struct pt_regs *);
arch/c6x/include/asm/ptrace.h:extern void show_regs(struct pt_regs *);
arch/avr32/include/asm/processor.h:extern void show_regs_log_lvl(struct pt_regs *regs, const char *log_lvl);
arch/unicore32/kernel/setup.h:extern void __show_regs(struct pt_regs *);
arch/alpha/kernel/proto.h:extern void dik_show_regs(struct pt_regs *regs, unsigned long *r9_15);
$ 
$ egrep -r "extern.*show_regs" include/
include/linux/sched.h:extern void show_regs(struct pt_regs *);
$ 

I guess we could put a show_registers() declaration in 
arch/m68k/include/asm/ptrace.h, as that's where struct pt_regs definition 
comes from (actually uapi/asm/ptrace.h). Both nios2 and c6x do this for 
show_regs().

Or we could just leave the patch as it is, because thus far m68k has no 
need for any declaration except a sole call site in macints.c.

-- 

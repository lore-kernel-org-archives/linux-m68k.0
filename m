From: Michael Eager <eager@eagercon.com>
Subject: Re: M68k ColdFire ptrace/cache fix
Date: Fri, 13 Jul 2012 13:18:23 -0700
Message-ID: <5000828F.2090307@eagercon.com>
References: <500073A8.5090700@eagercon.com> <CAMuHMdUgZBgKSZK1YJnvqvcF1M82Q6mHL41K-6hdvhM69JCB+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050804010605000207030409"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shell4.bayarea.net ([209.128.82.1]:40714 "EHLO
	shell4.bayarea.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753041Ab2GMUZG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 13 Jul 2012 16:25:06 -0400
In-Reply-To: <CAMuHMdUgZBgKSZK1YJnvqvcF1M82Q6mHL41K-6hdvhM69JCB+w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

This is a multi-part message in MIME format.
--------------050804010605000207030409
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2012 01:06 PM, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Fri, Jul 13, 2012 at 9:14 PM, Michael Eager <eager@eagercon.com> wrote:
>> I've tracked down a problem in gdb/gdbserver to ptrace() not
>> clearing the i/d cache after modifying memory.
>>
>> To reproduce:
>>    m68k-gcc -g -o cf-gdb-test-no-io cf-gdb-test-no-io.c
>>    scp cf-gdb-test-no-io <target>:/
>>    on target:   gdbserver :1234 cf-gdb-test-no-io
>>    m68k-gcc cf-gdb-test-no-io
>>    (gdb) b 8
>>    (gdb) b 10
>>    (gdb) tar rem <target>:1234
>>    (gdb) c
>>    (gdb) c
>>
>> Program will hit first breakpoint, but not second breakpoint.
>>
>> It appears that the instruction at the last breakpoint location
>> is in the icache and does not get flushed when the bp is written.
>>
>> After applying the attached patch, gdb/gdbserver behavior is correct.
>
> Thanks for your report and patch!

I attached the test program, which I previously forgot.

> Does this happen only in 2.6.29, or also in current kernels?
> The first hunk of your patch no longer applies, as the affected code is
> gone and those cases are now handled purely by the generic code.

I'm working with a client's environment using 2.6.29, so I can't verify
that the same failure occurs in recent kernels.  But I don't see anything
in ptrace.c in the latest kernel which would clear the i/d caches when
writing to memory.

>
> If yes, feel free to take this to linux-m68k@lists.linux-m68k.org.

Done.


-- 
Michael Eager	 eager@eagercon.com
1960 Park Blvd., Palo Alto, CA 94306  650-325-8077



--------------050804010605000207030409
Content-Type: text/x-csrc;
 name="cf-gdb-test-no-io.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="cf-gdb-test-no-io.c"

int work (int a)
{
  return a * 2;
}

int main (void)
{
  int a = 10;
  int b = work (a);
  b = work (b);

  a = b * a;

  return 0;
}

--------------050804010605000207030409
Content-Type: text/x-patch;
 name="ptrace-cache.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ptrace-cache.patch"

--- linux-2.6.29/arch/m68k/kernel/ptrace.c-orig	2012-06-30 06:37:34.000000000 -0700
+++ linux-2.6.29/arch/m68k/kernel/ptrace.c	2012-07-13 11:25:24.000000000 -0700
@@ -24,6 +24,7 @@
 #include <asm/pgtable.h>
 #include <asm/system.h>
 #include <asm/processor.h>
+#include <asm/cacheflush_mm.h>
 
 /*
  * does not yet catch signals sent when the child dies.
@@ -157,6 +158,8 @@ long arch_ptrace(struct task_struct *chi
 	case PTRACE_POKETEXT:	/* write the word at location addr. */
 	case PTRACE_POKEDATA:
 		ret = generic_ptrace_pokedata(child, addr, data);
+		flush_dcache ();
+		flush_icache ();
 		break;
 
 	case PTRACE_POKEUSR:	/* write the word at location addr in the USER area */
@@ -183,6 +186,8 @@ long arch_ptrace(struct task_struct *chi
 			child->thread.fp[addr - 21] = data;
 		} else
 			goto out_eio;
+		flush_dcache ();
+		flush_icache ();
 		break;
 
 	case PTRACE_SYSCALL:	/* continue and stop at next (return from) syscall */

--------------050804010605000207030409--

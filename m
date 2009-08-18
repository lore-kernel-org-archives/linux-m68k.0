From: Brad Boyer <flar@allandria.com>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 16:40:17 -0700
Message-ID: <20090818234017.GA32464@cynthia.pants.nu>
References: <4A89D037.7090807@codesourcery.com> <20090818022850.GA17279@cynthia.pants.nu> <4A8A532E.6060709@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:53700 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751231AbZHRXk2 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 18 Aug 2009 19:40:28 -0400
Content-Disposition: inline
In-Reply-To: <4A8A532E.6060709@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

On Tue, Aug 18, 2009 at 11:07:26AM +0400, Maxim Kuvyrkov wrote:
> Brad Boyer wrote:
> >On Tue, Aug 18, 2009 at 01:48:39AM +0400, Maxim Kuvyrkov wrote:
> >>+/* This syscall gets its arguments in A0 (mem), A1 (oldval) and
> >>+   D1 (newval).  */
> >>+asmlinkage int
> >>+m68k_sys_atomic_cmpxchg_32(unsigned long newval, int d2, int d3, int d4, 
> >>int d5,
> >>+			unsigned long __user *mem, unsigned long oldval)
> >>+{
> >
> >Any particular reason for this calling convention? The real CAS instruction
> >specifically takes two data registers for the two values. It seems more
> >logical to me to have oldval and newval in data registers and just have
> >the mem argument in an address register.
> 
> The reason for this calling convention is to minimize difference in 
> invokation of the vDSO helper and the syscall.  The helper gets its 
> arguments in a0 (mem), d0 (oldval) and d1 (newval); in a stub, which is 
> used when vDSO is not available, one then can do:
> 
> movel %d0,%a1
> movel #NR,%d0
> trap #0

Then wouldn't it make sense to use %d2 instead of %a1?

	Brad Boyer
	flar@allandria.com


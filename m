From: Brad Boyer <flar@allandria.com>
Subject: Re: Add private syscalls to support NPTL
Date: Mon, 17 Aug 2009 19:28:50 -0700
Message-ID: <20090818022850.GA17279@cynthia.pants.nu>
References: <4A89D037.7090807@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:37900 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751011AbZHRDEN (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 17 Aug 2009 23:04:13 -0400
Content-Disposition: inline
In-Reply-To: <4A89D037.7090807@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

On Tue, Aug 18, 2009 at 01:48:39AM +0400, Maxim Kuvyrkov wrote:
> +/* This syscall gets its arguments in A0 (mem), A1 (oldval) and
> +   D1 (newval).  */
> +asmlinkage int
> +m68k_sys_atomic_cmpxchg_32(unsigned long newval, int d2, int d3, int d4, int d5,
> +			unsigned long __user *mem, unsigned long oldval)
> +{

Any particular reason for this calling convention? The real CAS instruction
specifically takes two data registers for the two values. It seems more
logical to me to have oldval and newval in data registers and just have
the mem argument in an address register.

For reference, here's the syntax summary from the m68k PRM:

CAS Dc, Du, <ea>

	Brad Boyer
	flar@allandria.com


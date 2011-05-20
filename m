From: Richard Henderson <rth@twiddle.net>
Subject: Re: [RFC][PATCH] extable: Make sure all archs define _sdata
Date: Fri, 20 May 2011 07:28:32 -0700
Message-ID: <4DD67A90.7010908@twiddle.net>
References: <1305855298.1465.19.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:33865 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751828Ab1ETO2g (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 20 May 2011 10:28:36 -0400
In-Reply-To: <1305855298.1465.19.camel@gandalf.stny.rr.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Hirokazu Takata <takata@linux-m32r.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>, "JamesE.J.Bottomley" <jejb@parisc-linux.org>

On 05/19/2011 06:34 PM, Steven Rostedt wrote:
> Can I get an Acked-by (or comment) from the following Maintainers:
> 
>   alpha
>   m32r
>   m68k
>   mips
>   parisc
> 
> Ingo has discovered that one of my patches broke the builds of these
> architectures. Although he added a quick fix, this patch supplies the
> proper fix and touches the affected architectures. Please review and Ack
> (or NACK with guidance) this patch.
> 
> -- Steve
> 
> A new utility function is used to determine if a passed in address is
> part of core kernel data or not. It may or may not return true for RO
> data, but this utility must work for RW data. Thus both _sdata and
> _edata must be defined and continuous, without .init sections that may
> later be freed and replaced by volatile memory (memory that can be
> freed).
> 
> This utility function is used to determine if data is safe from ever
> being freed. Thus it should return true for all RW global data that is
> not in a module or has been allocated, or false otherwise.
> 
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Acked-by: Richard Henderson <rth@twiddle.net>

Although I suppose if we're supposedly standardizing on _sdata,
the two uses of _data in arch/alpha/mm/ could be transitioned.


r~

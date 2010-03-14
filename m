From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: atomic_sub_and_test() asm constraints
Date: Sun, 14 Mar 2010 15:30:51 +0100
Message-ID: <m21vfnm0v8.fsf@igel.home>
References: <10f740e81003140559y7692c30ena811b6c0283c2303@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:43735 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751912Ab0CNOay (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Mar 2010 10:30:54 -0400
In-Reply-To: <10f740e81003140559y7692c30ena811b6c0283c2303@mail.gmail.com>
	(Geert Uytterhoeven's message of "Sun, 14 Mar 2010 13:59:06 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> |   CC      mm/memcontrol.o
> | {standard input}: Assembler messages:
> | {standard input}:4076: Error: operands mismatch -- statement `subl
> 12(%fp),170(%a0)' ignored
>
> Seems like we have bad asm constraints in
>
> static inline int atomic_sub_and_test(int i, atomic_t *v)
> {
>         char c;
>         __asm__ __volatile__("subl %2,%1; seq %0" : "=d" (c), "+m"
> (*v): "g" (i));

Surely "g" is wrong, sub only accepts a data register as source operand
when the destination is in memory.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."

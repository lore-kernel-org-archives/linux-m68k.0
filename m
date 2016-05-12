From: "George Spelvin" <linux@horizon.com>
Subject: Re: [RFC PATCH 2/2] arch/m68k: Add CONFIG_CPU_HAS_NO_MULDIV32
Date: 12 May 2016 16:31:16 -0400
Message-ID: <20160512203116.8654.qmail@ns.horizon.com>
References: <57347D52.2060801@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:11209 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751537AbcELUbR (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 12 May 2016 16:31:17 -0400
In-Reply-To: <57347D52.2060801@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux@horizon.com

> Did you intend to no longer compile any of mulsi3.o, etc, for
> ColdFire targets?
>
> CPU_HAS_NO_MULDIV64 is selected by both M68000 and ColdFire, so
> those functions used to be compiled. But with this change on
> only M68000 will compile them.

Yes, that's exactly the point.  ColdFire doesn't need or use them.

This was baiscally my answer to "why is there a ColdFire path
in __mulsi3"?

> When compiling with m5200 gcc will generate calls to divsi3,
> udivsi3, modsi3 and umodsi3. (As far as I can tell we never need
> mulsi3 for ColdFire). So linking will fail with this patch as-is
> in that m5200 case.

Ah!  I missed that on my testing.  Yes, indeed, there is *one* ColdFire
that needs the divides.  And -mcpu=5206 is a supported option.

I had tested with

m68k-linux-gnu-gcc-6 -march=isaa -fomit-frame-pointer -S mul.c

unsigned mul(unsigned x, unsigned y) { return x * y; }
unsigned div(unsigned x, unsigned y) { return x / y; }
unsigned rem(unsigned x, unsigned y) { return x % y; }
int sdiv(int x, int y) { return x / y; }
int srem(int x, int y) { return x % y; }

But yes, -m5206 isn't the same as "-march=isaa -mtune=5200"; the very
first is "ISA A minus" and doesn't have the *divides*.

Now that you point it out, I also see the -m5200 fallback in the Makefile.


Grumble, that just got more complicated.  It's easy enough to split
the option into CPU_HAS_NO_MUL32 and CPU_HAS_NO_DIV32, but the answer
depends on the GCC version, not just the config settings.

Options include:
- Punt on the divide part entirely, and just always compile divides like now.
  It's just a tiny bit of code space.
- (falsely) set CPU_HAS_NO_DIV32 for those CPUs always.
  The problem is, some future code might make optimization decisions
  based on that (e.g. using binary vs. Euclidean GCD algorithms),
  and for the 99% of people using a modern compiler, it'll be wrong.
- Do some post-Kconfig Makefile magic to detect the situation.

How ugly is this:

+lib-$(CONFIG_CPU_HAS_NO_MUL32) += mulsi3.o
+lib-$(CONFIG_CPU_HAS_NO_DIV32) += divsi3.o udivsi3.o modsi3.o umodsi3.o
+
+# Old GCC versions fall back to -m5200 compilation, generating these calls
+# even though the CPU doesn't actually need it.  See arch/m68k/Makefile.
+
+ifeq ($(cpuflags-y),-m5200)
+lib-y += divsi3.o udivsi3.o modsi3.o umodsi3.o
+endif

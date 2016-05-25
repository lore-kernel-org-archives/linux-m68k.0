From: "George Spelvin" <linux@sciencehorizons.net>
Subject: Re: [PATCH 08/10] m68k: Add <asm/archhash.h>
Date: 25 May 2016 04:19:49 -0400
Message-ID: <20160525081949.7160.qmail__47627.3020533428$1464164431$gmane$org@ns.sciencehorizons.net>
References: <CAMuHMdU51iHeG6rhDmGRK90ZrxfrdDifxt2gome7BWn+ciumMw@mail.gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:50146 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1753548AbcEYITv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 May 2016 04:19:51 -0400
In-Reply-To: <CAMuHMdU51iHeG6rhDmGRK90ZrxfrdDifxt2gome7BWn+ciumMw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, linux@sciencehorizons.net
Cc: gerg@linux-m68k.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, tglx@linutronix.de, torvalds@linux-foundation.org

> With my comment above, you wouldn't need this, but I'm gonna comment anyway.
> 
> We don't use special GCCs to target specific CPU variants. Hence inside the
> kernel, you should check the config symbols, to see if support for 68000 or
> 68010 (which isn't supported by the kernel yet) is enabled.

Do you remember some earlier discussion about the m68k Makefile and old
GCC versions?  In particular, lines like:

cpuflags-$(CONFIG_M525x)        := $(call cc-option,-mcpu=5253,-m5200)
cpuflags-$(CONFIG_M5249)        := $(call cc-option,-mcpu=5249,-m5200)
cpuflags-$(CONFIG_M520x)        := $(call cc-option,-mcpu=5208,-m5200)
cpuflags-$(CONFIG_M5206e)       := $(call cc-option,-mcpu=5206e,-m5200)
cpuflags-$(CONFIG_M5206)        := $(call cc-option,-mcpu=5206,-m5200)

The problem is that whether MULU.L exists depends on the targeted
architecture, and *that* depends on this Makefile trickery, not
just CONFIG symbols...

Oh, f*** me.


I misremembered.  That problem exists, but only for DIVU.L.  As I said in
the comments (which I wrote *after* deciding I needed this approach), all
ColdFire have MULU.L.  It's DIVU.L that's missing from some early ones.

You're absolutely right.  MULU.L support can be done perfectly from
CONFIG_ options.


Improved patch coming in a few minutes.  My sincere apologies.

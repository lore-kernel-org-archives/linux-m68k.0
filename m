From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
Date: Thu, 28 Apr 2016 21:54:06 +0200
Message-ID: <20160428195326.GB29802__29375.3603277311$1461873272$gmane$org@ravnborg.org>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
 <20160428164856.10120.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160428164856.10120.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, zengzhaoxiu@163.com, dalias@libc.org, davem@davemloft.net, deller@gmx.de, geert@linux-m68k.org, ink@jurassic.park.msu.ru, james.hogan@imgtec.com, jejb@parisc-linux.org, jonas@southpole.se, lennox.wu@gmail.com, lftan@altera.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux@arm.linux.org.uk, liqin.linux@gmail.com, mattst88@gmail.com, monstr@monstr.eu, nios2-dev@lists.rocketboards.org, ralf@linux-mips.org, rth@twiddle.net, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, ysato@users.sourceforge.jp, zhaoxiu.zeng@gmail.com

> __ffs on the available architectures:
> 	Alpha: sometimes (CONFIG_ALPHA_EV6, CONFIG_ALPHA_EV67)
> 	ARC: sometimes (!CONFIG_ISA_ARCOMPACT)
> 	ARM: sometimes (V5+)
> 	ARM64: NO, could be written using RBIT and CLZ
> 	AVR: yes
> 	Blackfin: NO, could be written using hweight()
> 	C6x: yes
> 	CRIS: NO
> 	FR-V: yes
> 	H8300: NO
> 	Hexagon: yes
> 	IA64: yes
> 	M32R: NO
> 	M68k: sometimes
> 	MetaG: NO
> 	Microblaze: NO
> 	MIPS: sometimes
> 	MN10300: yes
> 	OpenRISC: NO
> 	PA-RISC: NO?  Interesting code, but I think it's a net loss.
> 	PowerPC: yes
> 	S390: sometimes (CONFIG_HAVE_MARCH_Z9_109_FEATURES)
> 	Score: NO
> 	SH: NO
> 	SPARC: NO
SPARC: sparc64: YES, sparc32: NO
Patch needs to be updated to refelct this.

	Sam

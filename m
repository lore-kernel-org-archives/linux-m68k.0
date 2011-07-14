From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] m68k: Revive reporting of spurious interrupts
Date: Thu, 14 Jul 2011 08:32:54 +0200
Message-ID: <1310625174.18428.2.camel@joy-desktop>
References: <alpine.DEB.2.00.1107132028080.31317@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1107132028080.31317@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Geert Uytterhoeven p=C3=AD=C5=A1e v Wed 13. 07. 2011 v 20:29 +0200:
> commit 2502b667ea835ee16685c74b2a0d89ba8afe117a ("Change the m68knomm=
u irq
> handling to use the generic irq framework.") removed the reporting of=
 spurious
> interrupts on nommu (68328 and 68360).
>=20
> Bring it back in a generic way, using "atomic_t irq_err_count", as th=
at's what
> most of the other architectures are using.

I am curious if this would fix the kernel running in FastRAM on Falcon
with Afterburner040 (MC68040) by any chance. Because that never worked
correctly and there always were a lot of spurious interrupts :-)

If/when there is a binary kernel 3.1 for Falcon040 I might give it a
try, just out of curiosity.

Petr

From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] irq: remove obsolete definitions in interrupt.h
Date: Thu, 5 Apr 2012 10:43:12 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1204051036470.2542__13975.9187739857$1333615418$gmane$org@ionos>
References: <20120404074553.GA14959@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20120404074553.GA14959@merkur.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: lkml <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, sparclinux <sparclinux@vger.kernel.org>

On Wed, 4 Apr 2012, Sam Ravnborg wrote:

> interrupt.h contained a small fixlet for the days when
> m68k and sparc32 did not use genirq.
> As they have both entered the modern world this
> fixlet can be dropped.

You forgot that there is still an esoteric architecture which has
CONFIG_GENERIC_HARDIRQS=n.

So at least the exit_irq_thread() needs to stay.

The request_threaded_irq() one should not be used by any S390
driver. If it's used, they have probably a special opcode for it. :)

Thanks,

	tglx

 

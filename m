From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
Date: Thu, 28 Apr 2016 20:11:32 +0200
Message-ID: <CAMuHMdUBWqdyS4w7EKsnvQLXJVgQh624AQsjgQvxT9FRW4s_6g__35908.0639821061$1461867106$gmane$org@mail.gmail.com>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
	<20160428164856.10120.qmail@ns.horizon.com>
	<CAMuHMdU2e2PdwKYVaEsJ73X8Di1XHNPqnxuunr8R8bN8udazxw@mail.gmail.com>
	<20160428175843.GZ21636@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160428175843.GZ21636@brightrain.aerifal.cx>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rich Felker <dalias@libc.org>
Cc: George Spelvin <linux@horizon.com>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, zengzhaoxiu@163.com, "David S. Miller" <davem@davemloft.net>, Helge Deller <deller@gmx.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, James Hogan <james.hogan@imgtec.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Jonas Bonn <jonas@southpole.se>, Lennox Wu <lennox.wu@gmail.com>, Ley Foon Tan <lftan@altera.com>, alpha <linux-alpha@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "open list:METAG ARCHITECTURE" <linux-metag@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Russell

On Thu, Apr 28, 2016 at 7:58 PM, Rich Felker <dalias@libc.org> wrote:
> On Thu, Apr 28, 2016 at 07:51:06PM +0200, Geert Uytterhoeven wrote:
>> On Thu, Apr 28, 2016 at 6:48 PM, George Spelvin <linux@horizon.com> wrote:
>> > Another few comments:
>> >
>> > 1. Would ARCH_HAS_FAST_FFS involve fewer changes than CPU_NO_EFFICIENT_FFS?
>>
>> No, as you want to _disable_ ARCH_HAS_FAST_FFS / _enable_
>> CPU_NO_EFFICIENT_FFS as soon as you're enabling support for a
>> CPU that doesn't support it.
>>
>> Logical OR is easier in both the Kconfig and C preprocessor languages
>> than logical NAND.
>>
>> E.g. in Kconfig, a CPU core not supporting it can just select
>> CPU_NO_EFFICIENT_FFS.
>
> How does a CPU lack an efficient ffs/ctz anyway? There are all sorts
> of ways to implement it without a native insn, some of which are
> almost or just as fast as the native insn on cpus that have the
> latter. On anything with a fast multiply, the de Bruijn sequence
> approach is near-optimal, and otherwise one of the binary-search type
> approaches (possibly branchless) can be used. If the compiler doesn't
> generate an appropriate one for __builtin_ctz, that's arguably a
> compiler bug.

m68k-linux-gcc 4.6.3 generates:

        jsr __ctzsi2

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

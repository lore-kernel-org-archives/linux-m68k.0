From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: M68k ColdFire ptrace/cache fix
Date: Sun, 15 Jul 2012 13:54:19 +0200
Message-ID: <CAMuHMdVQoM945y=8uCQMSe2OFZ8eVj_A8v9ZXbYwHhEHpMvSRw@mail.gmail.com>
References: <500073A8.5090700@eagercon.com>
	<CAMuHMdUgZBgKSZK1YJnvqvcF1M82Q6mHL41K-6hdvhM69JCB+w@mail.gmail.com>
	<5000828F.2090307@eagercon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <5000828F.2090307@eagercon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Eager <eager@eagercon.com>
Cc: linux-m68k@lists.linux-m68k.org, Andreas Schwab <schwab@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>

Hi Michael,

On Fri, Jul 13, 2012 at 10:18 PM, Michael Eager <eager@eagercon.com> wrote:
> On 07/13/2012 01:06 PM, Geert Uytterhoeven wrote:
>> On Fri, Jul 13, 2012 at 9:14 PM, Michael Eager <eager@eagercon.com> wrote:
>>> I've tracked down a problem in gdb/gdbserver to ptrace() not
>>> clearing the i/d cache after modifying memory.
>>>
>>> To reproduce:
>>>    m68k-gcc -g -o cf-gdb-test-no-io cf-gdb-test-no-io.c
>>>    scp cf-gdb-test-no-io <target>:/
>>>    on target:   gdbserver :1234 cf-gdb-test-no-io
>>>    m68k-gcc cf-gdb-test-no-io
>>>    (gdb) b 8
>>>    (gdb) b 10
>>>    (gdb) tar rem <target>:1234
>>>    (gdb) c
>>>    (gdb) c
>>>
>>> Program will hit first breakpoint, but not second breakpoint.
>>>
>>> It appears that the instruction at the last breakpoint location
>>> is in the icache and does not get flushed when the bp is written.
>>>
>>> After applying the attached patch, gdb/gdbserver behavior is correct.
>>
>> Thanks for your report and patch!
>
> I attached the test program, which I previously forgot.
>
>> Does this happen only in 2.6.29, or also in current kernels?
>> The first hunk of your patch no longer applies, as the affected code is
>> gone and those cases are now handled purely by the generic code.
>
> I'm working with a client's environment using 2.6.29, so I can't verify
> that the same failure occurs in recent kernels.  But I don't see anything
> in ptrace.c in the latest kernel which would clear the i/d caches when
> writing to memory.

Yeah, even 2.6.29 just called the generic version from the m68k-specific code,
which moved a layer up in more recent kernels (commit
faa47b466935e73251b18b17d51455b06ed65764 ("m68k: use generic code for
ptrace requests") by Andreas).

Anyway, I'd expect the generic code to issue a cache flush/invalidate somewhere
around the road, else it would fail for many more platforms.
So far I couldn't reproduce this (on 3.0 and 3.5-rc6) on 68040 (both ARAnyM
and real hardware). Hence I'm more inclined to believe this is an issue in the
Coldfire-specific code, cfr. the recent cache issues Greg discovered
(http://www.mail-archive.com/linux-m68k@vger.kernel.org/msg04929.html).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

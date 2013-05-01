From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] lib: add weak __clzsi2()/__clzdi2() functions
Date: Wed, 1 May 2013 09:35:35 +0200
Message-ID: <CAMuHMdXJaZTSNavsPxQQ8df+J=Rfyn6mKjP2g7xoDXnW5PiF3Q@mail.gmail.com>
References: <1367214005-14302-1-git-send-email-chanho.min@lge.com>
	<CAMuHMdWk4oi_KCmZv7hLZ7JSwy=meziKPBMQ1HJiJR9W8AdrDg@mail.gmail.com>
	<20130430144605.1a99a7397702b332ee818fc8@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20130430144605.1a99a7397702b332ee818fc8@linux-foundation.org>
Sender: sparclinux-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chanho Min <chanho.min@lge.com>, Kyungsik Lee <kyungsik.lee@lge.com>, Yann Collet <yann.collet.73@gmail.com>, Bob Pearson <rpearson@systemfabricworks.com>, Richard Weinberger <richard@nod.at>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Tue, Apr 30, 2013 at 11:46 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Mon, 29 Apr 2013 09:20:25 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Mon, Apr 29, 2013 at 7:40 AM, Chanho Min <chanho.min@lge.com> wrote:
>> > Some architectures need __clzsi2() or __clzdi2() for __builtin_clz and
>> > It causes build failure. They can be implemented using the fls() and
>> > overridden by linking arch-specific versions may not be implemented yet.
>> >
>> > Reference: https://lkml.org/lkml/2013/4/18/603
>> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> > Signed-off-by: Chanho Min <chanho.min@lge.com>
>>
>> Thanks, this fixes the link error on m68k, so
>>
>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> It doesn't work for alpha (gcc-4.4.4):
>
> ERROR: "__ctzdi2" [lib/lz4/lz4hc_compress.ko] undefined!
> ERROR: "__ctzdi2" [lib/lz4/lz4_compress.ko] undefined!
>
> akpm3:/usr/src/25> nm vmlinux|grep ctzd
> akpm3:/usr/src/25>
>
> I assume the linker threw the code away.

No, the link errors are for __ctzdi2, not __clzdi2.
__ctzdi2 can be implemented using __ffs().

> How's about we stop using __builtin_ctz[ll]() altogether?  Use N-fls()?

That was my first suggestion ;-)

> btw, this:
>
> int __weak __clzsi2(int val)
> {
>        return BITS_PER_LONG - fls(val);
> }
>
> looks wrong.  It will give a different result for 32- and 64-bit.

Indeed. It should be hardcoded 32.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

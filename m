From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: TASK_SIZE for !MMU
Date: Tue, 3 Jun 2014 17:19:56 +0200
Message-ID: <CAMuHMdXpOcWhsjMRaW6YVeK4g-QJN7WNkRHD+q4==GkBPp5=0w__28948.8322720446$1401808865$gmane$org@mail.gmail.com>
References: <20140429100028.GH28564@pengutronix.de>
	<20140602085150.GA31147@pengutronix.de>
	<538DBC3F.9060207@uclinux.org>
	<20140603141138.GH16741@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20140603141138.GH16741@pengutronix.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Ungerer <gerg@uclinux.org>, Rabin Vincent <rabin@rab.in>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, linux-m32r@ml.linux-m32r.org, linux-c6x-dev@linux-c6x.org, microblaze-uclinux@itee.uq.edu.au, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Sascha Hauer <kernel@pengutronix.de>, "uclinux-dist-devel@blackfin.uclinux.org" <uclinux-dist-devel@blackfin.uclinux.org>, Andrew Morton <akpm@linux-foundation.org>, panchaxari <panchaxari.prasannamurthy@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Jun 3, 2014 at 4:11 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>> I did that same change for m68k in commit cc24c40 ("m68knommu: remov=
e
>> size limit on non-MMU TASK_SIZE"). For similar reasons as you need t=
o
>> now.
> ok.
>
>> >>Thoughts?
>> >The problem is that current linus/master (and also next) doesn't bo=
ot on
>> >my ARM-nommu machine because the user string functions (strnlen_use=
r,
>> >strncpy_from_user et al.) refuse to work on strings above TASK_SIZE
>> >which in my case also includes the XIP kernel image.
>>
>> I seem to recall that we were not considering flash or anything else
>> other than RAM when defining that original TASK_SIZE (back many, man=
y
>> years ago). Some of the address checks you list above made some sens=
e
>> if you had everything in RAM (though only upper bounds are checked).
>> The thinking was some checking is better than none I suppose.
> What is the actual meaning of TASK_SIZE? The maximal value of a valid
> userspace address?

Yes

$ git show cc24c40
commit cc24c405949e3d4418a90014d10166679d78141a
Author: Greg Ungerer <gerg@uclinux.org>
Date:   Mon May 24 11:22:05 2010 +1000

    m68knommu: remove size limit on non-MMU TASK_SIZE

    The TASK_SIZE define is used in some places as a limit on the size =
of
    the virtual address space of a process. On non-MMU systems those ad=
dresses
    used in comparison will be physical addresses, and they could be an=
ywhere
    in the 32bit physical address space. So for !CONFIG_MMU systems set=
 the
    TASK_SIZE to the maximum physical address.

    Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds

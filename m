From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] /proc/kmem cleanups and hwpoison bits
Date: Wed, 16 Sep 2009 11:01:17 +0200
Message-ID: <10f740e80909160201l4834369s75e63fe8df0991aa@mail.gmail.com>
References: <20090915021851.168285585@intel.com>
	 <20090915120939.bcc571e1.kamezawa.hiroyu@jp.fujitsu.com>
	 <20090915082200.GA2588@localhost>
	 <Pine.LNX.4.64.0909151057020.26095@sister.anvils>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0909151057020.26095@sister.anvils>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Hugh Dickins <hugh.dickins@tiscali.co.uk>
Cc: Wu Fengguang <fengguang.wu@intel.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ingo Molnar <mingo@elte.hu>, Tejun Heo <tj@kernel.org>, Nick Piggin <npiggin@suse.de>, LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org

On Tue, Sep 15, 2009 at 12:16, Hugh Dickins <hugh.dickins@tiscali.co.uk=
> wrote:
> On Tue, 15 Sep 2009, Wu Fengguang wrote:
>> On Tue, Sep 15, 2009 at 11:09:39AM +0800, KAMEZAWA Hiroyuki wrote:
>> > On Tue, 15 Sep 2009 10:18:51 +0800
>> > Wu Fengguang <fengguang.wu@intel.com> wrote:
>> >
>> > > Hi Kame,
>> > >
>> > > Here are 3 more kmem patches in my queue. Comments are welcome.
>> > > If you feel good about them, I can send all recent kmem cleanup
>> > > patches for you.
>> > >
>> >
>> > This is my quick hack. But I don't want to be an obstacle for you.
>> > So, I'll wait for your updates.
>>
>> Thanks. This is also a bug fix: vmalloc_to_page() will otherwise BUG=
()
>> on !is_vmalloc_or_module_addr() pages.
>>
>> > =3D=3D
>> > Now, /dev/kmem's read/write vmalloc area doesn't do
>> > range-check. Because vread/vwrite traverse vmalloc area list
>> > under system-wide spinlock, it's better to avoid unnecessary
>> > to do unnecessary calls to vread/vwrite.
>>
>> is_vmalloc_or_module_addr() could be put to either read_kmem()
>> or aligned_vread(), and I'm fine with both.
>>
>> It looks like vread can be shared by kmem and kcore :)
>>
>> > And, vread/vwrite returns 0 if we accessed memory holes.
>> > We can avoid copy-to-user in read side, we just ignore at write.
>> >
>> > Signed-off-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
>> > ---
>> > =C2=A0drivers/char/mem.c | =C2=A0 27 +++++++++++++++++++--------
>> > =C2=A01 file changed, 19 insertions(+), 8 deletions(-)
>
> Sorry guys, I'm picking this mail pretty much at random
> as something to reply to.
>
> I'm interested to notice such work going on in drivers/char/mem.c,
> and don't have time to join in - you interact a lot faster than I
> manage, and I've other priorities to attend to; but thought I should
> at least send over the patch I've been including in my private debug
> kernels for the last couple of years (rebased to 2.6.31), which lets
> me peek and poke into /dev/kmem as I occasionally wish.
>
> Warning: it may be rubbish, it may just be a hack which appeared to
> work for me the last time I tried, on a particular address range of a
> particular set of configurations of a particular set of architectures
> (x86_32, x86_64, powerpc64). =C2=A0I've never thought it through enou=
gh to
> consider submitting, but it _might_ contain something useful for you
> to factor into your own efforts.
>
> Sorry for chucking it over the wall to you in this way, but I guess
> that's better than just sitting quietly on it for a few more years.
>
> Certainly-Not-Signed-off-by: Hugh Dickins <hugh.dickins@tiscali.co.uk=
>
> ---
>
> =C2=A0drivers/char/mem.c | =C2=A0265 +++++++++++++++-----------------=
-----------
> =C2=A0fs/read_write.c =C2=A0 =C2=A0| =C2=A0 =C2=A09 +
> =C2=A02 files changed, 105 insertions(+), 169 deletions(-)
>
> but if completed would also remove vread() and vwrite() from
>
> =C2=A0include/linux/vmalloc.h
> =C2=A0mm/nommu.c
> =C2=A0mm/vmalloc.c
>
> --- 2.6.31/drivers/char/mem.c =C2=A0 2009-09-09 23:13:59.000000000 +0=
100
> +++ 2.6.31d/drivers/char/mem.c =C2=A02009-09-10 09:38:30.000000000 +0=
100

> -#ifdef __ARCH_HAS_NO_PAGE_ZERO_MAPPED
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we don't have p=
age 0 mapped on sparc and m68k.. */

Is this `feature' removed?

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
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

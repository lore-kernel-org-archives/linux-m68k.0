From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Wed, 22 Apr 2009 09:20:31 +0200
Message-ID: <10f740e80904220020o70837da9mfb74cbbfb0f917d3@mail.gmail.com>
References: <20090326123822.GD8081@marenka.net>
	 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
	 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
	 <20090421172039.GA26858@marenka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090421172039.GA26858@marenka.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Cc: linux-m68k@vger.kernel.org

On Tue, Apr 21, 2009 at 19:20, Stephen R Marenka <stephen@marenka.net> =
wrote:
> On Sun, Mar 29, 2009 at 03:07:57PM +0200, Geert Uytterhoeven wrote:
>> On Thu, Mar 26, 2009 at 15:10, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
>> > On Thu, Mar 26, 2009 at 13:38, Stephen R Marenka <stephen@marenka.=
net> wrote:
>> >> So 2.6.29 has hit sid. Anyone want to update the kernel patches? =
Also,
>> >> what patches to apply now that we have git-based goodness?
>> >
>> > You can start with the ones on the for-next branch.
>> > I still have to cherry-pick the others to the (to be created) queu=
e branch.
>> > I'll let you know when I'm finished.
>>
>> Now my git skills have been growing, I created two new branches:
>> =C2=A0 - m68k-v2.6.29
>> =C2=A0 - queue
>
> That pretty much rocks! Here's my process in case someone else wants
> it or wants to fix it. :)
>
> The only downside seems to be the 47 patch difference between m68k
> and the point release or whatever else happened on top of 2.6.29.
> Those pretty much all conflicted.

Yeah, that was my biggest fear. I'll refrain from merging any stable
revisions in the
future.

> I just pushed the patches for debian 2.6.29-4.
>
> http://wiki.debian.org/M68k/Kernel/Patches

A few comments:
  - If you cloned from linux-m68k.git, you don't have to do the `git
remote add',
    as `origin' is already the same remote.
  - You may want to put a `sort' in the `find ../bugfix/m68k/2.6.29
-print | sed -e 's;../;+ ;' | sed -e 's;$; m68k;' >> $series`
    pipeline.

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

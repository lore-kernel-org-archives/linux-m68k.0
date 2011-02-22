From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Tue, 22 Feb 2011 08:14:08 +0100
Message-ID: <AANLkTi=QkXK7=DQ5H1PFttTk+iug_npCsz112RYXd7BR@mail.gmail.com>
References: <4D5DB83D.80205@snapgear.com>
	<alpine.LFD.2.00.1102212216540.2701@localhost6.localdomain6>
	<4D6319E0.9080907@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:61569 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752173Ab1BVHOJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 22 Feb 2011 02:14:09 -0500
In-Reply-To: <4D6319E0.9080907@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Steven King <sfking00@yahoo.com>, uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>, Greg Ungerer <gregungerer@westnet.com.au>

On Tue, Feb 22, 2011 at 03:05, Greg Ungerer <gerg@snapgear.com> wrote:
> On 22/02/11 07:18, Thomas Gleixner wrote:
>> On Fri, 18 Feb 2011, Greg Ungerer wrote:
>>> Inside of the new arch/m68k is a little messy in the kernel and mm
>>> directories. There is plenty of scope for cleanup and merge on the
>>> files in here - but I want to leave that for follow up patches afte=
r
>>> this initial directory merge. As a data point, when we merged the
>>> m68k and m68knommu include files we had something like 70 or 80
>>> duplicate but separate files, after some cleanups that is now down =
to
>>> 10. Ongoing cleanup will merge some of these remaining ones as well=
=2E
>>>
>>> Thoughts?
>>
>> Hmm, how are you going to deal with the fact, that m68knommu uses
>> genirq, m68k not? I guess there are some more points like this
>> (clockevents, clocksource ...)
>
> Initially it has no impact. This first step pretty much just
> combines the 2 directories, it doesn't attempt to do a fine
> grained merge of each file. (It does factor out identical
> files - quite a few in arch/m68k/lib for example).
>
>
>> Is there a plan to move m68k to the generic facilities as well ?

Moving m68k to genirq is (the next thing?) on my list...

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds

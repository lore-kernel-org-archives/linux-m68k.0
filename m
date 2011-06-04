From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Support for MMU-less Atari ST
Date: Sat, 4 Jun 2011 11:14:35 +0200
Message-ID: <BANLkTi=Uob6LavtHkbhgL=c=n=6m46x-+g@mail.gmail.com>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2>
	<4DE88763.4030705@snapgear.com>
	<BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:61796 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753411Ab1FDJOg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 4 Jun 2011 05:14:36 -0400
Received: by bwz15 with SMTP id 15so2296677bwz.19
        for <linux-m68k@vger.kernel.org>; Sat, 04 Jun 2011 02:14:35 -0700 (PDT)
In-Reply-To: <BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@physik.tu-berlin.de>, Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org

On Fri, Jun 3, 2011 at 09:43, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> On Fri, Jun 3, 2011 at 09:04, Greg Ungerer <gerg@snapgear.com> wrote:
>> On 03/06/11 05:25, Matthias Reis wrote:
>>> since the m68k and the m68knommu trees have now been merged, I wond=
er if
>>> it is possible to run linux on mmu-less 68000 machines like the (or=
iginal)
>>> Atari ST. I think the first thing to do would be to modify
>>> arch/m68k/kernel/head.S in order to handle non-mmu CPUs. I would be=
 happy to
>>> do some work on this but the problem is that I'm not very familiar =
with the
>>> kernel so far. It would be nice if someone could tell me which thin=
gs need
>>> to be done to run linux on a mmu-less Atari ST. I'm not expecting d=
etailed
>>> step-by-step instructions, but rather some hints where the MMU- or
>>> 68020-dependent stuff in the Atari drivers lies.
>
> I worked on getting uClinux running on MMUless Amiga (read: UAE) in
> the 2.6.8.1 era.
> I got it more or less into booting userspace:
> http://www.kernel.org/pub/linux/kernel/people/geert/uClinux-amiga-2.6=
=2Ex-merging/
>
> Recently, I tried forward porting this to 2.6.39 in the (idle) hope
> converting the Amiga
> code to genirq would be easier while debugging on UAE than on real ha=
rdware.
> However, it's not as far yet as the work on 2.6.8.1, but since you're
> interested in
> it, I'll push it out later today.

Just for reference, I pushed it out to
git://git.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git
uamiga-untested
http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dsh=
ortlog;h=3Drefs/heads/uamiga-untested

It's not identical to what I tested, and some work is required to
rebase it to 3.0-rc1, due to
changes in the m68knommu handling.

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

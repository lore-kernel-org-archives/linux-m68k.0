From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Support for MMU-less Atari ST
Date: Fri, 3 Jun 2011 09:43:11 +0200
Message-ID: <BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2>
	<4DE88763.4030705@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52471 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753121Ab1FCHnN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Jun 2011 03:43:13 -0400
Received: by bwz15 with SMTP id 15so1562503bwz.19
        for <linux-m68k@vger.kernel.org>; Fri, 03 Jun 2011 00:43:11 -0700 (PDT)
In-Reply-To: <4DE88763.4030705@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@physik.tu-berlin.de>, Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org

On Fri, Jun 3, 2011 at 09:04, Greg Ungerer <gerg@snapgear.com> wrote:
> On 03/06/11 05:25, Matthias Reis wrote:
>> since the m68k and the m68knommu trees have now been merged, I wonde=
r if
>> it is possible to run linux on mmu-less 68000 machines like the (ori=
ginal)
>> Atari ST. I think the first thing to do would be to modify
>> arch/m68k/kernel/head.S in order to handle non-mmu CPUs. I would be =
happy to
>> do some work on this but the problem is that I'm not very familiar w=
ith the
>> kernel so far. It would be nice if someone could tell me which thing=
s need
>> to be done to run linux on a mmu-less Atari ST. I'm not expecting de=
tailed
>> step-by-step instructions, but rather some hints where the MMU- or
>> 68020-dependent stuff in the Atari drivers lies.

I worked on getting uClinux running on MMUless Amiga (read: UAE) in
the 2.6.8.1 era.
I got it more or less into booting userspace:
http://www.kernel.org/pub/linux/kernel/people/geert/uClinux-amiga-2.6.x=
-merging/

Recently, I tried forward porting this to 2.6.39 in the (idle) hope
converting the Amiga
code to genirq would be easier while debugging on UAE than on real hard=
ware.
However, it's not as far yet as the work on 2.6.8.1, but since you're
interested in
it, I'll push it out later today.

W.r.t. drivers, they are the easy part, and should work without any cha=
nges.

> Although m68k and m68knommu now all live in one arch directory a lot
> of the pieces are not really integrated yet. We are working towards
> that now.
>
> I haven't looked in arch/m68k/kernel/head.S yet, but if that can
> be made to work without enabling the MMU then that seems like a
> reasonable start. Currently the non-mmu based targets do not use
> that (there is a couple of different head.S files for various
> targets/cpus under arch/m68k/platfom/, search for files with "head"
> in the name). Ultimately it would be nice to clean all those up.
>
> Above that you may well hit problems trying to get timers and
> interrupts working, might not be too hard to sort that out.
> Basic device drivers might be ok. Lets see how far you can get :-)

=46ollowing up on Greg, indeed a lot is not integrated yet. The main di=
fficulty to
support MMUless operation on the classic Linux/m68k platforms (Amiga, A=
tari,
Mac, ...) is the different frameworks used by mmu-based platforms and n=
ommu
platforms. I.e. the Amiga and Atari platform code depends a lot on the =
mmu-based
core framework, in the parts that are not related to the MMU at all.
So for now I ended up still using most of the *_mm.c files, and
sprinkling lots of
#ifdefs for CONFIG_MMU in them. Yes, this includes arch/m68k/kernel/hea=
d.S.

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

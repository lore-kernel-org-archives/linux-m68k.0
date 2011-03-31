From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 0/6] m68k: merge and clean up files in m68k/lib
Date: Thu, 31 Mar 2011 14:01:18 +1000
Message-ID: <4D93FC8E.4000502@snapgear.com>
References: <1301471907-10204-1-git-send-email-gerg@uclinux.org> <AANLkTi=KoiaabjifdcB+YC1hiE9mb+CJz07Xfn588j7e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:41739 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750706Ab1CaEBh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Mar 2011 00:01:37 -0400
In-Reply-To: <AANLkTi=KoiaabjifdcB+YC1hiE9mb+CJz07Xfn588j7e@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org


Hi Geert,

On 31/03/11 04:41, Geert Uytterhoeven wrote:
> On Wed, Mar 30, 2011 at 09:58, Greg Ungerer<gerg@uclinux.org>  wrote:
>> The following set of patches cleans up and merges individual files i=
n
>> the arch/m68k/lib directory. Mostly strait forward stuff,
>>
>> I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
>> targets.
>
> Thanks! Looks good! Haven't tested it yet, though (see below).
>
>> Not sure why git/diff mangled some of these a little. The changes to
>> patche 5, string.h, are simpler than it looks... These where generat=
ed
>> with "git format-patch -M -B" to make it easier to review the file
>> movements.
>
> Patch 1:
>
> | Applying: m68k: merge mmu and non-mmu versions of muldi3
> | error: arch/m68k/lib/muldi3.c: already exists in index
> | Patch failed at 0001 m68k: merge mmu and non-mmu versions of muldi3
> | When you have resolved this problem run "git am --resolved".
> | If you would prefer to skip this patch, instead run "git am --skip"=
=2E
> | To restore the original branch and stop patching run "git am --abor=
t".
>
> Doing "git rm arch/m68k/lib/muldi3.c&&  git commit -a" first fixes it=
=2E
>
> Patch5:
>
> | Applying: m68k: remove duplicate memcpy() implementation
> | error: arch/m68k/lib/string.c: has been deleted/renamed
> | Patch failed at 0001 m68k: remove duplicate memcpy() implementation
> | When you have resolved this problem run "git am --resolved".
> | If you would prefer to skip this patch, instead run "git am --skip"=
=2E
> | To restore the original branch and stop patching run "git am --abor=
t".
>
> Doing "git rm arch/m68k/lib/string.c&&  git commit -a" did not fix it=
 :-(
>
> Any chance you can send a "normal" patch, or a place to pull from?

Certainly. You can pull just these patches on the m68k-lib branch at:

git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git m68k-l=
ib

I can re-send here if anyone wants to see them as normal patches?


> Anyway, I did a thorough review, so consider it
> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>

Thanks. I have added that, and fixed the other issues.

Thanks!
Greg


> Gr{oetje,eeting}s,
>
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1=C3=A1 =C3=A1=C3=A1 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m

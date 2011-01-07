From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Signal patchset
Date: Fri, 7 Jan 2011 14:17:13 +0100
Message-ID: <AANLkTik-9r_ZPkzVGowW2xT8h+QtVJ57q3mE6iKsuuVa@mail.gmail.com>
References: <AANLkTi=9B-8KN0oiXoiU+KqPt6B8Vs=d7yu9cui-7e1r@mail.gmail.com>
	<20101215101027.GA31097@ZenIV.linux.org.uk>
	<4D0A12EA.6040605@snapgear.com>
	<AANLkTi=iddsbRr+N5iLuGBizbFFQ2JN9sgBFC_Q3uA2K@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f66.google.com ([209.85.161.66]:42730 "EHLO
	mail-fx0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096Ab1AGNRQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 7 Jan 2011 08:17:16 -0500
In-Reply-To: <AANLkTi=iddsbRr+N5iLuGBizbFFQ2JN9sgBFC_Q3uA2K@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

On Thu, Jan 6, 2011 at 21:42, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> On Thu, Dec 16, 2010 at 14:23, Greg Ungerer <gerg@snapgear.com> wrote=
:
>> On 15/12/10 20:10, Al Viro wrote:
>>> On Sun, Dec 05, 2010 at 12:15:10PM +0100, Geert Uytterhoeven wrote:
>>>
>>>> Unless someone objects, I'm inclined to apply Al's patchset, as it
>>>> improves the
>>>> situation anyway.
>>>>
>>>> OK?
>>>
>>> FWIW, there's an m68knommu counterpart (ACKed by gerg a while ago).=
 =C2=A0The
>>> entire bunch is on ftp.linux.org.uk/pub/people/viro/m68k-signals - =
both m68k
>>> and m68knommu sets. =C2=A0I don't know how you guys would prefer it=
 done, since
>
> Thx, good the know the nommu part is there, as I don't seem to have i=
t
> in my mailbox.
>
>>> there's a trivial dependency between m68k and m68knommu parts of se=
ries -
>>> the former has
>>> +#ifndef __uClinux__
>>> +#define __ARCH_WANT_SYS_RT_SIGSUSPEND
>>> +#endif
>>> in unistd.h and the latter does
>>> -#ifndef __uClinux__
>>> =C2=A0#define __ARCH_WANT_SYS_RT_SIGSUSPEND
>>> -#endif
>>> Both parts switch to generic sys_rt_sigsuspend(), for mmu and nommu=
 resp.,
>>> so they need __ARCH_WANT_SYS_RT_SIGSUSPEND defined as soon as conve=
rsion
>>> is done. =C2=A0Other than that they are independent.
>>
>> I can make sure to send to Linus after Geert. Unless Geert you
>> want to take and send both the m68k and m68knommu changes?
>
> I can take the m68knommu changes with your ack, too.
> I'll try to take a look at it tomorrow...

I applied the m68k part to master and for-2.6.38/for-linus.
In addition, I applied the m68knommu part with Greg's acks added to for=
-next.

Greg, please let me know if this is OK, so I can send a pull request to=
 Linus
after it's been cooking one night in linux-next.

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

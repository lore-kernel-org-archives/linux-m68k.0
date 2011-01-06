From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Signal patchset
Date: Thu, 6 Jan 2011 21:42:49 +0100
Message-ID: <AANLkTi=iddsbRr+N5iLuGBizbFFQ2JN9sgBFC_Q3uA2K@mail.gmail.com>
References: <AANLkTi=9B-8KN0oiXoiU+KqPt6B8Vs=d7yu9cui-7e1r@mail.gmail.com>
	<20101215101027.GA31097@ZenIV.linux.org.uk>
	<4D0A12EA.6040605@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f66.google.com ([209.85.161.66]:35532 "EHLO
	mail-fx0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751355Ab1AFUmv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 6 Jan 2011 15:42:51 -0500
In-Reply-To: <4D0A12EA.6040605@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

On Thu, Dec 16, 2010 at 14:23, Greg Ungerer <gerg@snapgear.com> wrote:
> On 15/12/10 20:10, Al Viro wrote:
>> On Sun, Dec 05, 2010 at 12:15:10PM +0100, Geert Uytterhoeven wrote:
>>
>>> Unless someone objects, I'm inclined to apply Al's patchset, as it
>>> improves the
>>> situation anyway.
>>>
>>> OK?
>>
>> FWIW, there's an m68knommu counterpart (ACKed by gerg a while ago). =
=C2=A0The
>> entire bunch is on ftp.linux.org.uk/pub/people/viro/m68k-signals - b=
oth m68k
>> and m68knommu sets. =C2=A0I don't know how you guys would prefer it =
done, since

Thx, good the know the nommu part is there, as I don't seem to have it
in my mailbox.

>> there's a trivial dependency between m68k and m68knommu parts of ser=
ies -
>> the former has
>> +#ifndef __uClinux__
>> +#define __ARCH_WANT_SYS_RT_SIGSUSPEND
>> +#endif
>> in unistd.h and the latter does
>> -#ifndef __uClinux__
>> =C2=A0#define __ARCH_WANT_SYS_RT_SIGSUSPEND
>> -#endif
>> Both parts switch to generic sys_rt_sigsuspend(), for mmu and nommu =
resp.,
>> so they need __ARCH_WANT_SYS_RT_SIGSUSPEND defined as soon as conver=
sion
>> is done. =C2=A0Other than that they are independent.
>
> I can make sure to send to Linus after Geert. Unless Geert you
> want to take and send both the m68k and m68knommu changes?

I can take the m68knommu changes with your ack, too.
I'll try to take a look at it tomorrow...

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

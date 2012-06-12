From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned accesses
Date: Tue, 12 Jun 2012 22:27:42 +0200
Message-ID: <CAMuHMdVViTNCfWKPt9_pmaqEmjcuAT=sfz-vhUCNHiGKAm=p3g@mail.gmail.com>
References: <1339134180-13630-1-git-send-email-gerg@snapgear.com>
	<20120608103931.GA26964@frolo.macqel>
	<4FD1EDDF.1040101@snapgear.com>
	<20120608133503.GA12617@frolo.macqel>
	<4FD6A8A8.1070809@snapgear.com>
	<20120612072619.GA17645@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:62724 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751729Ab2FLU1n convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Jun 2012 16:27:43 -0400
Received: by mail-yw0-f46.google.com with SMTP id m54so3826797yhm.19
        for <linux-m68k@vger.kernel.org>; Tue, 12 Jun 2012 13:27:43 -0700 (PDT)
In-Reply-To: <20120612072619.GA17645@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: Greg Ungerer <gerg@snapgear.com>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Jun 12, 2012 at 9:26 AM, Philippe De Muyter <phdm@macqel.be> wr=
ote:
> On Tue, Jun 12, 2012 at 12:25:44PM +1000, Greg Ungerer wrote:
>> On 08/06/12 23:35, Philippe De Muyter wrote:
> ...
>>>
>>> I mentionned that only to make you able to soften the commit commen=
t :)
>>
>> Ok, makes sense. I should probably have mentioned that this means
>> the ColdFire processors currently support by Linux :-)
>>
>> Something like:
>>
>> =C2=A0 All of the current Linux supported ColdFire CPUs handle unali=
gned
>> =C2=A0 memory accesses. So remove the CONFIG_CPU_HAS_NO_UNALIGNED op=
tion
>> =C2=A0 selection for ColdFire. If we ever support a specific ColdFir=
e CPU
>> =C2=A0 that does not support unaligned accesses then we can insert t=
he
>> =C2=A0 CONFIG_CPU_HAS_NO_UNALIGNED for that specific CPU type.
>
> That's perfect. =C2=A0The line about dumb copying of the m68knommu se=
ttings
> was too much self-flagellation for you to my eyes :)

So I rewrote history on my for-3.6 branch...

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

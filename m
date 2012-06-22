From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/11] Atari: obsolete old EtherNAT driver
Date: Fri, 22 Jun 2012 07:03:48 +0200
Message-ID: <CAMuHMdW8jkqDedyjXArg5CSsYZvR+r=jGierN-0r-V_SuU78hQ@mail.gmail.com>
References: <E1SXMCw-0002XZ-2q@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdXYEBcKrXi-9X2wW9niNt+K2-2i2MKh4RGUCEz0HFL3Ug@mail.gmail.com>
	<CAOmrzk+KgfmG4BfTB_j378UMzjT_+tRrK5nEd-NpFGn6jf8iiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:43215 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753778Ab2FVFDt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 22 Jun 2012 01:03:49 -0400
Received: by obbuo13 with SMTP id uo13so1414474obb.19
        for <linux-m68k@vger.kernel.org>; Thu, 21 Jun 2012 22:03:49 -0700 (PDT)
In-Reply-To: <CAOmrzk+KgfmG4BfTB_j378UMzjT_+tRrK5nEd-NpFGn6jf8iiw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Hi Michael,

On Fri, Jun 22, 2012 at 1:53 AM, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>> @@ -1142,7 +1140,7 @@ static const char * chip_ids[ 16 ] =3D =C2=A0=
{
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (0)
>>>
>>> -#if defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNA=
T_MODULE)
>>> +#if defined(CONFIG_ATARI)
>>> =C2=A0/*
>>> =C2=A0* MSch: EtherNAT is 32 bit, so the misaligned data buffer hac=
k applies.
>>> =C2=A0* This appears to hurt quite a lot ... we actually need to by=
te swap the
>>
>> This part we'll have to do differently, as it depends on the old Eth=
erNAT
>> driver having been present first, which is not true for mainline.
>
> I've split this one (and similar cases like in EtherNEC) into two
> parts - first remove old EtherNAT driver code, then add the new
> version. Is that what you wanted?

Yes, and I only need the part that adds the new version.
I'm just going to revert the whole old EtherNAT/EtherNEC driver in one =
shot,
as it's not in mainline.

Thanks!

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

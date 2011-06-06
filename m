From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/2] m68knommu: create config options for CPU classes
Date: Mon, 6 Jun 2011 11:49:53 +1000
Message-ID: <4DEC3241.6060807@snapgear.com>
References: <1307083397-9994-1-git-send-email-gerg@snapgear.com>	<1307083397-9994-3-git-send-email-gerg@snapgear.com> <BANLkTikuR5tNe=CQS9qCOJHGkKUWKmO-rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:54951 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753130Ab1FFBtK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 5 Jun 2011 21:49:10 -0400
In-Reply-To: <BANLkTikuR5tNe=CQS9qCOJHGkKUWKmO-rw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 03/06/11 21:15, Geert Uytterhoeven wrote:
> On Fri, Jun 3, 2011 at 08:43,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> There are 3 families of CPU core types that we support in the m68kno=
mmu
>> architecture branch. They are
>>
>> . traditional 68000
>> . CPU32 (which is a 68020 core derivitive without MMU)
>
> derivative ... and without bitfield instructions.

My spelling never was too good :-)
I'll fix up the comment and add mention of bitfields.


>> . ColdFire
>
>> It will be useful going forward to have a CONFIG_ option defined for
>> each type. We already have one for ColdFire (CONFIG_COLDFIRE), so ad=
d
>> for the other 2 families, CONFIG_M68000 and CONFIG_MCPU32.
>
> I'm wondering whether it would help to have Kconfig symbols for the
> instruction capabilities as well.
> Then you have to document these capabilities in the kconfig definitio=
n only,
> and can use single (e.g.) #ifdef CONFIG_CPU_HAS_BITFIELDS tests every=
where
> else, instead of duplicating the logic at every #ifdef.

Yes, that sounds like a reasonable idea. I won't add them in this patch
though. I'll add it to the bitops.h merge patch - which is the only
one that would be effected/helped by a bitfield Kconfig option right
now.

Thanks
Greg


>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> ---
>> =C3=A1arch/m68k/Kconfig.nommu | =C3=A1 52 ++++++++++++++++++++++++++=
++++++++++++++------
>> =C3=A11 files changed, 45 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/m68k/Kconfig.nommu b/arch/m68k/Kconfig.nommu
>> index fc98f9b..b004dc1 100644
>> --- a/arch/m68k/Kconfig.nommu
>> +++ b/arch/m68k/Kconfig.nommu
>> @@ -14,6 +14,33 @@ config GENERIC_CLOCKEVENTS
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1bool
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1default n
>>
>> +config M68000
>> + =C3=A1 =C3=A1 =C3=A1 bool
>> + =C3=A1 =C3=A1 =C3=A1 help
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 The Freescale (was Motorola) 68000 CPU=
 is the first generation of
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 the well known M68K family of processo=
rs. The CPU core as well as
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 being available as a stand alone CPU w=
as also used in many
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 System-On-Chip devices (eg 68328, 6830=
2, etc). It does not contain
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 a paging MMU.
>> +
>> +config MCPU32
>> + =C3=A1 =C3=A1 =C3=A1 bool
>> + =C3=A1 =C3=A1 =C3=A1 help
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 The Freescale (was then Motorola) CPU3=
2 is a CPU core that is
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 based on the 68020 processor. For the =
most part it is used in
>
> without bitfield instructions.
>
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 System-On-Chip parts, and does not con=
tain a paging MMU.
>
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

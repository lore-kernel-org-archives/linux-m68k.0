From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned accesses
Date: Wed, 13 Jun 2012 10:27:45 +1000
Message-ID: <4FD7DE81.8080407@snapgear.com>
References: <1339134180-13630-1-git-send-email-gerg@snapgear.com> <20120608103931.GA26964@frolo.macqel> <4FD1EDDF.1040101@snapgear.com> <20120608133503.GA12617@frolo.macqel> <4FD6A8A8.1070809@snapgear.com> <20120612072619.GA17645@frolo.macqel> <CAMuHMdVViTNCfWKPt9_pmaqEmjcuAT=sfz-vhUCNHiGKAm=p3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:30864 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752182Ab2FMA17 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Jun 2012 20:27:59 -0400
In-Reply-To: <CAMuHMdVViTNCfWKPt9_pmaqEmjcuAT=sfz-vhUCNHiGKAm=p3g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Philippe De Muyter <phdm@macqel.be>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On 13/06/12 06:27, Geert Uytterhoeven wrote:
> On Tue, Jun 12, 2012 at 9:26 AM, Philippe De Muyter<phdm@macqel.be>  =
wrote:
>> On Tue, Jun 12, 2012 at 12:25:44PM +1000, Greg Ungerer wrote:
>>> On 08/06/12 23:35, Philippe De Muyter wrote:
>> ...
>>>>
>>>> I mentionned that only to make you able to soften the commit comme=
nt :)
>>>
>>> Ok, makes sense. I should probably have mentioned that this means
>>> the ColdFire processors currently support by Linux :-)
>>>
>>> Something like:
>>>
>>> =C3=A1 All of the current Linux supported ColdFire CPUs handle unal=
igned
>>> =C3=A1 memory accesses. So remove the CONFIG_CPU_HAS_NO_UNALIGNED o=
ption
>>> =C3=A1 selection for ColdFire. If we ever support a specific ColdFi=
re CPU
>>> =C3=A1 that does not support unaligned accesses then we can insert =
the
>>> =C3=A1 CONFIG_CPU_HAS_NO_UNALIGNED for that specific CPU type.
>>
>> That's perfect. =C3=A1The line about dumb copying of the m68knommu s=
ettings
>> was too much self-flagellation for you to my eyes :)
>
> So I rewrote history on my for-3.6 branch...

Thanks Geert!

Regards
Greg


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

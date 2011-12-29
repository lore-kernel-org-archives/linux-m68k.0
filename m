From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 33/35] m68k: do not use m68k startup or interrupt code
 for ColdFire CPU's
Date: Thu, 29 Dec 2011 12:01:30 +1000
Message-ID: <4EFBC9FA.7090107@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>	<1324610148-20666-34-git-send-email-gerg@snapgear.com>	<CAMuHMdX00Q9PFWPXRBRyMCFJgXaCmBtP7RLB-R+mU58iPHLwCA@mail.gmail.com>	<4EF9B8FC.7080206@snapgear.com>	<CAMuHMdW6Yh33i2H+V_A4o846TNyeDrbDbtwv17=Z794PfCn7vg@mail.gmail.com>	<4EFA6149.6000509@snapgear.com> <CAMuHMdXbjFaWPV8S4g8Z8=h+=Lqimxi9-Xaiao+g80amLB9JnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:19922 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754688Ab1L2CB7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Dec 2011 21:01:59 -0500
In-Reply-To: <CAMuHMdXbjFaWPV8S4g8Z8=h+=Lqimxi9-Xaiao+g80amLB9JnQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 28/12/11 20:09, Geert Uytterhoeven wrote:
> Hi Greg,
>
> On Wed, Dec 28, 2011 at 01:22, Greg Ungerer<gerg@snapgear.com>  wrote=
:
>> On 28/12/11 04:30, Geert Uytterhoeven wrote:
>>> On Tue, Dec 27, 2011 at 13:24, Greg Ungerer<gerg@snapgear.com>  =C3=
=A1wrote:
>>>>>> =E2=94=9C=C3=ADextra-$(CONFIG_MMU) =E2=94=9C=C3=AD =E2=94=9C=C3=AD=
 =E2=94=9C=C3=AD =E2=94=9C=C3=AD =E2=94=9C=C3=AD =E2=94=9C=C3=AD:=3D he=
ad.o
>>>>>> =E2=94=9C=C3=ADextra-$(CONFIG_SUN3) =E2=94=9C=C3=AD :=3D sun3-he=
ad.o
>>>>>> +extra-$(CONFIG_COLDFIRE) =E2=94=9C=C3=AD =E2=94=9C=C3=AD =E2=94=
=9C=C3=AD :=3D
>>>>>
>>>>> Why do you need the line above?
>>>>
>>>> That is to avoid using a "#ifndef CONFIG_COLDFIRE" around these.
>>>> This entry clears out extra-y for the case when both CONFIG_MMU
>>>> and CONFIG_COLDFIRE are set.
>>>
>>> Ooh, that's ugly, and easily overlooked (I missed it).
>>> So you don't want head.o for Coldfire. What about
>>>
>>> extra-$(CONFIG_MMU_MOTOROLA) :=3D head.o
>>> extra-$(CONFIG_SUN3) =C3=A1 :=3D sun3-head.o
>>>
>>> ?
>>>
>>> But since head.o is not really about MMU or not, but about the mach=
ine,
>>> perhaps it should be explicitly written as
>>>
>>> extra-$(CONFIG_AMIGA) :=3D head.o
>>> extra-$(CONFIG_ATARI) :=3D head.o
>>> ...
>>> extra-$(CONFIG_SUN3X) :=3D head.o
>>
>>
>> I am happy to do it either way. The second option here will need a
>> longer list. I count 8 machines that use head.o (assuming VME is a
>> single machine type) and 1 that uses sun3-head.o. At least the first
>> option above just has the 2 lines.
>>
>> What is your preference?
>
> The latter, as people are experimenting with MMU-less machines now.

Yep, done. I will send the revised patch here soon.

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

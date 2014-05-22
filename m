From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: m68knommu: CONFIG_I2C_COLDFIRE and CONFIG_RTC_DRV_M5441x
Date: Thu, 22 May 2014 11:04:26 +1000
Message-ID: <537D4D1A.2070108@westnet.com.au>
References: <1400614121.4912.58.camel@x220> <CAMuHMdVbRJOO1fvMDOeVH1j5HiDY=FMA35us0u7oP2jbYS=NAQ@mail.gmail.com> <201405201350.35661.sfking@fdwdc.com> <537CCA66.1050502@open.eurogiciel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <537CCA66.1050502@open.eurogiciel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Cc: Steven King <sfking@fdwdc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Paul Bolle <pebolle@tiscali.nl>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Gilles DOFFE <gdoffe.pro@gmail.com>, Baptiste Durand <baptiste.durand@open.eurogiciel.org>

Hi Yannick,

On 22/05/14 01:46, Yannick GICQUEL wrote:
> The MCF5441x support is quite a hot topic today for our company.
> This Soc family is seducing some of our customers, especially for it'=
s long term support from Freescale.
>=20
> We have worked on this target since past few weeks, using a Tower Kit=
 hardware and JTag, and just about to prepare a full integration of thi=
s device on recent kernel release.
> As a part of the open-source department, we have also planned to deli=
ver this work to the community and propose some patches to refresh this=
 target support.
>=20
> Some informations we observe on this target to be refreshed:
>  - NAND controller needs to be integrated again,
>  - UART controller as well,

What needs to be done to the mcf UART driver?
It seems all other ColdFire parts have used pretty much the same
module.


> Also :
>  - This chip contains a MMU and can be unlink from the !MMU dependenc=
y

The ColdFire v4e MMU has been supported for quite a while in main
line kernels (from linux-3.3 onwards). I believe it will need some
tweaks for the mcf5441x, but the heavy lifting is done.

Also keep in mind that for ColdFire that have an MMU we support them
both with the MMU enabled and disabled.


> This is for the big lines, if the community is ok for a patch receipt=
, some other feature can be also pushed.
> BTW, what about this patches proposal ? Is there some time slot for p=
atch proposal ?

Early and often :-)
Post them here. If you are really unsure about some specific feature
then you can discuss it here first. But if you have code already why
not just send patches.

Regards
Greg


> Regards,
>=20
> Le 20/05/2014 22:50, Steven King a =C3=A9crit :
>> On Tuesday 20 May 2014 1:19:26 pm Geert Uytterhoeven wrote:
>>> Hi Paul,
>>>
>>> On Tue, May 20, 2014 at 9:28 PM, Paul Bolle <pebolle@tiscali.nl> wr=
ote:
>>>> In v3.6 both a check for CONFIG_I2C_COLDFIRE and two checks for
>>>> CONFIG_RTC_DRV_M5441x were added to the code for the coldfire plat=
form
>>>> (in m525x.c and in m5441x.c respectively). Neither of these macros=
 can
>>>> be matched to a Kconfig symbol.
>>>>
>>>> Is a series that adds these Kconfig symbols pending?
>>> For the former, Steven King (cc) submitted patches in 2010 and 2012=
=2E
>>> For the latter, he submitted patches in 2012.
>>>
>>> Seems like they were never integrated...
>> Indeed.
>>
>> At this point, they're pretty much superfluous so if someone were to=
 submit a patch removing them, they would not get any objections from m=
e.
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe linux-m68k=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

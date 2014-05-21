From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: Re: m68knommu: CONFIG_I2C_COLDFIRE and CONFIG_RTC_DRV_M5441x
Date: Wed, 21 May 2014 17:46:46 +0200
Message-ID: <537CCA66.1050502@open.eurogiciel.org>
References: <1400614121.4912.58.camel@x220> <CAMuHMdVbRJOO1fvMDOeVH1j5HiDY=FMA35us0u7oP2jbYS=NAQ@mail.gmail.com> <201405201350.35661.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201405201350.35661.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Gilles DOFFE <gdoffe.pro@gmail.com>, Baptiste Durand <baptiste.durand@open.eurogiciel.org>, Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>

Hi all,

The MCF5441x support is quite a hot topic today for our company.
This Soc family is seducing some of our customers, especially for it's=20
long term support from Freescale.

We have worked on this target since past few weeks, using a Tower Kit=20
hardware and JTag, and just about to prepare a full integration of this=
=20
device on recent kernel release.
As a part of the open-source department, we have also planned to delive=
r=20
this work to the community and propose some patches to refresh this=20
target support.

Some informations we observe on this target to be refreshed:
  - NAND controller needs to be integrated again,
  - UART controller as well,

Also :
  - This chip contains a MMU and can be unlink from the !MMU dependency

This is for the big lines, if the community is ok for a patch receipt,=20
some other feature can be also pushed.
BTW, what about this patches proposal ? Is there some time slot for=20
patch proposal ?

Regards,

Le 20/05/2014 22:50, Steven King a =C3=A9crit :
> On Tuesday 20 May 2014 1:19:26 pm Geert Uytterhoeven wrote:
>> Hi Paul,
>>
>> On Tue, May 20, 2014 at 9:28 PM, Paul Bolle <pebolle@tiscali.nl> wro=
te:
>>> In v3.6 both a check for CONFIG_I2C_COLDFIRE and two checks for
>>> CONFIG_RTC_DRV_M5441x were added to the code for the coldfire platf=
orm
>>> (in m525x.c and in m5441x.c respectively). Neither of these macros =
can
>>> be matched to a Kconfig symbol.
>>>
>>> Is a series that adds these Kconfig symbols pending?
>> For the former, Steven King (cc) submitted patches in 2010 and 2012.
>> For the latter, he submitted patches in 2012.
>>
>> Seems like they were never integrated...
> Indeed.
>
> At this point, they're pretty much superfluous so if someone were to =
submit a patch removing them, they would not get any objections from me=
=2E
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

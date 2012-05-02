From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/11] m68knommu: remove ColdFire sub-architecture directories
Date: Thu, 3 May 2012 00:07:50 +1000
Message-ID: <4FA13FB6.6020806@snapgear.com>
References: <1335920946-11297-1-git-send-email-gerg@snapgear.com> <CAGj5WxB2f-4UHK-x=SESX4QqnbfsL0i=LhXoOOZeK2cFhDiQhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:19762 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753256Ab2EBOIm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 May 2012 10:08:42 -0400
In-Reply-To: <CAGj5WxB2f-4UHK-x=SESX4QqnbfsL0i=LhXoOOZeK2cFhDiQhg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Luis,

On 05/02/2012 07:50 PM, Luis Alves wrote:
> I've done a similar thing for the 68000 cpu's. Ended up with a single
> platform/68000 directory and removed the 68328, 68EZ328 and 68VZ328
> directories.

That sounds great.


> When I have the time I'll prepare the patches and send them (probably
> latter today).

Looking forward to them :-)


> I'm not sure if anyone is still building 3.x kernels for the 68[xx]32=
8
> SoC's but would be nice if someone could test building the kernel for
> the boards using those chips (hopefully I didn't break up anything).
> For the 68000 (and my board) it's working good.

I build them occasionally, but I don't have any way to test any
of those targets.

Regards
Greg


> On Wed, May 2, 2012 at 2:08 AM,<gerg@snapgear.com>  wrote:
>>
>> Currently the different ColdFire sub-archiectures are split up with =
a
>> directory for each family type. Most though only contain a small amo=
unt
>> of code, it just doesn't seem to make any sense to keep them separat=
e.
>>
>> Move all the ColdFire sub-architecture code into the platform/coldfi=
re
>> directory, and remove the sub-architecture directories. We already b=
uild
>> the common ColdFire components based on sub-architecture type anyway=
,
>> so there is very little Makefile change required.
>>
>> Overall we remove about 200 lines of duplicated Makefile code, and e=
nd
>> up with all the ColdFire specific code in a single directory.
>>
>> ---
>>
>> =C3=A1arch/m68k/Makefile =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 | =C3=A1 10 ----------
>> =C3=A1arch/m68k/platform/5206/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 18 ------------------
>> =C3=A1arch/m68k/platform/520x/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 17 -----------------
>> =C3=A1arch/m68k/platform/523x/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 17 -----------------
>> =C3=A1arch/m68k/platform/5249/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 18 ------------------
>> =C3=A1arch/m68k/platform/5272/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 18 ------------------
>> =C3=A1arch/m68k/platform/527x/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 18 ------------------
>> =C3=A1arch/m68k/platform/528x/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 18 ------------------
>> =C3=A1arch/m68k/platform/5307/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 20 --------------------
>> =C3=A1arch/m68k/platform/532x/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 18 ------------------
>> =C3=A1arch/m68k/platform/5407/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 18 ------------------
>> =C3=A1arch/m68k/platform/54xx/Makefile =C3=A1 =C3=A1 =C3=A1 | =C3=A1=
 19 -------------------
>> =C3=A1arch/m68k/platform/coldfire/Makefile =C3=A1 | =C3=A1 24 ++++++=
++++++++----------
>> =C3=A1b/arch/m68k/Makefile =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 | =C3=A1 =C3=A12 --
>> =C3=A1b/arch/m68k/platform/coldfire/Makefile | =C3=A1 =C3=A14 ++--
>> =C3=A1b/arch/m68k/platform/coldfire/m5206.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/m520x.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/m523x.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/m5249.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/m5272.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/m527x.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/m528x.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/m532x.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/m5407.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/m54xx.c =C3=A1| =C3=A1 =C3=A11 -
>> =C3=A1b/arch/m68k/platform/coldfire/nettel.c | =C3=A1 =C3=A11 -
>> =C3=A126 files changed, 16 insertions(+), 234 deletions(-)
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-m68k=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C3=A1http://vger.kernel.org/majordomo-info.h=
tml
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
8 Gardner Close,                            FAX:         +61 7 3891 363=
0
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m

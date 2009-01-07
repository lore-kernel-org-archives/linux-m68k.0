From: Laurent Vivier <laurent@lvivier.info>
Subject: Re: Macintosh booloader - EMILE
Date: Wed, 7 Jan 2009 18:14:28 +0100
Message-ID: <E254E686-E5C3-4432-BB1A-3EC5472A300C@lvivier.info>
References: <D044A55A-7048-4F40-82E2-B69770D8FED8@lvivier.info> <alpine.LNX.2.00.0901071606030.6444@halbrend.uninett.no>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.188]:57545 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750865AbZAGROc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 7 Jan 2009 12:14:32 -0500
In-Reply-To: <alpine.LNX.2.00.0901071606030.6444@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


Le 7 janv. 09 =E0 16:17, Kolbj=F8rn Barmen a =E9crit :

> On Wed, 6 Aug 2008, Laurent Vivier wrote:
>
>> Hi guys,
>>
>> a new version of EMILE is available.
>>
>> It adds multiboot and ext2 support.
>>
>> So, macintosh m68k developers, you can:
>>
>> modify your kernel, compile it, install it and reboot ... as it is =20
>> done on
>> i386.
>
> I'm pussled. I decided to try emile on my q610, so I downloaded the =20
> rescue
> floppy and it works nicely, great! But the kernel was slightly old =20
> (to put
> it mildly) and I really just want to make a scsi disk I can boot =20
> directly
> from, so I decided to build emile myself... what pussles me is this:
>
> aranym emile # make
> Makefile:9: tools.mk: No such file or directory
> sh scripts/tools.sh > tools.mk
> Cannot find powerpc cross-compiler
> make -C docs all
> Missing tools to generate emile.conf.5 from emile.conf.sgml
> make[1]: *** [emile.conf.5] Error 1
> make: *** [docs] Error 2
> aranym emile #
>
>
> scripts/tools.sh says:
>
>  if test "${ARCH}" !=3D "ppc"
>  then
>          PPC_CROSS_COMPILE=3Dpowerpc-linux-
>          if ! type "${PPC_CROSS_COMPILE}${CC}" > /dev/null 2>&1
>  ...
>
> Huh? It requires toolchain for PowerPC? What's going on?

Not required, but one day I tried to boot Linux on powermac to replace =
=20
bootx.

>
>
> I just want to build it on m68k :)


You just need to install docbook-to-man

Regards,
Laurent
----------------------- Laurent Vivier ----------------------
"The best way to predict the future is to invent it."
- Alan Kay

--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

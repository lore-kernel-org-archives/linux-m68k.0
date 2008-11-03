From: Laurent Vivier <Laurent@lvivier.info>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Mon, 3 Nov 2008 19:58:24 +0100
Message-ID: <81C7C741-F3E1-4908-81D8-584768A7A476@lvivier.info>
References: <12255325912043-git-send-email-Laurent@lvivier.info> <Pine.LNX.4.64.0811020947320.5281@anakin> <AC634DD2-CE12-4975-BB8E-B564C7DFDC06@lvivier.info> <20081102212852.GA8162@cynthia.pants.nu> <Pine.LNX.4.64.0811031102090.10345@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:51161 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753426AbYKCS6m convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Nov 2008 13:58:42 -0500
In-Reply-To: <Pine.LNX.4.64.0811031102090.10345@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org


Le 3 nov. 08 =E0 01:14, Finn Thain a =E9crit :

>
>
> On Sun, 2 Nov 2008, Brad Boyer wrote:
>
>> On Sun, Nov 02, 2008 at 12:21:23PM +0100, Laurent Vivier wrote:
>>> Le 2 nov. 08 =E0 09:54, Geert Uytterhoeven a =E9crit :
>>>> The preferred way to do this these days is to create a platform
>>>> device with a struct resource that points to the SWIMBase.
>>>
>>> Is this what Finn explains also in his answer ? If so, I agree.
>>
>> Not exactly. What Finn suggested is to match the way we handle many =
=20
>> of
>> the other on-board things like ADB and SCSI. What Geert suggests is =
a
>> much more recent way to do things that we generally haven't done for
>> Mac-only drivers. I think Finn used it for the new Sonic ethernet =20
>> driver
>> because we share it with other systems. The code in macsonic.c also =
=20
>> has
>> the extra complexity from having both NuBus and on-board hardware to
>> support, and NuBus also hasn't been updated to the new driver model.
>>
>> Finn's suggestion of using the macintosh_config entry and data =20
>> table is
>> the easiest way to get it working, but Geert's method would move to =
=20
>> the
>> real device/driver model that most other systems are using now.
>
> I agree with Geert. Ignore my comment about device_initcall -- I was
> looking at via-cuda.c but that is not a good example.
> drivers/scsi/mac_esp.c is a better example.
>
> esp_mac_probe checks the macintosh_config entry. That and =20
> esp_mac_remove
> are the platform device entry points Geert referred to. The module =20
> entry
> points are mac_esp_init and mac_esp_exit. I think you could use =20
> either of
> the platform device probe routine or the module init routine to set =20
> the
> base address.

Ok, thank you for this detailled explanation. Now, I understand better =
=20
what I have to do.

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

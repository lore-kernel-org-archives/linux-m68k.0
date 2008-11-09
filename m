From: Laurent Vivier <laurent@lvivier.info>
Subject: Re: [PATCH 2/2][v3] Add SWIM floppy support for m68k Macs.
Date: Sun, 9 Nov 2008 22:06:08 +0100
Message-ID: <53A1BB3E-6764-4127-92A0-AA0ADFE0E632@lvivier.info>
References: <12260012691527-git-send-email-laurent@lvivier.info> <Pine.LNX.4.64.0811091716590.19341@anakin> <914807AF-2B1B-4E28-BB75-8E1FAA5463C5@lvivier.info> <Pine.LNX.4.64.0811092041300.19341@anakin>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:49832 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756125AbYKIVGV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2008 16:06:21 -0500
In-Reply-To: <Pine.LNX.4.64.0811092041300.19341@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


Le 9 nov. 08 =E0 20:42, Geert Uytterhoeven a =E9crit :

> On Sun, 9 Nov 2008, Laurent Vivier wrote:
>> Le 9 nov. 08 =E0 17:19, Geert Uytterhoeven a =E9crit :
>>> On Thu, 6 Nov 2008, Laurent Vivier wrote:
>>>> --- /dev/null
>>>> +++ b/drivers/block/swim.c
>>>
>>>> +static struct platform_device *swim_device;
>>>
>>> One global instance?
>>
>> Yes, why not ? Could you explain ?
>
> It prevents the driver from working if you have multiple SWIM devices=
=2E

If we have multiple SWIM devices the driver is only able to know the =20
base address of the onboard controller.
So, it manages only one.

>
> Didn't I read something about SWIM chips on expansion cards?

I think you speak about the expansion card for the MacII allowing to =20
replace the WIM controller by a SWIM one, but what I understood is the =
=20
SWIM replaces the WIM at the same base address. Moreover the SWIM has =20
a WIM compatibility mode: it's why I've added the set_swim_mode() and =20
get_swim_mode() to detect in which case we are. But there is only one =20
controller at a time.

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

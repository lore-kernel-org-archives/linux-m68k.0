From: Laurent Vivier <Laurent@lvivier.info>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Sun, 2 Nov 2008 13:02:32 +0100
Message-ID: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info>
References: <12255325912043-git-send-email-Laurent@lvivier.info> <20081101181013.GA25819@cynthia.pants.nu>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.177]:60518 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753288AbYKBMCw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 2 Nov 2008 07:02:52 -0500
In-Reply-To: <20081101181013.GA25819@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org


Le 1 nov. 08 =E0 19:10, Brad Boyer a =E9crit :

> On Sat, Nov 01, 2008 at 10:43:11AM +0100, Laurent@lvivier.info wrote:
>> It allows to read data from a floppy, but not to write to, and to =20
>> eject the
>> floppy (useful on our Mac without eject button).
>>
>> I have tested it on a Quadra 800, but it is supposed to work on:
>>
>> II, IIci, IIsi, IIvx, IIx, IIcx, SE/30,
>> PowerBook 100, PowerBook 140, PowerBook 145, PowerBook 160,
>> PowerBook 165, PowerBook 165c, PowerBook 170, PowerBook 180,
>> PowerBook 180c, PowerBook 190, PowerBook 190cs, PowerBook 500,
>> Performa 460, Performa 550, LC II, LC III, LC 520, Color Classic,
>> Color Classic II, ClassicII,
>> Quadra 700, Quadra 800, Quadra 650, Quadra 605, Quadra 610,
>> Centris 610, Quadra 630, Performa 580, LC 475, LC 575,
>
> I just have one comment and one question. The model check looks like
> it will end up printing out a warning message on the AV models. You
> should add them explicitly to the unsupported list the way you did
> for the IIfx and Q900/Q950. Also, I'm not sure this driver would

OK

>
> work on a Mac II. They didn't originally ship with a SWIM chip at
> all, but that was available as an upgrade. From the factory they
> came with the old IWM chip. It's not clear to me if the driver uses
> any of the SWIM features other than the capability to detect and
> read high density media which the old drives obviously don't do.


I don't have MacII to test. But this driver needs a SWIM chip to work.

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

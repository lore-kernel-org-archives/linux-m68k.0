From: Laurent Vivier <laurent@lvivier.info>
Subject: Re: [PATCH] reinstate mac rtc
Date: Thu, 23 Oct 2008 00:14:00 +0200
Message-ID: <5AC01130-D57C-4A0E-81EB-D10549A1146C@lvivier.info>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org> <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no> <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au> <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no> <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de> <A064497F-167C-4BC4-9565-6530A6914285@lvivier.info> <alpine.DEB.1.00.0810220916590.18164@zirkon.biophys.uni-duesseldorf.de> <alpine.LNX.2.00.0810221309050.3377@halbrend.uninett.no>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:62150 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752139AbYJVWOP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Oct 2008 18:14:15 -0400
In-Reply-To: <alpine.LNX.2.00.0810221309050.3377@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


Le 22 oct. 08 =E0 13:09, Kolbj=F8rn Barmen a =E9crit :

> On Wed, 22 Oct 2008, Michael Schmitz wrote:
>
>> Hi,
>>
>>>> Valid point. I gues penguin still does pass the date, so the =20
>>>> problem boils
>>>> down to 'why isn't it used by the kernel?'
>>>
>>> EMILE passes the date too.
>>
>> Good, so solving the problem should fix it for both. When did the =20
>> problem get
>> introduced - 2.4 or 2.6?
>
> Silly question I guess, but how is the passing done?

On m68k architecture, bootloader passes a list of tags to the kernel, =20
see set_kernel_bootinfo():

http://gitorious.org/projects/emile/repos/mainline/blobs/master/second%=
2Fbootinfo.c

These tags are put at the end of the kernel image (see main.c).

It allows to pass things like command line, memory mapping or hardware =
=20
information.

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

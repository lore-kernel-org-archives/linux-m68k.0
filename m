From: Laurent Vivier <laurent@lvivier.info>
Subject: Re: [PATCH] reinstate mac rtc
Date: Mon, 20 Oct 2008 21:13:43 +0200
Message-ID: <A064497F-167C-4BC4-9565-6530A6914285@lvivier.info>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org> <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no> <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au> <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no> <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.188]:55506 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752102AbYJTTOG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 20 Oct 2008 15:14:06 -0400
In-Reply-To: <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: =?ISO-8859-1?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


Le 20 oct. 08 =E0 04:05, Michael Schmitz a =E9crit :

> Hi,
>
>>>>
>>>>> I don't know "how", but with 2.2 kernels I always had a correct =20
>>>>> date
>>>>> at boot without any tricks. It is true though that with high CPU =
=20
>>>>> load
>>>>> we had clockskew and that we didn't save back the date and =20
>>>>> hourtime to
>>>>> the clock, thus any clock setting needed to be done from the mac =
=20
>>>>> side.
>>>>> A compromoise, but better than the current situation.
>
> IIRC the booter passed the current date to the kernel, and this date =
=20
> was used to initialize the system clock.
>
>>> It isn't a problem if you disable the time-stamp triggered fsck =20
>>> and set
>>> the clock from the network (rdate or ntp).
>>
>> This is the answer I keep getting, but it isnt really helping.
>>
>> * SSL/TLS and certificate validation. For example my gumtix uses =20
>> 802.1X to
>> get online, when it is running in "1970-01-01", the server and clien=
t
>> certificates are ofcourse not valid and the authentication _will_ =20
>> fail,
>> and it wont go online, and therefor no ntp. As .1x is becoming more =
=20
>> common
>
> Valid point. I gues penguin still does pass the date, so the problem =
=20
> boils down to 'why isn't it used by the kernel?'

EMILE passes the date too.

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

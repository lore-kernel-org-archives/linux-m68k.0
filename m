From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH] serial: Remove 68328 driver
Date: Mon, 11 Jan 2016 09:57:12 -0800
Message-ID: <5693ECF8.9020408@hurleysoftware.com>
References: <1449830170-15096-1-git-send-email-frederik.voelkel@fau.de>
 <1450438103-1059-1-git-send-email-frederik.voelkel@fau.de>
 <CAMuHMdW6r_QszpXTj1FLtOfjzPqDCU7UcF6OT+7MgW8uo01KYA@mail.gmail.com>
 <5689FD36.4020609@westnet.com.au>
 <20160104103031.655b6f61@lxorguk.ukuu.org.uk> <568A530F.8020807@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:33178 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757307AbcAKR5P (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Jan 2016 12:57:15 -0500
Received: by mail-pa0-f43.google.com with SMTP id cy9so324757353pac.0
        for <linux-m68k@vger.kernel.org>; Mon, 11 Jan 2016 09:57:15 -0800 (PST)
In-Reply-To: <568A530F.8020807@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, =?UTF-8?Q?Frederik_V=c3=b6lkel?= <frederik.voelkel@fau.de>, Jiri Slaby <jslaby@suse.com>, Greg KH <gregkh@linuxfoundation.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kernel@i4.cs.fau.de, Lukas Braun <lukas.braun@fau.de>, uClinux development list <uclinux-dev@uclinux.org>

On 01/04/2016 03:10 AM, Greg Ungerer wrote:
> On 04/01/16 20:30, One Thousand Gnomes wrote:
>> On Mon, 4 Jan 2016 15:03:50 +1000
>> Greg Ungerer <gregungerer@westnet.com.au> wrote:
>>
>>> If 68328serial.c is removed is there any point keeping the
>>> architecture support for 68328 platforms?
>>>
>>> The 68328serial.c provides pretty much the only type of console
>>> that can be used on these devices. They are largely useless
>>> without this
>>
>> Probably we should - unless someone wants to stand up and say "actually
>> I'm using this with current kernels, need it, and I'll maintain it"
>>
>> Somehow I doubt anyone is.
> 
> Yep, I suspect you are right.
> I can't even remember the last time a patch or improvement
> for 68328 came past me. Same goes for 68360 cpu/platform
> as well.

And none of it builds (and there's no build coverage in arch/m68k/configs)

Regards,
Peter Hurley

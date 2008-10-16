From: Laurent Vivier <laurent@lvivier.info>
Subject: Re: I'm back on linux-m68k
Date: Thu, 16 Oct 2008 08:05:20 +0200
Message-ID: <7715A9F4-EA8C-4C9A-894E-1E026D644FC3@lvivier.info>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info> <Pine.LNX.4.64.0810161121430.6252@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:59044 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751789AbYJPGF0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 16 Oct 2008 02:05:26 -0400
In-Reply-To: <Pine.LNX.4.64.0810161121430.6252@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Joshua Juran <jjuran@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>


Le 16 oct. 08 =E0 02:44, Finn Thain a =E9crit :

>
>
> On Thu, 16 Oct 2008, Laurent Vivier wrote:
>
>>
>> Le 15 oct. 08 =E0 16:20, Finn Thain a =E9crit :
>>
>>> [...]
>>>
>>> Laurent can fill in the details (and probably correct me here), =20
>>> but I
>>> would imagine that, like XPostFacto**, we'd need to copy the boot
>>> loader to the helper volume, copy the kernel binary, set kernel
>>> arguments, configure boot blocks on the helper device and set the =20
>>> boot
>>> device in PRAM. The tools to do all this from the linux side are =20
>>> part
>>> of Emile. But if/when something goes awry, it may be most easily =20
>>> fixed
>>> from MacOS.
>>
>> It's a good idea but the primary goal of EMILE is to totally remove
>> MacOS from the disk...
>
> That argument would be much more compelling if Linux supported more =20
> Mac
> hardware (by which I mean, co-processor network cards, more powerful
> display cards, duo docks, audio, scsi ethernet adapters, scsi HBA
> cards...) and MacOS software.

Who use MacOS 7-8-9 ?
  I you really need it, Basilisk II works faster...

>
> But even if we supported everything, MacOS will always be a better
> operating system for certain tasks, since it makes different =20
> compromises.
>
> I think dual-booting would make Emile more useful to more people. =20
> But it's
> quite possible that no-one else would want this.

I agree. I tried to make dual-booing but I failled.

Laurent

----------------------- Laurent Vivier ----------------------
"The best way to predict the future is to invent it."
- Alan Kay





--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

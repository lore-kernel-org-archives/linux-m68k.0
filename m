From: Laurent Vivier <laurent@lvivier.info>
Subject: Re: I'm back on linux-m68k
Date: Thu, 16 Oct 2008 01:05:05 +0200
Message-ID: <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.177]:61690 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753156AbYJOXFP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 Oct 2008 19:05:15 -0400
In-Reply-To: <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Joshua Juran <jjuran@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>


Le 15 oct. 08 =E0 16:20, Finn Thain a =E9crit :

>
> Hi Josh,
>
> On Wed, 15 Oct 2008, Joshua Juran wrote:
>
>> Hello,
>>
>> I thought I'd mention that I'm back lurking on linux-m68k.  Some of =
=20
>> you
>> may remember me as one of the Penguin contributors.
>>
>> My interests with regard to hacking tend to remain on the Mac OS sid=
e
>> (and to support this I've picked up some 68K asm knowledge), but =20
>> perhaps
>> this can be useful -- at least, I would have liked to have a Mac =20
>> program
>> that downloaded the necessary files, copied the floppy images, and
>> verified the drive setup.
>>
>> Please let me know if you would find anything running on the Mac OS =
=20
>> side
>> helpful.
>
> [...]
>
> Laurent can fill in the details (and probably correct me here), but I
> would imagine that, like XPostFacto**, we'd need to copy the boot =20
> loader
> to the helper volume, copy the kernel binary, set kernel arguments,
> configure boot blocks on the helper device and set the boot device in
> PRAM. The tools to do all this from the linux side are part of =20
> Emile. But
> if/when something goes awry, it may be most easily fixed from MacOS.

It's a good idea but the primary goal of EMILE is to totally remove =20
MacOS from the disk...

Now, as we are able to boot linux directly from a CD the tools can =20
stay on linux side.

EMILE in fact is a MacOS application :-P , perhaps you can make some =20
developments for EMILE.

Like PC bootloaders which use BIOS to access devices (disk, screen, =20
keyboard, ...) EMILE uses MacOS ROM to access devices.

Inside EMILE, I've written libmacos which is a "wrapper" between the =20
linux side of EMILE and the MacOS side of EMILE (yeah, EMILE is almost =
=20
like Darth Vader... )

So perhaps Joshua can help me to write some parts, in my TODO there are=
:

- save/change/restore the gamma of the screen (I don't like the green =20
display of my Q610)
- save/change/restore the video mode
- save/change/restore the boot device

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

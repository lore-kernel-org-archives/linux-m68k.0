From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: I'm back on linux-m68k
Date: Thu, 16 Oct 2008 01:20:24 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:52216 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755456AbYJOOU2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 Oct 2008 10:20:28 -0400
In-Reply-To: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joshua Juran <jjuran@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


Hi Josh,

On Wed, 15 Oct 2008, Joshua Juran wrote:

> Hello,
> 
> I thought I'd mention that I'm back lurking on linux-m68k.  Some of you 
> may remember me as one of the Penguin contributors.
> 
> My interests with regard to hacking tend to remain on the Mac OS side 
> (and to support this I've picked up some 68K asm knowledge), but perhaps 
> this can be useful -- at least, I would have liked to have a Mac program 
> that downloaded the necessary files, copied the floppy images, and 
> verified the drive setup.
>
> Please let me know if you would find anything running on the Mac OS side 
> helpful.

Thanks for the kind offer! There are several minor bugs in Penguin that 
I'd love to see fixed but I never got as far as setting up Code Worrier... 
The source code is on sourceforge if you want to try compiling it,

http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/

Aside from that, we could use an Emile* installer on the MacOS side. I'm 
thinking something similar to Ryan Rempel's excellent XPostFacto program 
for booting Mac OS X on Old World h/w.

Laurent can fill in the details (and probably correct me here), but I 
would imagine that, like XPostFacto**, we'd need to copy the boot loader 
to the helper volume, copy the kernel binary, set kernel arguments, 
configure boot blocks on the helper device and set the boot device in 
PRAM. The tools to do all this from the linux side are part of Emile. But 
if/when something goes awry, it may be most easily fixed from MacOS.

Regarding your suggestion WRT downloading, floppy images and drive setup: 
I think that the tools already exist. They aren't for novices, but then 
only enthusiasts really use the port anyway.

I think downloading is pretty much covered by Fetch, iCab etc.

The BSD projects have a port of Apple's pdisk program, which is fine for 
setting up/verifying disk partitions. It's basically an early version of 
the Mac OS X cmd line utility of the same name. Penguin can also dump scsi 
partition maps.

The SUntar program provides raw access to floppy devices (and almost any 
other device for that matter), and can read and write floppy images. I 
think perhaps apple's Disk Copy can too.

Regards,
Finn

* http://emile.sourceforge.net/index.php
** http://eshop.macsales.com/OSXCenter/XPostFacto/

> 
> Josh
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

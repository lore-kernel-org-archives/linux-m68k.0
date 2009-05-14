From: Riccardo <riccardo@kaffe.org>
Subject: Re: current 2.6 on Q950
Date: Thu, 14 May 2009 09:08:47 +0200
Message-ID: <118BBEEA-4056-11DE-A812-00050249ADE1@kaffe.org>
References: <20090512071518.GA971@cynthia.pants.nu>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out10.libero.it ([212.52.84.110]:53094 "EHLO
	cp-out10.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752458AbZENHIz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 May 2009 03:08:55 -0400
In-Reply-To: <20090512071518.GA971@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: linux-m68k@vger.kernel.org

Hi,

>> Some good news: it boots!
>
> That's good to hear. This is a model that doesn't get a lot of testing.

It works also quite decently; albeit slow, I was able to compile the 
whole GNUstep core stuff and two applications, that means several hours 
of compilation.

> We don't know how to access the hardware clock on the Q900 or Q950. The
> other models all had support at one point, but these two have never
> worked. In fact, they used to crash because they were trying to use an
> access method that didn't work for those systems.
>
That's unfortunate. I think to remember a disucssion some time ago 
about this, did past version of the 2.2 kernel perhaps get the time 
from the mac bootloader? That would help already.

> it working. The floppy is the same as the IIfx, which I have. I don't
> have either Q9x0 model. They aren't very common. Technically speaking
> it would be possible to use the normal swim driver, but it requires
> disabling the ADB ports. It would be tough to use the system without
> any input devices.
Since my other mac I use linux on is the IIfx, I don't even bother 
asking :)


>
> The SCSI is the other thing that is special on these models, so it's
> good to hear that it still works. Does the external SCSI port work?
> That's something that used to be broken. I think Finn was working
> on some of that code to try to get both ports working.

I have a magneto-optical drive attached externally, I turned it on and 
at reboot I don't see it in dmesg. But it might be that in the external 
scsi bus is disabled from the penguin, I rmember that I needed to put 
in  an option a long time ago.

Riccardo


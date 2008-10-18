From: Riccardo <riccardo@kaffe.org>
Subject: Re: [PATCH] reinstate mac rtc
Date: Sat, 18 Oct 2008 18:17:24 +0200
Message-ID: <3FD95B32-9D30-11DD-9A2B-00050249ADE1@kaffe.org>
References: <Pine.LNX.4.64.0810161144240.6252@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out9.libero.it ([212.52.84.109]:54048 "EHLO
	cp-out9.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbYJRQRl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 18 Oct 2008 12:17:41 -0400
In-Reply-To: <Pine.LNX.4.64.0810161144240.6252@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Hi,


On Thursday, October 16, 2008, at 03:02  AM, Finn Thain wrote:
> I don't know what is wrong with the clock on the Q950. Mine uses ntp. 
> Are
> you sure it works with 2.2?
>


> I haven't tested on a IIfx, but SCSI is almost certainly broken on the
> IIfx anyway.
>
>>
>> Generally, do you have a kernel to use on the above machines? I sitll
>> have 2.2 but I can't upgrade libc due to that and this is breaking my
>> upgrades and made my box a mess...
>
> Try Stephen Marenka's build:
> http://people.debian.org/~smarenka/d-i/m68k/images/daily/kernels/

testing 18 Oct files.

IIfx:

drivers/rtc/hctosys.c unable to open rtc device (rtc0)

(with 2.2 I get a correct system clock once booted, without ntp, here I 
get a forced fsck)
Afterwards, it remaints at INIT for an incredible amout of time, I 
thought it hanged! Then it continued and after messages about being 
unable to set the system clock, booting commenced.

then I get continous messages about modprobe not being able to find 
modules.dep . It says they are fatal but it continues.

Due to the clock skew a sendmail build restarted (!? absurd when our 
computers try to be too smart...)

Console input is totally screwed (keys don't correspond)

Quadra950:

the kernel starts and goes up to where fsck gets run since the 
clockskew is detected, I'm asked for the root password, but keyboard is 
screwed up like on the IIfx and I can't type in the password or even 
ctrl-d.

Still, could have been worse!

--Riccardo


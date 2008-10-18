From: Riccardo <riccardo@kaffe.org>
Subject: Re: [PATCH] reinstate mac rtc
Date: Sat, 18 Oct 2008 13:12:25 +0200
Message-ID: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
References: <20081016064919.GB28644@cynthia.pants.nu>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out12.libero.it ([212.52.84.112]:59034 "EHLO
	cp-out12.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbYJRLMp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 18 Oct 2008 07:12:45 -0400
In-Reply-To: <20081016064919.GB28644@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Hi,

On Thursday, October 16, 2008, at 08:49  AM, Brad Boyer wrote:

> On Thu, Oct 16, 2008 at 12:02:59PM +1100, Finn Thain wrote:
>> I don't know what is wrong with the clock on the Q950. Mine uses ntp. 
>> Are
>> you sure it works with 2.2?
>
> I'm very sure that we never had a working RTC on the Q900/Q950. In 
> fact,
> I believe that trying it crashed the system in 2.2. The kernel tried to
> use one of the existing RTC routines on that hardware when it wasn't
> the right thing to do. In particular it used the VIA bit-poking method
> that really old macs need and that wasn't a good thing.
>
> The caboose chip handles the RTC on these systems (and a few other
> things as well) and we just simply don't know how to use it.

I don't know "how", but with 2.2 kernels I always had a correct date at 
boot without any tricks. It is true though that with high CPU load we 
had clockskew and that we didn't save back the date and hourtime to the 
clock, thus any clock setting needed to be done from the mac side. A 
compromoise, but better than the current situation.

Of course, in a perfect world, you could use EMILE and not install 
macos at all (also saving space on those old SCSI disks) and 
consequently everything needs to be supported inside linux.

RIccardo


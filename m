From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/2] Convert PowerPC macro spin_event_timeout() to architecture
 independent macro
Date: Wed, 31 Jul 2013 17:04:14 -0700
Message-ID: <51F9A5FE.8030608@codeaurora.org>
References: <1375187900-17582-1-git-send-email-B44344@freescale.com> <1375187900-17582-3-git-send-email-B44344@freescale.com> <20130731071630.GI8868@codeaurora.org> <CAOZdJXVvNBR-qf7LXNOHZVstH_Rebxwn-wAkSaBS53Wn55mYCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:49015 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748Ab3HAAES (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 31 Jul 2013 20:04:18 -0400
In-Reply-To: <CAOZdJXVvNBR-qf7LXNOHZVstH_Rebxwn-wAkSaBS53Wn55mYCw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Timur Tabi <timur@tabi.org>
Cc: Arpit Goel <B44344@freescale.com>, linux@arm.linux.org.uk, takata@linux-m32r.org, philb@gnu.org, Geert Uytterhoeven <geert@linux-m68k.org>, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, linux390@de.ibm.com, David Miller <davem@davemloft.net>, Rob Herring <rob.herring@calxeda.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@nvidia.com>, john.stultz@linaro.org, jesper.nilsson@axis.com, gregkh@linuxfoundation.org, sam@ravnborg.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, linux-m32r@ml.linux-m32r.org, linux-m32r-ja@ml.linux-m32r.org, linux-m68k@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, mattw@codeaurora.org

On 07/31/13 16:44, Timur Tabi wrote:
> On Wed, Jul 31, 2013 at 2:16 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> What do you do here if jiffies aren't incrementing (i.e
>> interrupts are disabled). The time_before() check won't work
>> there and it would be nice if we were able to use this in such
>> situations. I think powerpc gets around this by reading the
>> hardware timer directly?
> I believe that jiffies is always a global variable.  It should behave
> the same on PowerPC as on other architectures.

Yes it's global but it doesn't increment while interrupts are off.

>
> The answer to your question is that you should not use
> spin_event_timeout() in interrupt context, because it yields.
>

If it yields why are we using udelay? Why not usleep_range()? It would
be useful to have a variant that worked in interrupt context and it
looked like that was almost possible.

BTW, couldn't we skip the first patch and just use usecs_to_jiffies()?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

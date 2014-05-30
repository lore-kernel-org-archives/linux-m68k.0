From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH 0/9] m68knommu: use ColdFire DMA timer
Date: Fri, 30 May 2014 10:51:34 +1000
Message-ID: <5387D616.8030408@uclinux.org>
References: <1401238189-4402-1-git-send-email-gerg@uclinux.org> <201405291622.11925.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:30494
	"EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753848AbaE3Avk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 29 May 2014 20:51:40 -0400
In-Reply-To: <201405291622.11925.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Steven,

On 30/05/14 09:22, Steven King wrote:
> On Tuesday 27 May 2014 5:49:40 pm gerg@uclinux.org wrote:
>> From: Greg Ungerer <gerg@uclinux.org>
>>
>> Most of the modern ColdFire family members contain the DMA timer hardware
>> module. Build the support code for it and use it on those that do. We can
>> use it as an accurate time source.
>>
>> I don't have test platforms based on all of these ColdFire types, it would
>> be really helpful if anyone that has any of these can test these changes.
>> It build tests fine on all these types, and it works on 520x and 527x
>> based platforms.
>>
>> These changes are (neccessarily) on top of my recent patch series titled
>> "clean up timer code on the ColdFire 53xx".
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
>> ---
>>  arch/m68k/include/asm/m520xsim.h        |    8 ++++++++
>>  arch/m68k/include/asm/m523xsim.h        |    8 ++++++++
>>  arch/m68k/include/asm/m527xsim.h        |    8 ++++++++
>>  arch/m68k/include/asm/m528xsim.h        |    8 ++++++++
>>  arch/m68k/include/asm/m53xxsim.h        |   10 +++++-----
>>  arch/m68k/include/asm/m5441xsim.h       |    8 ++++++++
>>  arch/m68k/platform/coldfire/Makefile    |   10 +++++-----
>>  arch/m68k/platform/coldfire/dma_timer.c |   24 +++++++++++++-----------
>>  8 files changed, 63 insertions(+), 21 deletions(-)
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> Hi Greg,
> 
> I was able to to test this on 528x and 5441x and didnt have problems, so you 
> can add my Acked-by if you want.

Great, thanks for testing. I will add your acked-by.

The most significant change is for the 532x and 537x, but
I don't have either of those to test with.

Regards
Greg

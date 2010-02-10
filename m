From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] Define sigcontext ABI for ColdFire
Date: Wed, 10 Feb 2010 16:16:55 +1000
Message-ID: <4B724F57.1070505@snapgear.com>
References: <4AB360DC.9030902@codesourcery.com> <4AB9439B.6050006@codesourcery.com> <4B714579.3060508@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:35706 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751141Ab0BJGPu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 10 Feb 2010 01:15:50 -0500
In-Reply-To: <4B714579.3060508@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Maxim,

Maxim Kuvyrkov wrote:
> On 9/23/09 1:37 AM, Maxim Kuvyrkov wrote:
>> Maxim Kuvyrkov wrote:
>>> The following patch define sigcontext ABI of ColdFire.
> ...
>> I was lured into thinking that the above sequence is OK by m68knommu's
>> version of the trampoline. Arch/m68knommu/kernel/entry.S uses "move
>> #__NR_rt_sigreturn,%d0" which assembles into "move.w". This is too is
>> buggy and I'm also attaching the fix for the nommu version.
> 
> I have cleaned up the sigcontext patch for ColdFire to only touch the 
> necessary fields in the sigcontext structure.  Attached are the cleaned 
> up sigcontext patch and the rt_sigreturn fix for m68knommu.
> 
> I hope these patches will find their way into m68k/for-2.6.34 branch.

I'll take 0002-Fix-m68k-uclinux-s-rt_sigreturn-trampoline.patch
and apply to the m68knommu git tree.

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com

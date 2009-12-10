From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [git pull] m68knommu arch updates
Date: Thu, 10 Dec 2009 14:54:30 +1000
Message-ID: <4B207F06.2080904@snapgear.com>
References: <200912090758.nB97wPok013748@goober.internal.moreton.com.au> <alpine.LFD.2.00.0912091910340.3560@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:41737 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752809AbZLJEyr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Dec 2009 23:54:47 -0500
In-Reply-To: <alpine.LFD.2.00.0912091910340.3560@localhost.localdomain>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, gerg@uclinux.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-m68k@vger.kernel.org


Hi Linus,

Linus Torvalds wrote:
> 
> On Wed, 9 Dec 2009, Greg Ungerer wrote:
>> Please pull to get the latest m68knommu arch fixes. Not a lot in here,
>> mostly small fixes. The biggest change is Tim Abbott's linker script
>> cleanups.
> 
> Hmm. I got a conflict due to the other m68k changes on the file 
> arch/m68k/include/asm/ptrace.h.
> 
> I fixed it up the way that seemed most appropriate, but somebody should 
> double-check. My resolution is not identical to either source branch tree.

The end result looks fine to me.

Regards
Greg


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com

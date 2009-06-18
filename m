From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: merge the non-mmu and mmu versions of hardirq.h
Date: Fri, 19 Jun 2009 00:07:18 +1000
Message-ID: <4A3A4A16.6080307@snapgear.com>
References: <200906170710.n5H7AxxV009015@localhost.localdomain> <200906170941.44383.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:48077 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1763520AbZFROHS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 18 Jun 2009 10:07:18 -0400
In-Reply-To: <200906170941.44383.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, gerg@uclinux.org, linux-m68k@vger.kernel.org


Hi Arnd,

Arnd Bergmann wrote:
> On Wednesday 17 June 2009, Greg Ungerer wrote:
>> [PATCH] m68k: merge the non-mmu and mmu versions of hardirq.h
>>
>> There is nothing different required between the non-mmu and mmu
>> versions of hardirq.h, so merge them back into a single file.
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> 
> AFAICT this file is also the same in the new asm-generic version, so you
> could fall back to that directly.

Indeed it could. It will need a clean out of ack_bad_irq() in
arch/m68knommu/kernel.irq.c, but otherwise looks good.

I'll prepare a new patch that uses that.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com

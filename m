From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH 0/3] m68k: coldfire MMU fixes
Date: Mon, 11 Sep 2017 13:08:09 +1000
Message-ID: <f306bff6-975d-1558-5a69-4d3571472e18@linux-m68k.org>
References: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
 <c2d0637b-0e6c-dfff-88d1-1de7990b0294@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:43432
        "EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751965AbdIKDIH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 10 Sep 2017 23:08:07 -0400
In-Reply-To: <c2d0637b-0e6c-dfff-88d1-1de7990b0294@sysam.it>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

Hi Angelo,

On 09/09/17 08:33, Angelo Dureghello wrote:
> Dear Greg,
> 
> On 08/09/2017 09:00, Greg Ungerer wrote:
>> The following patch series fixes some issues with the initialization phase
>> of the ColdFire MMU system startup. With these fixes applied we can also
>> enable and run the ColdFire 5441x family of parts with their MMU enabled.
>>
>>   arch/m68k/Kconfig.cpu               |    2 +-
>>   arch/m68k/coldfire/m54xx.c          |    4 ----
>>   arch/m68k/include/asm/mcfmmu.h      |    1 +
>>   arch/m68k/include/asm/mmu_context.h |    1 -
>>   arch/m68k/kernel/setup_mm.c         |    2 ++
>>   arch/m68k/mm/mcfmmu.c               |    4 ++--
>>   6 files changed, 6 insertions(+), 8 deletions(-)
>>
> 
> I just applied this patchset to fresh master and re-verified that enabling
> MMU works on my mcf54415 based board.
> 
> Tested-by: Angelo Dureghello <angelo@sysam.it>

Thats great, thanks Angelo. I will add your tested-by tags to the commits.

Regards
Greg

From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH 0/3] m68k: coldfire MMU fixes
Date: Sat, 9 Sep 2017 00:33:51 +0200
Message-ID: <c2d0637b-0e6c-dfff-88d1-1de7990b0294@sysam.it>
References: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:38317 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753031AbdIHWdy (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 8 Sep 2017 18:33:54 -0400
In-Reply-To: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

Dear Greg,

On 08/09/2017 09:00, Greg Ungerer wrote:
> The following patch series fixes some issues with the initialization phase
> of the ColdFire MMU system startup. With these fixes applied we can also
> enable and run the ColdFire 5441x family of parts with their MMU enabled.
> 
>   arch/m68k/Kconfig.cpu               |    2 +-
>   arch/m68k/coldfire/m54xx.c          |    4 ----
>   arch/m68k/include/asm/mcfmmu.h      |    1 +
>   arch/m68k/include/asm/mmu_context.h |    1 -
>   arch/m68k/kernel/setup_mm.c         |    2 ++
>   arch/m68k/mm/mcfmmu.c               |    4 ++--
>   6 files changed, 6 insertions(+), 8 deletions(-)
> 

I just applied this patchset to fresh master and re-verified that enabling
MMU works on my mcf54415 based board.

Tested-by: Angelo Dureghello <angelo@sysam.it>

Regards,
Angelo Dureghello

> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCHv2 7/8] m68k: only generate FPU instructions if CONFIG_FPU
 enabled
Date: Wed, 31 Aug 2016 10:46:38 +1000
Message-ID: <0dcae1b1-4935-886d-7637-cd318e6dac77@linux-m68k.org>
References: <1472542194-11743-1-git-send-email-gerg@linux-m68k.org>
 <CAMuHMdVe9KOdDyTy6ty5Wpw=QqB_msCMzAQD-7ZitZ+0qFv3Ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:12420
        "EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751154AbcHaAov (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 30 Aug 2016 20:44:51 -0400
In-Reply-To: <CAMuHMdVe9KOdDyTy6ty5Wpw=QqB_msCMzAQD-7ZitZ+0qFv3Ug@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On 30/08/16 17:32, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Tue, Aug 30, 2016 at 9:29 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> Most of the m68k code that supports a hardware FPU is surrounded by
>> CONFIG_FPU. Be consistent and surround the hardware FPU instruction
>> setup in setup_mm.c with CONFIG_FPU as well as the check for
>> CONFIG_M68KFPU_EMU_ONLY.
>>
>> The existing classic m68k architectures all define CONFIG_FPU, so they
>> see no change from this. But on ColdFire where we do not support the
>> emulated FP code we can now compile without CONFIG_FPU being set as well.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Thanks for the update. Series looks good to me now.

Thanks for the review. I'll push it into the for-next branch
of the m68knommu tree (if you have no problem with it going
upstream via that tree).

Regards
Greg

Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF05CC61DA4
	for <linux-m68k@archiver.kernel.org>; Fri, 24 Feb 2023 00:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjBXAki (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Feb 2023 19:40:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjBXAkh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2023 19:40:37 -0500
X-Greylist: delayed 524 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Feb 2023 16:40:35 PST
Received: from welho-filter2.welho.com (welho-filter2b.welho.com [83.102.41.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F2354A29
        for <linux-m68k@vger.kernel.org>; Thu, 23 Feb 2023 16:40:35 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by welho-filter2.welho.com (Postfix) with ESMTP id 600BC23674;
        Fri, 24 Feb 2023 02:31:49 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp2.welho.com ([IPv6:::ffff:83.102.41.85])
        by localhost (welho-filter2.welho.com [::ffff:83.102.41.24]) (amavisd-new, port 10024)
        with ESMTP id EBLHPSOz0-Zd; Fri, 24 Feb 2023 02:31:48 +0200 (EET)
Received: from [192.168.0.20] (89-27-41-239.bb.dnainternet.fi [89.27.41.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by welho-smtp2.welho.com (Postfix) with ESMTPSA id B01BE72;
        Fri, 24 Feb 2023 02:31:43 +0200 (EET)
Message-ID: <2f051c9f-4563-6f0c-c0f6-efc349731ea3@helsinkinet.fi>
Date:   Fri, 24 Feb 2023 02:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC v1] m68k: kernel/traps.c - only force 030 bus error if
 PC not in exception table
Content-Language: en-US
To:     Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
        geert@linux-m68k.org
Cc:     Finn Thain <ftain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <20230222195021.6683-1-schmitzmic@gmail.com>
From:   Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <20230222195021.6683-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On 22.2.2023 21.50, Michael Schmitz wrote:
> __get_kernel_nofault() does copy data in supervisor mode when
> forcing a task backtrace dump through the sysrq trigger.
> 
> Our 030 bus error handler is ill equipped to deal with this:
> 
> Whenever ssw indicates a kernel mode access on a data fault,
> we don't even attempt to handle the fault and instead send
> a bus error signal (or panic). As a result, the check for
> exception handling at the fault PC (buried in send_sig_fault()
> which gets called from do_page_fault() eventually) is never
> used.
> 
> Both 040 and 060 access error handlers do not care whether
> a fault happened on supervisor mode access, and will call
> do_page_fault() even on those.
> 
> Add a check in bus_error030 to call do_page_fault() in case
> we do have an entry for the fault PC in our exception table.
> 
> Tested on 030 Atari Falcon.


I've verified that the kernel Oops was there with unpatched kernel, and 
this fixes it, also when using Hatari emulator 030 / Atari Falcon emulation.

(Verified both with both v6.0 & v6.2 of Linus' kernel sources.)


	- Eero


> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com># Please enter the commit message for your changes. Lines starting
> CC: Eero Tamminen <oak@helsinkinet.fi>
> CC: Finn Thain <ftain@linux-m68k.org>
> CC: Andreas Schwab <schwab@linux-m68k.org>
> CC: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/r/daca2f68-19fa-a2b6-97c6-16b5b7e26afe@helsinkinet.fi
> ---
>   arch/m68k/kernel/traps.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
> index 5c8cba0efc63..67576fb0c466 100644
> --- a/arch/m68k/kernel/traps.c
> +++ b/arch/m68k/kernel/traps.c
> @@ -30,6 +30,7 @@
>   #include <linux/init.h>
>   #include <linux/ptrace.h>
>   #include <linux/kallsyms.h>
> +#include <linux/extable.h>
>   
>   #include <asm/setup.h>
>   #include <asm/fpu.h>
> @@ -545,7 +546,7 @@ static inline void bus_error030 (struct frame *fp)
>   			errorcode |= 2;
>   
>   		if (mmusr & (MMU_I | MMU_WP)) {
> -			if (ssw & 4) {
> +			if (ssw & 4 && !search_exception_tables(fp->ptregs.pc)) {
>   				pr_err("Data %s fault at %#010lx in %s (pc=%#lx)\n",
>   				       ssw & RW ? "read" : "write",
>   				       fp->un.fmtb.daddr,

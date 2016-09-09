From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: clean up uClinux boot log output
Date: Fri, 09 Sep 2016 16:20:57 +0200
Message-ID: <874m5pp31y.fsf@linux-m68k.org>
References: <1473383446-4861-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:46671 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750768AbcIIOVA (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Sep 2016 10:21:00 -0400
In-Reply-To: <1473383446-4861-1-git-send-email-gerg@linux-m68k.org> (Greg
        Ungerer's message of "Fri, 9 Sep 2016 11:10:46 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

On Sep 09 2016, Greg Ungerer <gerg@linux-m68k.org> wrote:

> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index 72d272e..a160695 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -106,7 +106,7 @@ void __init setup_arch(char **cmdline_p)
>  	process_uboot_commandline(&command_line[0], sizeof(command_line));
>  #endif /* CONFIG_UBOOT */
>  
> -	printk(KERN_INFO "\x0F\r\n\nuClinux/" CPU_NAME "\n");

Do you have any idea what's the significance of ^O here?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."

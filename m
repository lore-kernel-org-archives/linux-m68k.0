From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH] m68k: generalize uboot command line support
Date: Fri, 9 Sep 2016 16:48:16 +1000
Message-ID: <39f9e22c-31f2-0be5-7a1e-6df33f79831b@linux-m68k.org>
References: <1473383418-4824-1-git-send-email-gerg@linux-m68k.org>
 <CAMuHMdVTKUNy49py59+PTAT+DBhgewj1cShW7qT=1zjXnzpD9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:44054
        "EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751386AbcIIGsT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Sep 2016 02:48:19 -0400
In-Reply-To: <CAMuHMdVTKUNy49py59+PTAT+DBhgewj1cShW7qT=1zjXnzpD9Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On 09/09/16 16:20, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Fri, Sep 9, 2016 at 3:10 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> --- a/arch/m68k/include/asm/bootinfo.h
>> +++ b/arch/m68k/include/asm/bootinfo.h
>> @@ -22,6 +22,10 @@ extern void save_bootinfo(const struct bi_record *bi);
>>  static inline void save_bootinfo(const struct bi_record *bi) {}
>>  #endif
>>
>> +#ifdef CONFIG_UBOOT
>> +void process_uboot_commandline(char *commandp, int size);
>> +#endif
> 
> What about providing a dummy for the !CONFIG_UBOOT case..
> 
>> --- a/arch/m68k/kernel/setup_mm.c
>> +++ b/arch/m68k/kernel/setup_mm.c
>> @@ -274,6 +274,9 @@ void __init setup_arch(char **cmdline_p)
>>         strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>>         m68k_command_line[CL_SIZE - 1] = 0;
>>  #endif /* CONFIG_BOOTPARAM */
>> +#if defined(CONFIG_UBOOT)
>> +       process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
>> +#endif
> 
> ... so you can drop the #if and #endif here?

Yep, good idea. I'll re-spin with that.

Thanks
Greg

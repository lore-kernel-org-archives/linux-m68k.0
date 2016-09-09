From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: clean up uClinux boot log output
Date: Fri, 9 Sep 2016 16:47:07 +1000
Message-ID: <67f9c06e-309a-13c9-d49b-06a5160a2f4d@linux-m68k.org>
References: <1473383446-4861-1-git-send-email-gerg@linux-m68k.org>
 <CAMuHMdWyQ_8He0MYr81cQ+mfSHMQBU-BLh8HmFNAFzZK_NwTVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:63181
        "EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751234AbcIIGrp (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Sep 2016 02:47:45 -0400
In-Reply-To: <CAMuHMdWyQ_8He0MYr81cQ+mfSHMQBU-BLh8HmFNAFzZK_NwTVA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On 09/09/16 16:21, Geert Uytterhoeven wrote:
> On Fri, Sep 9, 2016 at 3:10 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> --- a/arch/m68k/kernel/setup_no.c
>> +++ b/arch/m68k/kernel/setup_no.c
>> @@ -106,7 +106,7 @@ void __init setup_arch(char **cmdline_p)
>>         process_uboot_commandline(&command_line[0], sizeof(command_line));
>>  #endif /* CONFIG_UBOOT */
>>
>> -       printk(KERN_INFO "\x0F\r\n\nuClinux/" CPU_NAME "\n");
>> +       printk(KERN_INFO "uClinux with CPU " CPU_NAME "\n");
> 
> pr_info() while you're at it?

If I do that I think I need to do the 12 printk's that follow
that as well :-)

Perhaps I should do that as a separate patch.

Thanks
Greg

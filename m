From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: clean up uClinux boot log output
Date: Sat, 10 Sep 2016 14:54:44 +1000
Message-ID: <2ff08c98-279e-471c-78c3-2509faba05f9@linux-m68k.org>
References: <1473383446-4861-1-git-send-email-gerg@linux-m68k.org>
 <874m5pp31y.fsf@linux-m68k.org>
 <CAMuHMdVA=xDfJOe8MMKVdT6UsfDP=cF_y33YEDR_ekDJcXBtxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:1805
        "EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751066AbcIJEyt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sat, 10 Sep 2016 00:54:49 -0400
In-Reply-To: <CAMuHMdVA=xDfJOe8MMKVdT6UsfDP=cF_y33YEDR_ekDJcXBtxA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert, Andreas,

On 10/09/16 00:45, Geert Uytterhoeven wrote:
> Hi Andreas,
>
> On Fri, Sep 9, 2016 at 4:20 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> On Sep 09 2016, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>
>>> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
>>> index 72d272e..a160695 100644
>>> --- a/arch/m68k/kernel/setup_no.c
>>> +++ b/arch/m68k/kernel/setup_no.c
>>> @@ -106,7 +106,7 @@ void __init setup_arch(char **cmdline_p)
>>>       process_uboot_commandline(&command_line[0], sizeof(command_line));
>>>  #endif /* CONFIG_UBOOT */
>>>
>>> -     printk(KERN_INFO "\x0F\r\n\nuClinux/" CPU_NAME "\n");
>>
>> Do you have any idea what's the significance of ^O here?
>
> You raised my interest, too ;-)
>
> http://mailman.uclinux.org/pipermail/uclinux-dev//2003-March/016122.html

The problem with the reasoning there is that this is not the
first string printed. This is what the boot console looks like
now:

     Linux version 4.8.0-rc5-00014-g5594b01-dirty (gerg@goober) (gcc 
version 5.4.0 (GCC) ) #2 Sat Sep 10 14:44:55 AEST 2016


     uClinux/COLDFIRE(m520x)
     COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
     Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
     Built 1 zonelists in Zone order, mobility grouping off.  Total 
pages: 4080
     Kernel command line: root=/dev/mtdblock0
     PID hash table entries: 128 (order: -4, 512 bytes)
     Dentry cache hash table entries: 4096 (order: 1, 16384 bytes)
     ....

So you end up with 2 blank lines for no good reason.

And then there is the question of whether CTRL-O is in any way
useful here. I would argue that it is of pretty much no value
these days - if it ever was:

https://en.wikipedia.org/wiki/Shift_Out_and_Shift_In_characters

Regards
Greg

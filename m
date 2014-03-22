From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 2/2] m68k/atari - atafb: convert allocation of fb ram
 to new interface
Date: Sat, 22 Mar 2014 14:28:43 +1300
Message-ID: <532CE74B.6010406@biophys.uni-duesseldorf.de>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>	<1395213784-3249-2-git-send-email-schmitz@debian.org>	<CAMuHMdVriMKQrNjxBnPDekVAzML5Np-ygvN57OTcTMxO97rsfQ@mail.gmail.com>	<532AA422.8040208@biophys.uni-duesseldorf.de> <CAMuHMdVq=XEW_aVnu=M8skWYbiAOxOjNyT9zoZqTLUM0HxiM-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:49990 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971AbaCVBai (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Mar 2014 21:30:38 -0400
Received: by mail-pb0-f41.google.com with SMTP id jt11so3128329pbb.28
        for <linux-m68k@vger.kernel.org>; Fri, 21 Mar 2014 18:30:38 -0700 (PDT)
In-Reply-To: <CAMuHMdVq=XEW_aVnu=M8skWYbiAOxOjNyT9zoZqTLUM0HxiM-Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Geert,
>>>         kernel_set_cachemode(screen_base, screen_len,
>>>                                                      IOMAP_WRITETHROUGH);
>>>
>>> woops, that won't work with the virt_to_phys() above, nor with transparent
>>> translation. I guess it writes to a non-existent pointer table,
>>> causing the crash?
>>>       
>> You mean kernel_set_cachemode wants a physical address?
>>     
>
> No, it wants memory mapped using the page tables. Probably it will
> work only for System RAM, not for MMIO mapped in head.S.
>   

I've disabled both to check, no change. ST-RAM (4 MB of it) is mapped 
per page tables in head.S so we should be fine.

>   
>> The last log line I get is:
>>
>> atafb_init: start
>> atafb_init: initializing Falcon hw
>> atafb: screen_base ff001000 real_screen_base 00001000 screen_len 69632
>> Determined 640x400, depth 1
>>   virtual 640x870
>>
>> which is a bit further down.
>>
>> I guess it dies in register_framebuffer() - the next log entry is missing:
>>
>>        fb_info(&fb_info, "frame buffer device, using %dK of video memory\n",
>>                screen_len >> 10);
>>     
>
> And register_framebuffer() will write to the frame buffer, I think.
> So info->screen_base may be incorrect.
>
> Yep:
>
> static void atafb_set_disp(struct fb_info *info)
> {
>         atafb_get_var(&info->var, info);
>         atafb_get_fix(&info->fix, info);
>
>         info->screen_base = (void *)info->fix.smem_start;
> }
>
> Missing atari_stram_to_virt().
>   

Should have had phys_to_virt() before I guess. Thanks.

> Any other casts that indicate bugs? ;-)
>   

Probably - I'll go over the source again. My port of atafb a few years 
back was none too subtle.

Cheers,

    Michael

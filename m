From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 2/2] m68k/atari - atafb: convert allocation of fb ram
 to new interface
Date: Thu, 20 Mar 2014 21:17:38 +1300
Message-ID: <532AA422.8040208@biophys.uni-duesseldorf.de>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>	<1395213784-3249-2-git-send-email-schmitz@debian.org> <CAMuHMdVriMKQrNjxBnPDekVAzML5Np-ygvN57OTcTMxO97rsfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:44310 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751883AbaCTIRy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 20 Mar 2014 04:17:54 -0400
Received: by mail-pd0-f181.google.com with SMTP id p10so582087pdj.26
        for <linux-m68k@vger.kernel.org>; Thu, 20 Mar 2014 01:17:54 -0700 (PDT)
In-Reply-To: <CAMuHMdVriMKQrNjxBnPDekVAzML5Np-ygvN57OTcTMxO97rsfQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Geert Uytterhoeven wrote:
> On Wed, Mar 19, 2014 at 8:23 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>   
>> @@ -3166,7 +3166,7 @@ int __init atafb_init(void)
>>                 memset(screen_base, 0, mem_req);
>>                 pad = -(unsigned long)screen_base & (PAGE_SIZE - 1);
>>                 screen_base += pad;
>> -               real_screen_base = screen_base + ovsc_offset;
>> +               real_screen_base = atari_stram_to_phys((unsigned long) (screen_base + ovsc_offset));
>>     
>
> This triggered my eye, but it's actually correct, as it's stored in
> fix->smem_start,
> which should be the physical address.
>
> But the external_addr case is wrong ;-)
>
>   

Haven't touched that at all yet.

>>                 screen_len = (mem_req - pad - ovsc_offset) & PAGE_MASK;
>>                 st_ovsc_switch();
>>                 if (CPU_IS_040_OR_060) {
>>     
>
> Starting here, you have:
>
>         cache_push(virt_to_phys(screen_base), screen_len);
>
> atari_stram_to_phys()
>   

Well spotted - I'm sure I searched for to_phys, must have missed that 
somehow

>         kernel_set_cachemode(screen_base, screen_len,
>                                                      IOMAP_WRITETHROUGH);
>
> woops, that won't work with the virt_to_phys() above, nor with transparent
> translation. I guess it writes to a non-existent pointer table,
> causing the crash?
>
>   
You mean kernel_set_cachemode wants a physical address?

Not sure the mapping in head.S is actually per transparent translation 
for 040 or 060. But I'll try with that chunk of code disabled (the early 
mapping is done as NOCACHE_SER so we don't really need all of that if 
the kernel is not in ST-RAM).

The last log line I get is:

atafb_init: start
atafb_init: initializing Falcon hw
atafb: screen_base ff001000 real_screen_base 00001000 screen_len 69632
Determined 640x400, depth 1
   virtual 640x870

which is a bit further down.

I guess it dies in register_framebuffer() - the next log entry is missing:

        fb_info(&fb_info, "frame buffer device, using %dK of video 
memory\n",
                screen_len >> 10);

Cheers,

    Michael

From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 2/2] m68k/atari - atafb: convert allocation of fb ram
 to new interface
Date: Sat, 22 Mar 2014 20:36:11 +1300
Message-ID: <532D3D6B.4040600@biophys.uni-duesseldorf.de>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>	<1395213784-3249-2-git-send-email-schmitz@debian.org>	<CAMuHMdVriMKQrNjxBnPDekVAzML5Np-ygvN57OTcTMxO97rsfQ@mail.gmail.com>	<532AA422.8040208@biophys.uni-duesseldorf.de> <CAMuHMdVq=XEW_aVnu=M8skWYbiAOxOjNyT9zoZqTLUM0HxiM-Q@mail.gmail.com> <532CE74B.6010406@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:32986 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831AbaCVHhR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Mar 2014 03:37:17 -0400
Received: by mail-pb0-f42.google.com with SMTP id rr13so3357617pbb.29
        for <linux-m68k@vger.kernel.org>; Sat, 22 Mar 2014 00:37:16 -0700 (PDT)
In-Reply-To: <532CE74B.6010406@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Geert,
>>> I guess it dies in register_framebuffer() - the next log entry is 
>>> missing:
>>>
>>>        fb_info(&fb_info, "frame buffer device, using %dK of video 
>>> memory\n",
>>>                screen_len >> 10);
>>>     
>>
>> And register_framebuffer() will write to the frame buffer, I think.
>> So info->screen_base may be incorrect.
>>
>> Yep:
>>
>> static void atafb_set_disp(struct fb_info *info)
>> {
>>         atafb_get_var(&info->var, info);
>>         atafb_get_fix(&info->fix, info);
>>
>>         info->screen_base = (void *)info->fix.smem_start;
>> }
>>
>> Missing atari_stram_to_virt().
>>   
>
> Should have had phys_to_virt() before I guess. Thanks.

Bingo!

>
>> Any other casts that indicate bugs? ;-)
>>   
>
> Probably - I'll go over the source again. My port of atafb a few years 
> back was none too subtle.
>

Only a few more - in the external VGA adapter code, in the ioctl code 
(copy tp/from user) and one in the atafb_imageblit() that I'm fairly 
sure is dead code.

ARAnyM is happy - I'll have yet to see how this works on real hardware. 
We might yet need a writethrough mapping for performance.

In the interest of minimizing casts, I'll rewrite the virt/phys 
translation helpers and clean up the rest of the code a bit more. Saves 
a bit of headache when I need to revisit this code in another decade or 
so :-)

Thanks again for your help in tracking this down.

Cheers,

    Michael

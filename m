From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Mon, 19 Aug 2013 20:48:24 +1200
Message-ID: <5211DBD8.5090801@gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>	<520D4AE3.6040801@aalto.fi>	<520E76FC.9040803@aalto.fi>	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>	<520F5F81.7090409@aalto.fi>	<52102BEC.7000006@gmail.com>	<CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>	<52108CAF.1010700@gmail.com> <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:60984 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107Ab3HSIsj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Aug 2013 04:48:39 -0400
Received: by mail-pd0-f176.google.com with SMTP id q10so4852032pdj.21
        for <linux-m68k@vger.kernel.org>; Mon, 19 Aug 2013 01:48:39 -0700 (PDT)
In-Reply-To: <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert,
> On Sun, Aug 18, 2013 at 10:58 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>   
>> I'll also need to check the command_block and command_block_dma addresses -
>> does the DMA require virtual or physical addresses?
>>     
>
> Physical, of course.
>   

:-) VDMA was invented a bit later ...


I'll go check the usage of the DMA API calls again, but as the driver 
seems to do DMA fine until the short transfer, that seems the most 
likely cause. PIO for dma_count < 7 might be an option.

I see transfers with esp_count=1 and dma_count=7 in the log - wonder why 
that works but the short 2/2 byte case does not.

Cheers,

    Michael

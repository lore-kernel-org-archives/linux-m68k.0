From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Mon, 19 Aug 2013 14:47:15 +0300
Message-ID: <521205C3.1060807@aalto.fi>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>	<520D4AE3.6040801@aalto.fi>	<520E76FC.9040803@aalto.fi>	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>	<520F5F81.7090409@aalto.fi>	<52102BEC.7000006@gmail.com>	<CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>	<52108CAF.1010700@gmail.com> <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com> <5211DBD8.5090801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx04.aalto.fi ([130.233.222.103]:55517 "EHLO mx04.aalto.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751286Ab3HSLrR (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 19 Aug 2013 07:47:17 -0400
In-Reply-To: <5211DBD8.5090801@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 08/19/2013 11:48 AM, Michael Schmitz wrote:
> Geert,
>> On Sun, Aug 18, 2013 at 10:58 AM, Michael Schmitz 
>> <schmitzmic@gmail.com> wrote:
>>> I'll also need to check the command_block and command_block_dma 
>>> addresses -
>>> does the DMA require virtual or physical addresses?
>>
>> Physical, of course.
>
> :-) VDMA was invented a bit later ...
>
>
> I'll go check the usage of the DMA API calls again, but as the driver 
> seems to do DMA fine until the short transfer, that seems the most 
> likely cause. PIO for dma_count < 7 might be an option.
>
> I see transfers with esp_count=1 and dma_count=7 in the log - wonder 
> why that works but the short 2/2 byte case does not.
>
Is it possible that the problem is with memory alignment?

http://fxr.watson.org/fxr/source/arch/amiga/dev/bzivsc.c?v=NETBSD#L360
https://groups.google.com/d/msg/comp.sys.amiga.hardware/FXwaSFoAPxc/zsXeP7PB6RoJ

-Tuomas

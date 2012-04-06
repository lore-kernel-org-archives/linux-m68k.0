From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari interrupts
 to make room for EtherNAT interrupts
Date: Sat, 07 Apr 2012 09:43:09 +1200
Message-ID: <4F7F636D.3090908@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>	<4F4B2BB6.900@gmail.com>	<4F77C245.5090002@gmail.com>	<CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com>	<CAOmrzkJqkLC=dhsY0AUduv3Mm7PVmbtHrsjgS6v=V14eXuuA8g@mail.gmail.com>	<CAMuHMdXnVU2ZuCVLWA27RaCm2COi_AdDE9F2hj=qBGQLB6KxuA@mail.gmail.com> <CAOmrzkJGonrmY4jztegh3JqZRW17H1sF7en765=Em+_G7SodXw@mail.gmail.com> <4F7B6880.9050605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:53800 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754247Ab2DFVna (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Apr 2012 17:43:30 -0400
Received: by pbcun15 with SMTP id un15so3000371pbc.19
        for <linux-m68k@vger.kernel.org>; Fri, 06 Apr 2012 14:43:30 -0700 (PDT)
In-Reply-To: <4F7B6880.9050605@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,
> See attached - the 3.3.0-ethernat patches implement switching over to 
> the mainstream 91Cx driver (card detected on my Falcon, link brought 
> up but not detected by the driver due to hardware problems). The 
> 3.3.0-atari-cleanup-num-irqs.diff sets the number of interrupt sources 
> to 141 on Atari, setting the number of VME sources back to 16 so we 
> don't accidentially trash memory contiguous with the free_vme_irq bitmap.
>
> For some reason, I have to set NUM_ATARI_SOURCES to 141 to actually 
> get interrupt source 140 to register. Off-by-one error somewhere in 
> the generic interrupt code I'd think, but I've not been able to spot 
> it. (Just increasing the number of interrupts that are registered by 
> atari_init_IRQ results in 'unexpected interrupt from 112' until the 
> cows come home. And yes, it happens in ARAnyM, too.)
>
> That pretty much wraps it up for EtherNEC and EtherNAT - EtherNEC is 
> fully tested by me, EtherNAT needs testing on Christian's Falcon or by 
> someone else with fully functional hardware. Next project : SCSI, SCC 
> serial, or what?...
Forgot to add my Signed-off-by - I guess the same arguments apply here 
as Paul raised them for ne.c. Do you want a new patch set based on 
current m68k?

Cheers,

  Michael

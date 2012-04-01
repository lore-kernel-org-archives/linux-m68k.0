From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari
 interrupts to make room for EtherNAT interrupts
Date: Mon, 2 Apr 2012 10:44:20 +1200
Message-ID: <CAOmrzkJqkLC=dhsY0AUduv3Mm7PVmbtHrsjgS6v=V14eXuuA8g@mail.gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>
	<4F4B2BB6.900@gmail.com>
	<4F77C245.5090002@gmail.com>
	<CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59973 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753535Ab2DAWoU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Apr 2012 18:44:20 -0400
Received: by pbcun15 with SMTP id un15so3841210pbc.19
        for <linux-m68k@vger.kernel.org>; Sun, 01 Apr 2012 15:44:20 -0700 (PDT)
In-Reply-To: <CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi Geert,

>> Part 1 (this): make room for the EtherNAT interrupts - they appear at
>> vectors 0xc3 (USB ISP1160) and 0xc4 (SMC91C111)
>
> Is there any specific reason you cannot use atari_register_vme_int(), like
> drivers/net/ethernet/amd/atarilance.c, to avoid increasing NR_IRQS?

>From what I read in atari_register_vme_int(), it returns the next free
VME interrupt starting at VME_SOURCE_BASE. This required the vector
number to be programmable in the correspomding VME device.

To the best of my knowledge, vector numbers are fixed (0xc3 and 0xc4)
for the EtherNAT.

I definitely need to increase NR_IRQS - it might be better to leave
VME_MAX_SOURCES unchanged and change the NUM_ATARI_SOURCES definition
above instead.

I'm uncertain whether the complicated definition of NUM_ATARI_SOURCES
is needed anymore - are the IRQ_VECTOR_TO_SOURCE and
IRQ_SOURCE_TO_VECTOR macros still used anywhere?

Cheers,

  Michael

From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k v3.16 status update
Date: Wed, 20 Dec 2017 10:01:35 +1100 (AEDT)
Message-ID: <alpine.LNX.2.21.1712200935490.3@nippy.intranet>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net> <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net> <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
 <4403d779c1664692ae5a7ef5b69ec888@aalto.fi> <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com> <alpine.LNX.2.21.1712151039050.3@nippy.intranet> <CAOmrzkKgHEO8BY-z5hXKoJFgb7SpZF55jjkeo-9v34PkqsYt_Q@mail.gmail.com> <alpine.LNX.2.21.1712191358160.3@nippy.intranet>
 <d5f920dd-6678-d3a7-d823-e6524f3611cd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:55740 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752361AbdLSXBi (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 19 Dec 2017 18:01:38 -0500
In-Reply-To: <d5f920dd-6678-d3a7-d823-e6524f3611cd@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

On Tue, 19 Dec 2017, Michael Schmitz wrote:

> 
> esp->command_block_dma is mapped at driver init time so we don't get to 
> chose at command submission time.

When the command is submitted, ops->send_dma_cmd() can do something like 
this,

static void zorro_esp_send_dma_cmd(struct esp *esp, u32 dma_addr, u32 esp_count,
                                   u32 dma_count, int write, u8 cmd);
{
	if ((dma_addr_t)dma_addr == esp->command_block_dma && esp_count < 4) {
		zorro_esp_send_pio_cmd(esp, (u32)esp->command_block, esp_count,
		                       dma_count, write, cmd);
		return;
	}

	/* do the usual DMA... */
}

This logic completely ignores data transfers (including sense transfers) 
but it is simple and self-contained and should get the job done.

>From what you said, I think you already arrived at this code (or something 
equivalent). Is there a problem? Do we have to do PIO data transfers too?

-- 

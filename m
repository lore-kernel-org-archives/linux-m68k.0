From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT
Date: Thu, 05 Jan 2012 19:02:51 +0000
Message-ID: <4F05F3DB.3090801@fairlite.co.uk>
References: <4F0488A9.5030100@fairlite.co.uk> <Pine.BSM.4.64L.1201041911580.19192@herc.mirbsd.org> <alpine.LNX.2.00.1201052128060.6601@nippy.intranet> <4F059460.5040305@fairlite.co.uk> <CAMuHMdUxQq_29g7yeaS2Ktz193CcHNX5FaP8PR9ijU0htnKbZg@mail.gmail.com> <4F059AE1.6070707@fairlite.co.uk> <4F059DB9.1050209@fairlite.co.uk> <CAMuHMdUK=2tkFtxQjua6LLGDJuEkrbK0W+mMVQ6PLBB9MfqPSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:49473 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758015Ab2AETCz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Jan 2012 14:02:55 -0500
In-Reply-To: <CAMuHMdUK=2tkFtxQjua6LLGDJuEkrbK0W+mMVQ6PLBB9MfqPSw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/01/12 14:42, Geert Uytterhoeven wrote:
> On Thu, Jan 5, 2012 at 13:55, Alan Hourihane <alanh@fairlite.co.uk> wrote:
>> Linux version 3.1.0-atari-00246-gbff0dc7 (root@server) (gcc version
> bff0dc7 = m68k-v3.1. That kernel still has the SCC driver, but it depends on
> BROKEN, so you cannot select it.
> If you revert 173808aa9203cf752518acd80fde3c9c910ddd0f ("m68k/atari: SCC
> - Mark Atari serial driver BROKEN") you can select CONFIG_ATARI_SCC again,
> and get a real serial console.
>
> But first the interrupt storm must be fixed.
>
>> unexpected interrupt from 112
> That's the vector number, so the actual IRQ number is 112 / 4 = 28, which is
> IRQ_TT_MFP_TIMD. Sorry, no clues.
>
> Can you please try a pristine v3.1? The only relevant differences are the
> conversion to the genirq framework and the Atari SCC driver.
>
> If that works, I guess it's a regression introduced by the genirq conversion.
> Then you can bisect between v3.1 and m68k-v3.1.
>
No it didn't work. Same problem.

Linux version 3.1.7-atari (root@server) (gcc version 4.5.3 (Gentoo
4.5.3-r1 p1.0, pie-0.4.5) ) #1 Thu Jan 5 18:57:55 GMT 2012
console [debug0] enabled
Atari hardware found: TT_SHIFTER ST_MFP TT_MFP TT_SCSI_DMA TT_SCSI
YM2149 PCM SCC_DMA SCC VME SCU MICROWIRE TT_CLK FDC_SPEED ACSI
Ignoring memory chunk at 0x0:0x400000 before the first chunk
Fix your bootloader or use a memfile to make use of this area!
On node 0 totalpages: 32768
free_area_init_node: node 0, pgdat 003159a8, node_mem_map 0034e000
  DMA zone: 288 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 32480 pages, LIFO batch:7
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32480
Kernel command line: console=tty fb=false video=atafb:ttmid debug=ser2
BOOT_IMAGE=vmlinux.gz
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 125372k/125372k available (2476k kernel code, 3112k data, 112k init)
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112
unexpected interrupt from 112

Alan.

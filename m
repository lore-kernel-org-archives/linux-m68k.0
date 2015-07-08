From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [RFC 0/8] m5441x: mmu support patchset
Date: Thu, 09 Jul 2015 00:07:35 +1000
Message-ID: <559D2EA7.7060909@westnet.com.au>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:57818
	"EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758480AbbGHOHl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 10:07:41 -0400
In-Reply-To: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>, linux-m68k@vger.kernel.org

Hi Yannick,

On 08/07/15 19:51, Yannick GICQUEL wrote:
> Here is a patchset proposal for MMU support on Coldfire 5441x serie.

Nice.


> This patchset allows building the mcfmmu on chip without FPU, enable the
> elf binary support and report some code from m54xx to m5441x sources
> files.
>
> Also, it contains a proposal for uImage generation.
>
>
> Functional status is OK on kernel v3.14.
> But on v4.2-rc1, we observe a map_err exit fail in do_page_fault().
> After bisecting, we point out the regression appears after the
> vm_ops->map_pages() feature integration (introduced in 8c6e50b and later)

I haven't looked in detail into this yet. But I can confirm
that it still works fine on a 5475 with MMU enabled.

Some other comments as replies to specific patches.

Regards
Greg


> Your feedbacks are welcome on this.
>
> Best Regards,
> Yannick
>
>
> Yannick GICQUEL (8):
>    m68k: coldfire: unlink FPU presence from MMU activation
>    m68k: fix build issue in setup_arch() when no FPU
>    m68k: add dummy dump_fpu() when FPU is not present
>    m68k: m5441x: add ColdFire 5441x CPU MMU memory init code
>    m68k: m5441x: fix ACR0 base address when MBAR is not present
>    m68k: m5441x: set rambar to end of SRAM physical addr space
>    m68k: mmu: add u-boot command line support in setup_arch()
>    m68k: uImage generation support
>
>   arch/m68k/Kconfig                |  2 +-
>   arch/m68k/Kconfig.cpu            |  4 +-
>   arch/m68k/Makefile               |  8 +++-
>   arch/m68k/boot/Makefile          | 45 ++++++++++++++++++++++
>   arch/m68k/coldfire/head.S        |  9 +++++
>   arch/m68k/coldfire/m5441x.c      | 47 +++++++++++++++++++++++
>   arch/m68k/include/asm/m54xxacr.h | 13 ++++++-
>   arch/m68k/kernel/process.c       |  6 ++-
>   arch/m68k/kernel/setup_mm.c      | 82 +++++++++++++++++++++++++++++++++++++++-
>   9 files changed, 209 insertions(+), 7 deletions(-)
>   create mode 100644 arch/m68k/boot/Makefile
>

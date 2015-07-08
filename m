From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: [RFC 0/8] m5441x: mmu support patchset
Date: Wed,  8 Jul 2015 11:51:24 +0200
Message-ID: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:35834 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933086AbbGHJvt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 05:51:49 -0400
Received: by wgjx7 with SMTP id x7so190630750wgj.2
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 02:51:48 -0700 (PDT)
Received: from PCL140005.eurogiciel.fr (130.167.26.109.rev.sfr.net. [109.26.167.130])
        by smtp.gmail.com with ESMTPSA id k16sm2551260wjr.7.2015.07.08.02.51.47
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 08 Jul 2015 02:51:47 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi all,

Here is a patchset proposal for MMU support on Coldfire 5441x serie.

This patchset allows building the mcfmmu on chip without FPU, enable the
elf binary support and report some code from m54xx to m5441x sources
files.

Also, it contains a proposal for uImage generation.


Functional status is OK on kernel v3.14.
But on v4.2-rc1, we observe a map_err exit fail in do_page_fault().
After bisecting, we point out the regression appears after the
vm_ops->map_pages() feature integration (introduced in 8c6e50b and later)

Your feedbacks are welcome on this.

Best Regards,
Yannick


Yannick GICQUEL (8):
  m68k: coldfire: unlink FPU presence from MMU activation
  m68k: fix build issue in setup_arch() when no FPU
  m68k: add dummy dump_fpu() when FPU is not present
  m68k: m5441x: add ColdFire 5441x CPU MMU memory init code
  m68k: m5441x: fix ACR0 base address when MBAR is not present
  m68k: m5441x: set rambar to end of SRAM physical addr space
  m68k: mmu: add u-boot command line support in setup_arch()
  m68k: uImage generation support

 arch/m68k/Kconfig                |  2 +-
 arch/m68k/Kconfig.cpu            |  4 +-
 arch/m68k/Makefile               |  8 +++-
 arch/m68k/boot/Makefile          | 45 ++++++++++++++++++++++
 arch/m68k/coldfire/head.S        |  9 +++++
 arch/m68k/coldfire/m5441x.c      | 47 +++++++++++++++++++++++
 arch/m68k/include/asm/m54xxacr.h | 13 ++++++-
 arch/m68k/kernel/process.c       |  6 ++-
 arch/m68k/kernel/setup_mm.c      | 82 +++++++++++++++++++++++++++++++++++++++-
 9 files changed, 209 insertions(+), 7 deletions(-)
 create mode 100644 arch/m68k/boot/Makefile

-- 
1.9.1.286.g5172cb3

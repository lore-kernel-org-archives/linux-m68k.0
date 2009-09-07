From: sfking@fdwdc.com
Subject: [RFC 00/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:39:50 -0700
Message-ID: <cover.1252222129.git.sfking__3093.2825095535$1252302436$gmane$org@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34372 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752446AbZIGFrA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:00 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

Simple, proof of concept for m68k / m68knommu merge.  For most of the files common to
both trees, rename the m68k version of the file by appending a _mm suffix before the
extension, and rename the m68knommu version by appending a _no suffix before the
extension and move it into the m68k tree.  Then add a wrapper to select between the two
based upon CONFIG_MMU.  The remaining files in the m68knommu tree were moved directly
to the m68k tree.  No attempt at actually merging any of the common code.

This is against Greg's git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git 
for-linus tree.

 Makefile                                           |    8 +-
 arch/m68k/Kconfig                                  |  735 ++++++++++++
 arch/m68k/Kconfig.debug                            |   33 +
 arch/m68k/Makefile                                 |  129 +++
 arch/m68k/configs/m5208evb_defconfig               |  634 ++++++++++
 arch/m68k/configs/m5249evb_defconfig               |  648 +++++++++++
 arch/m68k/configs/m5272c3_defconfig                |  646 +++++++++++
 arch/m68k/configs/m5275evb_defconfig               |  653 +++++++++++
 arch/m68k/configs/m5307c3_defconfig                |  676 +++++++++++
 arch/m68k/configs/m5407c3_defconfig                |  659 +++++++++++
 arch/m68k/kernel/Makefile                          |   18 +-
 arch/m68k/kernel/{Makefile => Makefile_mm}         |    0 
 .../kernel/Makefile => m68k/kernel/Makefile_no}    |    0 
 arch/m68k/kernel/asm-offsets.c                     |  112 +--
 .../kernel/{asm-offsets.c => asm-offsets_mm.c}     |    0 
 .../asm-offsets.c => m68k/kernel/asm-offsets_no.c} |    0 
 arch/m68k/kernel/dma.c                             |  134 +---
 arch/m68k/kernel/{dma.c => dma_mm.c}               |    0 
 .../kernel/dma.c => m68k/kernel/dma_no.c}          |    0 
 arch/m68k/kernel/entry.S                           |  762 +------------
 arch/m68k/kernel/{entry.S => entry_mm.S}           |    0 
 .../kernel/entry.S => m68k/kernel/entry_no.S}      |    0 
 arch/{m68knommu => m68k}/kernel/init_task.c        |    0 
 arch/{m68knommu => m68k}/kernel/irq.c              |    0 
 arch/m68k/kernel/m68k_ksyms.c                      |   21 +-
 arch/m68k/kernel/{m68k_ksyms.c => m68k_ksyms_mm.c} |    0 
 .../m68k_ksyms.c => m68k/kernel/m68k_ksyms_no.c}   |    0 
 arch/m68k/kernel/module.c                          |  156 +---
 arch/m68k/kernel/{module.c => module_mm.c}         |    0 
 .../kernel/module.c => m68k/kernel/module_no.c}    |    0 
 arch/m68k/kernel/process.c                         |  353 +------
 arch/m68k/kernel/{process.c => process_mm.c}       |    0 
 .../kernel/process.c => m68k/kernel/process_no.c}  |    0 
 arch/m68k/kernel/ptrace.c                          |  296 +-----
 arch/m68k/kernel/{ptrace.c => ptrace_mm.c}         |    0 
 .../kernel/ptrace.c => m68k/kernel/ptrace_no.c}    |    0 
 arch/m68k/kernel/setup.c                           |  535 +---------
 arch/m68k/kernel/{setup.c => setup_mm.c}           |    0 
 .../kernel/setup.c => m68k/kernel/setup_no.c}      |    0 
 arch/m68k/kernel/signal.c                          | 1043 +-----------------
 arch/m68k/kernel/{signal.c => signal_mm.c}         |    0 
 .../kernel/signal.c => m68k/kernel/signal_no.c}    |    0 
 arch/m68k/kernel/sys_m68k.c                        |  668 +-----------
 arch/m68k/kernel/{sys_m68k.c => sys_m68k_mm.c}     |    0 
 .../sys_m68k.c => m68k/kernel/sys_m68k_no.c}       |    0 
 arch/{m68knommu => m68k}/kernel/syscalltable.S     |    0 
 arch/m68k/kernel/time.c                            |  182 +---
 arch/m68k/kernel/{time.c => time_mm.c}             |    0 
 .../kernel/time.c => m68k/kernel/time_no.c}        |    0 
 arch/m68k/kernel/traps.c                           | 1204 +-------------------
 arch/m68k/kernel/{traps.c => traps_mm.c}           |    0 
 .../kernel/traps.c => m68k/kernel/traps_no.c}      |    0 
 arch/m68k/kernel/vmlinux.lds.S                     |   11 +-
 .../kernel/{vmlinux.lds.S => vmlinux_mm.lds.S}     |    0 
 .../vmlinux.lds.S => m68k/kernel/vmlinux_no.lds.S} |    0 
 arch/m68k/lib/Makefile                             |   11 +-
 arch/m68k/lib/{Makefile => Makefile_mm}            |    0 
 .../lib/Makefile => m68k/lib/Makefile_no}          |    0 
 arch/m68k/lib/checksum.c                           |  430 +-------
 arch/m68k/lib/{checksum.c => checksum_mm.c}        |    0 
 .../lib/checksum.c => m68k/lib/checksum_no.c}      |    0 
 arch/{m68knommu => m68k}/lib/delay.c               |    0 
 arch/{m68knommu => m68k}/lib/divsi3.S              |    0 
 arch/{m68knommu => m68k}/lib/memcpy.c              |    0 
 arch/{m68knommu => m68k}/lib/memset.c              |    0 
 arch/{m68knommu => m68k}/lib/modsi3.S              |    0 
 arch/m68k/lib/muldi3.c                             |   68 +-
 arch/m68k/lib/{muldi3.c => muldi3_mm.c}            |    0 
 .../lib/muldi3.c => m68k/lib/muldi3_no.c}          |    0 
 arch/{m68knommu => m68k}/lib/mulsi3.S              |    0 
 arch/{m68knommu => m68k}/lib/udivsi3.S             |    0 
 arch/{m68knommu => m68k}/lib/umodsi3.S             |    0 
 arch/m68k/mm/Makefile                              |   13 +-
 arch/m68k/mm/{Makefile => Makefile_mm}             |    0 
 .../{m68knommu/mm/Makefile => m68k/mm/Makefile_no} |    0 
 arch/m68k/mm/fault.c                               |  221 +----
 arch/m68k/mm/{fault.c => fault_mm.c}               |    0 
 arch/{m68knommu/mm/fault.c => m68k/mm/fault_no.c}  |    0 
 arch/m68k/mm/init.c                                |  152 +---
 arch/m68k/mm/{init.c => init_mm.c}                 |    0 
 arch/{m68knommu/mm/init.c => m68k/mm/init_no.c}    |    0 
 arch/m68k/mm/kmap.c                                |  369 +------
 arch/m68k/mm/{kmap.c => kmap_mm.c}                 |    0 
 arch/{m68knommu/mm/kmap.c => m68k/mm/kmap_no.c}    |    0 
 arch/m68k/mm/memory.c                              |  298 +-----
 arch/m68k/mm/{memory.c => memory_mm.c}             |    0 
 .../{m68knommu/mm/memory.c => m68k/mm/memory_no.c} |    0 
 arch/{m68knommu => m68k}/platform/5206/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5206/config.c    |    0 
 arch/{m68knommu => m68k}/platform/5206/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5206e/Makefile   |    0 
 arch/{m68knommu => m68k}/platform/5206e/config.c   |    0 
 arch/{m68knommu => m68k}/platform/5206e/gpio.c     |    0 
 arch/{m68knommu => m68k}/platform/520x/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/520x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/520x/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/523x/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/523x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/523x/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5249/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5249/config.c    |    0 
 arch/{m68knommu => m68k}/platform/5249/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5249/intc2.c     |    0 
 arch/{m68knommu => m68k}/platform/5272/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5272/config.c    |    0 
 arch/{m68knommu => m68k}/platform/5272/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5272/intc.c      |    0 
 arch/{m68knommu => m68k}/platform/527x/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/527x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/527x/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/528x/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/528x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/528x/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5307/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5307/config.c    |    0 
 arch/{m68knommu => m68k}/platform/5307/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/532x/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/532x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/532x/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5407/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5407/config.c    |    0 
 arch/{m68knommu => m68k}/platform/5407/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/68328/Makefile   |    0 
 arch/{m68knommu => m68k}/platform/68328/bootlogo.h |    0 
 .../{m68knommu => m68k}/platform/68328/bootlogo.pl |    0 
 arch/{m68knommu => m68k}/platform/68328/config.c   |    0 
 arch/{m68knommu => m68k}/platform/68328/entry.S    |    0 
 arch/{m68knommu => m68k}/platform/68328/head-de2.S |    0 
 .../platform/68328/head-pilot.S                    |    0 
 arch/{m68knommu => m68k}/platform/68328/head-ram.S |    0 
 arch/{m68knommu => m68k}/platform/68328/head-rom.S |    0 
 arch/{m68knommu => m68k}/platform/68328/ints.c     |    0 
 arch/{m68knommu => m68k}/platform/68328/romvec.S   |    0 
 arch/{m68knommu => m68k}/platform/68328/timers.c   |    0 
 arch/{m68knommu => m68k}/platform/68360/Makefile   |    0 
 arch/{m68knommu => m68k}/platform/68360/commproc.c |    0 
 arch/{m68knommu => m68k}/platform/68360/config.c   |    0 
 arch/{m68knommu => m68k}/platform/68360/entry.S    |    0 
 arch/{m68knommu => m68k}/platform/68360/head-ram.S |    0 
 arch/{m68knommu => m68k}/platform/68360/head-rom.S |    0 
 arch/{m68knommu => m68k}/platform/68360/ints.c     |    0 
 arch/{m68knommu => m68k}/platform/68EZ328/Makefile |    0 
 .../platform/68EZ328/bootlogo.h                    |    0 
 arch/{m68knommu => m68k}/platform/68EZ328/config.c |    0 
 arch/{m68knommu => m68k}/platform/68VZ328/Makefile |    0 
 arch/{m68knommu => m68k}/platform/68VZ328/config.c |    0 
 arch/{m68knommu => m68k}/platform/Makefile         |    0 
 .../{m68knommu => m68k}/platform/coldfire/Makefile |    0 
 arch/{m68knommu => m68k}/platform/coldfire/clk.c   |    0 
 arch/{m68knommu => m68k}/platform/coldfire/dma.c   |    0 
 .../platform/coldfire/dma_timer.c                  |    0 
 arch/{m68knommu => m68k}/platform/coldfire/entry.S |    0 
 arch/{m68knommu => m68k}/platform/coldfire/gpio.c  |    0 
 arch/{m68knommu => m68k}/platform/coldfire/head.S  |    0 
 .../{m68knommu => m68k}/platform/coldfire/intc-2.c |    0 
 .../platform/coldfire/intc-simr.c                  |    0 
 arch/{m68knommu => m68k}/platform/coldfire/intc.c  |    0 
 .../{m68knommu => m68k}/platform/coldfire/pinmux.c |    0 
 arch/{m68knommu => m68k}/platform/coldfire/pit.c   |    0 
 .../{m68knommu => m68k}/platform/coldfire/timers.c |    0 
 .../platform/coldfire/vectors.c                    |    0 
 arch/m68knommu/Kconfig                             |  734 ------------
 arch/m68knommu/Kconfig.debug                       |   35 -
 arch/m68knommu/Makefile                            |  123 --
 arch/m68knommu/configs/m5208evb_defconfig          |  633 ----------
 arch/m68knommu/configs/m5249evb_defconfig          |  647 -----------
 arch/m68knommu/configs/m5272c3_defconfig           |  645 -----------
 arch/m68knommu/configs/m5275evb_defconfig          |  652 -----------
 arch/m68knommu/configs/m5307c3_defconfig           |  675 -----------
 arch/m68knommu/configs/m5407c3_defconfig           |  658 -----------
 arch/m68knommu/defconfig                           |  620 ----------
 arch/m68knommu/lib/ashldi3.c                       |   62 -
 arch/m68knommu/lib/ashrdi3.c                       |   63 -
 arch/m68knommu/lib/lshrdi3.c                       |   62 -
 174 files changed, 4907 insertions(+), 12580 deletions(-)
 create mode 100644 arch/m68k/configs/m5208evb_defconfig
 create mode 100644 arch/m68k/configs/m5249evb_defconfig
 create mode 100644 arch/m68k/configs/m5272c3_defconfig
 create mode 100644 arch/m68k/configs/m5275evb_defconfig
 create mode 100644 arch/m68k/configs/m5307c3_defconfig
 create mode 100644 arch/m68k/configs/m5407c3_defconfig
 copy arch/m68k/kernel/{Makefile => Makefile_mm} (100%)
 rename arch/{m68knommu/kernel/Makefile => m68k/kernel/Makefile_no} (100%)
 copy arch/m68k/kernel/{asm-offsets.c => asm-offsets_mm.c} (100%)
 rename arch/{m68knommu/kernel/asm-offsets.c => m68k/kernel/asm-offsets_no.c} (100%)
 copy arch/m68k/kernel/{dma.c => dma_mm.c} (100%)
 rename arch/{m68knommu/kernel/dma.c => m68k/kernel/dma_no.c} (100%)
 copy arch/m68k/kernel/{entry.S => entry_mm.S} (100%)
 rename arch/{m68knommu/kernel/entry.S => m68k/kernel/entry_no.S} (100%)
 rename arch/{m68knommu => m68k}/kernel/init_task.c (100%)
 rename arch/{m68knommu => m68k}/kernel/irq.c (100%)
 copy arch/m68k/kernel/{m68k_ksyms.c => m68k_ksyms_mm.c} (100%)
 rename arch/{m68knommu/kernel/m68k_ksyms.c => m68k/kernel/m68k_ksyms_no.c} (100%)
 copy arch/m68k/kernel/{module.c => module_mm.c} (100%)
 rename arch/{m68knommu/kernel/module.c => m68k/kernel/module_no.c} (100%)
 copy arch/m68k/kernel/{process.c => process_mm.c} (100%)
 rename arch/{m68knommu/kernel/process.c => m68k/kernel/process_no.c} (100%)
 copy arch/m68k/kernel/{ptrace.c => ptrace_mm.c} (100%)
 rename arch/{m68knommu/kernel/ptrace.c => m68k/kernel/ptrace_no.c} (100%)
 copy arch/m68k/kernel/{setup.c => setup_mm.c} (100%)
 rename arch/{m68knommu/kernel/setup.c => m68k/kernel/setup_no.c} (100%)
 copy arch/m68k/kernel/{signal.c => signal_mm.c} (100%)
 rename arch/{m68knommu/kernel/signal.c => m68k/kernel/signal_no.c} (100%)
 copy arch/m68k/kernel/{sys_m68k.c => sys_m68k_mm.c} (100%)
 rename arch/{m68knommu/kernel/sys_m68k.c => m68k/kernel/sys_m68k_no.c} (100%)
 rename arch/{m68knommu => m68k}/kernel/syscalltable.S (100%)
 copy arch/m68k/kernel/{time.c => time_mm.c} (100%)
 rename arch/{m68knommu/kernel/time.c => m68k/kernel/time_no.c} (100%)
 copy arch/m68k/kernel/{traps.c => traps_mm.c} (100%)
 rename arch/{m68knommu/kernel/traps.c => m68k/kernel/traps_no.c} (100%)
 copy arch/m68k/kernel/{vmlinux.lds.S => vmlinux_mm.lds.S} (100%)
 rename arch/{m68knommu/kernel/vmlinux.lds.S => m68k/kernel/vmlinux_no.lds.S} (100%)
 copy arch/m68k/lib/{Makefile => Makefile_mm} (100%)
 rename arch/{m68knommu/lib/Makefile => m68k/lib/Makefile_no} (100%)
 copy arch/m68k/lib/{checksum.c => checksum_mm.c} (100%)
 rename arch/{m68knommu/lib/checksum.c => m68k/lib/checksum_no.c} (100%)
 rename arch/{m68knommu => m68k}/lib/delay.c (100%)
 rename arch/{m68knommu => m68k}/lib/divsi3.S (100%)
 rename arch/{m68knommu => m68k}/lib/memcpy.c (100%)
 rename arch/{m68knommu => m68k}/lib/memset.c (100%)
 rename arch/{m68knommu => m68k}/lib/modsi3.S (100%)
 copy arch/m68k/lib/{muldi3.c => muldi3_mm.c} (100%)
 rename arch/{m68knommu/lib/muldi3.c => m68k/lib/muldi3_no.c} (100%)
 rename arch/{m68knommu => m68k}/lib/mulsi3.S (100%)
 rename arch/{m68knommu => m68k}/lib/udivsi3.S (100%)
 rename arch/{m68knommu => m68k}/lib/umodsi3.S (100%)
 copy arch/m68k/mm/{Makefile => Makefile_mm} (100%)
 rename arch/{m68knommu/mm/Makefile => m68k/mm/Makefile_no} (100%)
 copy arch/m68k/mm/{fault.c => fault_mm.c} (100%)
 rename arch/{m68knommu/mm/fault.c => m68k/mm/fault_no.c} (100%)
 copy arch/m68k/mm/{init.c => init_mm.c} (100%)
 rename arch/{m68knommu/mm/init.c => m68k/mm/init_no.c} (100%)
 copy arch/m68k/mm/{kmap.c => kmap_mm.c} (100%)
 rename arch/{m68knommu/mm/kmap.c => m68k/mm/kmap_no.c} (100%)
 copy arch/m68k/mm/{memory.c => memory_mm.c} (100%)
 rename arch/{m68knommu/mm/memory.c => m68k/mm/memory_no.c} (100%)
 rename arch/{m68knommu => m68k}/platform/5206/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/5206/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/5206/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/5206e/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/5206e/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/5206e/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/520x/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/520x/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/520x/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/523x/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/523x/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/523x/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/5249/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/5249/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/5249/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/5249/intc2.c (100%)
 rename arch/{m68knommu => m68k}/platform/5272/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/5272/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/5272/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/5272/intc.c (100%)
 rename arch/{m68knommu => m68k}/platform/527x/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/527x/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/527x/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/528x/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/528x/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/528x/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/5307/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/5307/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/5307/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/532x/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/532x/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/532x/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/5407/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/5407/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/5407/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/68328/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/68328/bootlogo.h (100%)
 rename arch/{m68knommu => m68k}/platform/68328/bootlogo.pl (100%)
 rename arch/{m68knommu => m68k}/platform/68328/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/68328/entry.S (100%)
 rename arch/{m68knommu => m68k}/platform/68328/head-de2.S (100%)
 rename arch/{m68knommu => m68k}/platform/68328/head-pilot.S (100%)
 rename arch/{m68knommu => m68k}/platform/68328/head-ram.S (100%)
 rename arch/{m68knommu => m68k}/platform/68328/head-rom.S (100%)
 rename arch/{m68knommu => m68k}/platform/68328/ints.c (100%)
 rename arch/{m68knommu => m68k}/platform/68328/romvec.S (100%)
 rename arch/{m68knommu => m68k}/platform/68328/timers.c (100%)
 rename arch/{m68knommu => m68k}/platform/68360/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/68360/commproc.c (100%)
 rename arch/{m68knommu => m68k}/platform/68360/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/68360/entry.S (100%)
 rename arch/{m68knommu => m68k}/platform/68360/head-ram.S (100%)
 rename arch/{m68knommu => m68k}/platform/68360/head-rom.S (100%)
 rename arch/{m68knommu => m68k}/platform/68360/ints.c (100%)
 rename arch/{m68knommu => m68k}/platform/68EZ328/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/68EZ328/bootlogo.h (100%)
 rename arch/{m68knommu => m68k}/platform/68EZ328/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/68VZ328/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/68VZ328/config.c (100%)
 rename arch/{m68knommu => m68k}/platform/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/Makefile (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/clk.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/dma.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/dma_timer.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/entry.S (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/gpio.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/head.S (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/intc-2.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/intc-simr.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/intc.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/pinmux.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/pit.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/timers.c (100%)
 rename arch/{m68knommu => m68k}/platform/coldfire/vectors.c (100%)
 delete mode 100644 arch/m68knommu/Kconfig
 delete mode 100644 arch/m68knommu/Kconfig.debug
 delete mode 100644 arch/m68knommu/Makefile
 delete mode 100644 arch/m68knommu/configs/m5208evb_defconfig
 delete mode 100644 arch/m68knommu/configs/m5249evb_defconfig
 delete mode 100644 arch/m68knommu/configs/m5272c3_defconfig
 delete mode 100644 arch/m68knommu/configs/m5275evb_defconfig
 delete mode 100644 arch/m68knommu/configs/m5307c3_defconfig
 delete mode 100644 arch/m68knommu/configs/m5407c3_defconfig
 delete mode 100644 arch/m68knommu/defconfig
 delete mode 100644 arch/m68knommu/lib/ashldi3.c
 delete mode 100644 arch/m68knommu/lib/ashrdi3.c
 delete mode 100644 arch/m68knommu/lib/lshrdi3.c


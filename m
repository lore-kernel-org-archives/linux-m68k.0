From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 0/8] m68k: prepare to support ColdFire M5441x MMU enabled
Date: Mon, 29 Aug 2016 21:43:16 +1000
Message-ID: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:49426
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932628AbcH2LmF (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 29 Aug 2016 07:42:05 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

The following changes are in preparation for supporting the ColdFire
M5441x SoC with its MMU enabled. (It is already supported in the no-MMU
mode).

Quite a few relate to the ability to run with no FPU hardware (and no
software emulation of FP). I have taken CONFIG_FPU to mean that we expect
a hardware FPU to be present - and we generate code to support that in
the kernel. If CONFIG_FPU is not defined we generate no support code
(so no use of FPU specific instructions). That is mostly what the code
already did, but not comepletely.

I don't actually enable the M5441x to run with MMU enabled in this
series. I don't have that hardware, so I can't verify that it actually
works. But these changes don't break the m547x, so I expect all is ok.
With the extra MMU enabling configuration line added you can cleanly
build for the M5441x with MMU enabled after this series though.

These patches are based on the ideas from Yannick Gicquel's
<yannick.gicquel@open.eurogiciel.org> patches from some time back.

Regards
Greg


 arch/m68k/Kconfig                     |    1
 arch/m68k/Kconfig.cpu                 |    6 +++++
 arch/m68k/coldfire/head.S             |    8 +++---
 arch/m68k/coldfire/m54xx.c            |   40 ----------------------------------
 arch/m68k/include/asm/m5441xsim.h     |    4 +++
 arch/m68k/include/asm/m54xxacr.h      |    2 -
 arch/m68k/include/asm/m54xxsim.h      |    4 +++
 arch/m68k/include/asm/mcfmmu.h        |    1
 arch/m68k/include/uapi/asm/bootinfo.h |    1
 arch/m68k/kernel/process.c            |    4 +--
 arch/m68k/kernel/setup_mm.c           |    5 ++--
 arch/m68k/mm/mcfmmu.c                 |   31 +++++++++++++++++++++++++-
 12 files changed, 57 insertions(+), 50 deletions(-)

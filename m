Return-Path: <SRS0=WB/I=7O=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76ACC433DF
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 21:00:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA87E20734
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 21:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgFAVAW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Jun 2020 17:00:22 -0400
Received: from mga03.intel.com ([134.134.136.65]:32481 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727096AbgFAVAV (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Jun 2020 17:00:21 -0400
IronPort-SDR: 23GBXS/IYC2pAhc4qJXE/wkPc/TkdIvUFuagMAvmGnV9W63IJ4SgddcQkrBfnYhRxCRTehTcWT
 5wJkPuimwHdw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 14:00:19 -0700
IronPort-SDR: pOVP8Jcxb200ucRPfqwAax6mkFCcBn0LipPZCsCHmN6Cp2UYCE7dgvyT277rtyQMwuvV3V+bz1
 zA+BwtZa0jjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,462,1583222400"; 
   d="scan'208";a="312063064"
Received: from lkp-server01.sh.intel.com (HELO 78d03bb9d680) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Jun 2020 14:00:18 -0700
Received: from kbuild by 78d03bb9d680 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jfrXd-0000Ax-DJ; Mon, 01 Jun 2020 21:00:17 +0000
Date:   Tue, 02 Jun 2020 04:59:51 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 95e63f06023f601c2d7d8ca89ed4b5a4154a3b9f
Message-ID: <5ed56c47.tm4elwZgvukALh9A%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 95e63f06023f601c2d7d8ca89ed4b5a4154a3b9f  fat: Use correct logical sector size for Atari GEMDOS FAT

Warning in current branch:

drivers/usb/host/isp116x.h:370:87: note: in expansion of macro 'isa_rom_writew_raw'
drivers/usb/host/isp116x.h:372:91: note: in expansion of macro 'isa_rom_writew'
drivers/usb/host/isp116x.h:391:2: note: in expansion of macro 'isp_writew'
drivers/usb/host/isp116x.h:403:2: note: in expansion of macro 'isp_raw_writew'

Warning ids grouped by kconfigs:

recent_errors
|-- m68k-allmodconfig
|   |-- drivers-usb-host-isp116x.h:note:in-expansion-of-macro-isa_rom_writew
|   |-- drivers-usb-host-isp116x.h:note:in-expansion-of-macro-isa_rom_writew_raw
|   |-- drivers-usb-host-isp116x.h:note:in-expansion-of-macro-isp_raw_writew
|   `-- drivers-usb-host-isp116x.h:note:in-expansion-of-macro-isp_writew
`-- m68k-allyesconfig
    |-- drivers-usb-host-isp116x.h:note:in-expansion-of-macro-isa_rom_writew
    |-- drivers-usb-host-isp116x.h:note:in-expansion-of-macro-isa_rom_writew_raw
    |-- drivers-usb-host-isp116x.h:note:in-expansion-of-macro-isp_raw_writew
    `-- drivers-usb-host-isp116x.h:note:in-expansion-of-macro-isp_writew

elapsed time: 484m

configs tested: 94
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
x86_64                              defconfig
s390                                defconfig
sh                           cayman_defconfig
xtensa                generic_kc705_defconfig
openrisc                         alldefconfig
openrisc                            defconfig
arm                        neponset_defconfig
arm                      jornada720_defconfig
nds32                            alldefconfig
mips                         tb0287_defconfig
sh                         microdev_defconfig
powerpc                       holly_defconfig
powerpc                mpc7448_hpc2_defconfig
h8300                       h8s-sim_defconfig
arm                       imx_v4_v5_defconfig
mips                     decstation_defconfig
arm                          collie_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc                            allyesconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

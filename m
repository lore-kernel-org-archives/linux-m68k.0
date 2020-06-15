Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6D5C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 15:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 785ED20679
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 15:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbgFOP4t (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 11:56:49 -0400
Received: from mga03.intel.com ([134.134.136.65]:45743 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbgFOP4s (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 Jun 2020 11:56:48 -0400
IronPort-SDR: Pi/M+rDydD9Ruo2IJ4O1Fi4YiikFOl9Q91kiNyB/IlOBT2YWGJFhOG2o1fqi8h5nnb3ZlLM89V
 Lr7lF5vjX9Dw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:56:47 -0700
IronPort-SDR: MD4CLukifX48wAERjifNK+fpsIlRQONVnzlCpPZR3XJ1KrK2uEMMB0YoQRy7XdQ26y5KyUJqd5
 0cSCj6cibMEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; 
   d="scan'208";a="272817339"
Received: from lkp-server02.sh.intel.com (HELO ec7aa6149bd9) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Jun 2020 08:56:46 -0700
Received: from kbuild by ec7aa6149bd9 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jkrTZ-00004o-Qp; Mon, 15 Jun 2020 15:56:45 +0000
Date:   Mon, 15 Jun 2020 23:55:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 6b12625aca1ff016cef6e39975e6a59f23014b91
Message-ID: <5ee79a02.EyFeC/Y/qXarbsFX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 6b12625aca1ff016cef6e39975e6a59f23014b91  fat: Use correct logical sector size for Atari GEMDOS FAT

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

elapsed time: 480m

configs tested: 102
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sh                   secureedge5410_defconfig
mips                       capcella_defconfig
sparc64                          alldefconfig
arm                         s3c2410_defconfig
arc                          axs103_defconfig
arm                             pxa_defconfig
um                           x86_64_defconfig
mips                      pic32mzda_defconfig
arm                       versatile_defconfig
ia64                      gensparse_defconfig
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
openrisc                            defconfig
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
i386                 randconfig-a006-20200615
i386                 randconfig-a002-20200615
i386                 randconfig-a001-20200615
i386                 randconfig-a004-20200615
i386                 randconfig-a005-20200615
i386                 randconfig-a003-20200615
i386                 randconfig-a015-20200615
i386                 randconfig-a011-20200615
i386                 randconfig-a014-20200615
i386                 randconfig-a013-20200615
i386                 randconfig-a016-20200615
i386                 randconfig-a012-20200615
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
um                               allmodconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

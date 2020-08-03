Return-Path: <SRS0=9X71=BN=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF9EC433DF
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 23:29:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 430462076E
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 23:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbgHCX3n (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:29:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:17380 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727091AbgHCX3n (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Aug 2020 19:29:43 -0400
IronPort-SDR: z0QhwBbxTs0J+NQ0ofGuQRIPzvHlgQyNW3aqCNi8jIMt90QNnQxNiB61FyDfo4bfM3mCzqgzqu
 +d1BlL3XnEjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="213760528"
X-IronPort-AV: E=Sophos;i="5.75,431,1589266800"; 
   d="scan'208";a="213760528"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 16:29:42 -0700
IronPort-SDR: 4qCToA/ncNj4d5R2BbYWtU3y3hKNy3wHtq0v23T1jGRJ3Becni3816bnxrl4/zdZrc6xDpghrV
 nU/JuLW9tv2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,431,1589266800"; 
   d="scan'208";a="275559093"
Received: from lkp-server02.sh.intel.com (HELO 84ccfe698a63) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2020 16:29:41 -0700
Received: from kbuild by 84ccfe698a63 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k2jtk-0000IR-HW; Mon, 03 Aug 2020 23:29:40 +0000
Date:   Tue, 04 Aug 2020 07:29:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 fcd6fab3f4748ca1bd431e25c8db3d15fb631009
Message-ID: <5f289ddd.ceR9Jxqo1Y3MY97K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: fcd6fab3f4748ca1bd431e25c8db3d15fb631009  Merge tag 'v5.8'

elapsed time: 723m

configs tested: 98
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                        generic_defconfig
m68k                       bvme6000_defconfig
arm                          pxa168_defconfig
mips                 pnx8335_stb225_defconfig
sparc64                          alldefconfig
arm                          badge4_defconfig
arm                          ixp4xx_defconfig
sh                          lboxre2_defconfig
arm                    vt8500_v6_v7_defconfig
arm                            lart_defconfig
mips                        omega2p_defconfig
mips                     loongson1c_defconfig
xtensa                           alldefconfig
arm                       aspeed_g4_defconfig
arc                          axs101_defconfig
powerpc                    amigaone_defconfig
sh                   sh7770_generic_defconfig
mips                        bcm47xx_defconfig
h8300                    h8300h-sim_defconfig
nds32                             allnoconfig
powerpc                          alldefconfig
mips                      bmips_stb_defconfig
arm                        magician_defconfig
arm                             pxa_defconfig
sh                             sh03_defconfig
mips                         db1xxx_defconfig
arm                        trizeps4_defconfig
powerpc                     powernv_defconfig
mips                        maltaup_defconfig
c6x                         dsk6455_defconfig
arm                         palmz72_defconfig
parisc                           alldefconfig
mips                           ip32_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a004-20200803
i386                 randconfig-a005-20200803
i386                 randconfig-a001-20200803
i386                 randconfig-a002-20200803
i386                 randconfig-a003-20200803
i386                 randconfig-a006-20200803
x86_64               randconfig-a013-20200803
x86_64               randconfig-a011-20200803
x86_64               randconfig-a012-20200803
x86_64               randconfig-a016-20200803
x86_64               randconfig-a015-20200803
x86_64               randconfig-a014-20200803
i386                 randconfig-a011-20200803
i386                 randconfig-a012-20200803
i386                 randconfig-a015-20200803
i386                 randconfig-a014-20200803
i386                 randconfig-a013-20200803
i386                 randconfig-a016-20200803
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

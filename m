Return-Path: <SRS0=9X71=BN=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691C4C433E0
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 23:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 824F42076E
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 23:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgHCX3u (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:29:50 -0400
Received: from mga02.intel.com ([134.134.136.20]:64315 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727091AbgHCX3t (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Aug 2020 19:29:49 -0400
IronPort-SDR: ni9aTiIKFwFfokAd8/IFtg2ylY9Qm9mirw2Tr9UaRTCgwkt+HiYU9NAWbWkbF0L4Bejre66Taf
 byKjwCxK5cfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="140147038"
X-IronPort-AV: E=Sophos;i="5.75,431,1589266800"; 
   d="scan'208";a="140147038"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 16:29:47 -0700
IronPort-SDR: XqxHfAPkNNXfAXMNZSyqchPAZ/DPxkhh14g/p8BX2Pq0OBqILE3cYBg1IJAqLb0EPOvcbCxxki
 WcucQFqoPpRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,431,1589266800"; 
   d="scan'208";a="396350125"
Received: from lkp-server02.sh.intel.com (HELO 84ccfe698a63) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2020 16:29:46 -0700
Received: from kbuild by 84ccfe698a63 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k2jtp-0000IU-Ed; Mon, 03 Aug 2020 23:29:45 +0000
Date:   Tue, 04 Aug 2020 07:29:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 9f2606b55aca95fc75e92af24fc298bad136ca24
Message-ID: <5f289dde.0l8PX8HFAny/s8N7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 9f2606b55aca95fc75e92af24fc298bad136ca24  fat: Use correct logical sector size for Atari GEMDOS FAT

elapsed time: 725m

configs tested: 99
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            lart_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                             allmodconfig
sparc64                             defconfig
ia64                        generic_defconfig
m68k                       bvme6000_defconfig
arm                          pxa168_defconfig
h8300                     edosk2674_defconfig
arm                        shmobile_defconfig
c6x                                 defconfig
arm                            mmp2_defconfig
arm                         lubbock_defconfig
arc                     nsimosci_hs_defconfig
mips                 pnx8335_stb225_defconfig
sparc64                          alldefconfig
arm                          badge4_defconfig
arm                          ixp4xx_defconfig
sh                          lboxre2_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        omega2p_defconfig
mips                     loongson1c_defconfig
xtensa                           alldefconfig
xtensa                generic_kc705_defconfig
sh                ecovec24-romimage_defconfig
arm                      footbridge_defconfig
arm                     am200epdkit_defconfig
parisc                           alldefconfig
mips                           ip32_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
x86_64               randconfig-a006-20200804
x86_64               randconfig-a001-20200804
x86_64               randconfig-a004-20200804
x86_64               randconfig-a005-20200804
x86_64               randconfig-a002-20200804
x86_64               randconfig-a003-20200804
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

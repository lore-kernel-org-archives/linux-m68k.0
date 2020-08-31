Return-Path: <SRS0=I5t9=CJ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3055BC433E6
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Aug 2020 21:40:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FBED2083E
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Aug 2020 21:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730292AbgHaVk3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Aug 2020 17:40:29 -0400
Received: from mga14.intel.com ([192.55.52.115]:45388 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730291AbgHaVk3 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Aug 2020 17:40:29 -0400
IronPort-SDR: rCgA/YtPwZ6/bVCJBE6eoCrX9R/Is5gJ2kVXthP7xNTjPuvhVG4Pj4qxfoUSit6TMrfotz34c2
 QDdnhmVvNlng==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="156322338"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="156322338"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 14:40:26 -0700
IronPort-SDR: cTn4QEesp4tj0HqaV6c7EZ0rHDWM2JlFNRwZXlphb02XYWIgWD4ic2wSVoikcWalKotXyrNfDH
 8CQpI8w+q65A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="301196898"
Received: from lkp-server02.sh.intel.com (HELO 713faec3b0e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 31 Aug 2020 14:40:24 -0700
Received: from kbuild by 713faec3b0e5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kCrXM-0000Cw-8Q; Mon, 31 Aug 2020 21:40:24 +0000
Date:   Tue, 01 Sep 2020 05:39:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 6487dce21c44bfa4c57b41c9d626649f2473470e
Message-ID: <5f4d6e20.RkAWGQAeWvVvFeUc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 6487dce21c44bfa4c57b41c9d626649f2473470e  Merge tag 'v5.9-rc3'

elapsed time: 721m

configs tested: 91
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                            q40_defconfig
arm                       cns3420vb_defconfig
m68k                       m5208evb_defconfig
mips                          rm200_defconfig
mips                     cu1000-neo_defconfig
riscv                               defconfig
sh                          rsk7203_defconfig
sh                          urquell_defconfig
openrisc                         alldefconfig
sh                          r7785rp_defconfig
mips                      pic32mzda_defconfig
sh                          sdk7780_defconfig
mips                  decstation_64_defconfig
arm                        trizeps4_defconfig
mips                         tb0287_defconfig
arm                         socfpga_defconfig
sh                           se7751_defconfig
um                             i386_defconfig
m68k                        stmark2_defconfig
mips                        jmr3927_defconfig
arm                          ixp4xx_defconfig
ia64                             alldefconfig
arm                         nhk8815_defconfig
sh                           se7722_defconfig
arm                          exynos_defconfig
sh                              ul2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200831
i386                 randconfig-a002-20200831
i386                 randconfig-a004-20200831
i386                 randconfig-a006-20200831
i386                 randconfig-a005-20200831
i386                 randconfig-a003-20200831
x86_64               randconfig-a012-20200831
x86_64               randconfig-a015-20200831
x86_64               randconfig-a014-20200831
x86_64               randconfig-a011-20200831
x86_64               randconfig-a016-20200831
x86_64               randconfig-a013-20200831
i386                 randconfig-a013-20200831
i386                 randconfig-a011-20200831
i386                 randconfig-a012-20200831
i386                 randconfig-a015-20200831
i386                 randconfig-a016-20200831
i386                 randconfig-a014-20200831
riscv                            allyesconfig
riscv                             allnoconfig
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

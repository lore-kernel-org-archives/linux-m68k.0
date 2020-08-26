Return-Path: <SRS0=i6Xs=CE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B595CC433DF
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 23:39:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8665F2074A
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 23:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgHZXjG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Aug 2020 19:39:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:5054 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbgHZXjG (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Aug 2020 19:39:06 -0400
IronPort-SDR: DI5Y35WdxOQEDJyj3uiYGyXnSgI17H44/vZBNMNf9ZDcvkSmKhlhkAx/zzmC9EHhA+FJmIQxzm
 3wb/QBLkBV3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="217947839"
X-IronPort-AV: E=Sophos;i="5.76,357,1592895600"; 
   d="scan'208";a="217947839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 16:39:03 -0700
IronPort-SDR: siO1gduTC1HWKzD+dnnDk+wa3dNPG8KCUdBHqcAyqy+OeDAoQuCVbKCARTmULzTIbNxJ3V70Fk
 UUD4F67s9GKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,357,1592895600"; 
   d="scan'208";a="281943478"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Aug 2020 16:39:00 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kB50O-0001lN-5R; Wed, 26 Aug 2020 23:39:00 +0000
Date:   Thu, 27 Aug 2020 07:38:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 d0e85366d55ae1bed7b67a0a6d7812f295b1e5f1
Message-ID: <5f46f27b.7Husr6YYjZdh9bDZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: d0e85366d55ae1bed7b67a0a6d7812f295b1e5f1  m68k: Correct some typos in comments

elapsed time: 721m

configs tested: 86
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      fuloong2e_defconfig
arm                          pxa910_defconfig
m68k                        stmark2_defconfig
arc                          axs103_defconfig
arm                           corgi_defconfig
h8300                               defconfig
microblaze                    nommu_defconfig
arm                       aspeed_g4_defconfig
m68k                          sun3x_defconfig
m68k                       bvme6000_defconfig
arm                            zeus_defconfig
i386                             allyesconfig
powerpc                    adder875_defconfig
sh                           se7751_defconfig
powerpc                          g5_defconfig
mips                     loongson1c_defconfig
mips                           ip28_defconfig
powerpc                     powernv_defconfig
nios2                         10m50_defconfig
xtensa                              defconfig
sh                        edosk7705_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200826
i386                 randconfig-a004-20200826
i386                 randconfig-a003-20200826
i386                 randconfig-a005-20200826
i386                 randconfig-a006-20200826
i386                 randconfig-a001-20200826
x86_64               randconfig-a015-20200826
x86_64               randconfig-a016-20200826
x86_64               randconfig-a012-20200826
x86_64               randconfig-a014-20200826
x86_64               randconfig-a011-20200826
x86_64               randconfig-a013-20200826
i386                 randconfig-a013-20200826
i386                 randconfig-a012-20200826
i386                 randconfig-a011-20200826
i386                 randconfig-a016-20200826
i386                 randconfig-a015-20200826
i386                 randconfig-a014-20200826
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

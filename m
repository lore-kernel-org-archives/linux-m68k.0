Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B568C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Mar 2022 05:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiCAFwd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Mar 2022 00:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiCAFwc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Mar 2022 00:52:32 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69EF6B0A8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Feb 2022 21:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646113912; x=1677649912;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1ZfQTOw/uNhOVrIw4C/alkMB+Nm+MZHgTrcyCm6AD8U=;
  b=Hhw2OMyOg5R9/e9SIl5zamB0+0wdHsTOm8KuSObPCAeTypTyQMlBYb54
   0JTIoxnhTw8IkNCgizNZodnZ1BhCjVVQZLD0ZQ/CqHAPQ/HmUplWk1N2j
   k0lKd0uvvplgRBZqOrJIvIXolFa/2ROudmDkQfIyWs23tZv3s3i4QJzZZ
   c7guD5y4Wzme6m1tNuReElmc+RZsvMI2k7wvAVpqvyU+kv8ibA8yUOo7I
   HJod9Y2UdwgsRxhqhmc1ufZKUeQEEOUI7Ycvvms+Gx5/smHZDxfKD5Ibc
   qEn4Kfi23zHhTao2YQVY74HDyuD0K9Z2vXAafl6LdG/Tt5FsYao8OMO6I
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="313785204"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="313785204"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 21:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="544977472"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2022 21:51:50 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOvQM-0008E0-46; Tue, 01 Mar 2022 05:51:50 +0000
Date:   Tue, 01 Mar 2022 13:51:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 5ff519ee9a5aa7daddbd28200d3f71b649c13358
Message-ID: <621db447.ovEdFgMWei37R4wc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 5ff519ee9a5aa7daddbd28200d3f71b649c13358  Merge tag 'v5.17-rc6'

elapsed time: 773m

configs tested: 129
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
arm                            lart_defconfig
arm                         assabet_defconfig
arm                          simpad_defconfig
sh                           se7780_defconfig
mips                           ip32_defconfig
mips                           jazz_defconfig
arm                         s3c6400_defconfig
powerpc                     mpc83xx_defconfig
m68k                        m5307c3_defconfig
arm                          pxa3xx_defconfig
m68k                          multi_defconfig
arm                          gemini_defconfig
powerpc                      makalu_defconfig
sh                          rsk7269_defconfig
sh                        sh7757lcr_defconfig
arc                        vdk_hs38_defconfig
m68k                         apollo_defconfig
arm                        spear6xx_defconfig
m68k                          amiga_defconfig
arm                           viper_defconfig
arm                  randconfig-c002-20220228
arm                  randconfig-c002-20220227
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20220228
x86_64               randconfig-a013-20220228
x86_64               randconfig-a015-20220228
x86_64               randconfig-a014-20220228
x86_64               randconfig-a016-20220228
x86_64               randconfig-a012-20220228
i386                 randconfig-a011-20220228
i386                 randconfig-a012-20220228
i386                 randconfig-a013-20220228
i386                 randconfig-a015-20220228
i386                 randconfig-a014-20220228
i386                 randconfig-a016-20220228
s390                 randconfig-r044-20220228
arc                  randconfig-r043-20220228
riscv                randconfig-r042-20220228
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
mips                 randconfig-c004-20220227
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220227
i386                          randconfig-c001
arm                  randconfig-c002-20220227
riscv                randconfig-c006-20220227
s390                 randconfig-c005-20220227
powerpc                     powernv_defconfig
powerpc                    ge_imp3a_defconfig
mips                           rs90_defconfig
mips                           mtx1_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
arm64                            allyesconfig
arm                        mvebu_v5_defconfig
mips                           ip28_defconfig
arm                          imote2_defconfig
mips                        bcm63xx_defconfig
arm                         s3c2410_defconfig
mips                       lemote2f_defconfig
i386                 randconfig-a002-20220228
i386                 randconfig-a001-20220228
i386                 randconfig-a005-20220228
i386                 randconfig-a003-20220228
i386                 randconfig-a006-20220228
i386                 randconfig-a004-20220228
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a001-20220228
x86_64               randconfig-a006-20220228
x86_64               randconfig-a004-20220228
x86_64               randconfig-a003-20220228
x86_64               randconfig-a005-20220228
x86_64               randconfig-a002-20220228
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
riscv                randconfig-r042-20220227

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

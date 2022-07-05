Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDFDC43334
	for <linux-m68k@archiver.kernel.org>; Tue,  5 Jul 2022 07:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiGEHHR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 5 Jul 2022 03:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiGEHHC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 5 Jul 2022 03:07:02 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5FB13D1B
        for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Jul 2022 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657004795; x=1688540795;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Cf0ZxiGXmbdYJU92RmbpAaaX2pwcKioAwBTWFD3IlQ4=;
  b=ArFDLHRBU6WYVO9SjWCV6dqPqNWC8caBeR+hbHYsa0vfsf5ef5GkhMcF
   3pp0K1pD/VMAdsHsh3ZOK/ON0SQucxjD2hntqTgMMXOBpdq6ky1mrOu6n
   c6wyUKkupjL8wPqIr3RlKRT6vDQxiqO8uYcWbWtu4c+ZPNwpRPor3cWTQ
   a9YPyCaiWoP08s7Ab0B547UhXJb50Ue8l0/mIKkmDoliDwNQ7ZcH0UrQA
   k0SS7z42AwNa69ER4qs6/PPoMuiwLTkerDAfKRgx3OdS30iVF83SMfbVA
   9Zh1GPlqAyNrNKnNvPYi9bCNceTYgWfpwDkAw04h2SBZd20QndV4YCpOS
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="347252570"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="347252570"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 00:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="695551672"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2022 00:06:32 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o8cdj-000Ipw-Cn;
        Tue, 05 Jul 2022 07:06:31 +0000
Date:   Tue, 05 Jul 2022 15:05:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.20] BUILD SUCCESS
 4977636d44b8d02cab7d04616283005b733477d7
Message-ID: <62c3e2bd.ezD7nZP3d/IsgTPU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.20
branch HEAD: 4977636d44b8d02cab7d04616283005b733477d7  m68k: q40: Align '*' in comments

elapsed time: 723m

configs tested: 69
configs skipped: 103

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc                         wii_defconfig
powerpc                      tqm8xx_defconfig
powerpc                       maple_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc834x_mds_defconfig
sh                   secureedge5410_defconfig
arm                      integrator_defconfig
sh                   rts7751r2dplus_defconfig
arm                         cm_x300_defconfig
m68k                        stmark2_defconfig
powerpc                       ppc64_defconfig
powerpc                 linkstation_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220703
arc                  randconfig-r043-20220703
s390                 randconfig-r044-20220703
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
riscv                             allnoconfig
arm                          collie_defconfig
mips                          ath79_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                              alldefconfig
arm                         hackkit_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                     mpc5200_defconfig
mips                          ath25_defconfig
arm                         orion5x_defconfig
mips                         tb0287_defconfig
mips                     loongson2k_defconfig
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220703
hexagon              randconfig-r041-20220703

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

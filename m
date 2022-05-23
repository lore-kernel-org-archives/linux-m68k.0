Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CE4C433FE
	for <linux-m68k@archiver.kernel.org>; Mon, 23 May 2022 22:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiEWWOI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 May 2022 18:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiEWWOH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 May 2022 18:14:07 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB746EC53
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 May 2022 15:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653344046; x=1684880046;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BkBh9w15ENV9R5xbdwRUSfaPvhbfc9RqioaoLtxpF5o=;
  b=SNqfNflu10hRcJhvVG0FVKEs/P1bynyTMDozscydnkrGpZQNBWnXKaB1
   jqa9WiyPEjwRXQHQMC4ClWHFOK0mjVUFluox2V2cy3xcXitjgw5RrEjYb
   baLMSvnYjBtNt+fZhkFpIvXin9taxictTdq3o1s2zaLfzTMRLthbTtMom
   pZJk0RIFw+Y9aqXoF8ur0oBTwY6PIdmkPf5VDR/oJdtBeCZebe4NFLZC5
   zJq2KlZqv2W2WoqArWv1BbMxqlpypua1hw50ze/q1wmNwnpvY5rAOS5FK
   fjcieM5+Mk7BHNl17yQlKQ+ZoTj2yd+GJutUjJpdaG3FVcaXkUAPuP+TQ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="359769058"
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; 
   d="scan'208";a="359769058"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 15:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; 
   d="scan'208";a="663644278"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 May 2022 15:14:04 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ntGJP-0001Tb-Fs;
        Mon, 23 May 2022 22:14:03 +0000
Date:   Tue, 24 May 2022 06:13:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v5.18] BUILD SUCCESS
 93c071b060b9c0298a56841f9a129d17594a5d38
Message-ID: <628c0722.JZeu4KvEkTscP1nM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v5.18
branch HEAD: 93c071b060b9c0298a56841f9a129d17594a5d38  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 726m

configs tested: 150
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                           stm32_defconfig
sparc                       sparc64_defconfig
sh                         ecovec24_defconfig
sh                               allmodconfig
arm                         lpc18xx_defconfig
powerpc                     rainier_defconfig
powerpc                     tqm8541_defconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
nios2                            alldefconfig
csky                             alldefconfig
um                             i386_defconfig
um                                  defconfig
arm                            lart_defconfig
mips                            ar7_defconfig
mips                           jazz_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                          pxa910_defconfig
openrisc                         alldefconfig
mips                     decstation_defconfig
m68k                             allyesconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
m68k                          hp300_defconfig
m68k                             alldefconfig
sh                           sh2007_defconfig
arm                         axm55xx_defconfig
arm                          gemini_defconfig
mips                 decstation_r4k_defconfig
arm                  randconfig-c002-20220522
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
riscv                             allnoconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220523
x86_64               randconfig-a006-20220523
x86_64               randconfig-a001-20220523
x86_64               randconfig-a004-20220523
x86_64               randconfig-a002-20220523
x86_64               randconfig-a005-20220523
i386                 randconfig-a001-20220523
i386                 randconfig-a006-20220523
i386                 randconfig-a002-20220523
i386                 randconfig-a005-20220523
i386                 randconfig-a003-20220523
i386                 randconfig-a004-20220523
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220523
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                  randconfig-c002-20220522
x86_64                        randconfig-c007
s390                 randconfig-c005-20220522
i386                          randconfig-c001
powerpc              randconfig-c003-20220522
riscv                randconfig-c006-20220522
mips                 randconfig-c004-20220522
powerpc                          allyesconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc44x_defconfig
arm                           omap1_defconfig
s390                             alldefconfig
arm                            mmp2_defconfig
mips                     cu1830-neo_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
powerpc                          g5_defconfig
mips                     loongson1c_defconfig
powerpc                   bluestone_defconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
powerpc                     ppa8548_defconfig
powerpc                    socrates_defconfig
arm                        neponset_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a011-20220523
x86_64               randconfig-a012-20220523
x86_64               randconfig-a016-20220523
x86_64               randconfig-a015-20220523
x86_64               randconfig-a013-20220523
x86_64               randconfig-a014-20220523
i386                 randconfig-a014-20220523
i386                 randconfig-a011-20220523
i386                 randconfig-a013-20220523
i386                 randconfig-a016-20220523
i386                 randconfig-a012-20220523
i386                 randconfig-a015-20220523
hexagon              randconfig-r045-20220523
hexagon              randconfig-r045-20220522
hexagon              randconfig-r041-20220523
hexagon              randconfig-r041-20220522
s390                 randconfig-r044-20220523
riscv                randconfig-r042-20220523
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

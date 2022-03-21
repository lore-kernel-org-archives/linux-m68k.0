Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ECFC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Mar 2022 22:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbiCUXAa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Mar 2022 19:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbiCUW6d (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Mar 2022 18:58:33 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9953B5A86
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Mar 2022 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647902160; x=1679438160;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rQYWTLeUIlg85ZmHo0YGDD1NrpZGxMJEyORVPFjsf7A=;
  b=lZwqwNcE+ZHGadBtJjbpbkKtlNhkEzYGM0v0P9Ek92ziotQSQCw7XFxK
   pxfcBqpe+bbPJUFtzVQeg9FrcrG0VgIS7DDJviXdeb2X3nxIIlP5BIMy2
   Uc/WeP9swjMdgiZed1cS7nxKQfW0JWajtSnPh5F5VZxu5v/S7yl5MXCcI
   J1NBv9e88J/nfr/7HU1ZaV0xobzXQuZK/9inn1LFnBRioLJDhxupRklBV
   PdQFGz2eowWcQQgDXOwm4NNQ5/6xvvaENr8N2yRM97fUoIpDAzLpe8vr1
   rimrHrTDkER0De8RyBxi1ADoacEXGISqkLj0KSfhd4IEtu3FHsGKNQ/VH
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="255226517"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="255226517"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 15:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="500330532"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Mar 2022 15:35:55 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWQd0-000ICw-5e; Mon, 21 Mar 2022 22:35:54 +0000
Date:   Tue, 22 Mar 2022 06:35:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v5.17] BUILD SUCCESS
 5e1850bb3c647ceb323efc380b4e7f0c60189be2
Message-ID: <6238fdbb.+2RxM8a05/fgeDXl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v5.17
branch HEAD: 5e1850bb3c647ceb323efc380b4e7f0c60189be2  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 729m

configs tested: 164
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220321
mips                 randconfig-c004-20220320
i386                          randconfig-c001
arm                        keystone_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         nhk8815_defconfig
arm                           corgi_defconfig
s390                             allmodconfig
powerpc                        cell_defconfig
arm                        oxnas_v6_defconfig
riscv                    nommu_k210_defconfig
m68k                             alldefconfig
m68k                       m5475evb_defconfig
arm                         cm_x300_defconfig
sh                             sh03_defconfig
mips                      maltasmvp_defconfig
mips                         rt305x_defconfig
openrisc                  or1klitex_defconfig
powerpc                 mpc837x_mds_defconfig
sh                      rts7751r2d1_defconfig
sh                        edosk7760_defconfig
arc                        nsimosci_defconfig
sh                          rsk7201_defconfig
alpha                            allyesconfig
arc                 nsimosci_hs_smp_defconfig
sh                               j2_defconfig
sh                          rsk7269_defconfig
nios2                         10m50_defconfig
powerpc64                           defconfig
ia64                                defconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                     edosk2674_defconfig
sh                         microdev_defconfig
sh                              ul2_defconfig
um                                  defconfig
arc                          axs103_defconfig
arm                          pxa3xx_defconfig
arc                                 defconfig
sh                          urquell_defconfig
csky                             alldefconfig
powerpc                     ep8248e_defconfig
arm                        mini2440_defconfig
xtensa                          iss_defconfig
arm64                            alldefconfig
m68k                             allmodconfig
powerpc                       ppc64_defconfig
arm                            mps2_defconfig
xtensa                    xip_kc705_defconfig
arc                            hsdk_defconfig
um                               alldefconfig
mips                        vocore2_defconfig
arm                            hisi_defconfig
m68k                        mvme147_defconfig
arm                  randconfig-c002-20220321
arm                  randconfig-c002-20220320
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a016-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a013-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a015-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a014-20220321
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220320
arm                  randconfig-c002-20220320
powerpc              randconfig-c003-20220320
riscv                randconfig-c006-20220320
i386                          randconfig-c001
arm                          moxart_defconfig
mips                      bmips_stb_defconfig
powerpc                          allmodconfig
powerpc                      ppc64e_defconfig
powerpc                          allyesconfig
mips                malta_qemu_32r6_defconfig
mips                         tb0287_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                          ep93xx_defconfig
powerpc                  mpc866_ads_defconfig
mips                       rbtx49xx_defconfig
arm                       netwinder_defconfig
arm                       cns3420vb_defconfig
riscv                          rv32_defconfig
powerpc                     mpc512x_defconfig
arm                          imote2_defconfig
arm                          pxa168_defconfig
mips                       lemote2f_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                       ebony_defconfig
riscv                             allnoconfig
x86_64               randconfig-a001-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a006-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a006-20220321
i386                 randconfig-a003-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a002-20220321
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220320
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220321
hexagon              randconfig-r041-20220320
riscv                randconfig-r042-20220322
hexagon              randconfig-r045-20220322
hexagon              randconfig-r041-20220322

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

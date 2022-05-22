Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67316C433EF
	for <linux-m68k@archiver.kernel.org>; Sun, 22 May 2022 06:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241370AbiEVGoW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 May 2022 02:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239924AbiEVGoQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 22 May 2022 02:44:16 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E8620BFE
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 May 2022 23:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653201855; x=1684737855;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=B4d8fc3vCipls5dqKqHUOC4Nsarfm4YJxRDPsCEJR8A=;
  b=d9K+lRC/TZ8f7Bk/RyntOyXTVLmNkOOJAcfch4sWc+EwCcP9jO0DrekE
   6GaL29nCHXSxZuVypmt1BFmEXce4lTOm47Irb7N/ZmrNxuMEpJEpMlzEX
   Jou1nZ6uYnymwCd0IrT8iXkRATBx8kOtZV1u0Z08DQMNUdi38dFazuwom
   btT1/aJbbNIYE2aesgBUaQtlkE6wFH9QJ0Bltq8pCR3jr1j/kZZM9OQlX
   huzJHN2KZ23CrsOS9eW/vTOM5Q7Yg0a5UL71iZPAgIOy0AqD4RCBLmgrW
   +TgbmM3EnLnmukIEtI+3QCidsT4uI8qMmrCAdW30DkPwwIU0KJx5hZi1u
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="298273700"
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="298273700"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 23:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="702445762"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 May 2022 23:44:13 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nsfK0-00008R-J4;
        Sun, 22 May 2022 06:44:12 +0000
Date:   Sun, 22 May 2022 14:43:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.19] BUILD SUCCESS
 4c0dd11e576412605b1fd9e868e2f66627c195b0
Message-ID: <6289db7e.iIP+EpIQ09yDm1lS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.19
branch HEAD: 4c0dd11e576412605b1fd9e868e2f66627c195b0  m68k: atari: Make Atari ROM port I/O write macros return void

elapsed time: 2317m

configs tested: 226
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
powerpc64                           defconfig
arc                                 defconfig
powerpc                     asp8347_defconfig
m68k                            mac_defconfig
ia64                            zx1_defconfig
arm                       imx_v6_v7_defconfig
arm                           imxrt_defconfig
parisc                           alldefconfig
mips                     loongson1b_defconfig
ia64                      gensparse_defconfig
arm                            pleb_defconfig
sh                            titan_defconfig
sh                            migor_defconfig
sh                               j2_defconfig
um                                  defconfig
um                               alldefconfig
arm                        shmobile_defconfig
mips                      maltasmvp_defconfig
powerpc                    sam440ep_defconfig
powerpc                      cm5200_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
sh                          rsk7269_defconfig
powerpc                     pq2fads_defconfig
parisc                           allyesconfig
ia64                        generic_defconfig
powerpc                      chrp32_defconfig
s390                          debug_defconfig
mips                  maltasmvp_eva_defconfig
riscv                            allyesconfig
arm                        mini2440_defconfig
xtensa                           allyesconfig
m68k                            q40_defconfig
sh                           se7721_defconfig
arm                           tegra_defconfig
ia64                          tiger_defconfig
sh                           se7750_defconfig
mips                  decstation_64_defconfig
arm                            zeus_defconfig
arm                           corgi_defconfig
xtensa                          iss_defconfig
xtensa                  audio_kc705_defconfig
arm                            lart_defconfig
sh                          r7785rp_defconfig
powerpc                        cell_defconfig
sh                                  defconfig
powerpc                    klondike_defconfig
sh                           se7206_defconfig
powerpc                         wii_defconfig
mips                        bcm47xx_defconfig
um                           x86_64_defconfig
arm                           h3600_defconfig
parisc                generic-64bit_defconfig
sh                           se7619_defconfig
arm                           h5000_defconfig
arm                        multi_v7_defconfig
ia64                         bigsur_defconfig
sh                          landisk_defconfig
alpha                            allyesconfig
arm                        realview_defconfig
powerpc                     sequoia_defconfig
arm                            qcom_defconfig
arc                        nsimosci_defconfig
powerpc                     stx_gp3_defconfig
sparc64                          alldefconfig
i386                                defconfig
sh                          urquell_defconfig
x86_64                           alldefconfig
powerpc                 canyonlands_defconfig
powerpc                       eiger_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                   motionpro_defconfig
arc                          axs103_defconfig
arm                      jornada720_defconfig
s390                       zfcpdump_defconfig
arm                           sama5_defconfig
powerpc                        warp_defconfig
powerpc                 mpc837x_mds_defconfig
arm                           viper_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                     edosk2674_defconfig
arc                           tb10x_defconfig
m68k                          multi_defconfig
nios2                            alldefconfig
arm                        keystone_defconfig
h8300                       h8s-sim_defconfig
openrisc                 simple_smp_defconfig
xtensa                generic_kc705_defconfig
powerpc                       holly_defconfig
arc                          axs101_defconfig
alpha                               defconfig
m68k                       m5208evb_defconfig
powerpc                      mgcoge_defconfig
arc                         haps_hs_defconfig
sh                               allmodconfig
m68k                           sun3_defconfig
powerpc                     rainier_defconfig
sparc64                             defconfig
arm                            xcep_defconfig
m68k                       bvme6000_defconfig
mips                           ci20_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                mpc7448_hpc2_defconfig
nios2                         3c120_defconfig
powerpc                      ppc6xx_defconfig
m68k                          amiga_defconfig
sh                         microdev_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220519
arm                  randconfig-c002-20220522
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
h8300                            allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
arc                  randconfig-r043-20220519
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
s390                 randconfig-c005-20220519
powerpc              randconfig-c003-20220519
x86_64                        randconfig-c007
riscv                randconfig-c006-20220519
mips                 randconfig-c004-20220519
i386                          randconfig-c001
arm                  randconfig-c002-20220519
arm                  randconfig-c002-20220522
s390                 randconfig-c005-20220522
powerpc              randconfig-c003-20220522
riscv                randconfig-c006-20220522
mips                 randconfig-c004-20220522
mips                      pic32mzda_defconfig
arm                          ep93xx_defconfig
mips                      malta_kvm_defconfig
arm                              alldefconfig
arm                          ixp4xx_defconfig
powerpc                     tqm5200_defconfig
i386                             allyesconfig
powerpc                          g5_defconfig
powerpc                    socrates_defconfig
arm                     davinci_all_defconfig
arm                         mv78xx0_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                   bluestone_defconfig
powerpc                      katmai_defconfig
powerpc                        icon_defconfig
powerpc                      ppc44x_defconfig
arm                       spear13xx_defconfig
mips                           rs90_defconfig
powerpc                          allmodconfig
arm                      tct_hammer_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                        mvebu_v5_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    gamecube_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220522
hexagon              randconfig-r041-20220522
s390                 randconfig-r044-20220519
hexagon              randconfig-r045-20220519
riscv                randconfig-r042-20220519
hexagon              randconfig-r041-20220519
hexagon              randconfig-r045-20220521
hexagon              randconfig-r041-20220521
s390                 randconfig-r044-20220521
riscv                randconfig-r042-20220521

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE0AC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 28 Apr 2022 21:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237252AbiD1Vol (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 28 Apr 2022 17:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbiD1Vol (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 28 Apr 2022 17:44:41 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A670A776A
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Apr 2022 14:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651182085; x=1682718085;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TLuYvtCk1xFVG4tEDNR/bNK2Yr78KgT6rcDvz4i6GCs=;
  b=XKaL8O8HGvAMma7ld8xje0/mIG97s88YwlTAQaZrTh493JBp04rGNNsu
   hvPn90e/81w3q0/loD6drVCNVEQozZrVrJWqnS+UfschRXV2Qng7b+pmR
   O2IaD9qFCgsKJMbDe/a3xmBLTJDfqHxP74B2QsCObeY1jNPv5x01FJYGK
   HsjjNfmWf5cFCOO9aLaLqv8hw0aV42fn9l9LHXC2XgacYgfpMxpUL+Nxn
   rIl3qgYTR9KhEC6q/VROngWx7Q//9VmE7M8hAkaBjatVGUUSjIeyp7i8W
   sW7y0NDProO97Docgc4V0JiphATkCuXPZblxDl7JRZO1H5Zf9exEHW/x1
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="264021386"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="264021386"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 14:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="596990911"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Apr 2022 14:41:22 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nkBt4-0005iX-2N;
        Thu, 28 Apr 2022 21:41:22 +0000
Date:   Fri, 29 Apr 2022 05:41:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.19] BUILD SUCCESS
 a96e4ebf3dedaf110999189939cd0272d32c4296
Message-ID: <626b09f6.GaivaX5HexIHyFh0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.19
branch HEAD: a96e4ebf3dedaf110999189939cd0272d32c4296  m68k: defconfig: Update defconfigs for v5.18-rc1

elapsed time: 4876m

configs tested: 274
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
mips                 randconfig-c004-20220425
i386                 randconfig-c001-20220425
powerpc              randconfig-c003-20220428
i386                          randconfig-c001
ia64                          tiger_defconfig
sh                            shmin_defconfig
mips                           ip32_defconfig
nios2                               defconfig
mips                     decstation_defconfig
m68k                            q40_defconfig
arm                           corgi_defconfig
sh                           se7724_defconfig
parisc                generic-32bit_defconfig
powerpc                       ppc64_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                    sam440ep_defconfig
sh                           se7619_defconfig
powerpc                      pasemi_defconfig
sh                        sh7785lcr_defconfig
powerpc                    amigaone_defconfig
um                               alldefconfig
powerpc                      makalu_defconfig
sh                               j2_defconfig
arm                        cerfcube_defconfig
sh                           se7751_defconfig
arm                         assabet_defconfig
mips                  decstation_64_defconfig
arm                            zeus_defconfig
arm                      integrator_defconfig
arc                              alldefconfig
arm                           sunxi_defconfig
s390                             allmodconfig
sh                          rsk7264_defconfig
mips                  maltasmvp_eva_defconfig
mips                      maltasmvp_defconfig
sh                        sh7763rdp_defconfig
openrisc                  or1klitex_defconfig
mips                       bmips_be_defconfig
arm                         lpc18xx_defconfig
arm                          pxa910_defconfig
powerpc                     ep8248e_defconfig
s390                                defconfig
mips                         tb0226_defconfig
sh                        edosk7760_defconfig
powerpc                 mpc834x_mds_defconfig
sh                           se7206_defconfig
powerpc                    adder875_defconfig
powerpc                     taishan_defconfig
sparc                       sparc64_defconfig
powerpc                        cell_defconfig
parisc                generic-64bit_defconfig
arm                         cm_x300_defconfig
sparc                               defconfig
arm                            hisi_defconfig
alpha                            alldefconfig
xtensa                generic_kc705_defconfig
m68k                       bvme6000_defconfig
i386                             alldefconfig
arm                        clps711x_defconfig
arm                             pxa_defconfig
arm                        keystone_defconfig
arm                         vf610m4_defconfig
sh                              ul2_defconfig
sh                          sdk7786_defconfig
arm                           viper_defconfig
powerpc                     mpc83xx_defconfig
sh                      rts7751r2d1_defconfig
m68k                       m5249evb_defconfig
arm                          iop32x_defconfig
xtensa                              defconfig
arm                        mini2440_defconfig
sh                ecovec24-romimage_defconfig
arm                      jornada720_defconfig
sh                         ap325rxa_defconfig
m68k                        m5272c3_defconfig
sh                             shx3_defconfig
sh                           se7780_defconfig
arc                     nsimosci_hs_defconfig
xtensa                           alldefconfig
arm                          gemini_defconfig
sh                          kfr2r09_defconfig
sh                          landisk_defconfig
arc                         haps_hs_defconfig
mips                      loongson3_defconfig
parisc64                            defconfig
microblaze                          defconfig
mips                            gpr_defconfig
arm                          simpad_defconfig
m68k                          sun3x_defconfig
nios2                            allyesconfig
m68k                                defconfig
sh                        edosk7705_defconfig
arm                        multi_v7_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     pq2fads_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                            pleb_defconfig
arc                        nsim_700_defconfig
ia64                             alldefconfig
sh                           sh2007_defconfig
powerpc                     asp8347_defconfig
m68k                        mvme147_defconfig
h8300                       h8s-sim_defconfig
xtensa                          iss_defconfig
sh                           se7750_defconfig
sparc64                             defconfig
powerpc                  storcenter_defconfig
arc                      axs103_smp_defconfig
sh                          r7780mp_defconfig
m68k                             alldefconfig
arm                           h3600_defconfig
arm                           tegra_defconfig
sh                            hp6xx_defconfig
openrisc                 simple_smp_defconfig
xtensa                  cadence_csp_defconfig
m68k                        mvme16x_defconfig
h8300                            alldefconfig
arm                        mvebu_v7_defconfig
sh                          sdk7780_defconfig
arm                      footbridge_defconfig
mips                       capcella_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         lubbock_defconfig
arc                     haps_hs_smp_defconfig
xtensa                  nommu_kc705_defconfig
arc                                 defconfig
powerpc                      arches_defconfig
mips                          rb532_defconfig
powerpc                      mgcoge_defconfig
x86_64                           alldefconfig
x86_64               randconfig-c001-20220425
arm                  randconfig-c002-20220425
x86_64                        randconfig-c001
arm                  randconfig-c002-20220428
arm                  randconfig-c002-20220427
arm                  randconfig-c002-20220426
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a015-20220425
x86_64               randconfig-a014-20220425
x86_64               randconfig-a011-20220425
x86_64               randconfig-a013-20220425
x86_64               randconfig-a012-20220425
x86_64               randconfig-a016-20220425
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a014-20220425
i386                 randconfig-a012-20220425
i386                 randconfig-a011-20220425
i386                 randconfig-a015-20220425
i386                 randconfig-a013-20220425
i386                 randconfig-a016-20220425
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
arc                  randconfig-r043-20220425
s390                 randconfig-r044-20220425
riscv                randconfig-r042-20220425
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz

clang tested configs:
riscv                randconfig-c006-20220425
mips                 randconfig-c004-20220425
x86_64               randconfig-c007-20220425
arm                  randconfig-c002-20220425
i386                 randconfig-c001-20220425
powerpc              randconfig-c003-20220425
riscv                randconfig-c006-20220427
mips                 randconfig-c004-20220427
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220427
powerpc              randconfig-c003-20220427
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
mips                          ath79_defconfig
mips                     loongson2k_defconfig
arm                          pxa168_defconfig
powerpc                    socrates_defconfig
arm                            dove_defconfig
arm                       aspeed_g4_defconfig
arm                          moxart_defconfig
mips                           mtx1_defconfig
arm                       cns3420vb_defconfig
arm                     davinci_all_defconfig
mips                          rm200_defconfig
powerpc                     tqm5200_defconfig
mips                           ip22_defconfig
powerpc                  mpc885_ads_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                       ebony_defconfig
arm                       imx_v4_v5_defconfig
powerpc                          allyesconfig
powerpc                      katmai_defconfig
powerpc                     pseries_defconfig
mips                       lemote2f_defconfig
powerpc                     kmeter1_defconfig
x86_64                           allyesconfig
powerpc                        fsp2_defconfig
arm                      pxa255-idp_defconfig
mips                      malta_kvm_defconfig
mips                           ip27_defconfig
arm                        vexpress_defconfig
mips                       rbtx49xx_defconfig
powerpc                          allmodconfig
powerpc                 mpc8560_ads_defconfig
mips                         tb0287_defconfig
mips                        workpad_defconfig
mips                      bmips_stb_defconfig
arm                       versatile_defconfig
x86_64               randconfig-a002-20220425
x86_64               randconfig-a004-20220425
x86_64               randconfig-a003-20220425
x86_64               randconfig-a001-20220425
x86_64               randconfig-a005-20220425
x86_64               randconfig-a006-20220425
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a006-20220425
i386                 randconfig-a002-20220425
i386                 randconfig-a005-20220425
i386                 randconfig-a003-20220425
i386                 randconfig-a001-20220425
i386                 randconfig-a004-20220425
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220425
hexagon              randconfig-r045-20220425
hexagon              randconfig-r041-20220428
riscv                randconfig-r042-20220428
hexagon              randconfig-r045-20220428

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

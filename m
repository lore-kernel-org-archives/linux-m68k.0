Return-Path: <SRS0=i6Xs=CE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46438C433DF
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 23:39:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 188AD2074A
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 23:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgHZXjJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Aug 2020 19:39:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:18757 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbgHZXjJ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Aug 2020 19:39:09 -0400
IronPort-SDR: AD4Ocl1VkY/24CixV/mNHbkK94/iGokenCGq3Po8peGZgbnnPvZxNiGCg4pCM67dkmxqbQGBjA
 hoxELSx6Q6Ug==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="144159654"
X-IronPort-AV: E=Sophos;i="5.76,357,1592895600"; 
   d="scan'208";a="144159654"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 16:39:02 -0700
IronPort-SDR: AoYnB6LgoKfmc3QTKPYWkbfbmWxW8vPZXGZEvcg8RtPNkIvqcd+swbRVV48IFp9PZlKaHCU4h5
 yjqLDfuyqeVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,357,1592895600"; 
   d="scan'208";a="331963064"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2020 16:39:00 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kB50N-0001lK-Jb; Wed, 26 Aug 2020 23:38:59 +0000
Date:   Thu, 27 Aug 2020 07:38:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-v5.10] BUILD SUCCESS
 5661bccb70ef134502b9d2e80a19465ad943b022
Message-ID: <5f46f276.a91RMkU6Ne+CZeLc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  for-v5.10
branch HEAD: 5661bccb70ef134502b9d2e80a19465ad943b022  m68k: Correct some typos in comments

elapsed time: 722m

configs tested: 159
configs skipped: 15

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
mips                        workpad_defconfig
mips                        maltaup_defconfig
sh                   rts7751r2dplus_defconfig
arm                        oxnas_v6_defconfig
sh                        edosk7705_defconfig
powerpc                     pseries_defconfig
arm                        mvebu_v7_defconfig
c6x                        evmc6472_defconfig
arm                       multi_v4t_defconfig
arm                          simpad_defconfig
sh                          lboxre2_defconfig
sh                          urquell_defconfig
powerpc                      ep88xc_defconfig
arm                         s3c6400_defconfig
arm                            pleb_defconfig
sh                            shmin_defconfig
arm                            zeus_defconfig
m68k                            q40_defconfig
arm                              zx_defconfig
mips                        jmr3927_defconfig
sh                        sh7757lcr_defconfig
arm                         lpc18xx_defconfig
mips                          malta_defconfig
arm                          pxa168_defconfig
m68k                          multi_defconfig
arm                         nhk8815_defconfig
arm                       aspeed_g4_defconfig
m68k                          sun3x_defconfig
m68k                       bvme6000_defconfig
mips                      malta_kvm_defconfig
mips                           jazz_defconfig
arm                        multi_v5_defconfig
riscv                            allmodconfig
mips                         bigsur_defconfig
sh                               j2_defconfig
m68k                         amcore_defconfig
sh                           se7712_defconfig
mips                        nlm_xlr_defconfig
xtensa                       common_defconfig
powerpc                     skiroot_defconfig
m68k                       m5249evb_defconfig
arm                         palmz72_defconfig
powerpc                    adder875_defconfig
sh                           se7751_defconfig
mips                     loongson1c_defconfig
i386                             allyesconfig
powerpc                          g5_defconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
x86_64                              defconfig
c6x                        evmc6474_defconfig
sh                           se7724_defconfig
arm                        neponset_defconfig
ia64                            zx1_defconfig
arm                      integrator_defconfig
powerpc                 mpc8272_ads_defconfig
m68k                             allmodconfig
arm                          ixp4xx_defconfig
openrisc                    or1ksim_defconfig
m68k                             alldefconfig
xtensa                    xip_kc705_defconfig
c6x                                 defconfig
arm                            qcom_defconfig
sh                          kfr2r09_defconfig
mips                          rb532_defconfig
arm                            dove_defconfig
mips                          ath25_defconfig
powerpc                         wii_defconfig
arm                    vt8500_v6_v7_defconfig
arc                      axs103_smp_defconfig
mips                      bmips_stb_defconfig
c6x                              allyesconfig
powerpc                           allnoconfig
arm                          pxa3xx_defconfig
sh                             sh03_defconfig
mips                 decstation_r4k_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7722_defconfig
mips                malta_qemu_32r6_defconfig
mips                         mpc30x_defconfig
arm                          collie_defconfig
h8300                     edosk2674_defconfig
mips                       capcella_defconfig
arm                      footbridge_defconfig
arm                           sunxi_defconfig
m68k                                defconfig
arc                 nsimosci_hs_smp_defconfig
xtensa                          iss_defconfig
sh                          r7785rp_defconfig
mips                           rs90_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                          sdk7786_defconfig
mips                       rbtx49xx_defconfig
arm                         orion5x_defconfig
sh                           se7206_defconfig
arm                           h5000_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                             defconfig
i386                 randconfig-a002-20200826
i386                 randconfig-a004-20200826
i386                 randconfig-a003-20200826
i386                 randconfig-a005-20200826
i386                 randconfig-a006-20200826
i386                 randconfig-a001-20200826
x86_64               randconfig-a012-20200826
x86_64               randconfig-a014-20200826
x86_64               randconfig-a011-20200826
x86_64               randconfig-a013-20200826
x86_64               randconfig-a015-20200826
x86_64               randconfig-a016-20200826
i386                 randconfig-a013-20200826
i386                 randconfig-a012-20200826
i386                 randconfig-a011-20200826
i386                 randconfig-a016-20200826
i386                 randconfig-a015-20200826
i386                 randconfig-a014-20200826
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

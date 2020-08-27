Return-Path: <SRS0=O3TF=CF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360D9C433E1
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 04:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16F83204FD
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 04:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgH0EAl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Aug 2020 00:00:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:29243 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbgH0EAl (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 27 Aug 2020 00:00:41 -0400
IronPort-SDR: rTdm06TXcTy1b3ddWFrYYDp/2Oog1aC9eW5yOo3sFNdB87pnnO8tIeZCbxHHIZHlY072C393mW
 Z1viPw5U9dWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="241239182"
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; 
   d="scan'208";a="241239182"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 21:00:32 -0700
IronPort-SDR: sG5y2c3NoDC5/OJntXdOMIgXw0j1KjKirbHJ9qO9HzHE0hsyCvopxyWS3Cl89ijQFD7Pg+sAoT
 WE9ZTZTaRmSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; 
   d="scan'208";a="337036887"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2020 21:00:31 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kB95S-0001rM-Hq; Thu, 27 Aug 2020 04:00:30 +0000
Date:   Thu, 27 Aug 2020 11:59:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 3d86f8d3c27501378f9256a99cd2616d3539bb9b
Message-ID: <5f472fa3.LcylrRkOT0CzzKs9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 3d86f8d3c27501378f9256a99cd2616d3539bb9b  fat: Use correct logical sector size for Atari GEMDOS FAT

elapsed time: 983m

configs tested: 158
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
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
m68k                            q40_defconfig
arm                              zx_defconfig
mips                        jmr3927_defconfig
sh                        sh7757lcr_defconfig
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
m68k                         apollo_defconfig
sh                ecovec24-romimage_defconfig
sh                        apsh4ad0a_defconfig
arm                       spear13xx_defconfig
arm                        trizeps4_defconfig
m68k                       m5249evb_defconfig
arm                         palmz72_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arm                            zeus_defconfig
i386                             allyesconfig
powerpc                    adder875_defconfig
sh                           se7751_defconfig
powerpc                          g5_defconfig
mips                     loongson1c_defconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
sh                           se7722_defconfig
sh                   sh7770_generic_defconfig
mips                         tb0226_defconfig
powerpc                     skiroot_defconfig
powerpc                         ps3_defconfig
arm                         hackkit_defconfig
arm                            qcom_defconfig
arm                         lpc18xx_defconfig
sh                          urquell_defconfig
ia64                            zx1_defconfig
arm                      integrator_defconfig
powerpc                 mpc8272_ads_defconfig
m68k                             allmodconfig
arm                          ixp4xx_defconfig
openrisc                    or1ksim_defconfig
arc                          axs103_defconfig
sh                          kfr2r09_defconfig
mips                          rb532_defconfig
arm                            dove_defconfig
mips                          ath25_defconfig
powerpc                         wii_defconfig
m68k                        stmark2_defconfig
sh                                  defconfig
arc                    vdk_hs38_smp_defconfig
arc                             nps_defconfig
arm                  colibri_pxa270_defconfig
mips                         rt305x_defconfig
xtensa                generic_kc705_defconfig
ia64                        generic_defconfig
x86_64                           alldefconfig
arm                          pxa3xx_defconfig
sh                             sh03_defconfig
mips                 decstation_r4k_defconfig
arc                     nsimosci_hs_defconfig
h8300                     edosk2674_defconfig
mips                       capcella_defconfig
arm                      footbridge_defconfig
arm                           sunxi_defconfig
mips                malta_kvm_guest_defconfig
mips                        bcm47xx_defconfig
sh                            shmin_defconfig
sh                     sh7710voipgw_defconfig
arm                     eseries_pxa_defconfig
m68k                       m5475evb_defconfig
mips                  decstation_64_defconfig
mips                  cavium_octeon_defconfig
nios2                         10m50_defconfig
arm                            mmp2_defconfig
m68k                       m5275evb_defconfig
m68k                           sun3_defconfig
sh                          sdk7786_defconfig
mips                       rbtx49xx_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         orion5x_defconfig
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
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

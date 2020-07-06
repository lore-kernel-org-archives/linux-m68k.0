Return-Path: <SRS0=anco=AR=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA699C433DF
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Jul 2020 21:50:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B91E5205CB
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Jul 2020 21:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgGFVuo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Jul 2020 17:50:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:60972 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726727AbgGFVuo (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Jul 2020 17:50:44 -0400
IronPort-SDR: u4AgDjFGQIKJKzqqMshgdTJuQxqBQMtNGQvAwgSW9h5BhA3C+ufbln3B6TzlWhpprfvvsslblP
 GZ9PZKVDXo1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="209028746"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; 
   d="scan'208";a="209028746"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2020 14:50:41 -0700
IronPort-SDR: OvOK9XUmL+8v2Qpxk7pGcbgWQC9jSXevnXoNnxgf8odIrJCyoAI3yKFD4wAcZfgzWlDjvSYQLd
 K4jtafA4A5GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; 
   d="scan'208";a="315304212"
Received: from lkp-server01.sh.intel.com (HELO 82346ce9ac16) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2020 14:50:40 -0700
Received: from kbuild by 82346ce9ac16 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jsZ0Z-0000Qp-W5; Mon, 06 Jul 2020 21:50:39 +0000
Date:   Tue, 07 Jul 2020 05:50:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 50b615674c23c9c40a77a7b45ddad2dc37db0ec6
Message-ID: <5f039ca3.eK+4k+K6VDSjwLml%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 50b615674c23c9c40a77a7b45ddad2dc37db0ec6  Merge tag 'v5.8-rc4'

elapsed time: 721m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sh                      rts7751r2d1_defconfig
parisc                              defconfig
arm                         s3c6400_defconfig
arm                            hisi_defconfig
powerpc64                        alldefconfig
sparc                            alldefconfig
mips                  mips_paravirt_defconfig
sh                        dreamcast_defconfig
sh                     sh7710voipgw_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                           sun3_defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200706
i386                 randconfig-a002-20200706
i386                 randconfig-a006-20200706
i386                 randconfig-a004-20200706
i386                 randconfig-a005-20200706
i386                 randconfig-a003-20200706
x86_64               randconfig-a001-20200706
x86_64               randconfig-a006-20200706
x86_64               randconfig-a002-20200706
x86_64               randconfig-a003-20200706
x86_64               randconfig-a004-20200706
x86_64               randconfig-a005-20200706
i386                 randconfig-a011-20200706
i386                 randconfig-a014-20200706
i386                 randconfig-a015-20200706
i386                 randconfig-a016-20200706
i386                 randconfig-a012-20200706
i386                 randconfig-a013-20200706
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

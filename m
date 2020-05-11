Return-Path: <SRS0=1ZKR=6Z=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52163C47255
	for <linux-m68k@archiver.kernel.org>; Mon, 11 May 2020 16:56:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D2E3206D7
	for <linux-m68k@archiver.kernel.org>; Mon, 11 May 2020 16:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbgEKQ43 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 May 2020 12:56:29 -0400
Received: from mga11.intel.com ([192.55.52.93]:24335 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727874AbgEKQ42 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 May 2020 12:56:28 -0400
IronPort-SDR: gmt+ssoXfPrmEUj8Zer/vXJXD34U7CixZZbBXZIvSWF1WpDirJvzwCMp2IqehqwCtwYkr1d/3I
 3KKLdMQKLwDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 09:56:28 -0700
IronPort-SDR: imJ+tI7G78DvIe9iDsRkrxTQdDxLuMMqnL2GnycCOTHztXTJNV7V8pcrWXyIRILxyDuYBmpThA
 PcYYUx0lN0CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; 
   d="scan'208";a="436760797"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2020 09:56:26 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jYBj8-0002YY-8k; Tue, 12 May 2020 00:56:26 +0800
Date:   Tue, 12 May 2020 00:56:11 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-next] BUILD SUCCESS
 b5c08eb306abe5f00bee7220e8d3b62040edf28e
Message-ID: <5eb983ab.7uns4Q4Uu4nbGFRq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  for-next
branch HEAD: b5c08eb306abe5f00bee7220e8d3b62040edf28e  m68k: defconfig: Update defconfigs for v5.7-rc1

elapsed time: 482m

configs tested: 84
configs skipped: 98

The following configs have been built successfully.
More configs may be tested in the coming days.

sparc                            allyesconfig
m68k                             allyesconfig
parisc                           allyesconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
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
xtensa                              defconfig
h8300                            allyesconfig
h8300                            allmodconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200511
i386                 randconfig-a005-20200511
i386                 randconfig-a003-20200511
i386                 randconfig-a001-20200511
i386                 randconfig-a004-20200511
i386                 randconfig-a002-20200511
i386                 randconfig-a012-20200511
i386                 randconfig-a016-20200511
i386                 randconfig-a014-20200511
i386                 randconfig-a011-20200511
i386                 randconfig-a013-20200511
i386                 randconfig-a015-20200511
x86_64               randconfig-a005-20200511
x86_64               randconfig-a003-20200511
x86_64               randconfig-a006-20200511
x86_64               randconfig-a004-20200511
x86_64               randconfig-a001-20200511
x86_64               randconfig-a002-20200511
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
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
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD2AC00144
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Aug 2022 00:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbiHBA4C (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Aug 2022 20:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235063AbiHBA4B (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Aug 2022 20:56:01 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7CBB402E7
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Aug 2022 17:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659401759; x=1690937759;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EiN41VMmVgIYbVnRYWZGo3/GeoVB1WOzmTWE7sCJNkI=;
  b=S/nQcIAtJhItAItdgAuau2VcwM+FfGddwD1hqSXITlkoiGS2f8PPcCQr
   Lyw1VNoMP3zoM6jP/LkutSAVreVegkT6Kei25BVbko1CCIrr0Nlr5m7t2
   5z9sFtd8YE+jpXVUsCpjFnaAvW0I/Z4qgPbhgB97T02skveCQWxQ1FDNW
   ZyzhJz2AxbsGD6utroRIJv2eJQ09+UZubgPQPNhYRfKvcJ37zT/ZsWhag
   V27VkLQ/1S6pTLyaysjjYVMMWTDS1pR8i3KwuGFy72VSZ0rayJa+kSRhs
   ZXnstOERVi18iQ0/+IpT6YYyHP3CUhiEgLndeVZ3Huw9SGjJ/zlN+xqjs
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="288044363"
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="288044363"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 17:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="929764241"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2022 17:55:57 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oIgCT-000FXL-02;
        Tue, 02 Aug 2022 00:55:57 +0000
Date:   Tue, 02 Aug 2022 08:55:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 376d372fe2eb004586efb7109580b44b430f8589
Message-ID: <62e875f1.iNA7xZnpcuMiu750%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 376d372fe2eb004586efb7109580b44b430f8589  Merge tag 'v5.19'

elapsed time: 721m

configs tested: 59
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220801
i386                                defconfig
s390                 randconfig-r044-20220801
riscv                randconfig-r042-20220801
x86_64                              defconfig
m68k                             allmodconfig
arm                                 defconfig
x86_64                               rhel-8.3
arc                              allyesconfig
x86_64                           allyesconfig
i386                             allyesconfig
x86_64               randconfig-a014-20220801
i386                 randconfig-a012-20220801
ia64                             allmodconfig
arm                              allyesconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
i386                 randconfig-a011-20220801
powerpc                          allmodconfig
arm64                            allyesconfig
i386                 randconfig-a015-20220801
mips                             allyesconfig
i386                 randconfig-a013-20220801
i386                 randconfig-a014-20220801
sh                               allmodconfig
i386                 randconfig-a016-20220801
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a011-20220801
alpha                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64               randconfig-a012-20220801
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a013-20220801
m68k                             allyesconfig
x86_64               randconfig-a016-20220801
x86_64               randconfig-a015-20220801
arc                      axs103_smp_defconfig
arc                           tb10x_defconfig
nios2                               defconfig
xtensa                    xip_kc705_defconfig

clang tested configs:
hexagon              randconfig-r045-20220801
hexagon              randconfig-r041-20220801
x86_64               randconfig-a002-20220801
i386                 randconfig-a004-20220801
x86_64               randconfig-a001-20220801
i386                 randconfig-a001-20220801
i386                 randconfig-a002-20220801
x86_64               randconfig-a003-20220801
i386                 randconfig-a003-20220801
x86_64               randconfig-a004-20220801
i386                 randconfig-a005-20220801
x86_64               randconfig-a005-20220801
i386                 randconfig-a006-20220801
x86_64               randconfig-a006-20220801
powerpc                 mpc836x_mds_defconfig
mips                  cavium_octeon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

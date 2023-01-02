Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C04BC3DA7A
	for <linux-m68k@archiver.kernel.org>; Mon,  2 Jan 2023 22:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjABWSF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 Jan 2023 17:18:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjABWSE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 Jan 2023 17:18:04 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFADB6427
        for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Jan 2023 14:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672697883; x=1704233883;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jYXhmDuqGnkDxZIhNdXwL2LccIhOZpGxT8D1SP2yddA=;
  b=Yo3SUbAq7PVqE603AUYtU9anPQV3JaIcU0v3NkRI8U+JYkBcWxxFiSpc
   HirDUw3K3lK8KJcgROempAk4AyHhYvssUaLen9lSrhuErLV6qHuHNCka0
   SFTt0huNMIREbl/Hf2GkynsVjxKkLw7D70sX7X0eb6jZDRe/C2ayLP94D
   P3i8W32wJ/S+01ruohXfZ2YIsK80kFhJ2EWFYA8JOzHZqjctvavnBbEl2
   N1z0svzBlMWwkN/iRBk0ObIr9GA+ykzzKZFMQ6EVD0REa4/yyOQTM/DD/
   fJCaKDQOiVLfoF46lc0QRHO5BIDEIBCHZeWopWnW3+O77hZEFgAE81cmf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="301231873"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="301231873"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 14:18:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="723061894"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="723061894"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Jan 2023 14:18:01 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pCT84-000RZ9-2n;
        Mon, 02 Jan 2023 22:18:00 +0000
Date:   Tue, 03 Jan 2023 06:17:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 8075de6c0ed34e9108b4f56148dca6c671319ec7
Message-ID: <63b3580f.aD+muEpXx97mL82l%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 8075de6c0ed34e9108b4f56148dca6c671319ec7  Merge tag 'v6.2-rc2'

elapsed time: 722m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
x86_64                              defconfig
arc                                 defconfig
s390                             allmodconfig
sh                               allmodconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
s390                             allyesconfig
mips                             allyesconfig
i386                                defconfig
i386                 randconfig-a004-20230102
i386                 randconfig-a003-20230102
i386                 randconfig-a001-20230102
i386                 randconfig-a002-20230102
x86_64                          rhel-8.3-func
x86_64               randconfig-a001-20230102
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a004-20230102
x86_64               randconfig-a002-20230102
x86_64               randconfig-a003-20230102
i386                 randconfig-a005-20230102
arm                                 defconfig
i386                 randconfig-a006-20230102
x86_64               randconfig-a006-20230102
x86_64               randconfig-a005-20230102
arm64                            allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
i386                             allyesconfig
riscv                randconfig-r042-20230101
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20230102
x86_64                            allnoconfig
m68k                             allmodconfig
arc                              allyesconfig
arm                  randconfig-r046-20230102
alpha                            allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20230101
s390                 randconfig-r044-20230101

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a013-20230102
i386                 randconfig-a012-20230102
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a016-20230102
i386                 randconfig-a015-20230102
hexagon              randconfig-r041-20230102
x86_64               randconfig-a011-20230102
s390                 randconfig-r044-20230102
x86_64               randconfig-a012-20230102
x86_64               randconfig-a013-20230102
hexagon              randconfig-r045-20230101
x86_64               randconfig-a015-20230102
x86_64               randconfig-a016-20230102
hexagon              randconfig-r045-20230102
arm                  randconfig-r046-20230101
x86_64               randconfig-a014-20230102
riscv                randconfig-r042-20230102
hexagon              randconfig-r041-20230101

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

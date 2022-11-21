Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF677C433FE
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Nov 2022 22:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiKUWzq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Nov 2022 17:55:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbiKUWzm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Nov 2022 17:55:42 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E20D6AEFE
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Nov 2022 14:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669071341; x=1700607341;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tq5sJmk886eD1xWeJLJMTojgdMlGje2N1ZdzobCo/9s=;
  b=P0RMwSUVSM1SuNAQuajdnmGTA6WDsRtS7sgSzFJCHfqyOGro6qsRlNID
   jCJblVaIToUiPOVTAMQ9Rw1RsRTLaHsdUxowBSVbCz3msCKsNnF0mPOym
   qjAi1gZ8afU0Fzxa71p+h6bWgPiWzJ3/2LgAHpIo60UErKlwQXInJKoxC
   ITE2jCle4ziafJN0oNMuFJzI4UyDZCYOwojucxkeADEQv2zslBTUoYlyJ
   GGIsyCCgzoPSl+OB5nSRqQzr1etpM4uKgvsuETRZFR7aChXp2Ungc0uGv
   ea1B/GinDn2kdLUnMR2qRVvMCoEt+ldJnI1XuY8gK/PL0Vva5iA464I6r
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="312381276"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="312381276"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 14:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="783618066"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="783618066"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2022 14:55:39 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxFhT-0000ob-0g;
        Mon, 21 Nov 2022 22:55:39 +0000
Date:   Tue, 22 Nov 2022 06:55:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 67f3d38b198673a4241083c86706e7f4fc8c5d63
Message-ID: <637c01e2.f6W/YlWVQ4RjAcKt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 67f3d38b198673a4241083c86706e7f4fc8c5d63  Merge tag 'v6.1-rc6'

elapsed time: 726m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
arc                  randconfig-r043-20221120
arc                  randconfig-r043-20221121
s390                 randconfig-r044-20221121
riscv                randconfig-r042-20221121
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a012-20221121
x86_64               randconfig-a011-20221121
x86_64               randconfig-a015-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a016-20221121
i386                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
arm                                 defconfig
i386                 randconfig-a011-20221121
m68k                             allmodconfig
m68k                             allyesconfig
i386                 randconfig-a013-20221121
i386                 randconfig-a012-20221121
x86_64                               rhel-8.3
i386                 randconfig-a014-20221121
i386                 randconfig-a015-20221121
x86_64                           allyesconfig
i386                 randconfig-a016-20221121
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221120
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221120
hexagon              randconfig-r045-20221121
riscv                randconfig-r042-20221120
s390                 randconfig-r044-20221120
x86_64               randconfig-a004-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a006-20221121
x86_64               randconfig-a005-20221121
i386                 randconfig-a001-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a004-20221121
i386                 randconfig-a002-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a006-20221121

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

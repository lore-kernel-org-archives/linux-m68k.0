Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE26C43334
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Jun 2022 05:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234094AbiFVFci (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Jun 2022 01:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbiFVFch (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 22 Jun 2022 01:32:37 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC7A36313
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jun 2022 22:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655875956; x=1687411956;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oSVuoePGguQy74MDhkCuDkrA24RvQj6WpBbZnXWTjH8=;
  b=WPlWnJu9/EaBxuq+r5WRVF7a2UJKcJZwFutDhXeyUmAQvhOVTtLX3lEE
   3lr8KPs/VHNrJDmGftJWZUyEjOENpTJmABV1TpsUb4Aaxsyp0ZgsGn9ZX
   Inev0au5UK9w7IFN9PjgK/qjJ46By71J2jrvS9JYWNjPkuLq+FKjb4n5w
   MhgbYV/XfFDdR+1l6GdqTUj2wInEAfBgdfes9YxGeGzbbIY/V5tSJE/L5
   jy3YKhcbkSgyVkiRLVMeBvxDqS/JNzAIRoMXxP/beXcNRPYYhkyWrikhP
   jlWlCwZYpkcwSPNjs/jtJVmRNT83kjTEo0J49v2jZtZ19wLrLf7LOFwsa
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="344308854"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="344308854"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 22:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="677348458"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2022 22:32:33 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o3syf-0000sx-9h;
        Wed, 22 Jun 2022 05:32:33 +0000
Date:   Wed, 22 Jun 2022 13:32:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.20] BUILD SUCCESS
 bcc94f9a2581a035befd86cde7c4b80855203fec
Message-ID: <62b2a96f.52dZBCM53NMlXp4M%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.20
branch HEAD: bcc94f9a2581a035befd86cde7c4b80855203fec  m68k: sun3: Use __func__ to get function's name in an output message

elapsed time: 1505m

configs tested: 2
configs skipped: 117

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allyesconfig
m68k                             allmodconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

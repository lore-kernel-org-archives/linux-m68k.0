Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568C3C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Jul 2022 22:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiGLWEi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Jul 2022 18:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGLWEh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 12 Jul 2022 18:04:37 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383DF599DF
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Jul 2022 15:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657663477; x=1689199477;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oATL8PUqtkbQKo7jrOLjjX5gzHl0AT+d+IG0eitdbDc=;
  b=Fim1PHAXWR9TBSsjZJImgd+FBCNN9Q6ds0/Hm+6ke0JZHcI6ngy+yzoT
   /dfEgZ+sZr7kiF2tNuFCQw6hIEhkuR6b3+p0oXxVi1bOu+JTPT2YxreeF
   Kq3EVARWkzVltYEPtB40w3BxAR8jCrb7rJOSRpo4ZnN+8Z31076HLuerJ
   Vbltj0STQGeUSEBdhvFmx/zb00ervzbilFpLD6Ln5CDY9MIW9CuxFqzXh
   yl5zIaFh5mX2pk5GI10wVyKzw4cahx3+YGhJ9uGGxBTDO5kVLifHScNUH
   c3wc3vVhRVZzvTRj84NT+9v2U3KvyeDjyejOWvF6q5wMAWxh1Qjw5w9WU
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="286183461"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="286183461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 15:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="622677317"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Jul 2022 15:04:35 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oBNze-0002jL-Fo;
        Tue, 12 Jul 2022 22:04:34 +0000
Date:   Wed, 13 Jul 2022 06:03:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.20] BUILD SUCCESS
 b508128bb0d1e243beb56cca5d819bcbb5c269b1
Message-ID: <62cdefcb.thqzzlLJcfBVpilf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.20
branch HEAD: b508128bb0d1e243beb56cca5d819bcbb5c269b1  m68k: defconfig: Update defconfigs for v5.19-rc1

elapsed time: 728m

configs tested: 2
configs skipped: 121

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allyesconfig
m68k                             allmodconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

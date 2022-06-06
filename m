Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBB0CCA473
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Jun 2022 11:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235712AbiFFLum (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Jun 2022 07:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235693AbiFFLu0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Jun 2022 07:50:26 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6E023D5FC
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jun 2022 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654516224; x=1686052224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0UfNxvkyTgN3+Cr6Fria9sdwavpE+KYijn4w/ioe52M=;
  b=Y3O9PCInltyXSJ60WClAYhkP/rON6YFzTf1XUuqZz1UYP5AaNpjdZ9L2
   KkAOP2Eha13pCt0TU8+oDQFr5aHOncx84oisttKsUiKQ+skC06tTCHWSv
   lWbLuR3W8FcNyRlC4AXlYxGxpJhxUczL/1qqxCJCh/ua2HUFEGkeT89dV
   goX22V7GBdX6WSl3fdNNfuICiH/81fB4Bgit1OJ/HoIZkhpefRwU3NeGh
   QE87Eeii9fKzMIOPBfF5p2q7F1nbkn9vusaP4rrLUDFCXYxW9e/g+Lm17
   vzIdJOQQX/n/VDKa4h4/exQMxPASv1JVLh3P4p254lk7dxXKE3JFNbr9E
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="258951663"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="258951663"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 04:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="583594985"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2022 04:50:18 -0700
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
        by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 256BoDHi010626;
        Mon, 6 Jun 2022 12:50:17 +0100
From:   Alexander Lobakin <alexandr.lobakin@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>
Cc:     Alexander Lobakin <alexandr.lobakin@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] bitops: define gen_test_bit() the same way as the rest of functions
Date:   Mon,  6 Jun 2022 13:49:04 +0200
Message-Id: <20220606114908.962562-4-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606114908.962562-1-alexandr.lobakin@intel.com>
References: <20220606114908.962562-1-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Currently, the generic test_bit() function is defined as a one-liner
and in case with constant bitmaps the compiler is unable to optimize
it to a constant. At the same time, gen_test_and_*_bit() are being
optimized pretty good.
Define gen_test_bit() the same way as they are defined.

Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
---
 include/asm-generic/bitops/generic-non-atomic.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/bitops/generic-non-atomic.h b/include/asm-generic/bitops/generic-non-atomic.h
index 7a60adfa6e7d..202d8a3b40e1 100644
--- a/include/asm-generic/bitops/generic-non-atomic.h
+++ b/include/asm-generic/bitops/generic-non-atomic.h
@@ -118,7 +118,11 @@ gen___test_and_change_bit(unsigned int nr, volatile unsigned long *addr)
 static __always_inline int
 gen_test_bit(unsigned int nr, const volatile unsigned long *addr)
 {
-	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
+	const unsigned long *p = (const unsigned long *)addr + BIT_WORD(nr);
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long val = *p;
+
+	return !!(val & mask);
 }
 
 #endif /* __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H */
-- 
2.36.1


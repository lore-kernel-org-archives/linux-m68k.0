Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DD3CCA47B
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Jun 2022 11:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349371AbiFJLgM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Jun 2022 07:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347728AbiFJLf7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Jun 2022 07:35:59 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916CF403CA
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 04:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654860953; x=1686396953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DT50KSu+dkwFmnyj0sxL9pF5VyPowriYXEyZrXDQToM=;
  b=d73Y2h39AZDAT08QZQbvikzFQqb6gohpTYNXDNg+y04M4dXdsr4mYkPQ
   PMZWlRmEjmID35cHSQMLIt47bs/rHo8542ur46vFuRKmTyggD0WlKajF0
   uaU/55J3g9FD/sxpkL0L9i/ygXkSaalyTASmeP6Oh4i8Ib0WC+IbvdFvk
   agj53SDNQNOza0B0JWJGtjeA9u58CrKVSUGOw0AWWoFbCJXZZwa6bQKK1
   H+ehpwfWmvPGYUKH4WoY5NHyHlS/vSmNBNNaIQmXRmbgt2VpEXhhUfBEn
   Tk6b27CEuSahbgbTorrzZfAfJzaZd70QqMZa5W+vpXEqkuXKB5GKKvWHK
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="276380711"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="276380711"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 04:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="671810849"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2022 04:35:28 -0700
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
        by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 25ABZKik030333;
        Fri, 10 Jun 2022 12:35:26 +0100
From:   Alexander Lobakin <alexandr.lobakin@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>
Cc:     Alexander Lobakin <alexandr.lobakin@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
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
Subject: [PATCH v2 4/6] bitops: define const_*() versions of the non-atomics
Date:   Fri, 10 Jun 2022 13:34:25 +0200
Message-Id: <20220610113427.908751-5-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610113427.908751-1-alexandr.lobakin@intel.com>
References: <20220610113427.908751-1-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Define const_*() variants of the non-atomic bitops to be used when
the input arguments are compile-time constants, so that the compiler
will be always to resolve those to compile-time constants as well.
Those are mostly direct aliases for generic_*() with one exception
for const_test_bit(): the original one is declared atomic-safe and
thus doesn't discard the `volatile` qualifier, so in order to let
optimize the code, define it separately disregarding the qualifier.
Add them to the compile-time type checks as well just in case.

Suggested-by: Marco Elver <elver@google.com>
Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
---
 .../asm-generic/bitops/generic-non-atomic.h   | 31 +++++++++++++++++++
 include/linux/bitops.h                        |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/bitops/generic-non-atomic.h b/include/asm-generic/bitops/generic-non-atomic.h
index 3ce0fa0ab35f..9a77babfff35 100644
--- a/include/asm-generic/bitops/generic-non-atomic.h
+++ b/include/asm-generic/bitops/generic-non-atomic.h
@@ -121,4 +121,35 @@ generic_test_bit(unsigned long nr, const volatile unsigned long *addr)
 	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
 }
 
+/*
+ * const_*() definitions provide good compile-time optimizations when
+ * the passed arguments can be resolved at compile time.
+ */
+#define const___set_bit			generic___set_bit
+#define const___clear_bit		generic___clear_bit
+#define const___change_bit		generic___change_bit
+#define const___test_and_set_bit	generic___test_and_set_bit
+#define const___test_and_clear_bit	generic___test_and_clear_bit
+#define const___test_and_change_bit	generic___test_and_change_bit
+
+/**
+ * const_test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ *
+ * A version of generic_test_bit() which discards the `volatile` qualifier to
+ * allow the compiler to optimize code harder. Non-atomic and to be used only
+ * for testing compile-time constants, e.g. from the corresponding macro, or
+ * when you really know what you are doing.
+ */
+static __always_inline bool
+const_test_bit(unsigned long nr, const volatile unsigned long *addr)
+{
+	const unsigned long *p = (const unsigned long *)addr + BIT_WORD(nr);
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long val = *p;
+
+	return !!(val & mask);
+}
+
 #endif /* __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H */
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 87087454a288..51c22b8667b4 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -36,7 +36,8 @@ extern unsigned long __sw_hweight64(__u64 w);
 
 /* Check that the bitops prototypes are sane */
 #define __check_bitop_pr(name)						\
-	static_assert(__same_type(arch_##name, generic_##name) &&	\
+	static_assert(__same_type(const_##name, generic_##name) &&	\
+		      __same_type(arch_##name, generic_##name) &&	\
 		      __same_type(name, generic_##name))
 
 __check_bitop_pr(__set_bit);
-- 
2.36.1


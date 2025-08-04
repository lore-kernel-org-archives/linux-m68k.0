Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010F9286898
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Aug 2025 16:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754325864; cv=none; b=VR/IPPwivYQ+GXxwRC1T+Sc72ICPnmipusgBR76Bn+PZtU/eJoL27nToKcwIKpEKMmZCvyg1NqoSzj608DYWKOfdUeTdVXUzaigeOkeD7wV68WZCyMGaO9+dvA3p8CuQewbxE7SsEUdnH14qTWvIXN6RWqgmu5xweLWYcF5U9XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754325864; c=relaxed/simple;
	bh=HdxC+YrG0RYotBTATCCMvdXpeJF/VSAnm1GW7teMP8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q8qFwmKyzHN0C6YDE60/CUSYUCWCxF9DqmwdQK14JsLf2TEmT05RF66l8YpHVHwmx6c8pvoXGdM2v222pb+Dp8XzB4Cwi80PYMIAIZTqumrDD3MqW4l7enuRfxg6B9njXyiCggtBQTzs2ZFz3kKwAzA22NPHdPLdeO6OHOYTKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eht0h6wa; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eht0h6wa"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC8E045E9D;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4D0C19425;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=HdxC+YrG0RYotBTATCCMvdXpeJF/VSAnm1GW7teMP8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eht0h6wavbG5fQnbmTMV1LmgGtMtTND4AiQx88qlrbrKMG7q+I2KV9TG5su1TUwJl
	 9JdYbIVDZVFNRpe+KxrQj3yYkr4jIKgX9AM48OY/X2HUTDt/yQMqghpZgo8dI+lUiY
	 sPFgdBPotx0O5vmB6rNUrXXCO7pIkGlxNLrZo/VrhZoavzwFsJfvHQQ5GRxGNORwYq
	 ll8Z8hIgRcmL2pG5t8gqltpIuUcpQJARO85MAZKd2YSKMLDdNiWDCDoVxzSQxjvD/J
	 I98kgiMNwgfmoVibR8Ga7ysDFMZhTXmoCPMBAlSUtMbpOVSZMmG3i0SdT9ZJxpw6vZ
	 nJ6HuuSPbsIvw==
From: Kees Cook <kees@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 17/17] KUnit: ffs: Validate all the __attribute_const__ annotations
Date: Mon,  4 Aug 2025 09:44:13 -0700
Message-Id: <20250804164417.1612371-17-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3872; i=kees@kernel.org; h=from:subject; bh=HdxC+YrG0RYotBTATCCMvdXpeJF/VSAnm1GW7teMP8Q=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHsc45wRtnf/oYkjVF1ejQumtl0UPxWm1daQdPSSrw bs5K8W2o5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCKRWxgZOjz/P/l/pMCzl0Hu 27r4n4VL9jtHtEl/uSCclF54euLlvwz/qxb+jO8s3m0ks3bJu3DRTzNP+l7bENDeHCloJ86woVy TAwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute_const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Validate all the __attibute_const__ annotations were found for all
architectures by reproducing the specific problem encountered in the
original bug report.

Build and run tested with everything I could reach with KUnit:

$ ./tools/testing/kunit/kunit.py run --arch=x86_64 ffs
$ ./tools/testing/kunit/kunit.py run --arch=i386 ffs
$ ./tools/testing/kunit/kunit.py run --arch=arm64 --make_options "CROSS_COMPILE=aarch64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=arm --make_options "CROSS_COMPILE=arm-linux-gnueabi-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=powerpc ffs
$ ./tools/testing/kunit/kunit.py run --arch=powerpc32 ffs
$ ./tools/testing/kunit/kunit.py run --arch=powerpcle ffs
$ ./tools/testing/kunit/kunit.py run --arch=m68k ffs
$ ./tools/testing/kunit/kunit.py run --arch=loongarch ffs
$ ./tools/testing/kunit/kunit.py run --arch=s390 --make_options "CROSS_COMPILE=s390x-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=riscv --make_options "CROSS_COMPILE=riscv64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=riscv32 --make_options "CROSS_COMPILE=riscv64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=sparc --make_options "CROSS_COMPILE=sparc64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=sparc64 --make_options "CROSS_COMPILE=sparc64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=alpha --make_options "CROSS_COMPILE=alpha-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=sh --make_options "CROSS_COMPILE=sh4-linux-gnu-" ffs

Closes: https://github.com/KSPP/linux/issues/364
Signed-off-by: Kees Cook <kees@kernel.org>
---
 lib/tests/ffs_kunit.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/lib/tests/ffs_kunit.c b/lib/tests/ffs_kunit.c
index ed11456b116e..9a329cdc09c2 100644
--- a/lib/tests/ffs_kunit.c
+++ b/lib/tests/ffs_kunit.c
@@ -496,6 +496,46 @@ static void ffz_edge_cases_test(struct kunit *test)
 	}
 }
 
+/*
+ * To have useful build error output, split the tests into separate
+ * functions so it's clear which are missing __attribute_const__.
+ */
+#define CREATE_WRAPPER(func)						\
+static noinline bool build_test_##func(void)				\
+{									\
+	int init_##func = 32;						\
+	int result_##func = func(6);					\
+									\
+	/* Does the static initializer vanish after calling func? */	\
+	BUILD_BUG_ON(init_##func < 32);					\
+									\
+	/* "Consume" the results so optimizer doesn't drop them. */	\
+	barrier_data(&init_##func);					\
+	barrier_data(&result_##func);					\
+									\
+	return true;							\
+}
+CREATE_WRAPPER(ffs)
+CREATE_WRAPPER(fls)
+CREATE_WRAPPER(__ffs)
+CREATE_WRAPPER(__fls)
+CREATE_WRAPPER(ffz)
+#undef CREATE_WRAPPER
+
+/*
+ * Make sure that __attribute_const__ has be applied to all the
+ * functions. This is a regression test for:
+ * https://github.com/KSPP/linux/issues/364
+ */
+static void ffs_attribute_const_test(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, build_test_ffs());
+	KUNIT_EXPECT_TRUE(test, build_test_fls());
+	KUNIT_EXPECT_TRUE(test, build_test___ffs());
+	KUNIT_EXPECT_TRUE(test, build_test___fls());
+	KUNIT_EXPECT_TRUE(test, build_test_ffz());
+}
+
 /*
  * KUnit test case definitions
  */
-- 
2.34.1


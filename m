Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ECD2E83F
	for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Feb 2024 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709110742; cv=none; b=s9neoApQuEMrKjZ4TvwyTAwvmIkF+Ylt7IqLLYF9iHKUxNDWJT8hJjJ+rkUXx3qoZmWhWUo7ysppC49j3XMjHccEE8ztrMIwV8kWD0DlgQNr4ZA2Cr/hkCr5CmEj8pWvoZFBlrlHH3Tmb41/YRgME0egBdtgLfyjgdTbWLIOh8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709110742; c=relaxed/simple;
	bh=RDvcBlVuIemwLM4J03ulD1eFMdgG9/KmMg5CARU8pQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qajf8JX1q2OxiQvffu4EJgpNOLhDe5Pc17PSItI7sOqGpmbM+ArhTnRLUWpYbtm4K5VHeuP5QccAYPw76eYTN93jLmm3Fi5muYKUDWk6eYH9x2NP2Lhk+JfEs3WJQ0xkQ+ZXzFFIuhzknY3sIWCy+j599xf+ehKf8ilLCz98m6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass smtp.mailfrom=shingroup.cn; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shingroup.cn
X-QQ-mid: bizesmtp81t1709110713tb5brp7v
X-QQ-Originating-IP: RMFuvulrkTTkIP3veOx5DZWOUzbPAQR7RNVNIZjsZAQ=
Received: from localhost ( [112.22.30.30])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Feb 2024 16:58:32 +0800 (CST)
X-QQ-SSF: 01400000000000505000000F0000000
X-QQ-FEAT: LE7C6P2vL8S2AsPvDMxMsvXF+uR7nFYwkxu3h1ZViKpA2gYns/FH84WdcCO1m
	A9y5Xklv7vi7WpLi05dx2fTfkPNHUtslCmUkh8VaAlXr/Mii1L24lZiIeEU9GgBwu6ELmCG
	Yp5eXgQrWF0h58L+WEaKuboRvZ+2LRlqIodEp8+BtmTqkafTgd/TXC3agtGlM2GfwTrERLM
	OoIyX6cYvGPkf4DuxsRzACF2+g97DyrnC61htmVfL15IU/w8GA4ePV9H1ypPGpUnAKbdP9h
	/Bx1Ls+WojIKWMFGG6YA+C38tNgymkK3XcUJ4pssb6XWERXJDQpD1ywHAjw15wnTcZoMrpk
	FRvfTz+5rwdZWgxsF95DFA4zg4XfU82GpMYXCgUVZGshWi8imujDYYXN0Jwn1dIXCKOlJDt
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 16178612125370400260
From: Dawei Li <dawei.li@shingroup.cn>
To: geert@linux-m68k.org
Cc: gerg@snapgear.com,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com,
	Dawei Li <dawei.li@shingroup.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mk68k: Fix broken THREAD_SIZE_ORDER
Date: Wed, 28 Feb 2024 16:58:24 +0800
Message-Id: <20240228085824.74639-1-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1

Current THREAD_SIZE_ORDER implementation for m68k is incorrect, fix it
by ilog2().

Fixes: cddafa3500fd ("m68k/m68knommu: merge MMU and non-MMU thread_info.h")
Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
Cc: stable@vger.kernel.org
---
 arch/m68k/include/asm/thread_info.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 31be2ad999ca..50faecd6fc5f 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -19,7 +19,8 @@
 #else
 #define THREAD_SIZE	PAGE_SIZE
 #endif
-#define THREAD_SIZE_ORDER	((THREAD_SIZE / PAGE_SIZE) - 1)
+
+#define THREAD_SIZE_ORDER	ilog2(THREAD_SIZE / PAGE_SIZE)
 
 #ifndef __ASSEMBLY__
 
-- 
2.27.0


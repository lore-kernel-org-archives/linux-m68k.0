Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03014C433F5
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Nov 2021 07:23:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD8D0603E9
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Nov 2021 07:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhKCH0H (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 Nov 2021 03:26:07 -0400
Received: from smtpbg604.qq.com ([59.36.128.82]:45964 "EHLO smtpbg604.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232047AbhKCH0G (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 3 Nov 2021 03:26:06 -0400
X-QQ-mid: bizesmtp53t1635924192tx7l0973
Received: from localhost.localdomain (unknown [125.70.163.9])
        by esmtp6.qq.com (ESMTP) with 
        id ; Wed, 03 Nov 2021 15:22:59 +0800 (CST)
X-QQ-SSF: 0100000000200040B000000A0000000
X-QQ-FEAT: F3yR32iATbi+01qVliYZ0OWssXX7k9Rodh2HUJUTqd02fyV4mgoJ9u1lhyw7F
        ngPmSc2M8/8dcjnDhnMPtH7ysekB8qk6FxMP+vqrbTZ+bylTtLg3UREExH0ck4DBF4EOal5
        gPMMzSoOqjRG1uNGl7GTBCBCcflEJd7Q4TzJ3TyJjTQaPJ7DhDW7iZaLtwl9FULQ6YMb+os
        UifXKpa3bWqtNK8v2iKWXeDcbQHT+dCFz+5I/kDryfVDhSS0KJQiyf+99nWI3d3K2TsRv8P
        MpYpt2LjW5IONXfZcig8Ovb4JOqZotsbZAlM0z8sphPX+nNRkAaXvi0qC6yMjz345HdRZSw
        dUONuXVnivPErom/vxqF5pTftyAbg==
X-QQ-GoodBg: 0
From:   Jingjing Liu <liujingjing@cdjrlc.com>
To:     gerg@linux-m68k.org
Cc:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org, Jingjing Liu <liujingjing@cdjrlc.com>
Subject: [PATCH] m68k: coldfire: Prefer unsigned int to bare use of unsigned
Date:   Wed,  3 Nov 2021 15:22:52 +0800
Message-Id: <20211103072252.24556-1-liujingjing@cdjrlc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Fix checkpatch warnings:
	WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Jingjing Liu <liujingjing@cdjrlc.com>
---
 arch/m68k/coldfire/m520x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/m520x.c b/arch/m68k/coldfire/m520x.c
index d2f96b40aee1..dca89214bbc6 100644
--- a/arch/m68k/coldfire/m520x.c
+++ b/arch/m68k/coldfire/m520x.c
@@ -106,7 +106,7 @@ static struct clk * const disable_clks[] __initconst = {
 
 static void __init m520x_clk_init(void)
 {
-	unsigned i;
+	unsigned int i;
 
 	/* make sure these clocks are enabled */
 	for (i = 0; i < ARRAY_SIZE(enable_clks); ++i)
-- 
2.33.1


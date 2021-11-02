Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3C9C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Nov 2021 12:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43FC160F36
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Nov 2021 12:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhKBMyb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 Nov 2021 08:54:31 -0400
Received: from smtpbg704.qq.com ([203.205.195.105]:54557 "EHLO
        smtpproxy21.qq.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231267AbhKBMyb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 Nov 2021 08:54:31 -0400
X-QQ-mid: bizesmtp43t1635857498tscl2n4u
Received: from localhost.localdomain (unknown [125.70.163.9])
        by esmtp6.qq.com (ESMTP) with 
        id ; Tue, 02 Nov 2021 20:51:36 +0800 (CST)
X-QQ-SSF: 0100000000200040B000000A0000000
X-QQ-FEAT: ke64Y+R1JM0ThU8WVzbCeOed4r4zvX9G8Ap5anGKqIqdx4LXrqxY1uf3D8qmd
        TKfqVwP9/nqU4dfkUof8e+dfA36lR8nJhC9oL4vXBcNq+6vYeSNllY9nsxrqvN4fR0rQ4xj
        tK1TmajUdeem7qDkL1jappgM7NDbpkk895Sc/d7GPu/xVVrR0rgzJhE3Ct37NlF/EZyr8hR
        fIbvCDN7dWQdNLTuiwNExclcm7xjo0FxrwPFrHgP+AV5GwLbo9Glifb2mP7gNMpx++fakDQ
        iZgXPDIPNePkswxOFL87J5/tm3dVtbx5Gjar1jypGRJjs1YcThJw4D9If4D3oG5AIa/koli
        bLhy5/f2B/XeLrVKzM=
X-QQ-GoodBg: 0
From:   Jingjing Liu <liujingjing@cdjrlc.com>
To:     geert@linux-m68k.org
Cc:     fthain@linux-m68k.org, axboe@kernel.dk,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Jingjing Liu <liujingjing@cdjrlc.com>
Subject: [PATCH] m68k/q40:Prefer 'unsigned int' to bare use of 'unsigned'
Date:   Tue,  2 Nov 2021 20:51:28 +0800
Message-Id: <20211102125128.23360-1-liujingjing@cdjrlc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Fix checkpatch warnings:
	WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Jingjing Liu <liujingjing@cdjrlc.com>
---
 arch/m68k/q40/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/q40/config.c b/arch/m68k/q40/config.c
index 5caf1e5be1c2..718e18717343 100644
--- a/arch/m68k/q40/config.c
+++ b/arch/m68k/q40/config.c
@@ -153,7 +153,7 @@ static unsigned int serports[] =
 
 static void __init q40_disable_irqs(void)
 {
-	unsigned i, j;
+	unsigned int i, j;
 
 	j = 0;
 	while ((i = serports[j++]))
-- 
2.33.1




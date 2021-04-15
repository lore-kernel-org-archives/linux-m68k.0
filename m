Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA54C433ED
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Apr 2021 03:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2486611AB
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Apr 2021 03:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbhDODQA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 14 Apr 2021 23:16:00 -0400
Received: from mail-m17635.qiye.163.com ([59.111.176.35]:44902 "EHLO
        mail-m17635.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhDODQA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 14 Apr 2021 23:16:00 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 8808A400090;
        Thu, 15 Apr 2021 11:15:35 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Sam Creasey <sammy@sammy.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] m68k: Remove unneeded semicolon
Date:   Thu, 15 Apr 2021 11:14:50 +0800
Message-Id: <20210415031450.23379-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ0MZTlZDQx8dGB9CQklDTExVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MD46Dhw*Fj8TMBMJDilJCjYX
        T0oaCh1VSlVKTUpDT05NTkhNS0pIVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKTktPNwY+
X-HM-Tid: 0a78d386e278d991kuws8808a400090
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Fix the following coccicheck warning:

./arch/m68k/include/asm/sun3xflop.h:109:2-3: Unneeded semicolon

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 arch/m68k/include/asm/sun3xflop.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/sun3xflop.h b/arch/m68k/include/asm/sun3xflop.h
index 93f2a8431c0e..bce8aabb5380 100644
--- a/arch/m68k/include/asm/sun3xflop.h
+++ b/arch/m68k/include/asm/sun3xflop.h
@@ -106,7 +106,7 @@ static void sun3x_82072_fd_outb(unsigned char value, int port)
 	case 4: /* FD_STATUS */
 		*(sun3x_fdc.status_r) = value;
 		break;
-	};
+	}
 	return;
 }
 
-- 
2.25.1


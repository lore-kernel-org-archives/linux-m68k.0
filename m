Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29109C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Dec 2021 09:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235752AbhL0JJd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Dec 2021 04:09:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235748AbhL0JJc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Dec 2021 04:09:32 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84650C061401
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Dec 2021 01:09:32 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id i8so4603072pgt.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Dec 2021 01:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KP3YVQJ4biv4U+8Gd/f+YsR8MUWxl5xUFHc5/8r5sRM=;
        b=Zf+fHnZmOREYGBv2HVzFWEoL3SomNcCJ297KAPMlzEzEmaxt8YgQ0FjmEhnRXfU24U
         c7opPNO6VyWtll0ssAiqTn7RHKZSAMuK6pZhLhk/JLboJZtSQ4L5qoICtFCxOYI8AuaR
         QNnLGOlFwxioToP+GJl2IENEXYVote2Me/ntF0ksIYh9Kg+TCVtD6zM/m/HqpZHmM9lU
         AWg/w6LiDyx00FmJ8nhhyz7WG/aiyi0Ncg0mhMcWVOirrcUum/n8IeTQ3I1zM08mF2p9
         Ozs47eg/a+HrY/fJRsH0Ejn90M/6s5HsC009bG23pjBA8iNk/cper5louHkutd6JhsLv
         5bbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KP3YVQJ4biv4U+8Gd/f+YsR8MUWxl5xUFHc5/8r5sRM=;
        b=a1FhQioFXgitZYPF8euYzEgTAOFRTpcM8b1Ow0S5FR7E7Utn08UGMDlV+/F4bPuwI5
         sOY6UEWXG/zzPPxK3xZLsdg9yDGYYask64gXlB602nfofTk9tTQ+5hpjeI06q7OfPYL1
         ARS/oX09qxD8FwuJXS6T4KMsVH68jWj02oshOUozH3TLIIiOp9oPz8TVCXpNlMbnUwm4
         yfmnJCOaXSg5RzaJmWjvpUlnAtLLCp3U3O3MuuoiRjehhLqfei6qIfeg9fPwP4Va0/iT
         TG9i8pIoiOaRNvSCqlZ+nlVhRt5PUbPsgt7ShRug1yDzZ4hodWYThziYWIAAiWHcmtnJ
         Cnog==
X-Gm-Message-State: AOAM531Lq17oRxoikizEZGc9UEUkvJ9JufzPTUAsPfWAu9kY+G4Bor1Q
        30QntepsZP/hu8rLUAZdmk4=
X-Google-Smtp-Source: ABdhPJy5lDNV56AsXfd2Am9DMW6ZwTZOAge3OfJcO94V6iXHXjAocOeCUQxKZ0Tx38MOVp5oaP9ssA==
X-Received: by 2002:a63:5906:: with SMTP id n6mr14670827pgb.586.1640596171879;
        Mon, 27 Dec 2021 01:09:31 -0800 (PST)
Received: from slim.das-security.cn ([103.84.139.53])
        by smtp.gmail.com with ESMTPSA id 10sm16659078pfm.56.2021.12.27.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 01:09:31 -0800 (PST)
From:   Hangyu Hua <hbh25y@gmail.com>
To:     geert@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH] m68k/kernel: array out of bound access in process_uboot_commandline
Date:   Mon, 27 Dec 2021 17:09:17 +0800
Message-Id: <20211227090917.35838-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When the size of commandp >= size, array out of bound write occurs because
len == 0.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 arch/m68k/kernel/uboot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index 928dbd33fc4a..05eca6f653b5 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -101,5 +101,8 @@ __init void process_uboot_commandline(char *commandp, int size)
 	}
 
 	parse_uboot_commandline(commandp, len);
-	commandp[len - 1] = 0;
+	if (len > 0)
+		commandp[len - 1] = 0;
+	else
+		commandp[0] = 0;
 }
-- 
2.25.1


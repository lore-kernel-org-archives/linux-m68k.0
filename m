Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E25FC433E0
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Feb 2021 12:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0666364FCB
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Feb 2021 12:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhBEMLZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 Feb 2021 07:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbhBEMFy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 Feb 2021 07:05:54 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59AFC061794
        for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Feb 2021 04:05:13 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id h21so3271632qvb.8
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Feb 2021 04:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w6IhO9s40oec0IOKUurPh0EF/d7cv4coioK7fFZj4LQ=;
        b=SpJO5Tt1TO1dUD3i4VucFeay0wqS/HfNKt+YEFegYexKHkj5sf8P+tSXF8/dnQft/5
         rvpy4jzhX800lgtMIv7LL4wkzvKx31Lpv2dbxbBRkAvs4M1p9lvHHhX3ZZUHyaf2JajQ
         KIdBbmu7zxfFX1KbqbcoY8VBtqpPdd3VU8YN9IM1H6LKlHO4L86b+0nJFS2auCj3zv05
         NqJQY/kF7WOoq2b0snEqSwLfSmoRF0hYPaKFj6gNRijH91nJoe/RQVglOYW9YMYaerCh
         PE5vJ0jnDY/9lYoDlgoapXEC7/6GqjDrziidw6YJxCkXnnPxUCt2a7ZzR4UCF8EuV9Fd
         Fs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w6IhO9s40oec0IOKUurPh0EF/d7cv4coioK7fFZj4LQ=;
        b=rhOyKWMWYp7pueC/CqtMCmR+3ZiNFvXTlrt/GiojLRp8LframQ1si1MpLi6rpn0GW2
         Lcm1YUmC5m7rvAz3Q7Jz0NowQcAX5IQyrwM9PmLy56ZnVinsdG0MGP1W3F2IDmqpueEb
         bd2zYWvtd+ETSUNg9JEawisA2GSqomhtEfliR1o/mnIKvdPvgYdYmKjVEHCn2jIaxeng
         QdJQOgBdEug6eWRLMN/git/OVwxEnZPi4mRcf86dDPC5If8CXjwUmGDTVk7MLWqAuXwU
         SJmBqXrR+s8w5Uaz1SqPhPricJNYz1nIjtL+aD2ZYJgdsC0qYX+IC/fUrl0DobL51AXT
         pa/A==
X-Gm-Message-State: AOAM530jO6oozKBXxf020tSb/g6P31Q/5rpF6ORAZYI5H1jouKkBB1BS
        AnTujRfds+4DQJEOMfk9VoE=
X-Google-Smtp-Source: ABdhPJwBexh4xI/1rmx/HQV+TJIDu6za4Ky6jCeJARIIc9+W8w3Zca33NATu5VKjlAWwrLT0aXbymg==
X-Received: by 2002:a0c:f986:: with SMTP id t6mr3977209qvn.15.1612526713013;
        Fri, 05 Feb 2021 04:05:13 -0800 (PST)
Received: from localhost.localdomain ([138.199.10.106])
        by smtp.gmail.com with ESMTPSA id v135sm9328298qka.98.2021.02.05.04.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:05:12 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     sammy@sammy.net, geert@linux-m68k.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] arch: m68k: include: asm: Reconstruct the sentence in file sun3ints.h
Date:   Fri,  5 Feb 2021 17:34:55 +0530
Message-Id: <20210205120455.1289448-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



s/fuck/"do anything"/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/m68k/include/asm/sun3ints.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/sun3ints.h b/arch/m68k/include/asm/sun3ints.h
index 309d6e6a1374..1bbd76545d8f 100644
--- a/arch/m68k/include/asm/sun3ints.h
+++ b/arch/m68k/include/asm/sun3ints.h
@@ -27,7 +27,7 @@ extern void sun3_enable_interrupts (void);
 extern void sun3_disable_interrupts (void);
 extern volatile unsigned char* sun3_intreg;

-/* master list of VME vectors -- don't fuck with this */
+/* master list of VME vectors -- don't do anything with this */
 #define SUN3_VEC_FLOPPY		(IRQ_USER+0)
 #define SUN3_VEC_VMESCSI0	(IRQ_USER+0)
 #define SUN3_VEC_VMESCSI1	(IRQ_USER+1)
--
2.30.0


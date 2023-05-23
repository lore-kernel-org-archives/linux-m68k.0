Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6505DC7EE23
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 14:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237094AbjEWOGv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 May 2023 10:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237077AbjEWOGt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 May 2023 10:06:49 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790C7132
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 07:06:47 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f3b5881734so4432586e87.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850746; x=1687442746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=yi3hcBL/sMAfGA15PDa1P8NdEmww4HzJP2F/sUwI9IpWl8FAr9D8nzxcXs3kk9VZLg
         gqW+uTf0Quu6EKOMoBtewB5My0WXhMod0GC8z1ZbYL4s/yewGksiSDol/qQUkOAwxxUP
         tWgq8rOI0YG+2kzNAd6LFlZQnU/w/sUVfPTphub78KgJsbXLOjbr0epF5+oc5rNWTcLT
         4z9nAmfx1uJBTtHPDaWVenyL8i5pZQeTVRUJb52fjzXC6jarDxR7o0xXXXnUa9XVKQra
         c4l8ZCAV1hnrQiBJbDsUuYXenW29rw/An0d2CKxpWMKMbNQerNNefqEtiX0g0tIAPTZn
         73Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850746; x=1687442746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=GVJa53Iq6+P/3LMAv6lz/C2LJGurP5dVhWXBTGpHfyL4Jg/axKpIuDTEP1EH8yk5nS
         b2nDi9dmXF46/j2EDBUVIk6TJT5e2duIX8t9SIjBoS3eJktZ7GNvTOtAFHLtVdnepAw2
         ObGWoTI+SrGJT8V7PfWhXreFScQNJa8U9G/5fMWRC5ape/k00Viu2E0ei3WAIhKtE2Sq
         KNMIZet2oUoEa3pZktPpNwmCmxSON+mWSUBN6wPib3AKfLc9h3IblRfV+xcdOhSmVjUN
         bAU+SoYbY/XalzxuQLHEsKSZW6iGQsnyJ4h3qJTelXQOhGkBW4mFD3f5vT+3gnWZUo0R
         K6gg==
X-Gm-Message-State: AC+VfDxR6qoqPjqZGosw91+3F9U6RIdTvTHxySwFCe3DeRhL0UE9sMty
        2yT3yDQpNOssg89lUjT2Bmh4+A==
X-Google-Smtp-Source: ACHHUZ7rLgS3uJwWiogUeDYb0+CYWWtRVMpUMIrByqwxVk0kXBZ79wUE4ySYqYt+Mam8+eVWY8llcQ==
X-Received: by 2002:ac2:43a2:0:b0:4f3:a1db:ad4 with SMTP id t2-20020ac243a2000000b004f3a1db0ad4mr4313623lfl.66.1684850745735;
        Tue, 23 May 2023 07:05:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 May 2023 16:05:25 +0200
Subject: [PATCH v3 01/12] fs/proc/kcore.c: Pass a pointer to
 virt_addr_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-1-a16c19c03583@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org,
        linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-cifs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arch@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The virt_addr_valid() should be passed a pointer, the current
code passing a long unsigned int is just exploiting the
unintentional polymorphism of these calls being implemented
as preprocessor macros.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/proc/kcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 25b44b303b35..75708c66527f 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -199,7 +199,7 @@ kclist_add_private(unsigned long pfn, unsigned long nr_pages, void *arg)
 	ent->addr = (unsigned long)page_to_virt(p);
 	ent->size = nr_pages << PAGE_SHIFT;
 
-	if (!virt_addr_valid(ent->addr))
+	if (!virt_addr_valid((void *)ent->addr))
 		goto free_out;
 
 	/* cut not-mapped area. ....from ppc-32 code. */

-- 
2.34.1


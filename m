Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2112C43470
	for <linux-m68k@archiver.kernel.org>; Sun, 21 Mar 2021 21:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F5886195E
	for <linux-m68k@archiver.kernel.org>; Sun, 21 Mar 2021 21:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhCUVzm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 21 Mar 2021 17:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbhCUVzM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 21 Mar 2021 17:55:12 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414CAC061763
        for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Mar 2021 14:55:12 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id m7so10990984qtq.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Mar 2021 14:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/XStqP8D36CZJzw2TftI54Ck6LfKQaVMF+TC1pFq5UY=;
        b=boTqQ/9S6wam0P8nPn8btJusb093uXNIQ+5szswt4fPF0puRU1LwUoRPlSnbGlSVnf
         PG2rgmLg5ihl/HCy5l6yfzUd8TRaVTUDRyrRS1H1ZN87AK52jtsVD71/Pc/KZTdQLxDc
         Wp5oIZI69GG7YfRRGgLa4owGJIvKKbA9o8TvAOWvQvd/A3MKF5iNQOs6fjw6q9R7zHDp
         CMnjcoMcruP8lRHGDsx+Qwwphj2+AiLyk0LSQndypvb8zSM6Q53FFa3+B68Htng8VvfO
         3EZJAhcrCniYhwdqvXwn1cXMpcdyfjpVfAwsNMEci4jRkx3E9kV5CyaOmbXCN7Dxz73k
         xafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/XStqP8D36CZJzw2TftI54Ck6LfKQaVMF+TC1pFq5UY=;
        b=dkJuvgqLXuQB8sQ4VyY4wqhJfauTeBw+pWCJWgPZpa/5VniyScMJpNYDZEWkjUPt8M
         rI3DEbQG+67Gh5XyfeHshjXasM2gHSPCfloJ+e2Bc/P4/Q31JUPCdY2GUpwsKn/9lpB4
         oCKiSwaxM73FPTkNxCIfQo3/C7ZrZyG1MhgC5vNb93dfx26X386W0QwTcmfN3SZpP9ER
         DQit18Si+wb7aauhuQVZxTD85PHiECwUgWPR2ueIbiHy2VIrcfCVV9g3G7ANaI1Jje3V
         wPnK9HdbVlV2+qf/MHUYY9MNrlznUrGGxTg+pWsaSqF7giGCOjeV7IBHFKpTmAj4GW/h
         P6bg==
X-Gm-Message-State: AOAM530lUYnnW5nK0oyZXqCILp+GDyD5iTaISP3RhmiydalqJlb9J29K
        HeJz90p9GxbmS1Y6jgrWlK8=
X-Google-Smtp-Source: ABdhPJzuEUoa9KmXdMY9wULzE4YA/lfRLKC+pxc4pScjCeblaVmy7HRsyA9lMPhMUxxsJ6k5t5/hJw==
X-Received: by 2002:ac8:6790:: with SMTP id b16mr7160203qtp.379.1616363711463;
        Sun, 21 Mar 2021 14:55:11 -0700 (PDT)
Received: from localhost ([76.73.146.210])
        by smtp.gmail.com with ESMTPSA id r133sm9655356qke.20.2021.03.21.14.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 14:55:11 -0700 (PDT)
From:   Yury Norov <yury.norov@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Yury Norov <yury.norov@gmail.com>, linux-m68k@lists.linux-m68k.org,
        linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
        Alexey Klimov <aklimov@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        Joe Perches <joe@perches.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 12/12] MAINTAINERS: Add entry for the bitmap API
Date:   Sun, 21 Mar 2021 14:54:57 -0700
Message-Id: <20210321215457.588554-13-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210321215457.588554-1-yury.norov@gmail.com>
References: <20210321215457.588554-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add myself as maintainer for bitmap API and Andy and Rasmus as reviewers.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38ee5c1a7c3a..62be169be25a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3163,6 +3163,22 @@ F:	Documentation/filesystems/bfs.rst
 F:	fs/bfs/
 F:	include/uapi/linux/bfs_fs.h
 
+BITMAP API
+M:	Yury Norov <yury.norov@gmail.com>
+R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
+S:	Maintained
+F:	include/asm-generic/bitops/find.h
+F:	include/linux/bitmap.h
+F:	lib/bitmap.c
+F:	lib/find_bit.c
+F:	lib/find_bit_benchmark.c
+F:	lib/test_bitmap.c
+F:	tools/include/asm-generic/bitops/find.h
+F:	tools/include/linux/bitmap.h
+F:	tools/lib/bitmap.c
+F:	tools/lib/find_bit.c
+
 BLINKM RGB LED DRIVER
 M:	Jan-Simon Moeller <jansimon.moeller@gmx.de>
 S:	Maintained
-- 
2.25.1


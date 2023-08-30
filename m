Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05100C83F01
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Aug 2023 20:37:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240331AbjH3Uhr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Aug 2023 16:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240218AbjH3Uho (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 30 Aug 2023 16:37:44 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D263A277
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Aug 2023 11:55:42 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-34cafafa50eso244825ab.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Aug 2023 11:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693421677; x=1694026477; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3QMn3OzMi5xvDWjZZaqgwh4xUyJ2cGChp6VBLI0fVo=;
        b=VJ+OQ8ui3N9FYxav5g+4KBrp6KfvaMTet2SjqI+ZZNqul6swEfI83cQftYvQF7TzfU
         e+h3TjLVZc3LL9mFD7yz7qjniVTyLx9kc98J+BpPDXoBRk+UK8hRuu7vEw0uvkwb7SR+
         dI+xSeF43ncy/HPA+c2Hr9P2yP5RlHHItm7V8Nb5RBafaIN9HDXQe/oTKq4f4Pw4fhBC
         A69Fe+VBVuq/gWRoGmnri3qPAosjCXIvg+QzfU8vatsxqg+nuCPd/XP71jIBafT7Hdkr
         X1R/5cEnqKSo5b7ZM4uRHsEGRbj4krA+eRdJQhXG14Hiv03Y453DIWMfy2yVgSBIlhE5
         XBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693421677; x=1694026477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3QMn3OzMi5xvDWjZZaqgwh4xUyJ2cGChp6VBLI0fVo=;
        b=YMr+SvP90+Y0W2+82d6Pfe/sg19CIkf4HNHEj67DU6+HvZZA8tobC990CuMiCKyZdJ
         FLfZ6r7cfypib7YwEEkGlemoSh5w5nfQJ4r9jX5ZberUtnZDckzO1xOsUJ/+iw/wfH5i
         Y5pXSXwM+XM/V0MSCcmjQiv7+d+j9f1TViw9UWNijMiGcijjB9qYOFivZW1BeY1iDeAd
         Alx9c6zQqJ4gzFcm3yMD+264KnoQZ8XVEUCwc71gYdp5RFJCPDnBCMK+3TrvzmDXbnLP
         /hQGW6s7Bkmp1oj/2TKgBiUBU0qMNur5zwFBj3jFi2YhvG5NP7E1DTa2xOaaZXCkciOv
         H25A==
X-Gm-Message-State: AOJu0YzJ7J2vk63W0lQTs0ZbKxU6lXrjeiO5PClyLn2r1+JEySu+zpsp
        mK4LWrLFZlYDB/e3b6Dfn08=
X-Google-Smtp-Source: AGHT+IFXoI/B8H4SvdOW65eHwKS7fn9fnnKb+9GG6GfCU5+IlbLZCQzdxbln6V71KXjOG2kt3Y6mXg==
X-Received: by 2002:a05:6e02:1284:b0:345:a6c5:1ce8 with SMTP id y4-20020a056e02128400b00345a6c51ce8mr3312097ilq.14.1693421677437;
        Wed, 30 Aug 2023 11:54:37 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com (161.74.123.34.bc.googleusercontent.com. [34.123.74.161])
        by smtp.gmail.com with ESMTPSA id r23-20020a028817000000b004310d570d6dsm3921054jai.94.2023.08.30.11.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 11:54:36 -0700 (PDT)
From:   Azeem Shaikh <azeemshaikh38@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-hardening@vger.kernel.org,
        Azeem Shaikh <azeemshaikh38@gmail.com>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: [PATCH] m68k/atari: Replace strlcpy with strscpy
Date:   Wed, 30 Aug 2023 18:54:28 +0000
Message-ID: <20230830185428.4109426-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().

Direct replacement is safe here since return value of -errno
is used to check for truncation instead of sizeof(dest).

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 arch/m68k/emu/natfeat.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/emu/natfeat.c b/arch/m68k/emu/natfeat.c
index b19dc00026d9..d124c62022c2 100644
--- a/arch/m68k/emu/natfeat.c
+++ b/arch/m68k/emu/natfeat.c
@@ -42,10 +42,10 @@ long nf_get_id(const char *feature_name)
 {
 	/* feature_name may be in vmalloc()ed memory, so make a copy */
 	char name_copy[32];
-	size_t n;
+	ssize_t n;

-	n = strlcpy(name_copy, feature_name, sizeof(name_copy));
-	if (n >= sizeof(name_copy))
+	n = strscpy(name_copy, feature_name, sizeof(name_copy));
+	if (n < 0)
 		return 0;

 	return nf_get_id_phys(virt_to_phys(name_copy));
--
2.42.0.283.g2d96d420d3-goog



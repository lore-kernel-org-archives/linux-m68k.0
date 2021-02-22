Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99B2C433DB
	for <linux-m68k@archiver.kernel.org>; Mon, 22 Feb 2021 15:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77CE86148E
	for <linux-m68k@archiver.kernel.org>; Mon, 22 Feb 2021 15:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhBVPOz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 Feb 2021 10:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbhBVPOJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 Feb 2021 10:14:09 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ABCC0617AB
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Feb 2021 07:12:54 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id l30so3771626wrb.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Feb 2021 07:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DkOt0yrBVyRKH79yBKw6bfM0jQaRrACpcMjpjEsTbCk=;
        b=XovTNWHwTCos9xzXipmutbAdCB13MpWujMUaUW7i4hXpx6rYXFXRPIZ8/iNIwrIi2R
         IbP55z5TmCskc2vHnE7UiDvlds9Z4mcKkR0XlN2D3QfmOmA+nY0FgXuDfsvASdnr3ug3
         czItvGV4svJ/yme+wrTkvACH9L18hK0r1/zHtY+6xV+8xbuoGUGOBpls8YgfkWLuxWBa
         91YJKDhrgBm2P2OxXOxoUunNoOsDqTJcdQI2B7Chr/RrYqxeCm3jBUh0z5PE43xzj+Fs
         tWiylFYaUFkWZvLYXuEpybk/gQzm7sudrmZpNp3/2HLP7goAXFs5HwUHuZEsY0S7zSKy
         ZGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DkOt0yrBVyRKH79yBKw6bfM0jQaRrACpcMjpjEsTbCk=;
        b=ngvZRVTxKrCFv2qwbkHS2Xr4rr9ZEFa9FK5YzzM8ZvnFDCPmwLfCiKMEOSC6Bi8yPE
         G9MUXI3o12lSRmLgfmYOyb0rwHgVqoFYh2bE6OmLdTY2JTfP9Apk/OByh049tildO9Zq
         vx4An+m6H2z5ZFHAnfbotdWNb3rz3Oh7JPnFTSu+Zt11pWEse0YfCPGF1zhzGwopaoQv
         cOZBDJxDavkjvwMoTbvJ+Z9jcY+yEF1n40OkRW7NBGepdtSixGO30X5GsGIUfdWihLap
         7fl8sIvrpIqpHTcHdjbLgtG1qFuasuXIWRKxiBQIwF6huLD1W/atK0lFl41FfnPSiY0M
         urEg==
X-Gm-Message-State: AOAM533savZc98VN9qBwgzwhsDB1sOQviPT8aIgtd9StmvTFJf4gIJVY
        oZlQX9czSNTZNNBs2o+GXTc=
X-Google-Smtp-Source: ABdhPJzqndAalbnZM20kjoLXRdtC8IozfrJChCqLGB5rdddPCSw4ZQcEBtySznNjVccHSoocrtBBLg==
X-Received: by 2002:a5d:524b:: with SMTP id k11mr1010025wrc.122.1614006773420;
        Mon, 22 Feb 2021 07:12:53 -0800 (PST)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id y5sm12788081wrh.38.2021.02.22.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 07:12:52 -0800 (PST)
From:   Romain Perier <romain.perier@gmail.com>
To:     Kees Cook <keescook@chromium.org>,
        kernel-hardening@lists.openwall.com,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Romain Perier <romain.perier@gmail.com>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/20] m68k/atari: Manual replacement of the deprecated strlcpy() with return values
Date:   Mon, 22 Feb 2021 16:12:20 +0100
Message-Id: <20210222151231.22572-10-romain.perier@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222151231.22572-1-romain.perier@gmail.com>
References: <20210222151231.22572-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The strlcpy() reads the entire source buffer first, it is dangerous if
the source buffer lenght is unbounded or possibility non NULL-terminated.
It can lead to linear read overflows, crashes, etc...

As recommended in the deprecated interfaces [1], it should be replaced
by strscpy.

This commit replaces all calls to strlcpy that handle the return values
by the corresponding strscpy calls with new handling of the return
values (as it is quite different between the two functions).

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 arch/m68k/emu/natfeat.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/emu/natfeat.c b/arch/m68k/emu/natfeat.c
index 71b78ecee75c..fbb3454d3c6a 100644
--- a/arch/m68k/emu/natfeat.c
+++ b/arch/m68k/emu/natfeat.c
@@ -41,10 +41,10 @@ long nf_get_id(const char *feature_name)
 {
 	/* feature_name may be in vmalloc()ed memory, so make a copy */
 	char name_copy[32];
-	size_t n;
+	ssize_t n;
 
-	n = strlcpy(name_copy, feature_name, sizeof(name_copy));
-	if (n >= sizeof(name_copy))
+	n = strscpy(name_copy, feature_name, sizeof(name_copy));
+	if (n == -E2BIG)
 		return 0;
 
 	return nf_get_id_phys(virt_to_phys(name_copy));


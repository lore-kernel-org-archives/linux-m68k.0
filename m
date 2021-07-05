Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCFEC07E99
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 20:47:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 564EC61984
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 20:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhGEUuJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jul 2021 16:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhGEUuJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jul 2021 16:50:09 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82AEC061574
        for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Jul 2021 13:47:31 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id p21so12714264lfj.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Jul 2021 13:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=owhVWKFHyC3J6cH4NpobqXULLDkgBMIGsGNSqbFG3XY=;
        b=BSa6nUfzprgzTdHEWOMOnQZNeKGkfS+raoadhZ5IYkwWNTWbbXvOWo6MFDhISb502k
         te88t8goVaVMnOIRvcY0mNdFzdK5kAKeg1dju+bn/Ffq/U/+BFvHl1k5nP6vyDDNIzeN
         x6PgrClLlMWC1gU67W0xpOQbjF/VZEfi3JfA841iE/EXaIKV91IK/YgM+8wo4wYZ3oC1
         2ZyjzwxjhFaO3Cg1vN8mzfck6QqyNKu3KMfOYwdinUEecYExcNvLLIiFhsiNOHAYHd58
         ZsaR3A89kREWM8b+d6sHvES+YgV8XK9N6s6xKVtQGe043+pmEGbzPEBfd8F02WhMDbI+
         4XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=owhVWKFHyC3J6cH4NpobqXULLDkgBMIGsGNSqbFG3XY=;
        b=LAYuuUZQuzrRWBM31mxbP766Hsl51HSJ5arfCEgYwOOqOVnAXG002GEXQT26N3L/N6
         sXQbzkeyWo7T9yr6UaNdecspzBAVQqbxHnH07nl6nUoLZh9EKhhSDJO39u3Qus5AiOWX
         nshct92og5nWhOIte4spFXa3ui9rhb71b82U8c/ms1SKO6vT4tJGApJOtNy6iQTAfvaF
         SKD1znJmKc19QASk6lCtrZdpa/nDMO1VTEEJVTpSRBle/3+bn/deR4uYZeKYNsLFwreM
         Vzvqu2vayPbXGsRvHoYZHpdHIq9My1ZQagkCQKjjh/3VOg3N6QWA3tRXjlsVo2B3oLd9
         ehHA==
X-Gm-Message-State: AOAM533gQG4Of5RgjVIlwkdzzUmDOKwe7J/rJ507ou+BK3qwruAClk5A
        ZqBUxfQQbIPoIpCYoOrFxNY=
X-Google-Smtp-Source: ABdhPJzw9wLP5AtgjFm5rlh3Gh9CZFw6f6g0a83kkxQ8w6DcJZZAqZowRzR4YyaG81qS5iwuQcvEcA==
X-Received: by 2002:a05:6512:686:: with SMTP id t6mr12101439lfe.5.1625518049895;
        Mon, 05 Jul 2021 13:47:29 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
        by smtp.gmail.com with ESMTPSA id b19sm1506702ljo.37.2021.07.05.13.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 13:47:29 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     geert@linux-m68k.org, pstehlik@sophics.cz, milan.jurik@xylab.cz,
        schmitz@debian.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] m68k: emu: fix invalid free in nfeth_cleanup()
Date:   Mon,  5 Jul 2021 23:47:27 +0300
Message-Id: <20210705204727.10743-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

In for loop all nfeth_dev array members should be freed, not only
the first one. Freeing only first array member can cause double-free bug.

Fixes: 9cd7b148312f ("m68k/atari: ARAnyM - Add support for network
access")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 arch/m68k/emu/nfeth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/emu/nfeth.c b/arch/m68k/emu/nfeth.c
index d2875e32abfc..79e55421cfb1 100644
--- a/arch/m68k/emu/nfeth.c
+++ b/arch/m68k/emu/nfeth.c
@@ -254,8 +254,8 @@ static void __exit nfeth_cleanup(void)
 
 	for (i = 0; i < MAX_UNIT; i++) {
 		if (nfeth_dev[i]) {
-			unregister_netdev(nfeth_dev[0]);
-			free_netdev(nfeth_dev[0]);
+			unregister_netdev(nfeth_dev[i]);
+			free_netdev(nfeth_dev[i]);
 		}
 	}
 	free_irq(nfEtherIRQ, nfeth_interrupt);
-- 
2.32.0


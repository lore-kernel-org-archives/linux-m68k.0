Return-Path: <SRS0=A4BP=73=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5E1C433E0
	for <linux-m68k@archiver.kernel.org>; Sun, 14 Jun 2020 22:45:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB640204EC
	for <linux-m68k@archiver.kernel.org>; Sun, 14 Jun 2020 22:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="FRUzd95a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgFNWpT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 14 Jun 2020 18:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgFNWpT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Jun 2020 18:45:19 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97D4C05BD43
        for <linux-m68k@vger.kernel.org>; Sun, 14 Jun 2020 15:45:18 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id p5so15156828wrw.9
        for <linux-m68k@vger.kernel.org>; Sun, 14 Jun 2020 15:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOJcfTFqBnTadm27nj26UjDFJ0kier6IsF6viDXbqJI=;
        b=FRUzd95aVXO9i/zSiYnQCVwctclLXK5hTxDP/yVzDajoju5eJw5M3E/otG0tiv+aqJ
         bI1uLKHn+dChNsc4ztTuwRAICyBW+5UDwo3nsLrNatfbZB/sm/FIRdojtSj+P00WoP+Q
         I0X2v0KkppeqQ6m4fgsj8im2so/wU/gdDAM7OWeefOF1m4qo9xgqqL9UGf0ZzjS3/ZVR
         WSebtmX7crQbSJAJ6+ECc7msqGqD/aA0wkqUN143l63nJNqA7CFZG/0e3q215OCEgqHZ
         d7cu18+/x3MD2q1i10fpuOL0SZlec91YWKmqefQ5eJD6szdc8ZtCTD3U3vMhwxyv8iy8
         Us9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOJcfTFqBnTadm27nj26UjDFJ0kier6IsF6viDXbqJI=;
        b=NVVrXT5bOdddcEZ/VbpCyxJUnreWo2iAM4BvCYr4RQ1LrB2QBF1kZSZcAZPjevl5Bq
         mU5fbckLEsR0SpFrSvRv6Wq/6lmW8vImPiKxy7nmID2BiEbyEw9n6iGfaybIGrWlGE/8
         wI2h2UptVzYwT/yxXex09e4CFhkf5GGmlHDDYYUXL5fCQikCEqFu8XOk6DwptYaLFK4s
         WwFHkBpXpdAR+Y2zqSNAbvqVaNa9OFLzx1PdPgUFMKWmxxUqrbvs3g5czmDEB8cCumH1
         SP11DyLoPfMTL+dt8s1jv5Bnr2emgQCoDpHdU8sksso8FlT4D24G3V8j7opVhMKjj+ZJ
         9diQ==
X-Gm-Message-State: AOAM533VpUdS+q4iGoFggwdtYX59d+G67cv9ywVfjlsrUPfmzzVDh7cS
        QpJS8zzlMWsws2iUj53ubHsui1GVx8I=
X-Google-Smtp-Source: ABdhPJw5whBuENzZB9V480T9hUR/mHzTnX9+5fObp4lWbrddnKsAp2wBtc04PrFUMRRhkhFdKgXarA==
X-Received: by 2002:a5d:40d0:: with SMTP id b16mr25325387wrq.218.1592174716566;
        Sun, 14 Jun 2020 15:45:16 -0700 (PDT)
Received: from localhost.localdomain ([79.30.36.203])
        by smtp.gmail.com with ESMTPSA id a16sm21502596wrx.8.2020.06.14.15.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 15:45:15 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     gerg@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org, rppt@linux.ibm.com,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] m68k: mm: fix node memblock init
Date:   Mon, 15 Jun 2020 00:51:19 +0200
Message-Id: <20200614225119.777702-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

After pulling 5.7.0 (linux-next merge), mcf5441x mmu boot was
hanging silently.

memblock_add() seems not appropriate, since using MAX_NUMNODES
as node id, while memblock_add_node() sets up memory for node id 0.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 arch/m68k/mm/mcfmmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 29f47923aa46..7d04210d34f0 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -174,7 +174,7 @@ void __init cf_bootmem_alloc(void)
 	m68k_memory[0].addr = _rambase;
 	m68k_memory[0].size = _ramend - _rambase;
 
-	memblock_add(m68k_memory[0].addr, m68k_memory[0].size);
+	memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0);
 
 	/* compute total pages in system */
 	num_pages = PFN_DOWN(_ramend - _rambase);
-- 
2.26.2


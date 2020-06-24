Return-Path: <SRS0=e93C=AF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114B0C433E0
	for <linux-m68k@archiver.kernel.org>; Wed, 24 Jun 2020 23:28:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D44372078D
	for <linux-m68k@archiver.kernel.org>; Wed, 24 Jun 2020 23:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="ThS73Fqm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgFXX2O (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 24 Jun 2020 19:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgFXX2O (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Jun 2020 19:28:14 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82FEC061573
        for <linux-m68k@vger.kernel.org>; Wed, 24 Jun 2020 16:28:13 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q5so3937213wru.6
        for <linux-m68k@vger.kernel.org>; Wed, 24 Jun 2020 16:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1HxpwdPKzLhuBILG75aXJUduaQhYp9XdwwIS54wCfBU=;
        b=ThS73FqmTTLIQypE0YgiDnsnLGrPhU/EEwzK3/qV9ufGaYOokXtAhuhMx9lDKeNLRu
         sC06WY5iZBlWKoGfZty7qLqYknQLupSDAq2/0vJYSgPjdZ0NNO2DEk7SimgsrPqgA+1V
         yZnKFBl7laKkDvAeRmwA0DhulmWHu/iiRFpGqjvTX3M+cvztW0FlU9JWaMsMHI6HcWcA
         /ttEohCoF0Eo0znNab7EUiT7XBOh/INk46S3s1E5VQe43qH5uEqXPJnBixYIrWGEz0XK
         MDzKfWUM3x74/RA5AYEygUqIW/9kOtHfFuMvqYIsmqWlVCYOPuhsIw9gKCadYGeYC578
         Jgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1HxpwdPKzLhuBILG75aXJUduaQhYp9XdwwIS54wCfBU=;
        b=S+FNEQmuI0MExMIxuQ7IIrYHm9WcN+mZgWYqHmVvOnkJsQRCQN2+gIEfd6CWR9baGa
         Uiu1Q2VIi7E7Tkw91nmfQqCiKuOsMkCUd++54AdVaiEcXBOA/mzM+W3vJnkN+6tnWfIi
         2pY/bOCbeIQyrmj6OpB8y1ijuqi4Ba1G4XDNLv0vF/jaTq3wYM2uX7adYOiANMXqQEj5
         AIcIuZBHGaq/JGFIu0iCrr/wK3tHD0vuiXWtAugAvxnzs6fmW/lwV/yRJJJvAxz8wekh
         0Ioyt+HyNMoghi/42MWTf+NMHdlpCTS+7WWMoXDYNTZTnH9m3bUdi6i2wkc/0Q3g09Ih
         YCNg==
X-Gm-Message-State: AOAM530t1eLb2u2O+rrjrREyBfiCr1DrkyYGTKZAZA3rEttGdPJkFvcE
        M1gMOAe8U5rQYRzynofKmOx/4xi5MnigRA==
X-Google-Smtp-Source: ABdhPJw7lHoBXbyMSXia423+rn+Mi4UYHAGTXMswtYGH7l7XTov7OIGSu/1yxx2FOmhk+KKcPga0Vw==
X-Received: by 2002:adf:f745:: with SMTP id z5mr35241529wrp.128.1593041292499;
        Wed, 24 Jun 2020 16:28:12 -0700 (PDT)
Received: from localhost.localdomain (host-79-30-36-203.retail.telecomitalia.it. [79.30.36.203])
        by smtp.gmail.com with ESMTPSA id h14sm13126446wrt.36.2020.06.24.16.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 16:28:11 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     gerg@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] m68k: mm: fix wrong m68k_fixup_info addresses
Date:   Thu, 25 Jun 2020 01:34:43 +0200
Message-Id: <20200624233443.3346919-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On mcf5441x, mmu enabled, using a small initramfs, the boot was
recently hanging silently in the initial phase, inside
arch/m68k/mm/init.c, m68k_setup_node()

initrd at 0x47d2f000:0x47d82f64
overlap at 1073741889 for chunk 0
overlap at 1073746176 for chunk 0
overlap at 1073746736 for chunk 0
overlap at 1073746737 for chunk 0
overlap at 1073746738 for chunk 0
overlap at 1073746739 for chunk 0
overlap at 1073746740 for chunk 0

From some debugging, at m68k_setup_node(), the 25-bits shift value
(virt_to_node_shift) seems unset, because applied to a wrong
address (address previously set from m68k_fixup).

Tried some fixes, but the more low-risk and hopefully correct seems
to just add a volatile inside __virt_to_node_shift(). This seems to
produce correct addresses for the next fixup to work. Cannot test this
on other mmu ColdFire cpu's so every test is eventually welcome.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 arch/m68k/include/asm/page_mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index e6b75992192b..1eff386cc64b 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -135,7 +135,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 {
 	int shift;
 
-	asm (
+	asm volatile (
 		"1:	moveq	#0,%0\n"
 		m68k_fixup(%c1, 1b)
 		: "=d" (shift)
-- 
2.26.2


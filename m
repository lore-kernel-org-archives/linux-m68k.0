Return-Path: <SRS0=87Xh=7I=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18756C433E0
	for <linux-m68k@archiver.kernel.org>; Tue, 26 May 2020 12:46:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD7012073B
	for <linux-m68k@archiver.kernel.org>; Tue, 26 May 2020 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590497182;
	bh=pL92zS03C5lYp9vj1hO2q87jO0TlE1bYou2NP1lydAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=lywRQ8QZMqz1rjexsa/SQsA4BBNLlMT0ppZ474MSlzisD0tVUYw281UPrl33kf+5q
	 YOEl/vUs7E56Doi45IM9SN3e9BrbNNlzO1U0CBQqYAZ7jVLAQxnC1e0kksg3bObUKD
	 BEfUgedudOcnfZio6BfpE7UF6Oyu229P7B/oDy5A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388814AbgEZMqV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 May 2020 08:46:21 -0400
Received: from condef-09.nifty.com ([202.248.20.74]:38266 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388746AbgEZMqV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 May 2020 08:46:21 -0400
X-Greylist: delayed 337 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 May 2020 08:46:19 EDT
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-09.nifty.com with ESMTP id 04QCccCU008454
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2020 21:38:38 +0900
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 04QCcC2u029236;
        Tue, 26 May 2020 21:38:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 04QCcC2u029236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590496696;
        bh=gGTuSpyZuADWEH2NTxB4z6UBAsLbC7ydTen9vmPthvc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FIZ3ejq7AvsM6xAiZKt/y8OAod+Rd9ZviWPEFq/yyTxD3ImjLFIlVA27k1jt6RJmk
         ZTwbWt6gCNtN1NajHmuEjoNOYIJkXNavIUrtk0KQCeK//gbFcrO+wub3AtZ+2TZFlx
         kpbkdiB0nXqbEqK0Ute5+V/HWVvqqq4BGVwWxb5NKERtX59AfktQYQAgdxG+dIEud8
         bsqm3ZnGY9SfYuO74mv3VDW6SntKNAfkW6vDldwf8PNexums9ZEQSNghk7xykv1wmO
         MafNEdM/VDLkeRfWYuon17Z0jse4vUJlndfJ4JkTCUF7buJgqLr3H/Sec1rfI9pYIV
         rpVQvjKPlW4XQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] m68k: pass -D options to KBUILD_CPPFLAGS instead of KBUILD_{A,C}FLAGS
Date:   Tue, 26 May 2020 21:38:10 +0900
Message-Id: <20200526123810.301667-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526123810.301667-1-masahiroy@kernel.org>
References: <20200526123810.301667-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Precisely, -D is a preprocessor option.

KBUILD_CPPFLAGS is passed to for compiling .c and .S files too.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/m68k/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index ae6e29da3a3e..c28f9f917ac0 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -70,9 +70,8 @@ ifdef CONFIG_MMU
 KBUILD_CFLAGS += -fno-strength-reduce -ffixed-a2
 else
 # we can use a m68k-linux-gcc toolchain with these in place
-KBUILD_CFLAGS += -DUTS_SYSNAME=\"uClinux\"
-KBUILD_CFLAGS += -D__uClinux__
-KBUILD_AFLAGS += -D__uClinux__
+KBUILD_CPPFLAGS += -DUTS_SYSNAME=\"uClinux\"
+KBUILD_CPPFLAGS += -D__uClinux__
 endif
 
 KBUILD_LDFLAGS := -m m68kelf
-- 
2.25.1


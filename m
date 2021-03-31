Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC60C433B4
	for <linux-m68k@archiver.kernel.org>; Wed, 31 Mar 2021 14:44:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B561961007
	for <linux-m68k@archiver.kernel.org>; Wed, 31 Mar 2021 14:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbhCaOoV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 Mar 2021 10:44:21 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:33168 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235987AbhCaOoO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 31 Mar 2021 10:44:14 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 12VEhd3C005786;
        Wed, 31 Mar 2021 23:43:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 12VEhd3C005786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617201819;
        bh=C0YVGdmbD9bnQdCRbrJ5QrDoHiPkLL5zZr25U63CJDI=;
        h=From:To:Cc:Subject:Date:From;
        b=PN4/wj6eJE6kLeYCVwldPbxcPpCpY9fQdUJzm09Vn3GadKbFBFbmy6n223OrvNtDo
         cClGecuR9pRDijPgvUj0YxckXTJTqRrMcdvjzYxnC6u4wNluDkyTA0hl1mHhS2hmY3
         V8a+Urekc0971rH1oiRgEV9ELHKCDBoQvaeILQDooA2/ygeH1aALalbIQy7Y9/4f27
         BDcPuojUi8nPC/EZkNAMC+3YszvEkpvvKGnjBKsfNc1UxVf+iV7tbgF8gqEZGemnvS
         Fsj/M2CkXiSiRKlPqJg5kuv09UJn4HWsru/M6EKxtlgqvC/zwO4rsJ+Wx+mxGyoakb
         Qd7C18GkAcZsA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] m68k: remove meaningless $(OS_OBJS)
Date:   Wed, 31 Mar 2021 23:43:35 +0900
Message-Id: <20210331144336.25628-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

'git grep OS_OBJS' hits only this line. $(OS_OBJS) is just empty.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/m68k/fpsp040/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/m68k/fpsp040/Makefile b/arch/m68k/fpsp040/Makefile
index aab04d372ae7..5537807457fb 100644
--- a/arch/m68k/fpsp040/Makefile
+++ b/arch/m68k/fpsp040/Makefile
@@ -12,5 +12,3 @@ obj-y    := bindec.o binstr.o decbin.o do_func.o gen_except.o get_op.o \
 	    x_unfl.o x_unimp.o x_unsupp.o bugfix.o skeleton.o
 
 EXTRA_LDFLAGS := -x
-
-$(OS_OBJS): fpsp.h
-- 
2.27.0


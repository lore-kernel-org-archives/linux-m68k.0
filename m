Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211C2C433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 11 Nov 2021 02:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECDFC6103C
	for <linux-m68k@archiver.kernel.org>; Thu, 11 Nov 2021 02:56:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbhKKC6u (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 10 Nov 2021 21:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234617AbhKKC6u (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 10 Nov 2021 21:58:50 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DB4C061767
        for <linux-m68k@vger.kernel.org>; Wed, 10 Nov 2021 18:56:01 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id r28so3980226pga.0
        for <linux-m68k@vger.kernel.org>; Wed, 10 Nov 2021 18:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pZtEBFoYlcWQbC6LVbVgtgTXv+n7lhloHgdbkPWn4No=;
        b=Xnm/SaXD2oF43/U4F2RWB/WW+gFCH5h84nPytQYJlpfvIPSB2BtHj1reGgCFKCqL/r
         I89CmJrKlVHVYN5GPRnSsEdol4ZNSzbgxTEB3XUeMm+oTEKmvrWz19GhvaBEsOmILEgu
         YCgvaw2Z+CODkdwSs+Jyl37j1gCv2cnNTK3ZvJMW6Xn3eAqklauLQFwlc+Z61k8F8ZCA
         vwMuLbMEC6NqMqbnkmFyuzgaGgLiOviICT9nWao66DQxzDwBcPmBLlmaJE4JA6xQrkY0
         cBeJkeiiQO9moSExiMbY0dIHOgHv3sfGhMYkyhzE42zoSzfKrkSHknLx2XwIN47KlGlg
         khEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pZtEBFoYlcWQbC6LVbVgtgTXv+n7lhloHgdbkPWn4No=;
        b=6lFQ8hKP49dssH1Ycb6yooq/Soft0NVGOd/cF3haQdENEaqs37smAVqLAJBWNce7sm
         hDE9kbjlFSCZuPbL0TgdGrcN0rHuOxEXvTq9vDlV8wjEyUPSwJMntZ0d86MOA/TCeIc7
         WykUpCklwJIF6m90XArauUA3bY+1+vQwxjNBCBaeW1GA1kbmP1bjimKN+M4gCmwA8QW2
         7LihJ/W4UDNfY+GCqzPTo6psnW/c1dWUl+M9b2czq3+fPlYQh9WRDdNDuKMweDPLHyVB
         bpb2egdVnY+nCLIPXkyukIjp8ZhsCTr46Zj46X1KXTUbTcxwfqqqbdA7jruGQwzxY4yG
         BRFg==
X-Gm-Message-State: AOAM532rsugmqIV5yomu3RulSvB2stdcIqAvHgP+wbWa+EE5YzvErY9c
        8ThxXnekLY6hkKJwyFtx/EU=
X-Google-Smtp-Source: ABdhPJwVG6SSoypJ/E8nnb7I3xm7k8ZVEBimGNfExa6sC8Jl3Cf8F2LLy2xhmwQ1AT8qJA8JB0z2wQ==
X-Received: by 2002:aa7:9575:0:b0:49f:ddab:dcdb with SMTP id x21-20020aa79575000000b0049fddabdcdbmr3862065pfq.13.1636599361499;
        Wed, 10 Nov 2021 18:56:01 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id e187sm951206pfe.181.2021.11.10.18.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 18:56:00 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 235D336030F; Thu, 11 Nov 2021 15:55:57 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v10 1/3] m68k: amiga/pcmcia - add 16 bit detection interface to amipcmcia.h
Date:   Thu, 11 Nov 2021 15:55:52 +1300
Message-Id: <20211111025554.26768-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111025554.26768-1-schmitzmic@gmail.com>
References: <20211111025554.26768-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add the interface definition for 16 bit card autoprobing (using
the generic PCMCIA cftable entry parser) to amipcmcia.h for use
by apne.c. Include necessary cftable definitions from cistpl.h,
remove locally duplicate definitions from amipcmcia.h.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--

Changes from v9:

Geert Uytterhoeven:
- declare declare pcmcia_parse_tuple() unconditionally

Changes from v8:

Geert Uytterhoeven:

- just include pcmcia/cistpl.h; declare pcmcia_parse_tuple()
  only if core PCMCIA code is included

Changes from v7:

- add interface definitions only, move actual code to apne.c
---
 arch/m68k/include/asm/amipcmcia.h | 46 +++----------------------------
 1 file changed, 4 insertions(+), 42 deletions(-)

diff --git a/arch/m68k/include/asm/amipcmcia.h b/arch/m68k/include/asm/amipcmcia.h
index 6f1ec1887d82..a2f0694668af 100644
--- a/arch/m68k/include/asm/amipcmcia.h
+++ b/arch/m68k/include/asm/amipcmcia.h
@@ -13,6 +13,7 @@
 #ifndef __AMIGA_PCMCIA_H__
 #define __AMIGA_PCMCIA_H__
 
+#include <pcmcia/cistpl.h>
 #include <asm/amigayle.h>
 
 /* prototypes */
@@ -64,47 +65,8 @@ static inline void pcmcia_disable_irq(void)
 #define PCMCIA_SPEED_250NS	250
 #define PCMCIA_SPEED_720NS	720
 
-/* PCMCIA Tuple codes */
-
-#define CISTPL_NULL		0x00
-#define CISTPL_DEVICE		0x01
-#define CISTPL_LONGLINK_CB	0x02
-#define CISTPL_CONFIG_CB	0x04
-#define CISTPL_CFTABLE_ENTRY_CB	0x05
-#define CISTPL_LONGLINK_MFC	0x06
-#define CISTPL_BAR		0x07
-#define CISTPL_CHECKSUM		0x10
-#define CISTPL_LONGLINK_A	0x11
-#define CISTPL_LONGLINK_C	0x12
-#define CISTPL_LINKTARGET	0x13
-#define CISTPL_NO_LINK		0x14
-#define CISTPL_VERS_1		0x15
-#define CISTPL_ALTSTR		0x16
-#define CISTPL_DEVICE_A		0x17
-#define CISTPL_JEDEC_C		0x18
-#define CISTPL_JEDEC_A		0x19
-#define CISTPL_CONFIG		0x1a
-#define CISTPL_CFTABLE_ENTRY	0x1b
-#define CISTPL_DEVICE_OC	0x1c
-#define CISTPL_DEVICE_OA	0x1d
-#define CISTPL_DEVICE_GEO	0x1e
-#define CISTPL_DEVICE_GEO_A	0x1f
-#define CISTPL_MANFID		0x20
-#define CISTPL_FUNCID		0x21
-#define CISTPL_FUNCE		0x22
-#define CISTPL_SWIL		0x23
-#define CISTPL_END		0xff
-
-/* FUNCID */
-
-#define CISTPL_FUNCID_MULTI	0x00
-#define CISTPL_FUNCID_MEMORY	0x01
-#define CISTPL_FUNCID_SERIAL	0x02
-#define CISTPL_FUNCID_PARALLEL	0x03
-#define CISTPL_FUNCID_FIXED	0x04
-#define CISTPL_FUNCID_VIDEO	0x05
-#define CISTPL_FUNCID_NETWORK	0x06
-#define CISTPL_FUNCID_AIMS	0x07
-#define CISTPL_FUNCID_SCSI	0x08
+/* CIS tuple parser for 16 bit IO detection */
+
+extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);
 
 #endif
-- 
2.17.1


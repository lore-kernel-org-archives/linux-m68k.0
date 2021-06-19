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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377DAC48BE8
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 00:35:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18B72610C7
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 00:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233818AbhFSAhJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Jun 2021 20:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbhFSAhI (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Jun 2021 20:37:08 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8506CC06175F
        for <linux-m68k@vger.kernel.org>; Fri, 18 Jun 2021 17:34:58 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id o88-20020a17090a0a61b029016eeb2adf66so8950325pjo.4
        for <linux-m68k@vger.kernel.org>; Fri, 18 Jun 2021 17:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9rox4W4bEZK2ocFiEdDAhUbDBs4Ke8k4U+FgslybWic=;
        b=Tk33IVmVyDs1rTURw0fZBPiK7w/PBlOFFQSoglghJOWCcLbUdQenXd1ou+G4XJXOnV
         TcVjl/kaLpLaXdBNE94pq/kp1vEo5AXniGcZEnAS+K/vWJHEMbG//oyHtGu62QbxPXTc
         rYDwb9MJhm3iS+LU/j9NoQXohvaLVczqfq1FxGwynlC1UEAQsKL3BMbRWnkx71mkFDJP
         r46YIPnuykAREzwYdZztMtc/BII3E2Qi5xoRfzjKoqz5j4jwhJBNTSBJ3sBtdHtokcYU
         RqxOGuUaI4q3YVYjuqubb3TQc/AKp4T+9cZRJfO2Jbk1Dpoo7eOGTT8UgY4AL0XBiNbQ
         G/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9rox4W4bEZK2ocFiEdDAhUbDBs4Ke8k4U+FgslybWic=;
        b=SsVuW49qLHQnXejkHBUOTqHLNpty9KD/rSy0AeKAZViJoqoM9uUPe8C5PGuGtIQrnV
         ZHOMHOpeOUzaSbohk5tMznwnWdK0qNp8L8XsqWKb0BswEz1coXCUHBLK0Owu+wmT6OzD
         Acrc0VxhUfQICJPpOAtJsJvw3i++yfPHGdU/hckci3x+BqQXHD31ozSLCKSVNtB8x+gG
         2d40cRuwSmeM5q4TzUTe5xKFpxI3yjFZlNkoO3qrWqQeyIQhT2U1Kh3V4YeeU0H0DMQa
         sJw4cCalss77K1u3VNwkzlbzz9o+W2aFGZ4XccQPLkwH586iZUrjPftXyUhxlvPGk1wn
         ptYQ==
X-Gm-Message-State: AOAM530SuHXV0p9csZBiQ9tdkhQAtp62FDvAdhh/KO616IdOXFd+TqoK
        sMjMYID2HYPk4txSSil1C1mo8B/tXTU=
X-Google-Smtp-Source: ABdhPJzcs+tTDAMye8apZ5tvwHoZ93Wv1iYZSnzBm97bB2niBPhtfCe6J9TBAdGLIiZvd8MzD24RkQ==
X-Received: by 2002:a17:90b:4ac6:: with SMTP id mh6mr5441938pjb.210.1624062898044;
        Fri, 18 Jun 2021 17:34:58 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id m126sm9625022pfb.15.2021.06.18.17.34.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jun 2021 17:34:57 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 1A7873603D9; Sat, 19 Jun 2021 12:34:54 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v5 1/2] m68k: io_mm.h - add APNE 100 MBit support
Date:   Sat, 19 Jun 2021 12:34:50 +1200
Message-Id: <1624062891-22762-2-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624062891-22762-1-git-send-email-schmitzmic@gmail.com>
References: <1624062891-22762-1-git-send-email-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add code to support 10 Mbit and 100 Mbit mode for APNE driver.

A new ISA type ISA_TYPE_AG16 dynamically switches the Amiga
ISA inb accessor to word access as required by the 100 Mbit cards.

Patch modified after patch "[PATCH RFC net-next] Amiga PCMCIA
100 MBit card support" submitted to netdev 2018/09/16 by Alex
Kazik <alex@kazik.de>.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--
Changes from v4:

Geert Uytterhoeven:
- drop CONFIG_APNE100MBIT ifdefs

Changes from v3:

Finn Thain:
- revert isa_inb() define reordering
- omit redundant #ifdef around ISA_TYPE_AG16 case labels

Changes from v1:

Andreas Schwab:
- remove redundant fallthrough annotations

Changes from RFC:

Geert Uytterhoeven:
- rename ISA_TYPE_AG100 to ISA_TYPE_AG16 (16 bit cards)
- move ISA_TYPE_AG16 case inside #ifdef CONFIG_AMIGA_PCMCIA
- change #if defined(CONFIG_APNE_100MBIT) to #ifdef
- fix parentheses in isa_inb() define
- omit comment about compiler optimization

- add ISA_TYPE_AG16 case to isa_delay()
---
 arch/m68k/include/asm/io_mm.h | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index 9c521b0..68922ef 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -65,12 +65,10 @@
 #define AG_ISA_IO_B(ioaddr) ( GAYLE_IO+(ioaddr)+(((ioaddr)&1)*GAYLE_ODD) )
 #define AG_ISA_IO_W(ioaddr) ( GAYLE_IO+(ioaddr) )
 
-#ifndef MULTI_ISA
-#define MULTI_ISA 0
-#else
+#ifdef MULTI_ISA
 #undef MULTI_ISA
-#define MULTI_ISA 1
 #endif
+#define MULTI_ISA 1	/* Need MULTI_ISA for 16 bit PCMCIA card support ! */
 #endif /* AMIGA_PCMCIA */
 
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -101,6 +99,8 @@
 #define ISA_TYPE_Q40  (1)
 #define ISA_TYPE_AG   (2)
 #define ISA_TYPE_ENEC (3)
+#define ISA_TYPE_AG16 (4)	/* for 100 MBit APNE card */
+
 
 #if defined(CONFIG_Q40) && !defined(MULTI_ISA)
 #define ISA_TYPE ISA_TYPE_Q40
@@ -136,6 +136,7 @@ static inline u8 __iomem *isa_itb(unsigned long addr)
     case ISA_TYPE_Q40: return (u8 __iomem *)Q40_ISA_IO_B(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u8 __iomem *)AG_ISA_IO_B(addr);
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -155,6 +156,7 @@ static inline u16 __iomem *isa_itw(unsigned long addr)
     case ISA_TYPE_Q40: return (u16 __iomem *)Q40_ISA_IO_W(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u16 __iomem *)AG_ISA_IO_W(addr);
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -171,6 +173,7 @@ static inline u32 __iomem *isa_itl(unsigned long addr)
   switch(ISA_TYPE)
     {
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u32 __iomem *)AG_ISA_IO_W(addr);
 #endif
     }
@@ -184,6 +187,7 @@ static inline u8 __iomem *isa_mtb(unsigned long addr)
     case ISA_TYPE_Q40: return (u8 __iomem *)Q40_ISA_MEM_B(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u8 __iomem *)addr;
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -203,6 +207,7 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
     case ISA_TYPE_Q40: return (u16 __iomem *)Q40_ISA_MEM_W(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u16 __iomem *)addr;
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -216,7 +221,7 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
 }
 
 
-#define isa_inb(port)      in_8(isa_itb(port))
+#define isa_inb(port)      ((ISA_TYPE == ISA_TYPE_AG16) ? ((port) & 1 ? isa_inw((port) - 1) & 0xff : isa_inw(port) >> 8) : in_8(isa_itb(port)))
 #define isa_inw(port)      (ISA_SEX ? in_be16(isa_itw(port)) : in_le16(isa_itw(port)))
 #define isa_inl(port)      (ISA_SEX ? in_be32(isa_itl(port)) : in_le32(isa_itl(port)))
 #define isa_outb(val,port) out_8(isa_itb(port),(val))
@@ -270,6 +275,7 @@ static inline void isa_delay(void)
     case ISA_TYPE_Q40: isa_outb(0,0x80); break;
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16: break;
     case ISA_TYPE_AG: break;
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
-- 
2.7.4


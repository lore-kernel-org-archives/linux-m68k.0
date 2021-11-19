Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C67C433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Nov 2021 20:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2007061AD2
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Nov 2021 20:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbhKSU2K (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Nov 2021 15:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234319AbhKSU2K (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 19 Nov 2021 15:28:10 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA6BC061574
        for <linux-m68k@vger.kernel.org>; Fri, 19 Nov 2021 12:25:08 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y7so9044510plp.0
        for <linux-m68k@vger.kernel.org>; Fri, 19 Nov 2021 12:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x1Un6YHE+Z8SEPo3qeKcKRCaOjEWt/1Hw8WFkl0YtJQ=;
        b=D0Tl5cNVuIfzDPJisEPv7wmcKTT9K8+GV5kII8Hwp5gj3YWVwwyZXhS8ThgR8bxYDo
         LCdF4Kx04FYCFYbPysqiDaKUTJInUpYgsPkAJfkLapa5ALLSOtLSOv3oSdTYOeRu9nWL
         YJ185Fc3tQsKrBvm0DLYGm9zbHZS7h29zlmPULgF8kBa1YOL+kCMvn1owZREDbmpJM2+
         z7MmI72xbNRTrnvBAtcLzkhNZUOb+MubFqaGdLDnvD04M75Y83lo6OPjMs1/qZ2VmljO
         Ua+oKiX+1XYXpiQqEbvk5giAhNmIaegbzESrG2TKFumvv9frjloVJ8etMYxK3Nc6FdaJ
         pKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x1Un6YHE+Z8SEPo3qeKcKRCaOjEWt/1Hw8WFkl0YtJQ=;
        b=FVQU1IGuNWu64vT2JSU3VtRPrTUO8ZendkBRcNc0ZFHpaZ+SXok9L3ESAzyJUCI3Ky
         yMNsTbQRbi6HmXRWImIWhum1zzeDUBbcOWnz3Xajv+KbDP7HNnaZf9C1Vdcp4Rw1B+UE
         hGPNPoo+OMD3vkJ01R/MkOa0M/jKGikUV0/2VbM+5xx/TJoV7y4IzGbTwlzHe2adN+9E
         JJJPwLI1lID2EAbwlyS+hY66ZPzYLVd9t73Z/LAs3mN2O33b255YxN1Ci910w1m0+39H
         sz+vc4QOJMAldRvXGxWhDSGyXWbnbxjtCk+1XSmZOu/cxxNTOGQMwXqsok5eVDdItCmB
         UVbQ==
X-Gm-Message-State: AOAM531J/FJLXEWFIbo63Uvzrc/pZZyW0MWltQIyk+I6XnR53hCCzNGt
        /vJ4+K8K66K48fd2//HeI8E=
X-Google-Smtp-Source: ABdhPJzJP/W2OoqxAFcMSQn4JyxZ/9XtFAKpDMR+B5sV9vyZrm5vT6x2vBxtU+BP71DazrUqU0bcyg==
X-Received: by 2002:a17:902:e852:b0:143:8152:26c7 with SMTP id t18-20020a170902e85200b00143815226c7mr80504440plg.75.1637353508084;
        Fri, 19 Nov 2021 12:25:08 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id h22sm392983pgh.80.2021.11.19.12.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 12:25:07 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 25DDC360310; Sat, 20 Nov 2021 09:25:04 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v13 2/3] m68k: io_mm.h - add APNE 100 MBit support
Date:   Sat, 20 Nov 2021 09:24:59 +1300
Message-Id: <20211119202500.17850-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119202500.17850-1-schmitzmic@gmail.com>
References: <20211119202500.17850-1-schmitzmic@gmail.com>
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
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
index d41fa488453b..abb9e5ddb012 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -61,12 +61,10 @@
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
@@ -97,6 +95,8 @@
 #define ISA_TYPE_Q40  (1)
 #define ISA_TYPE_AG   (2)
 #define ISA_TYPE_ENEC (3)
+#define ISA_TYPE_AG16 (4)	/* for 100 MBit APNE card */
+
 
 #if defined(CONFIG_Q40) && !defined(MULTI_ISA)
 #define ISA_TYPE ISA_TYPE_Q40
@@ -132,6 +132,7 @@ static inline u8 __iomem *isa_itb(unsigned long addr)
     case ISA_TYPE_Q40: return (u8 __iomem *)Q40_ISA_IO_B(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u8 __iomem *)AG_ISA_IO_B(addr);
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -148,6 +149,7 @@ static inline u16 __iomem *isa_itw(unsigned long addr)
     case ISA_TYPE_Q40: return (u16 __iomem *)Q40_ISA_IO_W(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u16 __iomem *)AG_ISA_IO_W(addr);
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -161,6 +163,7 @@ static inline u32 __iomem *isa_itl(unsigned long addr)
   switch(ISA_TYPE)
     {
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u32 __iomem *)AG_ISA_IO_W(addr);
 #endif
     default: return 0; /* avoid warnings, just in case */
@@ -174,6 +177,7 @@ static inline u8 __iomem *isa_mtb(unsigned long addr)
     case ISA_TYPE_Q40: return (u8 __iomem *)Q40_ISA_MEM_B(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u8 __iomem *)addr;
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -190,6 +194,7 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
     case ISA_TYPE_Q40: return (u16 __iomem *)Q40_ISA_MEM_W(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16:
     case ISA_TYPE_AG: return (u16 __iomem *)addr;
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -200,7 +205,7 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
 }
 
 
-#define isa_inb(port)      in_8(isa_itb(port))
+#define isa_inb(port)      ((ISA_TYPE == ISA_TYPE_AG16) ? ((port) & 1 ? isa_inw((port) - 1) & 0xff : isa_inw(port) >> 8) : in_8(isa_itb(port)))
 #define isa_inw(port)      (ISA_SEX ? in_be16(isa_itw(port)) : in_le16(isa_itw(port)))
 #define isa_inl(port)      (ISA_SEX ? in_be32(isa_itl(port)) : in_le32(isa_itl(port)))
 #define isa_outb(val,port) out_8(isa_itb(port),(val))
@@ -254,6 +259,7 @@ static inline void isa_delay(void)
     case ISA_TYPE_Q40: isa_outb(0,0x80); break;
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+    case ISA_TYPE_AG16: break;
     case ISA_TYPE_AG: break;
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
-- 
2.17.1


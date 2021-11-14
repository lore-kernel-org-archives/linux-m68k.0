Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08760C433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 14 Nov 2021 23:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD04E60EE0
	for <linux-m68k@archiver.kernel.org>; Sun, 14 Nov 2021 23:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhKNXnc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 14 Nov 2021 18:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbhKNXnM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Nov 2021 18:43:12 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8043C061767
        for <linux-m68k@vger.kernel.org>; Sun, 14 Nov 2021 15:40:17 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id b4so12959524pgh.10
        for <linux-m68k@vger.kernel.org>; Sun, 14 Nov 2021 15:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x1Un6YHE+Z8SEPo3qeKcKRCaOjEWt/1Hw8WFkl0YtJQ=;
        b=WCfTFuLkzX+19g7P4prfCnwb42ybyVxyn262hyJeOah+No+1GYc1lHhFbfx9vq4vHC
         Ps0DFbPbIR0+cCT7EcZEcYsBmJrqRvTHNx46RNjGTqlVG9hWUjmRjboJuJHFqm68SjEV
         G0Pa+HEJHuKBfgpgip0NCwFcRyAFwSgi+J3rL/tiUnwMzRMy/Qf2nMTuYoasZ6TFMelf
         BkehoaJrw4OqrpMzCRheA+aBdVzAt1VuNYNzH/57vU+IuH1/PBZwbCQnwZmaTgyL5F5Z
         7qj4bhzhAx31b/MaVW+TlHnVKXxwYfRZ/EvhVHOCrSxxE2MqUVvIXtLrJsJqSART2mba
         W1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x1Un6YHE+Z8SEPo3qeKcKRCaOjEWt/1Hw8WFkl0YtJQ=;
        b=a/Yo74acs10pn78rlFd7iVUbkXUNpaDZep296ypUQ+wynME8fDKQoEBmwWc90/7/DA
         i1zcI+3eryYoFDPDfFWKnF4+O1N6LwTvgPNS/uP2UZAFFd63W2HBCWdbqutwHZw3LrtW
         ZGojDqesOaq/nYl4Lg4kz1X12csfelHbbO1bTv012gL93ep2W2yNh+uxFgPlyITa5bNb
         jDa91Zsd6j3uZrb7GCwaczRCT07dNe1eFMopPnxO+l0SS/N1PAEwrfJEm13hPP+V+ZGf
         f0PEdv7OfG5trgZgctfNPZZSizwkZCoYO8+YSkywcHtvDuBW4Oft3fyqlwBlgEjo+OCk
         2tVQ==
X-Gm-Message-State: AOAM530b/DVAoa5ri+VTriXz4URqHv7FEhC/2WGpEdp3WWS08iBikemn
        8r/vcv4X5JQXHTd+T0YhA5Y=
X-Google-Smtp-Source: ABdhPJxx1BKEpJwqFNa4S9nQb0tX6xfbiSwdOqxzTTa/X4yf83rZmYYVBCc881SXALCWB7mlsF30Vg==
X-Received: by 2002:aa7:818d:0:b0:49f:e7d4:bb55 with SMTP id g13-20020aa7818d000000b0049fe7d4bb55mr29557882pfi.60.1636933217503;
        Sun, 14 Nov 2021 15:40:17 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id q13sm14571335pfj.26.2021.11.14.15.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 15:40:17 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 80A51360209; Mon, 15 Nov 2021 12:40:13 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v11 2/3] m68k: io_mm.h - add APNE 100 MBit support
Date:   Mon, 15 Nov 2021 12:40:04 +1300
Message-Id: <20211114234005.335-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211114234005.335-1-schmitzmic@gmail.com>
References: <20211114234005.335-1-schmitzmic@gmail.com>
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


Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7F6C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Sep 2021 06:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0066611BD
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Sep 2021 06:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239116AbhI1HAp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Sep 2021 03:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239114AbhI1HAo (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Sep 2021 03:00:44 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1A3C061575
        for <linux-m68k@vger.kernel.org>; Mon, 27 Sep 2021 23:59:05 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id m26so18125762pff.3
        for <linux-m68k@vger.kernel.org>; Mon, 27 Sep 2021 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VG+aHZlvpBhpnBv8EgGxAqv4KlJ3ke3PgQHNOdAnvLg=;
        b=O0wo6uV32LKM/F3AQJv+cmRiXANwINQtD52kgCrQbx4lko14YFb3Iog0sVZdJTSqO/
         gp6h0/xUnskTUIqAT4KjJFgu7pGD/pITdmkI29ovVYUNj9jHLswm7VjCxZAwu2nMr7sZ
         2stEcZbf/2XcV2HlfmWOuaF+zRP4VtOXrFpszWyAUpt0vFRvOcXxEkmK0bjwXuPaqvn3
         KNAhfKKFNxbLLsHOBUargal1FwQQhs1qL/7cayTKfllxHicgdKQETlwO0Kgo9foG4U2O
         iECiYJHiZCzdpl+cmrx18naupTaSdlouLraNZ+6CL2NnQWz9ERDRrjBcf43CmKbmZyDV
         IPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VG+aHZlvpBhpnBv8EgGxAqv4KlJ3ke3PgQHNOdAnvLg=;
        b=H+ml6hxfmtfFR+kZDaVSNbE2Jud0KM6gngYLIB02/1NBsPlzK5aSRl/DKuwDIYqIUG
         g3RCicZDoi0U64QFhlFs3ljtv7n90VldQqmshaYyZKqbP4IXiQGnacnB3zlaFp02NZGt
         oYzjbHWiYF8YFIF5/Mjs8/i9BZiLSHXp4e/iA0FSJrs8aiEs6R8KJuBBA/jEL4wMVUG9
         BcF80Yp5gnesZHofVXECVUXCorWUs2/uLo8GQlWWq6XR4HbJQ/D0j5TuzBRseKzvwYYd
         cPsaROIeApep2/5/BqTsCLCmJcvYR8k94LGT5+vvbkmFYyWLFhAp1R3Sti4Th/Z2ZrFY
         cCDQ==
X-Gm-Message-State: AOAM532BNhZ2tNroxypcDhutOXVCNS9qRv5CWTqOrTW29KrcylqlGCUW
        AP2m7ORyolvOJ4yYucED8bs=
X-Google-Smtp-Source: ABdhPJxmFoAoM+FvAc7MvTGgHdD9K7s6seTWEuj6WXbjFxtzNdXoypm+TyS9Eim6St5RHaTlQYqzVw==
X-Received: by 2002:a63:79c7:: with SMTP id u190mr3273752pgc.378.1632812345431;
        Mon, 27 Sep 2021 23:59:05 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id l18sm10546438pfu.202.2021.09.27.23.59.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Sep 2021 23:59:05 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id DC2A0360424; Tue, 28 Sep 2021 19:59:01 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v7 2/3] m68k: io_mm.h - add APNE 100 MBit support
Date:   Tue, 28 Sep 2021 19:57:45 +1300
Message-Id: <20210928065825.15533-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210928065825.15533-1-schmitzmic@gmail.com>
References: <20210928065825.15533-1-schmitzmic@gmail.com>
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
index 9c521b048e57..68922ef42e04 100644
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
2.17.1


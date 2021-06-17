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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497EEC2B9F4
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 05:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1700C6128C
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 05:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhFQFa4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Jun 2021 01:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhFQFa4 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Jun 2021 01:30:56 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FFAC061574
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 22:28:49 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id t17so3986069pga.5
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 22:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eWB1M8mXOkRZXtMwwlZeHzR+WSj1aGwPLzSUUqVXtf4=;
        b=CkAW4SltoFkz2bV0XW0DbOZJEou/8/AyCTyxdjhaUhiCIzvPZUQAgqzmeLVaWTHgl0
         /GJ2u2HwDvQVaDd4XY0WsBl0fQ9WrzBG54xwfBNPGunBn2AdS6P/fS+u01Ky1MxPE5rt
         vLVC2BoU0jckU9/o8CbT79RcVoijVwedFntJKo/RFC79El4tMNMHC43tV19xy+yMst/X
         STh8+Dih9Aje0Le3SF9cRtlliCbfeC6EgaI503jEKisZG+Da0y6XRM2OMuW+46nn/Y3U
         QVhpPNXiIeCxziQCtBPDgtYsTE5P+ppYLct2vgMBaZt0wUfnln3WL7zL/T0RGsrHwuZ/
         qqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eWB1M8mXOkRZXtMwwlZeHzR+WSj1aGwPLzSUUqVXtf4=;
        b=hC2rK+qNAp0IB4RigM+0H5ULDNRMmv4LexbASHGtlhU6OfNxAlxFBApQLv4whZa+OT
         izLs5DJxLeIDGvLutoS07oMapZpqapGg1vwvVDo0+641qEWrAftETxfZgCP7v52XhS+/
         mFVj94P8CuBNJSeIs8ImXo9h19DvybLiDCaWDgoHbJ74sYGBzxOiT6/g19wQrOzW1Uso
         2m8z6fa3cJQg3qbo7dvI4Nt/YOhuL6iOc+Avc0ah4GXTpBiC46P5kn8wqr4M7lQzC3aT
         4hqqQ6kF7bD2ScX/HCysG9o6Y0c7BoHultUvpeXzlpsyQWKFyPYRgcvnHQZoHYpa6FoF
         e0cg==
X-Gm-Message-State: AOAM530QPbNGgu9ghIAOIjFqkW40wp65oxBdNduQD53VxSo/zorphLkW
        Pm7/Nuf8CeDHBhydaRmMT+U=
X-Google-Smtp-Source: ABdhPJxhVuV9lZwb734rko+XSTwcf2HCy0Kyzmkjwkc3wRjPDW3O7qGdf/HVAaSWLPFN93LzrfKeTQ==
X-Received: by 2002:a63:b645:: with SMTP id v5mr3315755pgt.15.1623907728630;
        Wed, 16 Jun 2021 22:28:48 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id q12sm4233572pgc.25.2021.06.16.22.28.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Jun 2021 22:28:48 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 9214C36040F; Thu, 17 Jun 2021 17:28:44 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v3 1/2] m68k: io_mm.h - add APNE 100 MBit support
Date:   Thu, 17 Jun 2021 17:28:31 +1200
Message-Id: <1623907712-29366-2-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623907712-29366-1-git-send-email-schmitzmic@gmail.com>
References: <1623907712-29366-1-git-send-email-schmitzmic@gmail.com>
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

fixup - review comment Andreas Schwab (fallthrough)
---
 arch/m68k/include/asm/io_mm.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index 9c521b0..3ab2f1d 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -101,6 +101,11 @@
 #define ISA_TYPE_Q40  (1)
 #define ISA_TYPE_AG   (2)
 #define ISA_TYPE_ENEC (3)
+#define ISA_TYPE_AG16 (4)	/* for 100 MBit APNE card */
+
+#if defined(CONFIG_APNE100MBIT)
+#define MULTI_ISA 1
+#endif
 
 #if defined(CONFIG_Q40) && !defined(MULTI_ISA)
 #define ISA_TYPE ISA_TYPE_Q40
@@ -136,6 +141,9 @@ static inline u8 __iomem *isa_itb(unsigned long addr)
     case ISA_TYPE_Q40: return (u8 __iomem *)Q40_ISA_IO_B(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+#ifdef CONFIG_APNE100MBIT
+    case ISA_TYPE_AG16:
+#endif
     case ISA_TYPE_AG: return (u8 __iomem *)AG_ISA_IO_B(addr);
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -155,6 +163,9 @@ static inline u16 __iomem *isa_itw(unsigned long addr)
     case ISA_TYPE_Q40: return (u16 __iomem *)Q40_ISA_IO_W(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+#ifdef CONFIG_APNE100MBIT
+    case ISA_TYPE_AG16:
+#endif
     case ISA_TYPE_AG: return (u16 __iomem *)AG_ISA_IO_W(addr);
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -171,6 +182,9 @@ static inline u32 __iomem *isa_itl(unsigned long addr)
   switch(ISA_TYPE)
     {
 #ifdef CONFIG_AMIGA_PCMCIA
+#ifdef CONFIG_APNE100MBIT
+    case ISA_TYPE_AG16:
+#endif
     case ISA_TYPE_AG: return (u32 __iomem *)AG_ISA_IO_W(addr);
 #endif
     }
@@ -184,6 +198,9 @@ static inline u8 __iomem *isa_mtb(unsigned long addr)
     case ISA_TYPE_Q40: return (u8 __iomem *)Q40_ISA_MEM_B(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+#ifdef CONFIG_APNE100MBIT
+    case ISA_TYPE_AG16:
+#endif
     case ISA_TYPE_AG: return (u8 __iomem *)addr;
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -203,6 +220,9 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
     case ISA_TYPE_Q40: return (u16 __iomem *)Q40_ISA_MEM_W(addr);
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+#ifdef CONFIG_APNE100MBIT
+    case ISA_TYPE_AG16:
+#endif
     case ISA_TYPE_AG: return (u16 __iomem *)addr;
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
@@ -216,13 +236,14 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
 }
 
 
-#define isa_inb(port)      in_8(isa_itb(port))
 #define isa_inw(port)      (ISA_SEX ? in_be16(isa_itw(port)) : in_le16(isa_itw(port)))
 #define isa_inl(port)      (ISA_SEX ? in_be32(isa_itl(port)) : in_le32(isa_itl(port)))
 #define isa_outb(val,port) out_8(isa_itb(port),(val))
 #define isa_outw(val,port) (ISA_SEX ? out_be16(isa_itw(port),(val)) : out_le16(isa_itw(port),(val)))
 #define isa_outl(val,port) (ISA_SEX ? out_be32(isa_itl(port),(val)) : out_le32(isa_itl(port),(val)))
 
+#define isa_inb(port)      ((ISA_TYPE == ISA_TYPE_AG16) ? ((port) & 1 ? isa_inw((port) - 1) & 0xff : isa_inw(port) >> 8) : in_8(isa_itb(port)))
+
 #define isa_readb(p)       in_8(isa_mtb((unsigned long)(p)))
 #define isa_readw(p)       \
 	(ISA_SEX ? in_be16(isa_mtw((unsigned long)(p)))	\
@@ -270,6 +291,9 @@ static inline void isa_delay(void)
     case ISA_TYPE_Q40: isa_outb(0,0x80); break;
 #endif
 #ifdef CONFIG_AMIGA_PCMCIA
+#ifdef CONFIG_APNE100MBIT
+    case ISA_TYPE_AG16: break;
+#endif
     case ISA_TYPE_AG: break;
 #endif
 #ifdef CONFIG_ATARI_ROM_ISA
-- 
2.7.4


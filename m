Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DC2C433EF
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Nov 2021 06:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EEF2611CE
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Nov 2021 06:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhKDGOX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 4 Nov 2021 02:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhKDGOT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 4 Nov 2021 02:14:19 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14194C061205
        for <linux-m68k@vger.kernel.org>; Wed,  3 Nov 2021 23:11:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id o14so5551649plg.5
        for <linux-m68k@vger.kernel.org>; Wed, 03 Nov 2021 23:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j1/Cp4nKKZ1RW1VHmccfWoRUsZJQgMPXglAdZYS3V+c=;
        b=Oua/Y52+3ceCEVGtk008KYYh0fRI+JSzWNMg3ibrIvOegK/Yk/wW4Pxq/Y5MMv2PGs
         jxs4VlC38dmZZOI49XAinBdzqrR6qkPPDBo/ZRpDSSoZyQ7MGyHtRT1B5WIKDVC7fG4v
         LhycvdSMkuvySaP8ebOOMGDzSThsA7ZaER80IAFRxBgzIocJaDRpObSNjvIv6w0AWkYv
         jidv7UaFfMof1Iov3mGQ/jR0XytNg/xbOg9GSxHBBmYwsJymLaZluENMlWjyaCXFhnUn
         KohC8x2xvvtyZMjqMpIbZqoWSifLukxswGpt9JwuWp3aoBbToVmP63KTpuqIuQ7L94Dn
         RMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j1/Cp4nKKZ1RW1VHmccfWoRUsZJQgMPXglAdZYS3V+c=;
        b=l/aFqFDKtVSZzQqTOBtuRz5bpVSoDYKe+ObqocmD04ETn144taTZeONAo8KJTtQx5g
         Mt9Uu8rhe2VVWxUE7Gh/7xHIRZzM0VlqIO4FWjc9j0wws0GfdYDLILLx8uewL4eq4zrr
         9/iayns7ytU1jn+3g3bH29p/Ayk1WV3Il4yLc9Sr1PCfPkEKVW85dD8L+56UgJ4JEeMl
         qQtHRf5QZL2Y4TFqp+1xMJUYXlUSfI6oZwmwfw7c1QXOKlFv3Yn5tAjA3sBjUjW2wnwC
         7gZSgLU/rwvf/6cib9xJzzAxGCRdm31TWQ/b5XwrGYFfao+j/+pM6pWbuNo+Wjz1okN8
         Vs0A==
X-Gm-Message-State: AOAM532miZuKI0Ck1lTXxoGMAJLGny0d4pg68yB3sPBp4MRVuLiHLuNm
        TsaKQUNJlV+NzOsQ0wV7bhQ=
X-Google-Smtp-Source: ABdhPJxBNuLV4mdD94naGuTSyp/nCX/szqjHf/xZClfESTusbDxfMVjP03x7pM6jp3ZBq0Oj6ZTq+g==
X-Received: by 2002:a17:903:18b:b0:142:12ba:8513 with SMTP id z11-20020a170903018b00b0014212ba8513mr12536540plg.69.1636006301626;
        Wed, 03 Nov 2021 23:11:41 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id p16sm3190420pgd.78.2021.11.03.23.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 23:11:41 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id DB6C2360200; Thu,  4 Nov 2021 19:11:37 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v8 2/3] m68k: io_mm.h - add APNE 100 MBit support
Date:   Thu,  4 Nov 2021 19:10:25 +1300
Message-Id: <20211104061102.30899-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211104061102.30899-1-schmitzmic@gmail.com>
References: <20211104061102.30899-1-schmitzmic@gmail.com>
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


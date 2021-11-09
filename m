Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D3BC433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 04:03:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4A5261130
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 04:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241579AbhKIEF4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Nov 2021 23:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhKIEFy (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 8 Nov 2021 23:05:54 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704F9C061764
        for <linux-m68k@vger.kernel.org>; Mon,  8 Nov 2021 20:03:09 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id g18so13413389pfk.5
        for <linux-m68k@vger.kernel.org>; Mon, 08 Nov 2021 20:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j1/Cp4nKKZ1RW1VHmccfWoRUsZJQgMPXglAdZYS3V+c=;
        b=b8HxkGx6Bq06W84quPElxBrXTEJkUxqlVD9A8qbg9nUKhbF6dq0n79yUKaTwpBi3te
         hUHotmVwEiuYmLtvCz4C6LRJStdjj9923IdIAwJw6Hp43deXkcOlpl/zIcyvqiI6rdC0
         +rWXwznfqpQkIyjrSL/oqXc9OCHimYuWEUcIwo/+I+ySscOSj2ZRrDngy8kO9SEK1OMp
         czI8DxIdVwtiy9Ze+SlZKYk7vSnj/xeP7Fl2rARDECjaUEC1F4V/UcC3EuVcfzsRzmXz
         fWUw4FgsbvXMIzHDC/rf2X3RJc8+U8MiMVT22M9l9q1EXCxK5EfWGwMzRABHCdTdITpN
         RGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j1/Cp4nKKZ1RW1VHmccfWoRUsZJQgMPXglAdZYS3V+c=;
        b=J3JgPRbskm0Kgfh9HWb6ra0wMlFJEm1xGy0D5fTJnskq6+ihLwWl0v59ZmgRzl/0HN
         b0RhTCPg0QvTfeCM9XsQenw/EWDObZ/ekN9i1HgqZIbJ+Pwnd+f1AyWPja9GngDaOhZs
         m8qe8QGDeqkmW3XyEFqMppPro0KghrMB+xS8oTH0lOniHcpHocg4IRMgS2OLI7Pedcpy
         Te19DzH8dsjSuVMsnFB8SKFz81TdOz+wjzQ6SXh89FXwpHXZUf3UxCyBVaw0vAjlUZ9D
         4LmGxFlRdQgzyAX84jmJQNcpIZZiWCL6vDBu4yO22XjrRsmFdeffIvsF9DZoJK4+/pOG
         q73w==
X-Gm-Message-State: AOAM533wmHlvo+7Kr3DGkkv5RcOs7vVpOQH2Arwk/ttsfcXJAHpr2Tz4
        B8ps5GHDH7CS30vJRCunoTw=
X-Google-Smtp-Source: ABdhPJxyduO6kD2m8+Kg+nLSe0nfKtd8BhzHgm5IdzJjZzGL6HyXkoQ4pS5mYm102ISGpEGq3ffizA==
X-Received: by 2002:a05:6a00:1310:b0:494:672b:1e97 with SMTP id j16-20020a056a00131000b00494672b1e97mr38278821pfu.77.1636430588994;
        Mon, 08 Nov 2021 20:03:08 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id co4sm786390pjb.2.2021.11.08.20.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:03:08 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 099FF36030C; Tue,  9 Nov 2021 17:03:05 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v9 2/3] m68k: io_mm.h - add APNE 100 MBit support
Date:   Tue,  9 Nov 2021 17:02:41 +1300
Message-Id: <20211109040242.11615-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109040242.11615-1-schmitzmic@gmail.com>
References: <20211109040242.11615-1-schmitzmic@gmail.com>
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


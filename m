Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A67C433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Nov 2021 06:06:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67C5C6126A
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Nov 2021 06:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhKSGJu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Nov 2021 01:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbhKSGJt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 19 Nov 2021 01:09:49 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A11EC061574
        for <linux-m68k@vger.kernel.org>; Thu, 18 Nov 2021 22:06:48 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id h63so7704147pgc.12
        for <linux-m68k@vger.kernel.org>; Thu, 18 Nov 2021 22:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w4dwxOMf5noX3ysG2CU3S9QKYL54kCVgWb6iE8Lbv9g=;
        b=BNNd1DxK8km57yarqK/trrOnhlFCTpr7wBzUQeSMtFIczEwAYT/E7wnvvzJA1EbkaR
         AtLteXpwwEvYbp+svkAYcECm+2nwChHCrGPFgebc4O+4tvxldwe5twfc6l46IpBohb8e
         8tDBcqG6w5nqUDbFgc8YSksj4nOtOVsxTFkiiVSzz9mXhSorY7IMcpAog4GtfUYm0BdR
         48j3q6kTLfnRA1G61IDaa8wpBkRxoUkiXUUd5pNJCIewVi+xK/15sJh0rVHPHs8eay5U
         exHHs9+hrND8i3fiH2cfpK35STw3toFRNt+8HWZ/pjybnQT3ubxH6BEfNrjWlXV9TSxB
         kmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w4dwxOMf5noX3ysG2CU3S9QKYL54kCVgWb6iE8Lbv9g=;
        b=Y/KfmYWcTFP3xe+9H4RbhlPpDBMYMVC+3x39+/fJnpLFb2ZQEPFyttlNlIdzk7UY7b
         EegmEy1QicfuzILFi7byAvVlCgV4KzYq8E2Eq7Yr9f9vrvvP/Tq/wimexHgr9sDNGHxJ
         C32n+nUq3xgAzX9gLcpka8Iht++G57rRZNfZSyHW2fVd1Ng50H843dkCIMlLgi9KKndd
         RJumeKCtfwDVUF2eyi/Y9AEAAknG/SAirMvK6FM1LlgPnUZ6kla/gRf/GLhuVqDF1oX1
         /0cEIisyXp7yoiamhakqgwA8NFt+yaQFZwFAnyG/hDsYrpHqgeYtHs2pvcNkWVtLcXxA
         ECNA==
X-Gm-Message-State: AOAM532pd9q+YNNN9HQqENZ0GaarWCae9ZlNKPkFlXk40Sy/fS17Ryu0
        FC1R9IbFd9LUAEQbT4a3l+K+3CNOLdkheg==
X-Google-Smtp-Source: ABdhPJyjb4ZZtpn6DRyG4AaoYl/Ic8qdf26+aufwTtUDwOFz+wxQZ7IrQ0v/WZn/SqOxtUeWWz7QLQ==
X-Received: by 2002:a65:4b87:: with SMTP id t7mr15333183pgq.115.1637302008229;
        Thu, 18 Nov 2021 22:06:48 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id b14sm1545299pfv.65.2021.11.18.22.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 22:06:47 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 7EAD136030E; Fri, 19 Nov 2021 19:06:44 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v12 1/3] m68k: amiga/pcmcia - add 16 bit detection interface to amipcmcia.h
Date:   Fri, 19 Nov 2021 19:06:30 +1300
Message-Id: <20211119060632.8583-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119060632.8583-1-schmitzmic@gmail.com>
References: <20211119060632.8583-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add the interface definition for 16 bit card autoprobing (using
the generic PCMCIA cftable entry parser) to amipcmcia.h for use
by apne.c. Include necessary cftable definitions from cistpl.h,
remove locally duplicate definitions from amipcmcia.h.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

--

Changes from v10:

Geert Uytterhoeven:
- include <pcmcia/ds.h> instead of explict pcmcia_parse_tuple()
  prototype declaration

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
 arch/m68k/include/asm/amipcmcia.h | 45 ++-----------------------------
 1 file changed, 2 insertions(+), 43 deletions(-)

diff --git a/arch/m68k/include/asm/amipcmcia.h b/arch/m68k/include/asm/amipcmcia.h
index 6f1ec1887d82..fbc80b1d853e 100644
--- a/arch/m68k/include/asm/amipcmcia.h
+++ b/arch/m68k/include/asm/amipcmcia.h
@@ -13,6 +13,8 @@
 #ifndef __AMIGA_PCMCIA_H__
 #define __AMIGA_PCMCIA_H__
 
+#include <pcmcia/cistpl.h>
+#include <pcmcia/ds.h>
 #include <asm/amigayle.h>
 
 /* prototypes */
@@ -64,47 +66,4 @@ static inline void pcmcia_disable_irq(void)
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
-
 #endif
-- 
2.17.1


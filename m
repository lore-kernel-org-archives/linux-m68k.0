Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE032C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 04:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D53D8611ED
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 04:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241536AbhKIEFy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Nov 2021 23:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhKIEFx (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 8 Nov 2021 23:05:53 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4E3C061764
        for <linux-m68k@vger.kernel.org>; Mon,  8 Nov 2021 20:03:08 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id r5so18561715pls.1
        for <linux-m68k@vger.kernel.org>; Mon, 08 Nov 2021 20:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S/F2boUeFTA3jReYEU9Ig9orb1pxVbkf7IPuYUTb+/M=;
        b=SbxEKF4gxDI6yUClJcrsxTCc6MbHBynwxhsiRgTr8Hz8R1b+aqvwIvEi0yIBAYrsyy
         qum2tLf+lmsqKMdO4ibAnS5Xj4Sbqca/vnmGoj93eNThZ++3v4ACI8508PGXQwY2WaVy
         ltJpXHBF5rOXACNHysYrQYjnBzMbcbxDTjsEchfTfRVYnaeahGfZB/wL+Mgg6DfPbe63
         cWrY/MSoWUo3HrYnwHatz1QjzQtlqN0W0ND8shB0JlF/45OtL8Mz4cijI+W5opGIMXq9
         EHhAuRgToFR3aXtLrygad+RBhf2vyGDX5pfaCONmu4sBsCd+YzDHLwRAiubtkeGF2svj
         +WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S/F2boUeFTA3jReYEU9Ig9orb1pxVbkf7IPuYUTb+/M=;
        b=M+VRJXdzKPnCkxp5mPYEc0UVNJd+Es6EofpTayf48y3MkuA/uKFUJ0ykM3CtZrUNBy
         7FIgajyrMqBWY6h8v97eyuwiLc6HeHNL9pHhWhlkyTC7SxAnMkoADJvjdDbDKjrWFURW
         eYouiCSEj3N0CbSXA41p22CmMwnTr99ZaJNoMIRzxOTUo36kRcfDAK9syuAnVla3cFdY
         S49/rIvkZlZ06YJug8eBru+fwxgyu4mAbbzDwjTA8Jkg2+4+PBrtCOGqPP0V+FMS7Qg+
         wrb/a6AS16CTxJH4rtEmQ7xV0CRPgwqO3EN3kffX4SMptg5ofsU8nTWRCDbmVelzLpLU
         0vwA==
X-Gm-Message-State: AOAM532jDTPMjeT4+kkPIQ1haZ0aZgYTcSO5iCRAq+rx1cIPTOFlb48z
        wOhng9Ps+tToaZhYOJ0NsJ0=
X-Google-Smtp-Source: ABdhPJwXR4LQP7XA6JA4LEovAKtARYm2zKeNKh+v8rHQm5X6b1EkaijylmzwvvYkDZVDYGeIMPxlYw==
X-Received: by 2002:a17:902:bf02:b0:13f:cfdd:804e with SMTP id bi2-20020a170902bf0200b0013fcfdd804emr4184433plb.1.1636430587974;
        Mon, 08 Nov 2021 20:03:07 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id n7sm17203124pfd.37.2021.11.08.20.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:03:07 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 2E3B336020F; Tue,  9 Nov 2021 17:03:04 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v9 1/3] m68k: amiga/pcmcia - add 16 bit detection interface to amipcmcia.h
Date:   Tue,  9 Nov 2021 17:02:40 +1300
Message-Id: <20211109040242.11615-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109040242.11615-1-schmitzmic@gmail.com>
References: <20211109040242.11615-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add the interface definition for 16 bit card autoprobing (using
the generic PCMCIA cftable entry parser) to amipcmcia.h for use
by apne.c. Include necessary cftable definitions from cistpl.h,
remove locally duplicate definitions from amipcmcia.h.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--

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
index 6f1ec1887d82..36a693895b99 100644
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
+#if IS_ENABLED(CONFIG_PCMCIA)
+extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);
+#endif
 
 #endif
-- 
2.17.1


Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CE1C433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 14 Nov 2021 23:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A592F60EE0
	for <linux-m68k@archiver.kernel.org>; Sun, 14 Nov 2021 23:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234778AbhKNXna (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 14 Nov 2021 18:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234874AbhKNXnM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Nov 2021 18:43:12 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503CEC061766
        for <linux-m68k@vger.kernel.org>; Sun, 14 Nov 2021 15:40:17 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id r130so13487443pfc.1
        for <linux-m68k@vger.kernel.org>; Sun, 14 Nov 2021 15:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NEFu4f6EN+lTthlxVdPHuZf75udGh2+rV/NL28fHCP8=;
        b=p1QSzHeGiAQw9seCVQspL/u/3MJwuT1IVovPcYDxeIdmF+DN/BM1zmS7iAyMVU9I3A
         Rbxv3A+ooIf7mpj8uyINDjKFhYmNiV/WBFGm9EnkO1X93e0BBzOIMFRSccf36CPRe9Fn
         +84rZ3we/weuM/+CcYADXBQkXcfH8IOjRtflGEcR1B1yBfJkgiMLlLiAf9WfxSdl5VpP
         VqSCmDecZWaEJHPzp6B7mK6K+FMu21Rt0uMP0nOKXSkdx0kZEnnQOTFfWK4TwGhrbHeq
         muxAOaLS7t/fybG9miYqlHpkLM1bDGwQrM3Y/NXP1joBoVOCsYrE9jTXgvVwA97aUl69
         jhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NEFu4f6EN+lTthlxVdPHuZf75udGh2+rV/NL28fHCP8=;
        b=wFfJymWsgf9Cma/s7Uv5t9z8wuI2pLy5EcDBavF4/+kcBm65xHxWOahy+T46Rl2iOq
         UFgq3qlvHLid7XEsEyHb25becCeecwXNlmkGyq5CP3WMQx44EhEPm3XmDMfAKwWVLdGe
         cH6ljSGBxBgwzeUw0L+Fpk0hEqKIqRXry6nLkNO4ksGoeu/2QxZrt/YKe0VjgYzqJtP6
         z4GIAd6t7uy/HxDhWzQOp0XT5B3K73/+wxqCaED20EF4aLwkAHM5puxf5ffmmeA5W2qu
         5IH+LHMuDHITuvWwsfgFXswQSUeCu99UZ2fc5twYdnZk7QTTqnVYTcvcBf89upgEiLvl
         jLbw==
X-Gm-Message-State: AOAM533/MT9KDCeNeBVXgV2wTzTyiDYfosfVxFqRzRkJx1M2ged23ylC
        wkaPwDu/n25gfHwjOHn6UEAh4RKwX38=
X-Google-Smtp-Source: ABdhPJzmZDNCSoo8ZVDXMCkxCVRFUrAOeEqCydKEnD7zIrrCsFhvV4tNZdedSZEYSCaXIyClNSUjsQ==
X-Received: by 2002:a05:6a00:10d3:b0:49f:faf7:6f8e with SMTP id d19-20020a056a0010d300b0049ffaf76f8emr29830380pfu.75.1636933216709;
        Sun, 14 Nov 2021 15:40:16 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id b15sm12706414pfv.48.2021.11.14.15.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 15:40:16 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id BFAD5360208; Mon, 15 Nov 2021 12:40:12 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v11 1/3] m68k: amiga/pcmcia - add 16 bit detection interface to amipcmcia.h
Date:   Mon, 15 Nov 2021 12:40:03 +1300
Message-Id: <20211114234005.335-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211114234005.335-1-schmitzmic@gmail.com>
References: <20211114234005.335-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add the interface definition for 16 bit card autoprobing (using
the generic PCMCIA cftable entry parser) to amipcmcia.h for use
by apne.c. Include necessary cftable definitions from cistpl.h,
remove locally duplicate definitions from amipcmcia.h.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

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


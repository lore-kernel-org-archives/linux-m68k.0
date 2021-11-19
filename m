Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D7C433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Nov 2021 20:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDE7761AD2
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Nov 2021 20:25:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235222AbhKSU2K (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Nov 2021 15:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234319AbhKSU2J (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 19 Nov 2021 15:28:09 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A26C06173E
        for <linux-m68k@vger.kernel.org>; Fri, 19 Nov 2021 12:25:07 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so9756004pjb.1
        for <linux-m68k@vger.kernel.org>; Fri, 19 Nov 2021 12:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w4dwxOMf5noX3ysG2CU3S9QKYL54kCVgWb6iE8Lbv9g=;
        b=FM+IcvIZk5Tvc4maTu9nNH3XTRyZp7m8WqXRR6QUTml6VVzkjdwU2Ye+HMwIOc6w65
         gGgjPWzURRHxDFEXsCKEQU6LO4YZ7krfvhQcKR22YWm53TxT9Os4VrcodrquEGSJK/Lp
         M3+i71dXORZYjmWgM1i1+lOTPFrhJ7shEdnJ4EN81fUCZv7nKQhNVQu7hvUPOQ7I8qir
         EKNSWGcJ/E4Fd9oHqC0gnoQzxfJQmBdYxD3xnfRQif5wghfi5qO8adGNDoxQyC2QYhH3
         pLEfy+DVKg0wAHjvPinNDPivKEOk2wfT+Dpg85xlcm766qOpgYWe5gbfVVSc63mBVIgc
         +GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w4dwxOMf5noX3ysG2CU3S9QKYL54kCVgWb6iE8Lbv9g=;
        b=AP8ZS93HRNO+/jbtn9fntGWxNxBSgUbZOLGh72JoNiH7rc4fChINgrLFWp/69JQAmJ
         ijSdUXJHrBX+WJTXexEw1krOR5yp+0e0tpnAHXm1wFKEdDO451p71UxOI2DahLmY5Ujz
         CdSWFu2UKcZkkf1lC0sZXj+kIVQ3Nswy8labGMDnZz0OAG6UqVV/Cc1wKvFZTNkfndUp
         2kPA9nHUKvWXJhiQ59zKCYUSUZFjRgVtaDAd29wXkOvZqyqnb8bdnhMYh3Uh4vz2XzX9
         ry3taZPPfaXGCuYZioXLWhkCa9vic9W+BDKwB3R+nyReh5qFZINrK7oNd9jx0ghPpFwO
         PYVQ==
X-Gm-Message-State: AOAM532PetUq/wfNVTmNKZUeAcLZm+9UvH9Zvsb9CutlxQFqk49HUMcz
        AKpR/Rg3AysIshQ9IKGCLOCvIXTy1VI=
X-Google-Smtp-Source: ABdhPJxycb2M5U0+LVuzjOeLf3mRTmMWXnjWpb52q7AOBmGOvJQVNeXQiRe2zzbpUPXLk/nmX6aPxQ==
X-Received: by 2002:a17:902:cb8a:b0:141:f601:d5f1 with SMTP id d10-20020a170902cb8a00b00141f601d5f1mr81790602ply.77.1637353507236;
        Fri, 19 Nov 2021 12:25:07 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id w187sm476132pfd.119.2021.11.19.12.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 12:25:06 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 7120336030E; Sat, 20 Nov 2021 09:25:03 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v13 1/3] m68k: amiga/pcmcia - add 16 bit detection interface to amipcmcia.h
Date:   Sat, 20 Nov 2021 09:24:58 +1300
Message-Id: <20211119202500.17850-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119202500.17850-1-schmitzmic@gmail.com>
References: <20211119202500.17850-1-schmitzmic@gmail.com>
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


Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5353DC7618A
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Mar 2023 13:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjCTNy2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Mar 2023 09:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbjCTNyY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Mar 2023 09:54:24 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8691CAF0C
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 06:54:22 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b20so14100962edd.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679320461;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16y5d5Rt6zcSbbBqIK/cInxaZjo1u3aH/GTMRwIy6cY=;
        b=XTWoN8oaLXhZ2s+pzarkIGAfZKWYnGKd4KDknqEejQvH86AHLnixCMamYUMIsLfgbi
         fsFx0fDyV1OuE694lPVWqsxRbtK9I4o0oZrO5Z36uiRcmR/9tSYJQ1kr7uMj99Ow1Qwp
         x2QHOL/NZob1jJr50lje02fGt0u4MBcYltQxBp/ZqJFLWvkVOgHo+OXoJve9Rcz9k5Qd
         AyvqJwBXMDRK8MZWyL3ZWE9acwiTRwoR6VNVwInkTZ0TyOMylrrTjMzNf39vNgWmJDRc
         vaNIPp28mM12fcGm0kBleLkL/6j6XDMP+Zr5yA+H12Sn/+O2b13E2A+NK755HpXeyAme
         1xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679320461;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16y5d5Rt6zcSbbBqIK/cInxaZjo1u3aH/GTMRwIy6cY=;
        b=xUrq1Gq0L0t44PGi2CblIOWz/9EAuHpeYZABz+r8ZYkP5zvSRkMcYTf1qjYSokiRwR
         4/rgKMt2QaDxn69VEPNQz/xZihxM3A5u/ItSYG0nDYHa3Hcc+goBAru0e5Wu0upYfwDh
         /rtwjAMT4XJNfL9YnLkFMTlNc4sWNf4TT6hgBO5lnpSTbajJGIx7TrBAmn4O2Lky/dtc
         ezGkO2OZT8eDmkRWBH17COvfH26q0H24fH+mxAdHSMOpmlgpto8+A7zqO4KiOjus7LId
         3ZaUyLmWomr/DcYKvXrLroEjmIobq25ncKx4qC4Fyyr83ueYPi8QGzgFKWpFRiQTiubk
         BPSw==
X-Gm-Message-State: AO0yUKVo1tbFeDPUdRKo6kzu4mOSUbhCDQBOg2OcfXFW8muSdEhEhS9W
        YQNZLlj8Xmvd+zTeAD4BPTU=
X-Google-Smtp-Source: AK7set8LY7zhCmW4QIJuiybizB/4Y4m1b5cdh1HenN6WmOpQ1ZMufaYnRbJMHZ/ARfy1CIP2js768A==
X-Received: by 2002:a50:ff1a:0:b0:4fd:215e:b691 with SMTP id a26-20020a50ff1a000000b004fd215eb691mr12409939edu.4.1679320460965;
        Mon, 20 Mar 2023 06:54:20 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:394b:6c53:31d8:7b18])
        by smtp.gmail.com with ESMTPSA id i15-20020a50d74f000000b004fb1a83cb00sm4964839edj.75.2023.03.20.06.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 06:54:20 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] m68k: Kconfig.machine: remove obsolete configs ROMBASE and ROMSIZE
Date:   Mon, 20 Mar 2023 14:54:18 +0100
Message-Id: <20230320135418.2055-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The configs ROMBASE and ROMSIZE were used in arch/m68k/68360/head-ram.S,
which was removed with commit a3595962d824 ("m68knommu: remove obsolete
68360 support").

Remove the obsolete configs ROMBASE and ROMSIZE.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/m68k/Kconfig.machine | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index e2f961208f18..255d50574065 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -439,15 +439,6 @@ config ROM
 	  that can be stored in flash, with possibly the text, and data
 	  regions being copied out to RAM at startup.
 
-config ROMBASE
-	hex "Address of the base of ROM device"
-	default "0"
-	depends on ROM
-	help
-	  Define the address that the ROM region starts at. Some platforms
-	  use this to set their chip select region accordingly for the boot
-	  device.
-
 config ROMVEC
 	hex "Address of the base of the ROM vectors"
 	default "0"
@@ -465,14 +456,6 @@ config ROMSTART
 	  Define the start address of the system image in ROM. Commonly this
 	  is strait after the ROM vectors.
 
-config ROMSIZE
-	hex "Size of the ROM device"
-	default "0x100000"
-	depends on ROM
-	help
-	  Size of the ROM device. On some platforms this is used to setup
-	  the chip select that controls the boot ROM device.
-
 choice
 	prompt "Kernel executes from"
 	help
-- 
2.17.1


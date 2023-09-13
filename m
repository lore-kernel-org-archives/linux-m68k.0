Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B80EDEC50
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241006AbjIMNpK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241002AbjIMNpJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:45:09 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216DD19B6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:45:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6BE6CCE2258;
        Wed, 13 Sep 2023 13:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFB3C433C8;
        Wed, 13 Sep 2023 13:45:01 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 2/7] m68knommu: coldfire: ensure gpio prototypes visible
Date:   Wed, 13 Sep 2023 23:44:20 +1000
Message-Id: <20230913134425.2610927-3-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913134425.2610927-1-gerg@linux-m68k.org>
References: <20230913134425.2610927-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

      CC      arch/m68k/coldfire/gpio.o
    arch/m68k/coldfire/gpio.c:19:5: warning: no previous prototype for ‘__mcfgpio_get_value’ [-Wmissing-prototypes]
     int __mcfgpio_get_value(unsigned gpio)
         ^~~~~~~~~~~~~~~~~~~
    arch/m68k/coldfire/gpio.c:25:6: warning: no previous prototype for ‘__mcfgpio_set_value’ [-Wmissing-prototypes]
     void __mcfgpio_set_value(unsigned gpio, int value)
          ^~~~~~~~~~~~~~~~~~~
    arch/m68k/coldfire/gpio.c:50:5: warning: no previous prototype for ‘__mcfgpio_direction_input’ [-Wmissing-prototypes]
     int __mcfgpio_direction_input(unsigned gpio)
         ^~~~~~~~~~~~~~~~~~~~~~~~~
    arch/m68k/coldfire/gpio.c:65:5: warning: no previous prototype for ‘__mcfgpio_direction_output’ [-Wmissing-prototypes]
     int __mcfgpio_direction_output(unsigned gpio, int value)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
    arch/m68k/coldfire/gpio.c:96:5: warning: no previous prototype for ‘__mcfgpio_request’ [-Wmissing-prototypes]
     int __mcfgpio_request(unsigned gpio)
         ^~~~~~~~~~~~~~~~~
    arch/m68k/coldfire/gpio.c:102:6: warning: no previous prototype for ‘__mcfgpio_free’ [-Wmissing-prototypes]
     void __mcfgpio_free(unsigned gpio)
          ^~~~~~~~~~~~~~

The local m68k asm version of gpio.h has prototypes for all of these,
but they are not always visible depending on the config options enabled.
Move the prototypes so they are always visible.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/mcfgpio.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index 7abd322c019f..019f24439546 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -8,10 +8,6 @@
 #ifndef mcfgpio_h
 #define mcfgpio_h
 
-#ifdef CONFIG_GPIOLIB
-#include <linux/gpio.h>
-#else
-
 int __mcfgpio_get_value(unsigned gpio);
 void __mcfgpio_set_value(unsigned gpio, int value);
 int __mcfgpio_direction_input(unsigned gpio);
@@ -19,6 +15,10 @@ int __mcfgpio_direction_output(unsigned gpio, int value);
 int __mcfgpio_request(unsigned gpio);
 void __mcfgpio_free(unsigned gpio);
 
+#ifdef CONFIG_GPIOLIB
+#include <linux/gpio.h>
+#else
+
 /* our alternate 'gpiolib' functions */
 static inline int __gpio_get_value(unsigned gpio)
 {
-- 
2.25.1


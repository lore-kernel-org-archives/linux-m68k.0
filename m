Return-Path: <SRS0=aUui=EJ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C18CC63699
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49B6820757
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604427147;
	bh=fv1yXYep5am+ln0fmGIMp8cDS9eZbRnVA7swo5V6Hus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=WGfh3YUE/rhcSlBf9FOYyR0CmfvctXC7bbvMn9y5/MKAXfIDchf11S6ZjbgJ1J89y
	 2SNuEaD8PC5kQ35M+ua6PHKax2GuylLSFZQDv/DiL8PxTtwOi7xFYZcxWn1543q1KQ
	 Ts020Iz4XiLzMPOoJA/3FXpsWf9HHz8WtVN+93Zw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgKCSM0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:12:26 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34118 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgKCSMD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Nov 2020 13:12:03 -0500
Received: by mail-lj1-f196.google.com with SMTP id y16so20114269ljk.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Nov 2020 10:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7KBLghtZ420Ru5TtsLIZ3CUl6d4/Pr8c2e31nM972Ds=;
        b=FxPReAbBFTTJnsYJwXHjrRN0MIu1RsRTDDF7ZzQ5PmzCQAcIIYR2Y3bbSdcLwLP4oh
         /4IJHxzEaYf+b2sRJY6AFbVOQtM3KP7K3jbQAkv3JrUEHDPDTToW/bcl7MHS6J1pPa9Q
         txSFKg5BE3gpRF/XH08elzs1zC5NYIgagqnfT/cVZSrpKDUJoJPE4mfyhm9UUvkuOzSp
         ODgyy0F0ngqWrYDGojkqDSmVnvP9VRxgA+zX/Xn41TLqm5Pe7t0ie/RPrcsQEJJGimfb
         u7bIiJdryestTDNvD5mInSDVRpWmF+fqFYh+mGoyaVuQVn6UkUxOnVWP09XWWMVpgFZ0
         aEhQ==
X-Gm-Message-State: AOAM531LKGAGyT/Q2XQWauIvyKeRZB2PLHkE3wJFXhTQjOPCvLEu58v/
        LKR1byVBs8JJOVG7HqNgp8Y=
X-Google-Smtp-Source: ABdhPJwQY8m/cWMaC3eDdLZZZIDEtwzCciIQWmKIp7GpVEiKr0cdfoZUUsLulnMKBfdNiza45agBZw==
X-Received: by 2002:a2e:8143:: with SMTP id t3mr9710944ljg.29.1604427121364;
        Tue, 03 Nov 2020 10:12:01 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id f6sm3745346lfk.104.2020.11.03.10.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 10:11:59 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1ka0mn-0002rW-Mx; Tue, 03 Nov 2020 19:12:01 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Nick Desaulniers <ndesaulniers@gooogle.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Miller <davem@davemloft.net>,
        Jakub Jelinek <jakub@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Kurtz <djkurtz@chromium.org>,
        linux-arch@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/8] earlycon: simplify earlycon-table implementation
Date:   Tue,  3 Nov 2020 18:57:05 +0100
Message-Id: <20201103175711.10731-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103175711.10731-1-johan@kernel.org>
References: <20201103175711.10731-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Instead of using the array-of-pointers trick to avoid having gcc mess up
the earlycon array stride, specify type alignment when declaring entries
to prevent gcc from increasing alignment.

This is essentially an alternative (one-line) fix to the problem
addressed by commit dd709e72cb93 ("earlycon: Use a pointer table to fix
__earlycon_table stride").

Note that we have been relying on this gcc behaviour for kernel
parameters for 16 years and it indeed hasn't changed since the
introduction of the aligned attribute in gcc-3.1.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/of/fdt.c              |  7 ++-----
 drivers/tty/serial/earlycon.c |  6 ++----
 include/linux/serial_core.h   | 20 +++++++-------------
 3 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4602e467ca8b..feb0f2d67fc5 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -906,7 +906,7 @@ int __init early_init_dt_scan_chosen_stdout(void)
 	int offset;
 	const char *p, *q, *options = NULL;
 	int l;
-	const struct earlycon_id **p_match;
+	const struct earlycon_id *match;
 	const void *fdt = initial_boot_params;
 
 	offset = fdt_path_offset(fdt, "/chosen");
@@ -933,10 +933,7 @@ int __init early_init_dt_scan_chosen_stdout(void)
 		return 0;
 	}
 
-	for (p_match = __earlycon_table; p_match < __earlycon_table_end;
-	     p_match++) {
-		const struct earlycon_id *match = *p_match;
-
+	for (match = __earlycon_table; match < __earlycon_table_end; match++) {
 		if (!match->compatible[0])
 			continue;
 
diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index b70877932d47..57c70851f22a 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -175,7 +175,7 @@ static int __init register_earlycon(char *buf, const struct earlycon_id *match)
  */
 int __init setup_earlycon(char *buf)
 {
-	const struct earlycon_id **p_match;
+	const struct earlycon_id *match;
 	bool empty_compatible = true;
 
 	if (!buf || !buf[0])
@@ -185,9 +185,7 @@ int __init setup_earlycon(char *buf)
 		return -EALREADY;
 
 again:
-	for (p_match = __earlycon_table; p_match < __earlycon_table_end;
-	     p_match++) {
-		const struct earlycon_id *match = *p_match;
+	for (match = __earlycon_table; match < __earlycon_table_end; match++) {
 		size_t len = strlen(match->name);
 
 		if (strncmp(buf, match->name, len))
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index ff63c2963359..3e32b788c28d 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -357,8 +357,8 @@ struct earlycon_id {
 	int	(*setup)(struct earlycon_device *, const char *options);
 };
 
-extern const struct earlycon_id *__earlycon_table[];
-extern const struct earlycon_id *__earlycon_table_end[];
+extern const struct earlycon_id __earlycon_table[];
+extern const struct earlycon_id __earlycon_table_end[];
 
 #if defined(CONFIG_SERIAL_EARLYCON) && !defined(MODULE)
 #define EARLYCON_USED_OR_UNUSED	__used
@@ -366,19 +366,13 @@ extern const struct earlycon_id *__earlycon_table_end[];
 #define EARLYCON_USED_OR_UNUSED	__maybe_unused
 #endif
 
-#define _OF_EARLYCON_DECLARE(_name, compat, fn, unique_id)		\
-	static const struct earlycon_id unique_id			\
-	     EARLYCON_USED_OR_UNUSED __initconst			\
+#define OF_EARLYCON_DECLARE(_name, compat, fn)				\
+	static const struct earlycon_id __UNIQUE_ID(__earlycon_##_name) \
+		EARLYCON_USED_OR_UNUSED  __section("__earlycon_table")  \
+		__aligned(__alignof__(struct earlycon_id))		\
 		= { .name = __stringify(_name),				\
 		    .compatible = compat,				\
-		    .setup = fn  };					\
-	static const struct earlycon_id EARLYCON_USED_OR_UNUSED		\
-		__section("__earlycon_table")				\
-		* const __PASTE(__p, unique_id) = &unique_id
-
-#define OF_EARLYCON_DECLARE(_name, compat, fn)				\
-	_OF_EARLYCON_DECLARE(_name, compat, fn,				\
-			     __UNIQUE_ID(__earlycon_##_name))
+		    .setup = fn };
 
 #define EARLYCON_DECLARE(_name, fn)	OF_EARLYCON_DECLARE(_name, "", fn)
 
-- 
2.26.2


Return-Path: <SRS0=Qn8O=DJ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12050C4363D
	for <linux-m68k@archiver.kernel.org>; Fri,  2 Oct 2020 14:06:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6DEE206A1
	for <linux-m68k@archiver.kernel.org>; Fri,  2 Oct 2020 14:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="WK4Ko0Hq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387993AbgJBOG1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387992AbgJBOG1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Oct 2020 10:06:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4CBC0613E2
        for <linux-m68k@vger.kernel.org>; Fri,  2 Oct 2020 07:06:26 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j2so1977888wrx.7
        for <linux-m68k@vger.kernel.org>; Fri, 02 Oct 2020 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4fQ1P5i5+5RX6Ky3j9bVO0oPaRJ1iFiFSHZs5cmAqj0=;
        b=WK4Ko0HqIW2wK28lL7drmURbz9MXJaRbpEORGAEYkctjVAswsSnF1l/hwk/nC4LtkU
         uPjuofNghmyanXg9OgOoSOQmG1LyjNFKfFJiL/ahjGT1t2Jx6v0KyS00DdlkwrYMnykF
         sBWiNXhd0lcctZZIH4WKNGUuy6mGg+hD9BIjWVN++uORr1rrktKv8r5uxF4xhshclKgO
         oKtJE/kRkZVvCVXFHwDVV824EeZZIxqsGcJXvwzdnygbkBYdb/nM0JjdFzujWpCwDoBi
         LDUPobK9PKq4NTwbT8NwzxF7Db7nC5oiaBdjO1f6KOG+3RzXNjCMAu6pQieSmwlCbl8G
         r7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4fQ1P5i5+5RX6Ky3j9bVO0oPaRJ1iFiFSHZs5cmAqj0=;
        b=OGMZGupDFnQQi0DaZJsI+v7YSRQh2YXaQ1bLoJT12OTHQieL9RyjQLXC0Im9p/B5qg
         4FCpp0gpUSe8MMoUQnz8wbKNB4OB5ppdfJfmggkYGLwd1DUpmxr+Cp5D1leg2tBBIhNz
         aAQh1gNqgQN8yFbsEe08zvVXIwwhaQvwBMG4lee/0UWeUTGX0BmhCitrpNfmL27HAgcb
         xzLllKGLLjG0+VVisdETRPg6O2Dn7adQuaRKkCf7NZXJ4qqysYsAu1TFFsLQrm/4x2Gl
         zRbPAFAyz28DpJd+f6Nxc3Cqi3c77KC39LZC7u0VvQKC/NsmzY7IxmgeWz6b+8fhcs2Y
         yKtw==
X-Gm-Message-State: AOAM5319+gdGFSo/+KeNdiIGUDUhwgiX+6LFIzBpoCPMpKFsjOvqTmYh
        heAHT4goGnfFPPUtrOt9rllxrg==
X-Google-Smtp-Source: ABdhPJykOE5JVtgyIOO2Io09nDK76PBiy+WKwOcX92EL0YVJBnhO+iOvb1AXmQ4sbI+HthIuSrHHSQ==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr3411669wrp.187.1601647585512;
        Fri, 02 Oct 2020 07:06:25 -0700 (PDT)
Received: from dfj.4.4.4.4 (host-79-20-236-235.retail.telecomitalia.it. [79.20.236.235])
        by smtp.gmail.com with ESMTPSA id d2sm1917690wro.34.2020.10.02.07.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 07:06:25 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     gerg@linux-m68k.org, gregkh@linuxfoundation.org
Cc:     linux-m68k@vger.kernel.org, linux-serial@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] serial: mcf: add sysrq capability
Date:   Fri,  2 Oct 2020 16:05:45 +0200
Message-Id: <20201002140545.477481-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

After some unsuccessful attempts to use sysrq over console, figured
out that port->has_sysrq should likely be enabled, as per other
architectures, this when CONFIG_SERIAL_MCF_CONSOLE is also enabled.

Tested some magic sysrq commands (h, p, t, b), they works now
properly. Commands works inside 5 secs after BREAK is sent, as
expected.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 drivers/tty/serial/mcf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/mcf.c b/drivers/tty/serial/mcf.c
index 7dbfb4cde124..09c88c48fb7b 100644
--- a/drivers/tty/serial/mcf.c
+++ b/drivers/tty/serial/mcf.c
@@ -632,6 +632,7 @@ static int mcf_probe(struct platform_device *pdev)
 		port->ops = &mcf_uart_ops;
 		port->flags = UPF_BOOT_AUTOCONF;
 		port->rs485_config = mcf_config_rs485;
+		port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
 
 		uart_add_one_port(&mcf_driver, port);
 	}
-- 
2.28.0


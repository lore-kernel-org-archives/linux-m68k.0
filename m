Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB008C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 24 May 2022 07:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235549AbiEXH7Y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 24 May 2022 03:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235628AbiEXH64 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 24 May 2022 03:58:56 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A3A87A2F
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 00:58:54 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 869443F325
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653379133;
        bh=YkatYCWfKUD+dq0NatM3KdWafpq2eW34NVcfW4Rx/e4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=DDfDtfBIlO6PaYlF/P/fyMTHce1sJrx+zD6csTuBFECfJBjLhXHYujYBkNWPLqmnp
         876WvEjgCNC8P+IXvefpMSy6jCStzfnumAn5g67b4BwujFllJ1wvx6XBjR24Zj9EYw
         7WdoDk8xYQG7Ni8dPiYBfkna3xQkCVb/bdtaEA57ou0M1rAVYWChgtBXv3oBJa9Y6z
         VBctrMtjGHCCQa9Sr/g5fmMgrdQdOV6UJSTBgiBizf1TJrnNoBklQaOX7B3HvSyzsR
         azpNMgt9yLShOtZQps8k1bY8ikJuCOsyy+exSrwx92P2yb76GSYMlqbla6CrIfvejO
         3v6HRKMbwBkEQ==
Received: by mail-ed1-f70.google.com with SMTP id w23-20020aa7da57000000b0042acd76347bso12179882eds.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 00:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YkatYCWfKUD+dq0NatM3KdWafpq2eW34NVcfW4Rx/e4=;
        b=Spsg6dIAvfrTQ4vRo4Um+s2qXPPCCgP1leF7eD7tbAl/sq1xSRwHjr2hq1PzN7Gm9P
         UO19MuGgMQTurKxGRxr/5Z1A9GHaF1N5+0W/1/r0ojNXTEpSAjyhaf+MhghD0oPCkF/5
         31a5J80A3fLZtLAO/z0E/pPI+BVmKbNXml0zyOO8ea4R0PX5p2LfZRDg66t0H4JytfpI
         ivxufE7PGxIW7bEDiZW5kGGK5zyr2duoHRLtf0fQJvAggoinKpy9UZoDS1hYWrqVfQt3
         vMEgP1L6hTbvbxP/qhOmjvrO9YeWizdJK66Vqd2Z3PHgiDPdAtis9IRHx9LPaiWGWyF1
         OOmg==
X-Gm-Message-State: AOAM531iTvlUlHpolEqMEFWtXrCaaV9jVzVY9ANPyoHM6aSdxn3wdFYR
        chbgdKK7x0NJsF+0sOxNFTwp9qK7oCbrWbvT3BHYvB8Swt30MI+SKDQKmdRGCJVKZRL5kvFJsVK
        bDlBiJ0KqEy25wOwjaI213rJ7U+GmWG7y7RSn1HBfXo5ACg==
X-Received: by 2002:a17:907:948c:b0:6f5:183f:eb6 with SMTP id dm12-20020a170907948c00b006f5183f0eb6mr22333661ejc.112.1653379133411;
        Tue, 24 May 2022 00:58:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycn4+bffJu0IMZGuyBrDA4LtHrGYk2owpnSRt1Zex59BQpLb1KRtxI2BxfHOZVe908GghDIw==
X-Received: by 2002:a17:907:948c:b0:6f5:183f:eb6 with SMTP id dm12-20020a170907948c00b006f5183f0eb6mr22333652ejc.112.1653379133273;
        Tue, 24 May 2022 00:58:53 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id r17-20020a056402019100b0042abf2affebsm9142442edv.67.2022.05.24.00.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 00:58:52 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 2/3] m68k: Kconfig.debug: Replace single quotes
Date:   Tue, 24 May 2022 09:58:47 +0200
Message-Id: <20220524075848.21684-3-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524075848.21684-1-juergh@canonical.com>
References: <20220524075848.21684-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Replace single quotes in strings with double quotes to match the majority
of the rest of the kernel's Kconfig files.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/m68k/Kconfig.debug | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
index 11b306bdd788..465e28be0ce4 100644
--- a/arch/m68k/Kconfig.debug
+++ b/arch/m68k/Kconfig.debug
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config BOOTPARAM
-	bool 'Compiled-in Kernel Boot Parameter'
+	bool "Compiled-in Kernel Boot Parameter"
 
 config BOOTPARAM_STRING
-	string 'Kernel Boot Parameter'
-	default 'console=ttyS0,19200'
+	string "Kernel Boot Parameter"
+	default "console=ttyS0,19200"
 	depends on BOOTPARAM
 
 config EARLY_PRINTK
-- 
2.32.0


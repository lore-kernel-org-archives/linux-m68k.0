Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F146AC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 24 May 2022 07:59:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235562AbiEXH7U (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 24 May 2022 03:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235661AbiEXH64 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 24 May 2022 03:58:56 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F268B096
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 00:58:55 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8CCB13F1DD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 07:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653379134;
        bh=zcVJY5VJphDpNHGQJdr7krO+G4yUvRFeyOLNl4XgZg4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=jHEw073zFs2JkAvVw8nFV6U4rk19NYEv8VyxjIEFduqjM0ZTzOWpJak198xFaJDxM
         dKBk3aXL5insnTaL9qiZaZMevTGGXfqzo39TmWvCl9LCGGVbaQ3pmdMJ1pDmKBzq2B
         1cLgay6Cryrt61oLbxyxHpzFjpE8MUA95DKXTAyTHi4Y7VjdT6rP4d3VlqoNBu1hcL
         AQ9g63M0o44aLRR5qcR0K/hBBE9WbjyEEFZnvn/5fZpxrerXNFPyRYG7mTi1EvfOFY
         5xE+CVEmyQcTqvfAPvhyzNgeruCBNc1ZwmOdDeRoGQYYKTsvfUkBZubruWcaSqyeFk
         gsr8JugLdS+BQ==
Received: by mail-ej1-f72.google.com with SMTP id s4-20020a170906500400b006feaccb3a0eso4256579ejj.11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 00:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zcVJY5VJphDpNHGQJdr7krO+G4yUvRFeyOLNl4XgZg4=;
        b=uM9u+5XX38HjFdvX6CHmaEik/ssh6f3DuWRVVZYUmsJZXkzYnEETY2ePDm67nq1mnR
         fm89Ht1Zumw4x0rTnojrUUYwIYHbeggINaszIgB+fllI7qDool/zzoSikvD37jqMrMHb
         en3q5LAUSrZXkW30dHC2l2dRRWRCfX4EtMFLh/R5IXwa9hMqnowBp7jDXT9HCLGsPBeA
         nnWaS64kNsz/II0LIX2hRvpYBsJqD0BItzFFx0qEWVKzCKsYe21d77+b7g4ynV/DqF08
         DotRql0s+AC1EfaH+qfudxMQ++m4AfJSHSkxrS+umlVCcLlf5gUgAv4VkerAXQLdJVsL
         9YFQ==
X-Gm-Message-State: AOAM533Mm+KFUFbAcDcZCnhAOTaSqrQ8cQSc0Ny1c7wf8Hl6fw9HY+kl
        gCYYPyhQjyiTFs8tsyaZ44Vee9Q7sQclqCvEs7jLALgj2cIBpcMW/LfCdEY+9GCrt0TAMM/ebK7
        XXHrcN+B3Yyv2kJY80aI0w0+b7CsKaZ1N5tWzbm7S7r0rWw==
X-Received: by 2002:a05:6402:4242:b0:42b:3266:a7e1 with SMTP id g2-20020a056402424200b0042b3266a7e1mr19713748edb.53.1653379134282;
        Tue, 24 May 2022 00:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb/n8XljY2RL9lLzdV+QEAjPgvOA5lXrC4/3YOgrecB5i7dd5q5uw41OWN3TUdwYfISYw33w==
X-Received: by 2002:a05:6402:4242:b0:42b:3266:a7e1 with SMTP id g2-20020a056402424200b0042b3266a7e1mr19713742edb.53.1653379134142;
        Tue, 24 May 2022 00:58:54 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id r17-20020a056402019100b0042abf2affebsm9142442edv.67.2022.05.24.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 00:58:53 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 3/3] m68k: Kconfig.machine: Add endif comment
Date:   Tue, 24 May 2022 09:58:48 +0200
Message-Id: <20220524075848.21684-4-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524075848.21684-1-juergh@canonical.com>
References: <20220524075848.21684-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add missing trailing endif comment.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/m68k/Kconfig.machine | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index eeab4f3e6c19..623b6d89f51f 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -474,4 +474,4 @@ config ROMKERNEL
 
 endchoice
 
-endif
+endif # !MMU || COLDFIRE
-- 
2.32.0


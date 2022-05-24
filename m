Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DE9C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 24 May 2022 07:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbiEXH7X (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 24 May 2022 03:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235649AbiEXH6z (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 24 May 2022 03:58:55 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C727E1EB
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 00:58:53 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 445473F1DD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653379132;
        bh=VDNNLnApwc8rQNr4eAC6zfgA2KUx0NhL3U0vjL4J/2s=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=QJKUjVQozmBhrZd/s8HkWAefcu9YbwrHHxs8K4mGlAWOlfDJUuLqD3IEjrPQute2U
         VuSgeEl8EI8eC1nSvvB8aWmVJjNROnFbs22jiSRyWoQcrSkEeVUfH0bPcqeZMN2qgR
         mRgRIKYEn0AVy6l33C8yOUEfRsTiGaNfOFG0jw4INccI+aXloyL4wVpvKNIRDR3ine
         kR+EOCz3x09jtANRAMXoSdEed5gICMZZRIi9IQGOoSbv7dLx8j07tOpPVpxM6HlOUI
         uVRr+nGYsA+/JGfIB6DACvc3iiY2AS1/omZ6CqzNw375YWrYT8OYLlipx4wA0J7QdP
         swER48ymtSZ1Q==
Received: by mail-ej1-f69.google.com with SMTP id k7-20020a1709062a4700b006fe92440164so6561443eje.23
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 00:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VDNNLnApwc8rQNr4eAC6zfgA2KUx0NhL3U0vjL4J/2s=;
        b=NV9+hQTeeon9Q99ABjudDTOgC72s6J+T4CJE/QccvhvX/VatL5IdQJrap0Tu0LdLa0
         g8LJSHEPoJlryaJnnSL9QOtoNGqCTHx8bKrKZUOW7gNPHuAVvDEdebTXenDXDcE8KzNO
         svCn67glyRnd2uwO7+aOqJOsj+Edr/oT5VtwW7hl9dDI5+7dbwwzUeTh3R9kJfKVyQQb
         DLicBCzcwPrEPCEp4WT5/XXlLmYSe9QExRsjHHUgqSKztxW8CrYA8NabekC+A3lZ/Oi9
         JNYIG2TMH8YIvKu9EcWm/fVBASzZiPFIHd+XmLHGUiuQR2XaOjvTf8ds7C+41uwygxgz
         BeYA==
X-Gm-Message-State: AOAM5309dFy4uTL1VWzH4VPtgLOUhEY2tCu3Vk+7IPgP+1gTxYzwHgwv
        ZpNevEYS+FzV0r491WUx2LcV8w2kyO/XmP0wrLc5UTLPn7CjfzFMU3gj9XgmE4KHHe28s0Al69v
        jwMJcEsB3f029E480TgzPwu2A+9VKGWoucHj3sv+rOnh7ug==
X-Received: by 2002:aa7:d5c2:0:b0:42a:a9bf:a646 with SMTP id d2-20020aa7d5c2000000b0042aa9bfa646mr20804905eds.321.1653379131818;
        Tue, 24 May 2022 00:58:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8OsoZI9oxyQnPCxQ7fwhh9KZPz4jaRo2clVqgihgcBQ/sa876cZ4AbBy8lUIP7MpR8lTlLw==
X-Received: by 2002:aa7:d5c2:0:b0:42a:a9bf:a646 with SMTP id d2-20020aa7d5c2000000b0042aa9bfa646mr20804896eds.321.1653379131597;
        Tue, 24 May 2022 00:58:51 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id r17-20020a056402019100b0042abf2affebsm9142442edv.67.2022.05.24.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 00:58:51 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 0/3] m68k: Kconfig: Style cleanups
Date:   Tue, 24 May 2022 09:58:45 +0200
Message-Id: <20220524075848.21684-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The majority of the Kconfig files use a single tab for basic indentation
and a single tab followed by two whitespaces for help text indentation.
Fix the lines that don't follow this convention.

While at it, replace single quotes with double quotes, add missing endif
comments and squeeze multiple empty lines.

Juerg Haefliger (3):
  m68k: Kconfig.cpu: Fix indentation and add endif comments
  m68k: Kconfig.debug: Replace single quotes
  m68k: Kconfig.machine: Add endif comment

 arch/m68k/Kconfig.cpu     | 7 +++----
 arch/m68k/Kconfig.debug   | 6 +++---
 arch/m68k/Kconfig.machine | 2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.32.0


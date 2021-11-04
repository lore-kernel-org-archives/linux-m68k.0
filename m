Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7271C433F5
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Nov 2021 06:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE86C611C4
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Nov 2021 06:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhKDGOP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 4 Nov 2021 02:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhKDGOO (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 4 Nov 2021 02:14:14 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3342CC061714
        for <linux-m68k@vger.kernel.org>; Wed,  3 Nov 2021 23:11:37 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id g184so4540158pgc.6
        for <linux-m68k@vger.kernel.org>; Wed, 03 Nov 2021 23:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DPnicQI4lPRJwSWzuA9zzGnkJG/yqnfOlPeWkE2pSDQ=;
        b=HG7BLGy4Y/CW1b/7tCXm6nDa366OE9xeaPLt8cWq8xKXitqmjjcmR6HGnCxjAfgD+q
         DuCWwgix9DxHGY4Z0szGz946T6ugSH6waiwWNhVH/ySo0v03ONh1ND9GFXd9nYlpzjlN
         TmUVmm4zYMURESjAw/yIEkQJIXbsIKF7BRLSlZcEEjcNmlWYXkziIbomNnduLQRCeqTY
         6Mpq7BTdA0KAZEL3mvmMzXZwjwvtSvdFxITjYzZu3LtVYpfVFIzwh548TU/GRuZUaTdl
         3PgVWCL2sgYxEyZJUnu6AL6Ph0VeaaPr6RJEKQ4N/E4CvzYdhsPvFsG8TqEbdp92Rckc
         k65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DPnicQI4lPRJwSWzuA9zzGnkJG/yqnfOlPeWkE2pSDQ=;
        b=LKURf+jIhUb72QGcVcIDLg/lqutXuvosm1iErNzSNecYFkJa5947Pj/U8IVuPM8Iu1
         90F2XxiHFkp6cf83g6mZBCDEwHCbwHQUJmmhiy1s/KbzSKwjUl13EcTJgjQXBd9pSRJO
         E98Pve8H+pWFdOkHEMJ0egZlwzSKpUKpe/Kl6pc4jN3EoPEnNPHELaDDH9GTkpDcIRAq
         DaaX0MMdrOIOFDkEXzP2CIionJlzBvXsQKnLAmKiPbzKz3xtMYBwtSBuPGE9PGjdheCL
         NSzg6xx5S0rmxYA1Sc93ZHG/KW/7+9EaVFaNwfzbpPRHv+bMy1eO8wqsBhTFepXwQFkB
         h7/w==
X-Gm-Message-State: AOAM532M9fR6a5M/AYAWhbruknNjnRUXRyK7u/iJpBAZiH4tCGgBxW9n
        YN4yG9/wcHpbNU7Pcd9cKvZ/pOAa8+Y=
X-Google-Smtp-Source: ABdhPJzmJMymBGVgnlZAeW8fcqF4G5h72NZWbv3X2iSUHYMOqg6xXc3TKYkXmJ8yKvhKPDZOAgnZ7g==
X-Received: by 2002:a05:6a00:2186:b0:473:5a61:a7f6 with SMTP id h6-20020a056a00218600b004735a61a7f6mr49366317pfi.15.1636006296812;
        Wed, 03 Nov 2021 23:11:36 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id h20sm4245990pfh.175.2021.11.03.23.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 23:11:36 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id DE4EA360200; Thu,  4 Nov 2021 19:11:32 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v8 1/3] m68k: amiga/pcmcia - add 16 bit detection interface to amipcmcia.h
Date:   Thu,  4 Nov 2021 19:10:24 +1300
Message-Id: <20211104061102.30899-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211104061102.30899-1-schmitzmic@gmail.com>
References: <20211104061102.30899-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add the interface definitions for 16 bit card autoprobing (using
the generic PCMCIA cftable entry parser) to amipcmcia.h for use
by apne.c.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--

Changes from v7:

- add interface definitions only, move actual code to apne.c
---
 arch/m68k/include/asm/amipcmcia.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/m68k/include/asm/amipcmcia.h b/arch/m68k/include/asm/amipcmcia.h
index 6f1ec1887d82..ecaeb583004f 100644
--- a/arch/m68k/include/asm/amipcmcia.h
+++ b/arch/m68k/include/asm/amipcmcia.h
@@ -64,6 +64,7 @@ static inline void pcmcia_disable_irq(void)
 #define PCMCIA_SPEED_250NS	250
 #define PCMCIA_SPEED_720NS	720
 
+#ifndef _LINUX_CISTPL_H
 /* PCMCIA Tuple codes */
 
 #define CISTPL_NULL		0x00
@@ -106,5 +107,8 @@ static inline void pcmcia_disable_irq(void)
 #define CISTPL_FUNCID_NETWORK	0x06
 #define CISTPL_FUNCID_AIMS	0x07
 #define CISTPL_FUNCID_SCSI	0x08
+#else	/* defined _LINUX_CISTPL_H */
+extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);
+#endif
 
 #endif
-- 
2.17.1


Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEF4C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Sep 2021 06:59:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3535611C7
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Sep 2021 06:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239112AbhI1HAk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Sep 2021 03:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239010AbhI1HAk (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Sep 2021 03:00:40 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E0AC061575
        for <linux-m68k@vger.kernel.org>; Mon, 27 Sep 2021 23:59:01 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id x191so13255204pgd.9
        for <linux-m68k@vger.kernel.org>; Mon, 27 Sep 2021 23:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DPnicQI4lPRJwSWzuA9zzGnkJG/yqnfOlPeWkE2pSDQ=;
        b=HyiuD3TGnEDJFFKFxCClXJnfZQWzqDsSpjC5r+EuF+Vxk9cAoWqZt9FQEz+4i3tVLR
         lB+OEq5ea+F/0puqjCYQyBnCiC5VnXGqs3tsur7oolDzrE9Bt8mTqxI/8qa0mwd3Z3cN
         MW3xmtNUSt78Pitx7ydTy4IGlZZLOIe7v8yOB7tvlOGvLSV5hVEqMcZFli6ritUiHzEf
         NC24CrXnpKdVcbTnEwzbjBkw+r2aqVmr5c45Fj398Er0IPL3iBZhdhAU2UPu/IFjEeTq
         5JyBPA4YXGiAopfvUiFIBR/QrkQjbrHggvLlqI21ymiQIN8rBFTZUvUr5nFtNv8us6MD
         i63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DPnicQI4lPRJwSWzuA9zzGnkJG/yqnfOlPeWkE2pSDQ=;
        b=IyagUa7K40MIkYLwnOgXyjmlN10qXXiUqLfxgxskXkM0hm7XfAErOEB5OfotiaGf0i
         RpvuZzct58QdK9um+vRVAQvtZHiVbneGXZ/UZj7wa+BmxA/xz0yEdLt1A8XnoTVjbxH9
         S7FMrwlhcm2LgOVcV+eJC8OgrJrCEx7gQDMWdl/xhhRR5U5cpYyNDJ/jjlA6dnzZ3VKY
         bPEWS8quR/WqtM4eCUOVnyxz3hSR/E4deFH2k/Q/tRDer74Gq6sXNmW0gg6XurekKXg/
         xKj+hFb5L7UxMHnPoiQS54RrRvMyF6RIcR2ccPm+uT8OkF1PL+Y7sf7vf9+slnwrWP8f
         HE/A==
X-Gm-Message-State: AOAM531KKkDMVteBL7QDi0pYbS3D/F/P16jMmRqCKWeuVYa3HopwdY7q
        xpr//ClqRGYHUQWhq6jBjfe9DGERedQ=
X-Google-Smtp-Source: ABdhPJx4V2Ya2vz5772eoav7HlijY/BC3+7rZxQlA4Rlq4SZsyitBlNIvC6oo+M3zpbwQqqqxpLFGQ==
X-Received: by 2002:a63:df05:: with SMTP id u5mr3187547pgg.323.1632812341245;
        Mon, 27 Sep 2021 23:59:01 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id 26sm23890293pgx.72.2021.09.27.23.59.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Sep 2021 23:59:00 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 95BDE360424; Tue, 28 Sep 2021 19:58:57 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v7 1/3] m68k: amiga/pcmcia - add 16 bit detection interface to amipcmcia.h
Date:   Tue, 28 Sep 2021 19:57:44 +1300
Message-Id: <20210928065825.15533-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210928065825.15533-1-schmitzmic@gmail.com>
References: <20210928065825.15533-1-schmitzmic@gmail.com>
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


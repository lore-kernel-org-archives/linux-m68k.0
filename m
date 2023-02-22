Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008B2C61DA4
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Feb 2023 19:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjBVTub (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Feb 2023 14:50:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjBVTua (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2023 14:50:30 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED92D27D7F
        for <linux-m68k@vger.kernel.org>; Wed, 22 Feb 2023 11:50:28 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so4337124pjz.1
        for <linux-m68k@vger.kernel.org>; Wed, 22 Feb 2023 11:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4+YREnGlHTbJcGp5ngQ80q3IpcGnfqqQVVBkMnxFS4=;
        b=ZWXOCKxQhby+FMi7CrUSn6/+eNUllX3cUeAuU1h9t8XCE2fr9jWAUm9hnqZuqVzxff
         OgJyy+MPtRE0VrR6hxGoOVD1mTDYdC7wOnXu6kZGuD20u73ZGBz5WLnhcNv4nFGv74eF
         ldmyqrrj+RhvKdOZUJghNdyJouuCMzAF6T/Q34PQPVMk0NeYOmmgM+Yj4KL9GlA5X9Es
         XZXUQZI9m0XZf2gFOW5QqB6Db4PNRnV80jzmsMxkTHidxHDNND1f5oQ34KJ+29iVpJNz
         weTUIeysNoqym1ZHpyWulImJdguTYe8mLR2w/jh/1PxzcxEWxxJ27DD18DZdzqdDNdHh
         QyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4+YREnGlHTbJcGp5ngQ80q3IpcGnfqqQVVBkMnxFS4=;
        b=3hKgWbXvZ9xXUDk/d87hhYk9URpCPjhhDopPLUyYhYsUevttRPBQ97w6baDUi3w7pM
         NCzN9Es+sCN9eyavlUn2ODhh/YNwI4w3x1Ma8ppHAUjKOBcbSLaHt7wXAf7XkrGti6WQ
         nSyLywrtyzUDfRMMJs+Ngl7oOMPKRZyliAJcRjEly3RHstA0o6etWW4GDMYNnMSB9Nhh
         TfGK9ApeGYRAQA95jwPEvcPNHudpFofvbCqsHR9Eqeo/Rz6vAcMINgjWBBgt0iu8e68N
         TwyVerPUW6ZwXUsUbpmVr8SCDEUyuzlC3gt2qRM2uhOv+GxxjAPsjOm8CTeaEoJh93tn
         e6mg==
X-Gm-Message-State: AO0yUKWHCnakxO8+u/tE5z0hYeXBoP6Cj5GVuQQ41KK7RRFMJMq7VQai
        4s5stIy/tJ2ZK73nxHWQ6EsCmD2HejE=
X-Google-Smtp-Source: AK7set9C4J48RFjTEzNfdvzbUQmBRW3MeFZNn51Kuptjkh59EhplehWpbn+Y8qNu+5Iio9YdZdYBIg==
X-Received: by 2002:a17:90b:4a4d:b0:233:9fff:888e with SMTP id lb13-20020a17090b4a4d00b002339fff888emr10149818pjb.39.1677095428417;
        Wed, 22 Feb 2023 11:50:28 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id ie14-20020a17090b400e00b002372107fc3dsm3156442pjb.49.2023.02.22.11.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 11:50:27 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id B5A8C3604D2; Thu, 23 Feb 2023 08:50:23 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     schmitzmic@gmail.com, Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <ftain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH RFC v1] m68k: kernel/traps.c - only force 030 bus error if PC not in exception table
Date:   Thu, 23 Feb 2023 08:50:21 +1300
Message-Id: <20230222195021.6683-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

__get_kernel_nofault() does copy data in supervisor mode when
forcing a task backtrace dump through the sysrq trigger.

Our 030 bus error handler is ill equipped to deal with this:

Whenever ssw indicates a kernel mode access on a data fault,
we don't even attempt to handle the fault and instead send
a bus error signal (or panic). As a result, the check for
exception handling at the fault PC (buried in send_sig_fault()
which gets called from do_page_fault() eventually) is never
used.

Both 040 and 060 access error handlers do not care whether
a fault happened on supervisor mode access, and will call
do_page_fault() even on those.

Add a check in bus_error030 to call do_page_fault() in case
we do have an entry for the fault PC in our exception table.

Tested on 030 Atari Falcon.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com># Please enter the commit message for your changes. Lines starting
CC: Eero Tamminen <oak@helsinkinet.fi>
CC: Finn Thain <ftain@linux-m68k.org>
CC: Andreas Schwab <schwab@linux-m68k.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/r/daca2f68-19fa-a2b6-97c6-16b5b7e26afe@helsinkinet.fi
---
 arch/m68k/kernel/traps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 5c8cba0efc63..67576fb0c466 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -30,6 +30,7 @@
 #include <linux/init.h>
 #include <linux/ptrace.h>
 #include <linux/kallsyms.h>
+#include <linux/extable.h>
 
 #include <asm/setup.h>
 #include <asm/fpu.h>
@@ -545,7 +546,7 @@ static inline void bus_error030 (struct frame *fp)
 			errorcode |= 2;
 
 		if (mmusr & (MMU_I | MMU_WP)) {
-			if (ssw & 4) {
+			if (ssw & 4 && !search_exception_tables(fp->ptregs.pc)) {
 				pr_err("Data %s fault at %#010lx in %s (pc=%#lx)\n",
 				       ssw & RW ? "read" : "write",
 				       fp->un.fmtb.daddr,
-- 
2.17.1


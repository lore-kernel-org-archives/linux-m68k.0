Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5F2C433DB
	for <linux-m68k@archiver.kernel.org>; Tue, 23 Feb 2021 14:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAE1964DD3
	for <linux-m68k@archiver.kernel.org>; Tue, 23 Feb 2021 14:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbhBWOhS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 Feb 2021 09:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbhBWOgs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 Feb 2021 09:36:48 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5602DC061222
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Feb 2021 06:34:56 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id c9so7391094wrq.18
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Feb 2021 06:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=S0g1Gw0V8LQdKC7HpmWoNe9UXx0KjO/uwYjAYtfhLeU=;
        b=Fq2+eMK4jh0j/XFxErxBk8JeSfqqp/fu80bJNatnXBZ+At9fWTw+fV8REB7eXUtZp1
         ULO0nXNMb/4yD7npazKim9wSN+KhAZDvelhEE2VXOW04dDQNWpR2j4a8dhjUh7H8vdLk
         LdBD159jN26zXBuVa/9kmkk6hXeouARhByuMWxXgSfSal5Vajn6E0H/0xXc9M/FBGqDx
         71vEf/3qA2dcUZrsFdOJHXvfq/XGKNsVTheqxZJWbPoc0xiNH+vHxYQlKO6MY+NL0rTl
         U3Nazu+wdymC8xNyetJQHEzeaV/tg2wAU6FrWnoRr/J1/2/lOOZoEwX79LN/hewvBfCb
         vklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=S0g1Gw0V8LQdKC7HpmWoNe9UXx0KjO/uwYjAYtfhLeU=;
        b=j1/GKIbrjpK8VhVB0UcvvDxF8cjQYyC+Ymp5d9NBUaHP4NL6HB/FivMevegQ535U30
         +iAlTv7/4DEzA00KbEowtGXglOuF2Z4y50jiYgs3AasuJ+ZLKiKIn5+rAURK5culFDWW
         gSboVI+ar+MdeT5xAS0MFCLrbKFmcAn4AriboS/fjEfTxr4qA84jBLeRQr1C4xogC9V0
         aQqmegRj74CxWQ+oH/KSyq4/lPcLaiKwz3rjruUFWg8mt9EKtrA7Yf+tcIfHT91M9XOq
         3deSBgGUjJXfy5JOWtidrZnIpWN9pg/eoCjhZw9c+ouBUnd9v9IBmbyPJ0aKQe2retDC
         Ai2A==
X-Gm-Message-State: AOAM532nYqsqzG3ey2hzNBqLuLfE0BjM/WqXVlTFwQkzdDHm04xiBpLq
        irfMajlZ+JgwTIlk1p6ag59NdBbqGw==
X-Google-Smtp-Source: ABdhPJzt6spWgjRPJkBK/IplFxSdnMgcPPQTnbG7I8X4jppm6p3wuv5JFcbCjpxvdDcCW9kqNB9SgjiX0A==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:855b:f924:6e71:3d5d])
 (user=elver job=sendgmr) by 2002:a1c:2e90:: with SMTP id u138mr587498wmu.0.1614090894574;
 Tue, 23 Feb 2021 06:34:54 -0800 (PST)
Date:   Tue, 23 Feb 2021 15:34:26 +0100
In-Reply-To: <20210223143426.2412737-1-elver@google.com>
Message-Id: <20210223143426.2412737-5-elver@google.com>
Mime-Version: 1.0
References: <20210223143426.2412737-1-elver@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH RFC 4/4] perf/core: Add breakpoint information to siginfo on SIGTRAP
From:   Marco Elver <elver@google.com>
To:     elver@google.com, peterz@infradead.org,
        alexander.shishkin@linux.intel.com, acme@kernel.org,
        mingo@redhat.com, jolsa@redhat.com, mark.rutland@arm.com,
        namhyung@kernel.org, tglx@linutronix.de
Cc:     glider@google.com, viro@zeniv.linux.org.uk, arnd@arndb.de,
        christian@brauner.io, dvyukov@google.com, jannh@google.com,
        axboe@kernel.dk, mascasa@google.com, pcc@google.com,
        irogers@google.com, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Encode information from breakpoint attributes into siginfo_t, which
helps disambiguate which breakpoint fired.

Note, providing the event fd may be unreliable, since the event may have
been modified (via PERF_EVENT_IOC_MODIFY_ATTRIBUTES) between the event
triggering and the signal being delivered to user space.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/events/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 8718763045fd..d7908322d796 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6296,6 +6296,17 @@ static void perf_sigtrap(struct perf_event *event)
 	info.si_signo = SIGTRAP;
 	info.si_code = TRAP_PERF;
 	info.si_errno = event->attr.type;
+
+	switch (event->attr.type) {
+	case PERF_TYPE_BREAKPOINT:
+		info.si_addr = (void *)(unsigned long)event->attr.bp_addr;
+		info.si_perf = (event->attr.bp_len << 16) | (u64)event->attr.bp_type;
+		break;
+	default:
+		/* No additional info set. */
+		break;
+	}
+
 	force_sig_info(&info);
 }
 
-- 
2.30.0.617.g56c4b15f3c-goog


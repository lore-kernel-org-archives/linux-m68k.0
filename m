Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87230C64E69
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47698212CC
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgKWKZC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Nov 2020 05:25:02 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39053 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728220AbgKWKY7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Nov 2020 05:24:59 -0500
Received: by mail-lj1-f196.google.com with SMTP id o24so17380018ljj.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2020 02:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O2Qijc9aD+xW1gS8brgc0GdeSKquQ1+Gpi9pX1QSTC8=;
        b=DVRm5jods8TyyeOitelZv2VDSZJO/qwipbhsAcZB9gjjLYQB/bM5ZGBqTTH0C/2/jr
         QbsCU/UZ7/61NrwQtq+bfymLKkGH6sOzlQlJdKMv7BKu8MS5v8lu/qJoa+EBCGRRAEJR
         pRLU0aqny3PLETnm/KHQGfX5yWZ8khwrpABUKq8HfDHTr/8c0saY4yJhrLNa/DsUfpct
         alUTMhmTemq0RW2A8u680vIMc7QZCAKdL73rsXFG3w5DHxaxy0V7lhQNp/NtS/zr1q7H
         Nu4BWXf9s8qqTT12lS5hAMoksOP3M54PP7xpUX8iH0/0vyC/7uQCuJDqsj/Jjj3BbJIb
         Mg1A==
X-Gm-Message-State: AOAM533PxZjHoUravGQFGaZl33n4PRq6y9XO2oiSpKvXkfeEX3QoWi1I
        1CcsnOtQay2W33srO061Gms=
X-Google-Smtp-Source: ABdhPJwgOlDN8KDCwSZS3ShtINu2/HapY7fElGJeiTXcNj8Tz55wosnok9KcMg/QlGR0eBh9Fi3M1A==
X-Received: by 2002:a2e:b701:: with SMTP id j1mr13560576ljo.242.1606127096342;
        Mon, 23 Nov 2020 02:24:56 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o17sm1330328lfg.136.2020.11.23.02.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 02:24:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kh91q-00028G-NA; Mon, 23 Nov 2020 11:25:02 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
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
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 7/8] params: use type alignment for kernel parameters
Date:   Mon, 23 Nov 2020 11:23:18 +0100
Message-Id: <20201123102319.8090-8-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123102319.8090-1-johan@kernel.org>
References: <20201123102319.8090-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Specify type alignment for kernel parameters instead of sizeof(void *).

The alignment attribute is used to prevent gcc from increasing the
alignment of objects with static extent as an optimisation, something
which would mess up the __param array stride.

Using __alignof__(struct kernel_param) rather than sizeof(void *) is
preferred since it better indicates why it is there and doesn't break
should the type size or alignment change.

Note that on m68k the alignment of struct kernel_param is actually two
and that adding a 1- or 2-byte field to the 20-byte struct would cause a
breakage with the current 4-byte alignment.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/linux/moduleparam.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 742074ad9f6e..15ecc6cc3a3b 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -288,8 +288,8 @@ struct kparam_array
 	/* Default value instead of permissions? */			\
 	static const char __param_str_##name[] = prefix #name;		\
 	static struct kernel_param __moduleparam_const __param_##name	\
-	__used								\
-	__section("__param") __attribute__ ((aligned(sizeof(void *))))  \
+	__used __section("__param")					\
+	__aligned(__alignof__(struct kernel_param))			\
 	= { __param_str_##name, THIS_MODULE, ops,			\
 	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
 
-- 
2.26.2


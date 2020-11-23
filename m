Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA5AC64E7C
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A09420731
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgKWKZB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Nov 2020 05:25:01 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39172 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgKWKY7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Nov 2020 05:24:59 -0500
Received: by mail-lf1-f68.google.com with SMTP id j205so22976418lfj.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2020 02:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S93dby/jp7jv4MUI4mEuwR4ZWuAyJbbXIVViROFzc9E=;
        b=X5tygwws4q3pTyW3SbX+20tG99TESA9YlICv11GHNpmHQh9R/kP0bkQx5b3xQP2ovs
         O6ItjmIFi5Ae6E1GNoDUqoIxPtxc7WHNS7K9P0/lRLLom8alASvlB/q+SIlTpR5KQBFp
         Cc8WkmEehRz6zpbcI8tkinAzhKEh7k6QCb0yoryYpqslwVMK2Sdc9uDaHUctJHvRT1NT
         n5Iwq8NWyxXAYWgXZz/XnMFA4aiFkXJQTMd8RkIFfzuPO4bQYXWdXtjwXU8cZdv4bAjj
         lIBipHCK9Zvm9K/v19UwRW84LFfZJCCJHHy7yU0U5z1mq/Imd5tg82ONcmmh+82SRrs8
         uSLg==
X-Gm-Message-State: AOAM530DUlCPe02droEM/AqsHDX9cR8PN56ct8Os2qEe+5C075q5uQ6g
        RH6rvl7d455lCfT6YqcjS70=
X-Google-Smtp-Source: ABdhPJxf/6p0jGHH0wODj5yk5BOpcAmqRwuv5scv8LhxdZCxpCZKNruHXr+u5rk9NAYdWDVKJLw33g==
X-Received: by 2002:a05:6512:3a6:: with SMTP id v6mr11785861lfp.90.1606127097313;
        Mon, 23 Nov 2020 02:24:57 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id d12sm1336284lfa.22.2020.11.23.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 02:24:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kh91q-00028B-Jc; Mon, 23 Nov 2020 11:25:02 +0100
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
Subject: [PATCH v2 6/8] params: drop redundant "unused" attributes
Date:   Mon, 23 Nov 2020 11:23:17 +0100
Message-Id: <20201123102319.8090-7-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123102319.8090-1-johan@kernel.org>
References: <20201123102319.8090-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Drop the redundant "unused" attributes from module-parameter structures
already marked "used".

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/linux/moduleparam.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 6388eb9734a5..742074ad9f6e 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -22,7 +22,7 @@
 
 #define __MODULE_INFO(tag, name, info)					  \
 static const char __UNIQUE_ID(name)[]					  \
-  __used __section(".modinfo") __attribute__((unused, aligned(1)))	  \
+  __used __section(".modinfo") __attribute__((aligned(1)))		  \
   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
 
 #define __MODULE_PARM_TYPE(name, _type)					  \
@@ -289,7 +289,7 @@ struct kparam_array
 	static const char __param_str_##name[] = prefix #name;		\
 	static struct kernel_param __moduleparam_const __param_##name	\
 	__used								\
-    __section("__param") __attribute__ ((unused, aligned(sizeof(void *)))) \
+	__section("__param") __attribute__ ((aligned(sizeof(void *))))  \
 	= { __param_str_##name, THIS_MODULE, ops,			\
 	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
 
-- 
2.26.2


Return-Path: <SRS0=aUui=EJ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD14C388F2
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E800320757
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604427144;
	bh=RjLeg+Sy17mVJa5fHrzWB0ic8XSr9rJNYyeuKFcuC1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=YKq6MRPPbR+8uDTDd6OqYozJRpD9kM1AvafwL1qPZ2hVOQ7rvB9Jc+wR8n5Gc/wUT
	 qX9hPUCu6JDJ9TjMEwVx7u7jQYN+3WLJsKS8OvBfHTEc5pFHxQGHDWtGU3UrASWXsa
	 U0jbIq1ibAsl/GjWoN7imazohGLR6uF8cnOyFcEQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbgKCSMH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:12:07 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43834 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729147AbgKCSMG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Nov 2020 13:12:06 -0500
Received: by mail-lf1-f65.google.com with SMTP id l28so23428154lfp.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Nov 2020 10:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S93dby/jp7jv4MUI4mEuwR4ZWuAyJbbXIVViROFzc9E=;
        b=jDiOvk0T5pAsIEV2aPMRhWMDLILVyfV55G/ilQWBi+sMrHXQZ9++Z4TBTLooa7wFta
         L1GVd1w+Eq7Nrmg+Y4G4A9T1ozt2UBidwjGrayh4eo7lJgh9+IFun6RWDVMn9hBx45cE
         nR5weJ68VOmmV2BReGeke4UYbWYPQfRj9KVQU2znSWpkIvYNSECqmCubuQ0DV2HM7NY/
         lhUyILHJ4UP+ZKBUZhJ9TWUZR4GgJKwfgQIqNr8a+2HM4lf3EgwpDr6n2vvSRRAlYdZ0
         Xkx+lG7aRddDK41SForU1pWV9496Vsh2dQlX5Fhfu+m3R5o53qUdLcRvJWFZZGBChdrw
         rQMw==
X-Gm-Message-State: AOAM533WNJN+OmaKbiWtwaOLIBz34ugqWEsWjJ5D79BsAK2HsaprHl2I
        j9rOpviB7cnR9SUzRy7DH4Y=
X-Google-Smtp-Source: ABdhPJxT8ZggtFKDC1OxlicGZYYGKQRpSeJxIsq/fh4HsdFQHzRVqsL/ZTEAnjpTQFyx1dLmJhOMAA==
X-Received: by 2002:ac2:5de5:: with SMTP id z5mr7271852lfq.232.1604427123837;
        Tue, 03 Nov 2020 10:12:03 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l20sm4082156lfc.274.2020.11.03.10.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 10:12:01 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1ka0mo-0002rq-2V; Tue, 03 Nov 2020 19:12:02 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Nick Desaulniers <ndesaulniers@gooogle.com>,
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
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/8] params: drop redundant "unused" attributes
Date:   Tue,  3 Nov 2020 18:57:09 +0100
Message-Id: <20201103175711.10731-7-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103175711.10731-1-johan@kernel.org>
References: <20201103175711.10731-1-johan@kernel.org>
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


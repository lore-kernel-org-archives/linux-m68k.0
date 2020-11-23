Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60C2C64E7D
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B83521D46
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgKWKZB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Nov 2020 05:25:01 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45683 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgKWKZA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Nov 2020 05:25:00 -0500
Received: by mail-lf1-f65.google.com with SMTP id z21so22947554lfe.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2020 02:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MyGoxRTFxoN3CcXdLX3OQwBVVHqEtKepL93LP6Dv6QA=;
        b=cUEIyJktqerz2WDta6flmoTT5BKpywVxUm/ZTFd0imLFunbztC2BmOmg4YS+h2PVcA
         s1pAHhMXfVeMF03aVwYjD5mPqnYh8eGgclJ0sZ2GYL80RtlPEOAyvr27WF5mh3fibUI1
         i/INekRVcSMom7Ij4pqNu4VakWaexAneMdgphFQ1P5E6Pr6lXrl2vf0/D6z5WYFugdO1
         wMD1oOreuSE4uZCNyYyjmT77O4eXqtI1LBwLWdK2QsH8J28ByaqORztW9UaXRgPkaqGz
         xi4QjvwF7lQr2OWX1OhPl+T4uZNH1egwGYHn8buEiMtSDrcJtGIEoEEv+nF7l5ZEsmUY
         PRFQ==
X-Gm-Message-State: AOAM531U2RvaQf8FNNaJYPtjJ0LXQTKAGoU7i5/genNmGAU5RUSTxRaU
        jE9CzajHMZO+1oRkSG/s3cg=
X-Google-Smtp-Source: ABdhPJwl8WMWawBdVsNJWOHAvxz3cvEnNqeVuuYH2D1bUXik+AgYZGIqav0dRAEa9yNytSMyPFebDg==
X-Received: by 2002:a19:910b:: with SMTP id t11mr1687236lfd.306.1606127097818;
        Mon, 23 Nov 2020 02:24:57 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y17sm425927ljc.50.2020.11.23.02.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 02:24:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kh91q-00028L-QS; Mon, 23 Nov 2020 11:25:02 +0100
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
Subject: [PATCH v2 8/8] params: clean up module-param macros
Date:   Mon, 23 Nov 2020 11:23:19 +0100
Message-Id: <20201123102319.8090-9-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123102319.8090-1-johan@kernel.org>
References: <20201123102319.8090-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Clean up the module-param macros by adding some indentation and using
the __aligned() macro to improve readability.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/linux/moduleparam.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 15ecc6cc3a3b..eed280fae433 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -21,12 +21,12 @@
 #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
 
 #define __MODULE_INFO(tag, name, info)					  \
-static const char __UNIQUE_ID(name)[]					  \
-  __used __section(".modinfo") __attribute__((aligned(1)))		  \
-  = __MODULE_INFO_PREFIX __stringify(tag) "=" info
+	static const char __UNIQUE_ID(name)[]				  \
+		__used __section(".modinfo") __aligned(1)		  \
+		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
 
 #define __MODULE_PARM_TYPE(name, _type)					  \
-  __MODULE_INFO(parmtype, name##type, #name ":" _type)
+	__MODULE_INFO(parmtype, name##type, #name ":" _type)
 
 /* One for each parameter, describing how to use it.  Some files do
    multiple of these per line, so can't just use MODULE_INFO. */
-- 
2.26.2


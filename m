Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E994C64E7B
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C29F20731
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgKWKZT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Nov 2020 05:25:19 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43350 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgKWKY5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Nov 2020 05:24:57 -0500
Received: by mail-lj1-f195.google.com with SMTP id 142so17356580ljj.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2020 02:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LHyP1gF49h6gvXjDL3rBo+x9M1skx5AsWhXDDOWrSN8=;
        b=jNyIsoGAN57Uy3sODfgTwO7J0kuWAS/NSoifxyOGKronF6AeoVZbVmFdG2S+6eDZHP
         NNQT16ZW10surUTInBIRLP/NCH0PYOmWStgL6IxPmmSfWZQZW9Je3SNBgYV6+9SKuh6u
         KciyBuW5RrZN6tl3+ljMNm4m6f+CBrODDwBlJUWq5INxQX4NBLha17AYLmLk/TP1BHFz
         +C9Svoka10IIUe0XW+p1gIqFJOjRao5Y1bj5ZWd+R9n0/YWDAhceN9EekWlNdH9OHCu9
         6c8kY6Q+5zi5k4U8uVKyzWFQz1+uqzV9Q0PMiQEQ2bwEx91ZcyfhdV6PQmr8DoZeCVsk
         LQDQ==
X-Gm-Message-State: AOAM531/traNkMfgp9mifpNpVUxsUqA2A9LA4Skwn4dyLc29qzBRKsa0
        hx+dzCoGTkhW8RsfWePIUmE=
X-Google-Smtp-Source: ABdhPJwNXcmhpB6rR47zowKo5AjZLMScQFr8spUl+ZmF+hYgPcER80cRSefkGb5VbKWnUX1JyagGew==
X-Received: by 2002:a2e:5853:: with SMTP id x19mr24502ljd.232.1606127095247;
        Mon, 23 Nov 2020 02:24:55 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a24sm1267712ljn.85.2020.11.23.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 02:24:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kh91q-00027w-AR; Mon, 23 Nov 2020 11:25:02 +0100
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
Subject: [PATCH v2 3/8] module: drop version-attribute alignment
Date:   Mon, 23 Nov 2020 11:23:14 +0100
Message-Id: <20201123102319.8090-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123102319.8090-1-johan@kernel.org>
References: <20201123102319.8090-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Commit 98562ad8cb03 ("module: explicitly align module_version_attribute
structure") added an alignment attribute to the struct
module_version_attribute type in order to fix an alignment issue on m68k
where the structure is 2-byte aligned while MODULE_VERSION() forced the
__modver section entries to be 4-byte aligned (sizeof(void *)).

This was essentially an alternative fix to the problem addressed by
b4bc842802db ("module: deal with alignment issues in built-in module
versions") which used the array-of-pointer trick to prevent gcc from
increasing alignment of the version attribute entries. And with the
pointer indirection in place there's no need to increase the alignment
of the type.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/linux/module.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 6264617bab4d..735f2931ea47 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -66,7 +66,7 @@ struct module_version_attribute {
 	struct module_attribute mattr;
 	const char *module_name;
 	const char *version;
-} __attribute__ ((__aligned__(sizeof(void *))));
+};
 
 extern ssize_t __modver_version_show(struct module_attribute *,
 				     struct module_kobject *, char *);
-- 
2.26.2


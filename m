Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6388C8300A
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BDBF20731
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 10:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgKWKZS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Nov 2020 05:25:18 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40236 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbgKWKY6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Nov 2020 05:24:58 -0500
Received: by mail-lj1-f193.google.com with SMTP id y10so1922687ljc.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2020 02:24:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DIiHwj3zzp1SABTt1Q6VlY96K3Om1JLL4a2Gj9szo8g=;
        b=YPDgKLSJqje7nd+TqiOmzVQ+h4KwwGFvaQ/IbObob2umGcz53XIoKFjDeNh8+LNX/i
         kGdCdFWQLmGx0pJ03qW0jndXI3HY19qDd8pF91E3fh13vfqokBtC/nZOzM/r3xLs9lA4
         K3lpDNq7EBegoL1Svjt5AamXRhzR/JCRzGfOSY+5Bpnq1zuKb+Dlr0TJGpO62x2u52T5
         1xpc3VBO0cXR1Ed8BlsSMCqJ+vjkdDadvVe/QZG2acvioJ/3T9DfWbTJY5wSJN5F/J0o
         IS/PBs5qOcv6GeoqysB61eQOlrT7FpZDKLIkQlMo0Eyv0xGPDQDwIJvjYqqNjiKDKE/N
         KYfQ==
X-Gm-Message-State: AOAM531Cf1gyeRq8b8jYEa4sxOOlfZ7oMFk9n+basVqDLpPXiKU3W7af
        3zfJ5eLXZh4t1ohBPZN/6Cg=
X-Google-Smtp-Source: ABdhPJypPhINbxOPDDAy+PaHJNUlqNhM/8V6ncVpCoNzYAAdenvD9//gnaDWJRNgSPvUqaBBQdCBOQ==
X-Received: by 2002:a05:651c:326:: with SMTP id b6mr2712269ljp.339.1606127095742;
        Mon, 23 Nov 2020 02:24:55 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id h11sm1343594lfc.194.2020.11.23.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 02:24:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kh91q-000286-Gd; Mon, 23 Nov 2020 11:25:02 +0100
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
Subject: [PATCH v2 5/8] init: use type alignment for kernel parameters
Date:   Mon, 23 Nov 2020 11:23:16 +0100
Message-Id: <20201123102319.8090-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123102319.8090-1-johan@kernel.org>
References: <20201123102319.8090-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Specify type alignment for kernel parameters instead of sizeof(long).

The alignment attribute is used to prevent gcc from increasing the
alignment of objects with static extent as an optimisation, something
which would mess up the __setup array stride.

Using __alignof__(struct obs_kernel_param) rather than sizeof(long) is
preferred since it better indicates why it is there and doesn't break
should the type size or alignment change.

Note that on m68k the alignment of struct obs_kernel_param is actually
two and that adding a 1- or 2-byte field to the 12-byte struct would
cause a breakage with the current 4-byte alignment.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/linux/init.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index 7b53cb3092ee..e668832ef66a 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -255,7 +255,7 @@ struct obs_kernel_param {
 		__aligned(1) = str; 					\
 	static struct obs_kernel_param __setup_##unique_id		\
 		__used __section(".init.setup")				\
-		__attribute__((aligned((sizeof(long)))))		\
+		__aligned(__alignof__(struct obs_kernel_param))		\
 		= { __setup_str_##unique_id, fn, early }
 
 #define __setup(str, fn)						\
-- 
2.26.2


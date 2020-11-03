Return-Path: <SRS0=aUui=EJ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FC3C388F9
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AF5920780
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604427146;
	bh=PLZh4m74KBCCGaolVI+F9iwmFHEMi4bhaZj855gSxwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=nTk+ZF+4Cdk3AI2FKAXTjyUSBuw7qaKG/0KmKutf0bn2+H6359sDm6nfEwtnamvjp
	 BTwTUWbp5ml7iVQ0EB9AE9uJgbGlFXXNOcsUD2p4nBDBUTkQA0ftOyaPdHgoYyu1uJ
	 nwcdLTZRgfPqcnNrCYFLXDxolHEgJxEPAZkHZ4rc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbgKCSMZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:12:25 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34124 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgKCSMG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Nov 2020 13:12:06 -0500
Received: by mail-lj1-f196.google.com with SMTP id y16so20114427ljk.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Nov 2020 10:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UieLvoqA5P6ZwzyGsTeQzw36sakrEQqFllLkPHEWnUg=;
        b=FJ69J6oCYTEg9l/VrlC2bYbi2iA+Cj0aEnTyM8mRQcUKZfosdJaPunIEVev7myj9o8
         TJVEwXx4qyoFvVp61btudkoqtWGi2DXoncEjs2R1ol4lLG9lTFH4Xvkb/bB50VFTogRN
         /z15dDgD9NDXEdR6ao8ZfJ0erqpxnD18htknGG14i8Jx2+AfxOzk+Fd6lh4webuHRfC3
         q59TxqCkeAa9Yqc8BkQRd5Q9M4ikDfr18f+mkmFxG00JA8+6RKWD/b/Sz1QFTVns9zYj
         7UcfUGU2MgRmjB1R474fRDEMVUwrTrNE8g1G2jxvMyHwxM1Jj8CLztI/UizCCOUDdQ7Y
         E8kQ==
X-Gm-Message-State: AOAM5328Gx/Z0up/Y/zKmk1bEof3PDrkgAChEIciWwbqk9S+eWEtnhFL
        2Xt/phr+7IdxdbufUgzrVt0=
X-Google-Smtp-Source: ABdhPJyTbZvWAl4u3Nl+uh0RXen+KdOFffJvuQ72p5TziacR+a4iH0On6sxkLwd10U9kJEfohQGhDg==
X-Received: by 2002:a2e:990f:: with SMTP id v15mr8578489lji.400.1604427124350;
        Tue, 03 Nov 2020 10:12:04 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l188sm4087838lfd.127.2020.11.03.10.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 10:12:01 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1ka0mo-0002rv-58; Tue, 03 Nov 2020 19:12:02 +0100
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
Subject: [PATCH 7/8] params: use type alignment for kernel parameters
Date:   Tue,  3 Nov 2020 18:57:10 +0100
Message-Id: <20201103175711.10731-8-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103175711.10731-1-johan@kernel.org>
References: <20201103175711.10731-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Specify type alignment for kernel parameters instead of sizeof(void *).

The alignment attribute is used to prevent gcc from increasing the
alignment of objects with static extent, something which would mess up
the __param array stride.

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


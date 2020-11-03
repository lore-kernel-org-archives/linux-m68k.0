Return-Path: <SRS0=aUui=EJ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF4CC388F9
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 746D620757
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604427167;
	bh=PQX74yj5ihTQA+DrUuH9+j3nU3WFMOKlvrcpoArY8Os=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=FpWn0yb1bM42qefdQSKZ2SLJnhmNKyXJpdwq3CwhPWRbPTgXe2a5fX9IpSN5iKH+n
	 JNDdCPFP7HkXPbkUFYSRwK2FpIiz1lBpzQwH7HNB30+q0soWHxDrQcn0x+66y4GJxF
	 J8ZZaP0sCApvuRL7qde7iCSlWa3GetTyMNc9PAn4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgKCSMY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:12:24 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38793 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729164AbgKCSMH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Nov 2020 13:12:07 -0500
Received: by mail-lj1-f194.google.com with SMTP id v19so15144372lji.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Nov 2020 10:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MyGoxRTFxoN3CcXdLX3OQwBVVHqEtKepL93LP6Dv6QA=;
        b=rytaGJrumPGgzIN96CZlETg3tHcz+nZEeTwkAXFrbmy2qvzvunUTzNXSEF/RHLWPAu
         DtB/oaQbbJNh6KS7RbitVOny1qEwa/1MPIoIFKvJFIwpzKFBOnYrfmsWvibV+9+hnf6q
         mJ2/TYEo6PREby4Wap/cQtc5UXlPfBTOC5h4cDSFjiu2VHJ4piP5zAufhoKyn7xADmK7
         d4H+xoxhZWnOOaO2xWr5LltvxDmlImDQsUdpP3dnTb5D54e9VKm+jOg1C30Q2t4jmnHp
         a///smlL+P1ZT05zd1lEoEzuHRLak5EHYXNZKEm97GkAbe6pgkRDkkSHF2Scxbhq+knZ
         aGug==
X-Gm-Message-State: AOAM532ZQcUwQRoC3QkTbccuhQgDOxyl7xFdYLznMrs4AKHunsGSBjD6
        z0mvsBcCnncP764MFcyFT9c=
X-Google-Smtp-Source: ABdhPJz/MO3T96ux3lea2nDseTlpodjsFUn7zZD2Ae+pvGCV0PQp49JaKgosvrFzcYrMAizjAgvuaw==
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr8407658lji.338.1604427124922;
        Tue, 03 Nov 2020 10:12:04 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l14sm3641920ljb.122.2020.11.03.10.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 10:12:01 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1ka0mo-0002s0-7f; Tue, 03 Nov 2020 19:12:02 +0100
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
Subject: [PATCH 8/8] params: clean up module-param macros
Date:   Tue,  3 Nov 2020 18:57:11 +0100
Message-Id: <20201103175711.10731-9-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103175711.10731-1-johan@kernel.org>
References: <20201103175711.10731-1-johan@kernel.org>
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


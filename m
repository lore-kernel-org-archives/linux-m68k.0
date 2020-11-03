Return-Path: <SRS0=aUui=EJ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CCEC2D0A3
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AFBD20757
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 18:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604427162;
	bh=YiFAXF8gpP+Fmp8T9Pr/5UbVkNbZC60Fqcgag/+SXFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=vqglBAPo2J12WC+1zCFqP8eKggPfaJjb6vuSPdvWKn9r9IvphpjD+8L1rYH5KHv8r
	 E8vl3/iW+AJUK9t8AlsItQ+LBuOWZ7ymlpogGN5Y4zSBgoF2UiO8syFY0+SPT+u0Rk
	 kI1aLeihA+iMxf3JmFfJrc/5oy6s31CXKcIRJflU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbgKCSM0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:12:26 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45022 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729061AbgKCSME (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Nov 2020 13:12:04 -0500
Received: by mail-lj1-f194.google.com with SMTP id o13so11773152ljj.11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Nov 2020 10:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lmR+OgLQpXiz9C9It/pksOvqMCO0WrxIHSJ60EhO0sc=;
        b=Xf8ZUUg3sNvcSLRkhdBeoGwugAY4l8R0l0mjYjmtXYjnGhGHZDVWXInn1GyABVsOp4
         NGNGwGeS+j8MbrbABl72TOLRW+hAP177sUD8sYiO7hI6CNz/xjPgikQIZUirF9PdiGlX
         zvV5gIVDntL4TZwHERd5vbP4jvBfngUL99dnMpcCqV3kYH73Suuz/ARygyTEAUDozrWk
         9fbyG87oUZSO/sTQcp2/LcTpOdQjyTdB6aYCJHeuZPOWTXXEMoAvLTppDNHfqMC7ebwl
         ULA/Sl2yUYVnG5iI50eqfKOk27cmwIzHsxVktL4FB7D3flFkKjrkXQI5FTTszBkMr37e
         Hvmg==
X-Gm-Message-State: AOAM532XN2IrhrxuIpjzhYTvJ9us2wj55kd7cFUKO37k8Vxqqs0cBY7Z
        i4uQfXwJsKa8Ugq5AAMKaP8=
X-Google-Smtp-Source: ABdhPJz07sueJ3+iSzebkN7P4Ah4zYnUmAAYA1hmwphU/S9lC2YVretq83hvmXcayqIQwculOmRVWg==
X-Received: by 2002:a2e:7310:: with SMTP id o16mr9809475ljc.42.1604427122132;
        Tue, 03 Nov 2020 10:12:02 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id g20sm4540473ljn.134.2020.11.03.10.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 10:12:00 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1ka0mn-0002rb-PW; Tue, 03 Nov 2020 19:12:01 +0100
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
Subject: [PATCH 3/8] module: drop version-attribute alignment
Date:   Tue,  3 Nov 2020 18:57:06 +0100
Message-Id: <20201103175711.10731-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103175711.10731-1-johan@kernel.org>
References: <20201103175711.10731-1-johan@kernel.org>
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
index 7ccdf87f376f..293250958512 100644
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


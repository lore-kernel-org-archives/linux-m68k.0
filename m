Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235D3367B70
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Sep 2026 01:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003986; cv=none; b=q0o0dVy8VYHEAN+TshK1hOid5TKaA1g6aMhAy50MD3vlvYgwTZvCILz48jhci8ZUz9fAhgXFfFM5QoEl8g/kdzu4DqLtjHb2tJzqBjEcSG2zu35umZVXzOLfmjBrMuz1gh5gSxu2gb+NUWkzYXc4orVOoe5k+5+eoAIpVbgGeHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003986; c=relaxed/simple;
	bh=a/5VJy34H0a3YmpXDQg4RHMoRD1nfV8oGhU09Jy89UY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mnzLHxwTlCLWiU+uGWDHKU94HbVjmu2GdXNrCrUMnpyRLydfvevEUWgZfsLlc6bxKug/+/m9Wza/d5rHlJraueptzd5NKUH5zKW8WZGZozybF9VAaRTEFUfjmN6TKs799qmyaOmIel79Po30thcq4HufdQSvyvHMFCwiuxUGwnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sW3nV/hZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sW3nV/hZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso9627195e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Sep 2026 18:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003979; x=1789608779; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=;
        b=sW3nV/hZmDCH/K1Yq3snu8mlQGoB5WarGwfIjbNnrdgojS8D7aFZGGcjNObhK3biDf
         nx1PPdYmdzGUYF4JvJ8yIxJUR+vjAO6fGjUD1sFv1h2l7YFyOj5+A+YDH+eKu/PTuL7F
         WtYfle5s8QVUZBOb2pE2hhV9w3hPQsXuOL+xnSEFsvsCZk0QxKJIH1djMUAAQhPEgtvf
         Lg6/+Yl8fIa0TJ8PwlIFXJEpb4jpVByUhA9p3SLOHJGd0XAlw1GzZ1tKt0MNArXNDD8S
         ATub0PfX2zNNZgb7Cay8L+zGzSZWzCXt1TiW7hJlv/6v77Y+ysct7YUodB2ku20xOhXp
         oUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003979; x=1789608779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=;
        b=UXI1b7d2xtGOOYtRRm9CFR1gW5eZLNZXsggujHqvUzn2TpQpfFkavguwiYSWNAu4eg
         +qduC7vbS/UZEzXnqZgT9aMMdq4ofocG5VylC/bumKfsblJunFWvhT5Tzebj0QwQHpcg
         5viH5kD8SgZ3nRNOhJ1JcevMBxxc+hVCgrz8PoPTjx1kWz//S6Qy4e+ATJ+iMgsxDIlo
         K9zNRJbniKa5X8GgYvK8/EB8YOZUgZw+mPbb+sPozixQRWDcV0UVMEyfp6VknqfqfERo
         KYgSEtraBOkuOjMvuRUzpuZoHZaWTF9wRMMToAxlPzrDgX9tWim/SXwUOr1+Xs4DxrEk
         9uaA==
X-Forwarded-Encrypted: i=1; AKwUvBygDTAcEtWMiavqi5UxtzCXgE/eSZt4mzDzKwt6MJWIhVQDIGEnK2mADMu12I3QxrWiZEEGmGmG7C4s@lists.linux-m68k.org
X-Gm-Message-State: AFuF++ko3aNWwAMEoUJ7zR45HvjiCaKPTD0yDApQFsx5NasFvCI8bqXh
	4pv1pHIQPuVW2d4bB5eeTZTRfiB6rJVxmE/dxs5y084yaxm0cZHz+KlL
X-Gm-Gg: AYBFou3KPren7SranqLeBsxkXfy5uOf0tN9ZlAG7IJco77VHB70ul1PXvZBKjbn7i5y
	a9aYBvOhqVcU5XIEvHQYHPmVfkYKqKS8mLJLl5Ov9M07DnsvHzIdrvb/ayw9CelN7Vx0C5Gvdbc
	q97AUhDqWCnwqZgs6o0uHkgiPCkdZOf9ZoXeq/CrEJLIvpk54MI8hpBH2au37DJK1E4qwvrw7Nq
	rsO2b4l6sHyFQEUKzOFBz+/r/27YAc0YmCBEXKzVGhoa9CUPh5iKjyTSRVHSP2fVWaigmGbwYYN
	sPzN5A1MQdUplOf0PmRfxRplNo7pv7bITmYP8lvJIHA85vuv0OP50aczXAWJfZX5SjyBy5rUjmb
	UFvp+RFuCmab18lWDBRLgVDc3GMJadnj2YOvhxNWnPlzisc6vYPrnc9v89E4IJkMsE1XtgRJnC2
	ApI0X2Jl0hWelQx61QnQLeB1pnBMjcwtHCgAbAn/fO/NqbQesOPPLR/D4n7s39gN+MToSfy+g35
	sHVRKj6/74pejldu40WRYE/3cJNJcP+uWRrRX56cVutXrfTBRq8XNZ7us2gxauxuh8vIxChMoRc
	qrTbLGARadxkSw4KNvxx3C7gHkCbRxg47EQv3/IfO4VmNWBkjAdJSocfAdfjFFe3iEFS9eKO/SW
	ToA==
X-Received: by 2002:a05:600c:150a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49d2592e85bmr54568515e9.13.1789003979463;
        Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 4/8] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Thu, 10 Sep 2026 03:32:41 +0200
Message-Id: <20260910013245.8619-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
order variables in io_apic_xx.c"); nothing parses it any more.

Drop the entry.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2a8d862ef30f..f4314492953d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1647,12 +1647,6 @@ Kernel parameters
 			to discrete, to make X server driver able to add WB
 			entry later. This parameter enables that.
 
-	enable_timer_pin_1 [X86]
-			Enable PIN 1 of APIC timer
-			Can be useful to work around chipset bugs
-			(in particular on some ATI chipsets).
-			The kernel tries to set a reasonable default.
-
 	enforcing=	[SELINUX] Set initial enforcing status.
 			Format: {"0" | "1"}
 			See security/selinux/Kconfig help text.
-- 
2.53.0

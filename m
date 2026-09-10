Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E3A3655C7
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Sep 2026 01:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003976; cv=none; b=BE7UtAEszIyVo5xbD4qIPmg2K4P4K5OsxIjxbxyHg0yPR4MY3wYc/1T39dP8pzCUOk+RZywIGIYwC+hEgAeZ3z1NhqzU/CnO99e2fYTDZAPe7opRirl3JBd2hsDY0iQGOR1/QkwRUJKkeTjFcxipswr4oXfHdiLQv+U5nqNWx04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003976; c=relaxed/simple;
	bh=Wrt5BREBuyuGcYt2aWXWslgff0dcwvsUynDfCbIh+Rc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pf4YEw5AdqmK0k5R6yFahUPAj18bLtjyx73g4HxomF9HwZjsEt8CdGZtbb3Hw+YJdWn/TxHHmr46rc1kcVy1lBZOh6xE5YqBIZ9cQW9SDSWUNf97QwypQkw6rAnS+4mF5kOWGaZFxFSMr+9X1R0FcGw3E7KRFLbL9VsnRJFPGuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAC37zWg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAC37zWg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so40604635e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Sep 2026 18:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003972; x=1789608772; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0noSNcNvP/+I+rxnaf4LKhy/qChedg87Os3I3Fnbpw=;
        b=kAC37zWgEGbN0uu9fnJL6mq3DxzYYaBersD/3f6YK02//AGj5iFkth87Htu0lKvBju
         gTHgbcq/ktLzdJfMA0gFG1B/XMGAn6q5LhY/U66oCpWFb44tIGv2dwJV1jSyWuGYFHRA
         fwzu1FK7NsImlL733Q2zc7PaSIqA8SupLF1/8HtxjEtAgoMyXjvQxo469iL9iKNJ/9Oy
         zoIa8kGN6LXGSDLfvDLTspbzrFv4zZ3pLbZ6xZRdEMKvS+/Zfy5s/CN19Zq4cW+Ox1yS
         M5uCCrO9UPv5oJYRsWKiuZUGfSBBZVRn7agUARfLyGug4otkPCn845nvlIBc9EKXZDnM
         /1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003972; x=1789608772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0noSNcNvP/+I+rxnaf4LKhy/qChedg87Os3I3Fnbpw=;
        b=EZBLor1Ez5F1HGj9dmtChHm+ibvr7O5c740We7QhGuFOn6vC6KmNCL8V7MnM4RE53p
         tHjv8gKt7oCNda9al6x+kq+EFQRA3aCj1aEQHlBIBUJIcYi0OJdVBv2wAh+NyxYb/JYH
         zw4S8KInTIrVmt+85UFZCmaTRI0dEXWSNGrvvzfOQrRn3AzK8P55242iyIG+IhyL5giE
         zHUE+LBhZFmFD8IHFXuu51iKBEktk+aVBw4ebJfN1aaBPmOBpW8toXPyHjEciNnlvd0A
         pvk6xWMA+KxtAvu5lOwGe+c/HUOEWxqd9W6oy4rNB8dip+Vo4IVL76SteOv5bCSCw9m9
         X0kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzNNIDRAJ8AX9sjiVebtJm1QIgTytWVd7uY2vdeKlFCi2TqB5NIpQlatz8u6rewPrGkIMBb1t64yab@lists.linux-m68k.org
X-Gm-Message-State: AFuF++l2x1wW1dXIq5u/oQnfjKQBcIBgFyc61HGTMQKW1aVPgfcr1ZhT
	MLzAbqh9GoDxh3P74kTky6aNuPNDW+qipr81J00D0xlCUaKJMKDRuc1I
X-Gm-Gg: AYBFou143gEpgbE/cJFFu5nkqZzNiOqvmkbmkEXM1VpTAeLQ53HWtQFgmDt38zJjN0e
	XmW31Ps1IBShFGHQAbjDb5ajez48rB/35e+O0LqFLlPqa+bgCZQkn7ajasmBcUCErKs23oia508
	eWv8V6srawwJBrU7YLTGwucHQ+Xq+UD8fCAcdEtWTuiWkX96Lywb9SNXILj3F/B2xTFg3AEjdeU
	SU29JWKfeDXeeOkjZunWMV8r342NzChE35jfe1zeteWDitLeATyqOfVNFnAxy8VWjDqTPkbAF8d
	QhNuL0a1bkHN6jfWz3+Vih81LhC4gMU5vRiIf5wFViaj7OVPT2KAQT6KMOeYfSQUv3QRe8rIaRT
	PpIcctiBUr5N1+noIa3kLGA8MyFi+emqeuwwrUvaHskXnEqUKcMWveNQjRVi/wyKn5HxkwW6OLg
	jax5BcUuyQmqY3K//w2hneHTZNz/uCgHs6MXKheglXC4ShYDhju58jDOlYy9YNvn7F3wVm+Yt6d
	6M868QPjG9J0A+DZ6j7vQ2v0oBAXXPKS3LW4aZnKl3HntRtQXkUQzQHejqTcYm5ZecSTstFFKgl
	tMj4MroprZYuGPiqbapA8EvC2WOjlkCEB0vLtuauNi5MdgnXaW1ipMR5OqKkXFhT6Pgus/iQPxi
	GEw==
X-Received: by 2002:a05:600c:3ba3:b0:49d:e79:612f with SMTP id 5b1f17b1804b1-49d0e79635amr237510065e9.26.1789003972418;
        Wed, 09 Sep 2026 18:32:52 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:52 -0700 (PDT)
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
Subject: [PATCH v3 1/8] docs: kernel-parameters: Drop the atarimouse= entry
Date: Thu, 10 Sep 2026 03:32:38 +0200
Message-Id: <20260910013245.8619-2-kmehltretter@gmail.com>
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

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..c8d96de4c00d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,8 +591,6 @@ Kernel parameters
 
 	ataflop=	[HW,M68k]
 
-	atarimouse=	[HW,MOUSE] Atari Mouse
-
 	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
 			EzKey and similar keyboards
 
-- 
2.53.0

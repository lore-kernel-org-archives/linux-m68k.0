Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9293FFABE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805087; cv=none; b=NLFKvsUxDdnK1aMCsbkcwQvslJV34Hi2ME+NviEDNOG+HQRM0NorH2EKsAgZVNl0Ck2kfcrE62s5Srv6yQL+KbfgY21oFdAYMRWsHC2crJ22f9Uq+q5e1oLHMM+3o1XDvABaMxObSat9CI6LlSMdt1TuZ0PcFYXCqEd3O9Y6C+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805087; c=relaxed/simple;
	bh=vLYhva7TFPlfvxBS6GmaWUTUrenc6YRKtxASZZ8jZAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IoKOTX3TS4A56eHSZDglA08njxi/WV1dgKH3Lu9GxcqB6P2nhH6U8BoVZiS4JG9qJVVec91KjqJOzLLjcbEkhSuy5T0aa3izxqMGPTtOENGzWf0Hx0fjb/kf3leI34tbh/nEcm3zIBRzModpgWzS2RRfckzZJD4RnKLPb07EncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mklUTZW2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mklUTZW2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ebafde87cso2490734f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779805084; x=1780409884; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcGq1XrISl74r5Iag0hCS2Wz/dm0EE2zh+iieQwt2tE=;
        b=mklUTZW2kQaSfqwXIFLO+vfpKW590tI4gWKuBSS9FLfzVgNBblzFv2fC80v98rZT7v
         gcgi3jDI7/C7F5Pdf6EkLTvklUfFy4Qb8iijw21OGZ7Kd9//dg7djClQ0rmTOgE2+T33
         y+h8LCcDdUdOc+ui0iJGzzZZfCkK1M8fa89WRnIThQIxIejFwndFe/SjYfLyB0QVyH/l
         HWx5VSoSCIRjt7NYMkh8kXQyW8dA/ul+ODd2D0Uzx8siSlkWwYI7JZxqsJbvXxIEJqyr
         Skel8PnM9kru2UWJGI4QsDFKdQM7B4lPH5UOp5EE34MdYy4aopNtvg2JXcdjcP5rXIlW
         DPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779805084; x=1780409884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcGq1XrISl74r5Iag0hCS2Wz/dm0EE2zh+iieQwt2tE=;
        b=l9MiYiSzmgZFQygBwSG6qxWQgAiaqhDFdqu50ZsNlKeNHZ4cB4nEtnVZZn88V1Qy7J
         gJx/fvXchTFlUBn/X6LgJV2wGjyUjWh2zSUIf6cr030tYwl9a6yszbCIEMCdUaZ/WyzP
         e+c+yljPJ17mwAXbTfbEfM04hmCzbkhFqy0i3ymvyuY6J6akuz6CLPdjGrc4RNl7mTVG
         4j+991okeYQJMRfIHDbt7AM3Th74mjl+A/6GVeK7+0B973c0LcYyYUO1splDGuFUUhLX
         YKObsu/vIyfaRlMBbmjFCMGmi5JFa+hsIrxRso8CwRccAquuJz/W7vtNHhNC6s+7uDMo
         QB6A==
X-Forwarded-Encrypted: i=1; AFNElJ+JwQsf6EkMBFW/DVNNANRTzqdMTXeT1RjG/fhEFwORp80Dk1D9Zu/rqvAAIE3ucJdNEHq34RM8boBQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyM/ZcOomzhcwJZtuoJnPyVFUv4WchHcMQ7COypoRMp42vSpNtf
	F0a+W1M39AsjtB58UuGicK9jsoniXhTfOLSDSY2PyGp/rQp3DFR/jwLtPXuqz8qbjk0=
X-Gm-Gg: Acq92OGK1XOrsITtXM41GWqYruQzr/JdV4UOdnUCOSZvM8T5bNQE8OjR9+TgbO9t6ZL
	RF7zJ5RKlbdQBIAMRNl0s28dHNJXozgAlP0jiJLth09JK4214mpRgw6Rq1AyOAneEJBwb2Kn6Pv
	izoZe5ewWVKp90WZMDCaRxZ92rBDcqMv09fJRBsy7NcFqvTdedmY+XZNHRXry6/Q3RhlXVIwqN/
	ULnscViLexixu4jkQq5Oyk6KjJeeTJxAy7kKaSFTHLgvD67UQmaAvIORhIltuanJYW0xIRZgJik
	T7RZFjDzmu8MgCvPkRNsARpjL2nO7czXJ0yvsIeHGdeywjwyz4ycNJKM4fXx5axIj6EBNKIhWzl
	lfGj2zUsYFO3u4zDlFEtMEnvmryl5fFVqp4qg2WVzdDcCp9cDiVgDtqN3S4NqVnmoFn8K4p29Bl
	bJAJSimIAr1GJvIouD8i/ohBCx9sn4ffJ0Mi3uj5ms06WovI50Wm+3U3PxR5HJ3Qg4mo7BRy6cp
	EB4qXb9XdFfXWM=
X-Received: by 2002:a5d:588d:0:b0:43d:a37f:8d5c with SMTP id ffacd0b85a97d-45eb36a860amr35484418f8f.17.1779805083801;
        Tue, 26 May 2026 07:18:03 -0700 (PDT)
Received: from localhost (p200300f65f47db04a716d2bdeddb4813.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a716:d2bd:eddb:4813])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45eb6cce0a4sm35446032f8f.12.2026.05.26.07.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:18:03 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>
Subject: [PATCH v1 5/8] video: fm2fb: Use named initializer for zorro_device_id array
Date: Tue, 26 May 2026 16:17:31 +0200
Message-ID:  <12911d2a1dfc4e482bbc0a417df73748283d04ee.1779803053.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779803053.git.u.kleine-koenig@baylibre.com>
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=vLYhva7TFPlfvxBS6GmaWUTUrenc6YRKtxASZZ8jZAs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhizR1U3u1mK5E3TLryob8TbMXBf7Meys0fYbv3Zb72143 3vnx1XHTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmIn2Yg2FmQtmKN5sOa66d rJ39ZNfE2ot/OA2maOQlfn6hfan1i8Mb4SIfoZq/cUIZGvkL54m+vZ7BXv+uMskjeJbmFLOL0ge i121P2PLYp/i5QtlVhXVqG52cctz7l9vnZS38pPBF91FWn9T5+RVBSk62Nu9Dklb/T7DRamzO05 Ws7ZzWfPdGfHXDwb73Nx04dA3T4rvVFhXvkzGM97/dY/gncmbLuv/qzy+5NTMns0fkBx5iyGj59 ujvn7LK/lfNL5l53ikZMQTw3+D4s/H93QKxqaUlit7rQ9amBjunr++0kjj7/1d7xiy7L9K+UnEF nCeFvxe0nPmySbTYOCDD7DST1Ns1rbkRO5akO9YE8W8DAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Using named initializers is more explicit and thus easier to parse for a
human.

While touching this array, drop the explicit zero from the list terminator.

This change doesn't introduce changes to the compiled zorro_device_id
array.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/fm2fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/fm2fb.c b/drivers/video/fbdev/fm2fb.c
index 25d2e716edf2..a62c8d86bf69 100644
--- a/drivers/video/fbdev/fm2fb.c
+++ b/drivers/video/fbdev/fm2fb.c
@@ -212,9 +212,9 @@ static int fm2fb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
 static int fm2fb_probe(struct zorro_dev *z, const struct zorro_device_id *id);
 
 static const struct zorro_device_id fm2fb_devices[] = {
-	{ ZORRO_PROD_BSC_FRAMEMASTER_II },
-	{ ZORRO_PROD_HELFRICH_RAINBOW_II },
-	{ 0 }
+	{ .id = ZORRO_PROD_BSC_FRAMEMASTER_II },
+	{ .id = ZORRO_PROD_HELFRICH_RAINBOW_II },
+	{ }
 };
 MODULE_DEVICE_TABLE(zorro, fm2fb_devices);
 
-- 
2.47.3


Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35253FF1C3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805084; cv=none; b=lxFfNMrJe4sL4o8pShmVIw6XwgSlmzYnx7Au255rdhkhllajGI+HrNlkTMy/WzNr+B0q5FrRq5j2s+wFBSfFtrrh96A2ghrui912MOFI49/7Pp6CYHyhpeH0lOp2nxa8mi0LdBCx8EzAQYAuT9S2ypGgWrtNyX6kWWtI6r4NQ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805084; c=relaxed/simple;
	bh=Ix8wMTvjRj2V15S2wbpbWWczlxynGaC6L6zz/D+au5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqyNFmHfprkbwM/CU0cu4HAXKg8pJBaMYXkBdJvbL5U1/TOWPfyPyaJv4rzkVSSdURyyVBDfde/vQGBcsP9fu7ct/SJviHvcHsRhtZiIyUivemnl8Rt/nzbLMgm358kf6K1VzYSmCO2oib4mOXFvsAgm39PXCVkmUz+jWWXULKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BYu9tXdk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BYu9tXdk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4905e190c71so26175435e9.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 07:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779805081; x=1780409881; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKGgUH1fX9QGB4ANVtGN3iVgHTq5bfM46OO8lv6SkzA=;
        b=BYu9tXdksTdG6zKjD6deIXGJtwJEjPX+/8IRwEwMQbMwbSD49978Ble7bhuMxbnauR
         3IlTfcB2+6s+59uZfsIxZeFNEqUxmgLGATKq8v280m3gUEjXIcmRBWrSQi+66UipBQ8i
         hwkECOfVQ5yyyjiC1TouxWrKpamLd+dn8dmAcZkfIrNjEcVRZVRBe2jDte/f4aq5gMVU
         Wi/F65GGLVPV0hamHz4kn3/OHlDPLuH4vnRDy2ufppkFtNYqJRxujoTeiHkiy2nT/Kiz
         R8RsmL6e7jXPfNrBErzPxRmbgaRPQnZkDCZh8XIVC3hSxnAlO6rcbHFiUYyghJe5G3me
         6Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779805081; x=1780409881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LKGgUH1fX9QGB4ANVtGN3iVgHTq5bfM46OO8lv6SkzA=;
        b=CnSnC1vOBOGZFZ06bu9SO0KYOBonndN767uAOeNHdNI5RlhFZ5p9fyFO1t5xXJS52p
         d8cW31ski9gnY31yArlMrsntiCk5buJOJ5lXU8PK511vHucy1OSrsOwurctmW7+A9ALr
         GDsekcpWAvwmKaGU034YLCf7vCJDToFARabnm2nvUygyzF3U6A+WC9yVCVQhKPvmmTFs
         f2vFR6vK/qhFC0+U6NV0+FbPTqbBde3OCd9QD8DbXFHh7iHr/ur+B1kamlxC2YYY5Bcp
         kyEA6QZJIVAirzw5mHTeo5CSa0t6LgQWVlHOeZQbj934NP6Xb5RB6gMT24ifaCDWlkYk
         Ez1w==
X-Forwarded-Encrypted: i=1; AFNElJ8rQbLfjalY0g45YrSAliBEFMY6fX1PCgVH5fXfr1ms/IR92KIA/F9e23VH90cVqcPFusnH+Zxlp7JD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwzX5lOFU82dk7PqSRI0YgTgVfiy3LwriUulNHLcgqZP9x1iMK4
	mXefR/4YGv8joKxG5UUePDedCeQKToLfRfUBpjxAsQ3nQXqY3BlNCproK9qFGUk77jc=
X-Gm-Gg: Acq92OFvQiGuwhaq9aodxEsk2jwpa7UJFQw5mng/tFbPoKDjK+Jp1QZA5QosAhEqsK1
	jDM3AGwGbst8kTglG4rEw6/IWEfOcaGUKaXet6tTkQcc1ZkYtzaKWnO5dsIr6FvT4C4m7908hio
	+e6cVkmSjM6PDCwW4vwlAkoi3nVIqkNSK2Z1AZbS3PCcVc9A9OVekavw4NIMYhunwiHXvLtFW5N
	37RVPC61WeOPQbUesMoghTnnfI2y/kNWSX0JP7RzTtF5zjMro6bIEhz0h/UtPpmXwftAGG5lTbQ
	DGCKcQKvftrHIHpxz0htomHB0f4hsWmWlg2zSR+3/73Vkr0uxAJmt/JGkRCtjQ9bC9LC2XHbyeD
	4LUg57KxU69HpgMJHB6qroPnG+tHBWVasDkHfk9ZlNOxk8WHUzerjtSH51rDz6PAHDvUakER6uL
	i4tK7jw6IPvogu//xTk+/dVZx0COZpC+uP/sk6CPCj+tkm20xqHRvNxP18b9VzBL2UoN4fH//Ce
	RV1NnfcyMZWbCeqDZx2okqwhw==
X-Received: by 2002:a05:600c:45d2:b0:490:6237:521d with SMTP id 5b1f17b1804b1-490623753admr156647735e9.13.1779805078453;
        Tue, 26 May 2026 07:17:58 -0700 (PDT)
Received: from localhost (p200300f65f47db04a716d2bdeddb4813.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a716:d2bd:eddb:4813])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49044775266sm110761365e9.33.2026.05.26.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:17:58 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-scsi@vger.kernel.org
Subject: [PATCH v1 1/8] ata: pata_budda: Use named initializer for zorro_device_id
Date: Tue, 26 May 2026 16:17:27 +0200
Message-ID:  <a20f52aeee9dfcacfaea43ff280fa1867878cbbe.1779803053.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Ix8wMTvjRj2V15S2wbpbWWczlxynGaC6L6zz/D+au5c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFat4RsEUJs+JP0DdUtGO65bC9TW+TPwCfDBUt sqTR8XPzt2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahWreAAKCRCPgPtYfRL+ Tq4NB/9LKL4P0fU7zq69zjKPXadEJbooMHKv4U0LmaNdculFVwVabt8d8w/eqfDxh0BTGkj6+mj rtEGQtd0ApMuqmujeug2au73Dj6Fbbc67P5DdIduNpVw9WugHne8/P8PFzhLqxw6z8P68S+ulIu EddgRkD6XHblmHbUvvoPZn+hVYE4HjiShEps34/3uuwnWaok5Q7ijUXK1dcKq77CzKQfMlxaP5r astqTQrhQIxuA4gMp9NgoY1e9YmbwiznIU7sWgE+vmD77ynaZKcnziO3ZfJMJDUDMhi6Xqtkygo 4idZaG8w2AK10QwAA7lBSc92/69CdBf2z19hS6Crn2NWTCjX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Using named initializers is more explicit and thus easier to parse for a
human.

It's also more robust to changes in the struct definition. This robustness
is relevant for a planned change to struct zorro_device_id that replaces
.driver_data by an anonymous union.

This change doesn't introduce changes to the compiled zorro_device_id
array.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/ata/pata_buddha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_buddha.c b/drivers/ata/pata_buddha.c
index c36ee991d5e5..3b1f0ee2f875 100644
--- a/drivers/ata/pata_buddha.c
+++ b/drivers/ata/pata_buddha.c
@@ -253,9 +253,9 @@ static void pata_buddha_remove(struct zorro_dev *z)
 }
 
 static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
-	{ ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, BOARD_BUDDHA},
-	{ ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, BOARD_CATWEASEL},
-	{ 0 }
+	{ .id = ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, .driver_data = BOARD_BUDDHA },
+	{ .id = ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, .driver_data = BOARD_CATWEASEL },
+	{ }
 };
 MODULE_DEVICE_TABLE(zorro, pata_buddha_zorro_tbl);
 
@@ -282,7 +282,7 @@ static int __init pata_buddha_late_init(void)
 	/* Manually bind to all X-Surf boards */
 	while ((z = zorro_find_device(ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, z))) {
 		static struct zorro_device_id xsurf_ent = {
-			ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, BOARD_XSURF
+			.id = ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, .driver_data = BOARD_XSURF
 		};
 
 		pata_buddha_probe(z, &xsurf_ent);
-- 
2.47.3


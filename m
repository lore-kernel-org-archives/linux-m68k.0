Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84BE402442
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805091; cv=none; b=kyNj+EQO81FZndEEQ/nU8pSRfZHCBs9uE3Hq7k1KymY95BOg6wGfg+6QwhIwxjpwoicbZQXtjRJS0hzgDV7Hh6G2gNx0l1BoeWaFqxC2lD7yW3eBDYGtAi06d2Ok3EDyXAOrd4/NpI5S+6KD1wCqVwN5nmsvodCdVXdAPzTtrWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805091; c=relaxed/simple;
	bh=K/rLWEjDKkHsJ9bxXPZI9DKSp87tpARRFywudt2h+mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TqkqHroJQRWqPoicPqjYNxSqAXeIO+HEA1xE7vUCw2j4iKuG6oXqvExvp7JuKDQFK6cPO4LDBkoao9VLr8K7j0KsU9iQk1CmtvQ58wpVjEY6MBdQaa1mve+iJ+4TenjDspg6ddif0upKdz/ZuJ4LPtEfrKKMPrFLwdSX0ioOMBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cxIK28bJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cxIK28bJ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43fe608cb92so6494070f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 07:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779805088; x=1780409888; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+l0tXTe0JtsE6kljkXV/yKiUveLQAvzo0OxqjuzKVB0=;
        b=cxIK28bJe28Z5djDeuQLim/WZx5YEbiQ8JWvS3ZZ4F9weVBtxv9yQu06C2H3dwFmbU
         tm/D5xtUmW73oYhBfurZa94CzKY/RBLIAUMVwnNwtaEcQwAfMc/5uU7WP3OBGEQYTKyC
         WkZ3D4W4AsrbiGYBtjdqqtwwi9EfAa8mgzvKDBvShm0oeaFE07S8SnIOEQQ0ypPABWHS
         Va9rXMbJWWRH+0MZPdrGGkU3t4GKtnTpgqtZZQnWK0kSajKIURbf6/4KdbZbI7rk5A1I
         yQz71VBjiYUKPOG4ZUwteqhIz2i0oNdfFnpaYt+oQJwBWdH3SVTlwwDtKMmom4GkTDgT
         3MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779805088; x=1780409888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+l0tXTe0JtsE6kljkXV/yKiUveLQAvzo0OxqjuzKVB0=;
        b=bivFH5bCS3jbEwo4IyGh/6754j2I+S7Tn/4tERms4X45UYF45iCfg/cx2d5RkNvuqx
         LvgeEJU4Nn/E5djbacvp2LuIvWNuhy338z1Fz0a35/TABfhx/JQp9H+bcmAVUq5AC+k3
         VJabX7KqcKltTWM6JXlnNNDP4Vn16uNQ03M9M8t4yY5gd441Xf5D6vrA6TPbR6BMCInO
         r/RVHElAttJ5A+ABfF4xiWX7VTXa1L37spDeqCUy0ssPvJDiFCR2dM2d9hVsIQeGkxe6
         7iCGJPAW/f8bInjONp2nXHX3/+k4dstNpV5bpeoqtc6sx261FHe3h0XIlH50W6/UJl+X
         PjQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gd2r3tWCXpgpFRfcELw16qMVbD1uPIcJK6DcTIqkSAnAiq1RbCItoZNOvnwUJGU/5vErrLLpgaJv1@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy7YAPUGIXDmbuW27huiIkpLqw9n8Mc1zHmJHI2BYPQQYmoOb1p
	DmhqCRc5JeUvL5965l5SQaORlZ67WZq5Yu8LDPcGk1s8CaImm1DyAADSSfF6U30mNFI=
X-Gm-Gg: Acq92OFKGmyqEvY8ZJXp4XliZplkUM3ftMh8vMT8spgonvJoSpFJd0c/zB8fjEh2CIZ
	xpU9zHAXEVNxJAz11/tsnV2ASXkUi/sWf3X410C2RRcC5oESvw7botFscj0J7bS4uKN2R+Ze+Kp
	4jPZQL+dkF7ziN11LG2/bzdJGiT9iQVtJD6/a0A0gwHhHAYK24jn3+Xd1VYNBt00OvEMogteNzx
	YvovgmzcRVw9HBgHdzakzQ65TZl8GXKko+oq+lNuv/Vej191pF1VEKPdAsO+yUQacNaMQxRxs9S
	DJAzLFeZ0dCzYh0WatuRec8W6y+8Xt5kxNhBnC0lwE+6IHfcnFYCJ5E7l4UG9EmY/ObpZgTLZPz
	ttOtPv8WuX+/pguY7UJ4GDiwUQNf93Db8BLGQihHigKaIA5sbBIGMDSrYv7KyDo3wmVIrHvrG2+
	Sw9CUVfAxlsPm7YGsjLw5AS78/zqNPf13PB8HGPRLnxb69/XXynMP5x+r3qZkqQYQ+8QgOjE9G1
	3BP1sLCZiDTtDA=
X-Received: by 2002:a05:6000:2003:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-45eb38e4b46mr32569170f8f.38.1779805088108;
        Tue, 26 May 2026 07:18:08 -0700 (PDT)
Received: from localhost (p200300f65f47db04a716d2bdeddb4813.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a716:d2bd:eddb:4813])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ec7fcd7f9sm22348657f8f.37.2026.05.26.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:18:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>
Subject: [PATCH v1 8/8] video: cirrusfb: Make use of struct zorro_device_id::driver_data_ptr
Date: Tue, 26 May 2026 16:17:34 +0200
Message-ID:  <72b515651ab8df2f464deb620fd7b24370d6fb1a.1779803053.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=K/rLWEjDKkHsJ9bxXPZI9DKSp87tpARRFywudt2h+mw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFauKEYSHWUZfQM/7o+z0zP1g8ExpBrH3mhgHl +PAjlqxotOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahWrigAKCRCPgPtYfRL+ TiO5B/9L+NQiEbboLQhnRBDWb9kWCznt9081jTJD52DjSXIbOimq9lDExC1+m0zHI2vR23OtAz5 rYKvMs5BII8C3sPjydO9HflKm+0HGBoxNHyFcBRx7nMD9YMRu0oEL1KgUF5aYOJDw3EZHWDojMB lD0vp9qtN/T5HfKs2Sh/ySwqhx90V07yB8/WO6csBHNoZKyJ5crGE/3+EXpuwm9iLdG7ro9/WqW 252nXum67dBmt2ECelLNWuOkHKOPjUDQ82WHUAqobOpqwWWtT8BqDC/PsBofb8nn9ZBDxydS9Eu V55nk2HDzDn0IRAJmoktE3+whV9/arrbjN0Wx39DREREqzRp
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Usage of .driver_data_ptr allows to drop several casts and so make the
driver a bit more type safe.

While touching the zorro_device_id array, drop an unneeded explicit zero
in the list terminator.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/cirrusfb.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index 2693b5cc053f..7e07e775b393 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -321,25 +321,25 @@ static const struct zorrocl zcl_picasso4_z2 = {
 
 static const struct zorro_device_id cirrusfb_zorro_table[] = {
 	{
-		.id		= ZORRO_PROD_HELFRICH_SD64_REG,
-		.driver_data	= (unsigned long)&zcl_sd64,
+		.id = ZORRO_PROD_HELFRICH_SD64_REG,
+		.driver_data_ptr = &zcl_sd64,
 	}, {
-		.id		= ZORRO_PROD_HELFRICH_PICCOLO_REG,
-		.driver_data	= (unsigned long)&zcl_piccolo,
+		.id = ZORRO_PROD_HELFRICH_PICCOLO_REG,
+		.driver_data_ptr = &zcl_piccolo,
 	}, {
-		.id	= ZORRO_PROD_VILLAGE_TRONIC_PICASSO_II_II_PLUS_REG,
-		.driver_data	= (unsigned long)&zcl_picasso,
+		.id = ZORRO_PROD_VILLAGE_TRONIC_PICASSO_II_II_PLUS_REG,
+		.driver_data_ptr = &zcl_picasso,
 	}, {
-		.id		= ZORRO_PROD_GVP_EGS_28_24_SPECTRUM_REG,
-		.driver_data	= (unsigned long)&zcl_spectrum,
+		.id = ZORRO_PROD_GVP_EGS_28_24_SPECTRUM_REG,
+		.driver_data_ptr = &zcl_spectrum,
 	}, {
-		.id		= ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z3,
-		.driver_data	= (unsigned long)&zcl_picasso4_z3,
+		.id = ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z3,
+		.driver_data_ptr = &zcl_picasso4_z3,
 	}, {
-		.id		= ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_REG,
-		.driver_data	= (unsigned long)&zcl_picasso4_z2,
+		.id = ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_REG,
+		.driver_data_ptr = &zcl_picasso4_z2,
 	},
-	{ 0 }
+	{ }
 };
 MODULE_DEVICE_TABLE(zorro, cirrusfb_zorro_table);
 #endif /* CONFIG_ZORRO */
@@ -2208,7 +2208,7 @@ static int cirrusfb_zorro_register(struct zorro_dev *z,
 	if (!info)
 		return -ENOMEM;
 
-	zcl = (const struct zorrocl *)ent->driver_data;
+	zcl = ent->driver_data_ptr;
 	btype = zcl->type;
 	regbase = zorro_resource_start(z) + zcl->regoffset;
 	ramsize = zcl->ramsize;
-- 
2.47.3


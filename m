Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07C13FE652
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805083; cv=none; b=mWHbr5WDSdzmfWE1K+4zZUjoKrXsewwMMVZrz88Om3jAj4FYZVdOVMcvaWTJITDHXaBJyJQzM83tMY+CTC6xmeGmgvnIw2eu+4tWXYtVD0BaUIrnvDwuV9LIl1qL5f6wUTyq/hGjduVWR2HX7e4H/VVj713+KQ1tvBzFH6nZUAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805083; c=relaxed/simple;
	bh=DUPc4hq5A75iCE9n+8UJBx44jmx2lrSpFvIMVWPYPp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ptZe8BiAkq3v6wEHUwT3gl58PWgtN4Xu7ZYpw0xSx8rT211JnCB2s0FxrlGW1apRC9OusWGKJ+cbCyz41XF84Pk5dQwDif+TQM31ookJYQKNOSmgbVoequ4WdpygHbqzsndjuADZHMXKzrPr8Zj6QeXUMwWwz6SCWax44F2GOdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=C7zrlHVy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="C7zrlHVy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48fde648a71so70130775e9.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779805080; x=1780409880; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owUZ+ht0GkQnt8mYcn/fY6yfRIileFWWrUTIJce2Gaw=;
        b=C7zrlHVy9fx+9Z1gOYO8qNjHRg7S9YokA9TiOb0sByvMvUy2zzvB67uQFBMyT3qwZj
         lpQo+UYTO71rrwDvQ/eSaTCNBDemHpfBakh7H0+6eIFxopOsVv3WiwnINYQFIZ1fY6je
         ZEFTus+VAkggdInLqTgl39qtzdpR44ZRYBqqIuu7Tw18phyaiGdjBrVfen1dCBzks2nw
         IvYp7+0XawlHW/3ZBHwUBDvyTFAbO8feaF6vrf3sYLHoUNoazjd45PR0pml3bXlrS5RU
         YfanrmBlnmOaVVTWCY0401u8iUGxxG5OrGsL3hc6S4jy+bd8JfPsKh+ZgZcrflYdglc7
         ZT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779805080; x=1780409880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=owUZ+ht0GkQnt8mYcn/fY6yfRIileFWWrUTIJce2Gaw=;
        b=Fw5mNk9uk3GHT3BUcttZhzyXlOz2MrxPDcOzKu67LK9HJjgBqwrqafdNbVPDZ4XLxI
         IU+Xti+SVZnmER+gaFbSUoaCHjEh7ubKZNkEjuWizGkbgG4IiPyv9diWXW/igYNHYWMN
         sVbZtny5bpAsfF2AhV+SXpoFSEdt6FQXckLaRck5A0tcDJjNkKfErvscSzwDq87Fp+SU
         03KQiZQxJwiuNSiRzQcmojEmYWCWXyxEgaFzDbgPtHV8ajOg4JBBCHzp0X93b1GeL1zM
         vjb3ASQHC0/vSKAo5ih8vXVzN5gSxXOAMUyFm6daXRS+gk6+4/d3e2kIUKe22XHzjC1r
         e50Q==
X-Forwarded-Encrypted: i=1; AFNElJ8+fonwVyMCZ2yiLUmaV71p07pU/RHoZET73u4HgrpupULLkx9gO1yd6ylxntysGNGjekbyhi8Xqatw@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx8zyMPgpVK3mz4/aVvXYTkSNqzk8G0JHtEBuQ3r8kHdVQzhKgd
	y+1Jy747lx+vn0mBdGSUX7oVbA2CfDIcO8h5Don8EulhIUBi7ykLFt/X+4Tzi/+OP3zT3x1teb4
	g0sdstcs=
X-Gm-Gg: Acq92OGwSB23jYQz5dd8Pl4MXFGTK7qI7QdrZS1nzdoGKcOPNYgEX6tGOO8xL3rRttR
	A5hEBJqoLCZnKZ1upnF5Wg9d7zOkOyYUMbdanIovZVx//m8C72IeHKcmYpBgIaNjJwJQkNqKTSD
	Cd80yEWPr/wfD9sGXwukET04I0JHU+/Hj96GkXko7JeR0Jv/0n7+752PnrN0AkiXT0TKHEKlwpJ
	Zccj0GivvshEW14WTafi0dI6C/qyOyh0gOvf947L7eRIbA32In3857F/8JQ545Wh/So6qhXKmBj
	IgUBGdr0Qf04UWqcXL6odxQvoqdrRNxUORXuVknzoFhYasOjl061uqzrPKhauY5Jh3DM7HMQtmU
	+JlLX0Q0htQA0Cs3jWIJ3KFJuXsj6wIiso81jSXVaTsGyrscGwwrzJfDwa1uXL3BRuQRq2y/dnx
	Laswix6glMObRITnsvcZWManjFJpTWkQyIWpyLexOkwP6UAOMdRiLfkese32XJ8EuzbwH3VdiHW
	o+8CFDYMm0zLbU=
X-Received: by 2002:a05:600c:4506:b0:490:3838:1548 with SMTP id 5b1f17b1804b1-49038381676mr334172855e9.13.1779805079826;
        Tue, 26 May 2026 07:17:59 -0700 (PDT)
Received: from localhost (p200300f65f47db04a716d2bdeddb4813.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a716:d2bd:eddb:4813])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45eb6d6ebf0sm37095798f8f.34.2026.05.26.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:17:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>
Subject: [PATCH v1 2/8] scsi: Use named initializer for zorro_device_id
Date: Tue, 26 May 2026 16:17:28 +0200
Message-ID:  <9602004a447b474b15ca1e110d6d3c277f669e20.1779803053.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3342; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=DUPc4hq5A75iCE9n+8UJBx44jmx2lrSpFvIMVWPYPp0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFat7M8eMhLUAoLTKpnqFEP1P/GOBJ0Ys3EJgQ NyA/2H+k2aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahWrewAKCRCPgPtYfRL+ TmGFB/921JeU5PH45mB8W4KFda/+9nqqIIa+qMv4InKRyccfCdXMtumJ53Km2M897qBTcAkaO8w wxxYTWmi5At320VtoBhOZ8SnJDxZxBQxNPU/TxWV6JjV4ujOcclgaSkQWvuk3piHBCpZ8iv7cWx hA6iOKyjZwwOTt49eIDAqjdRWJfd4CiIwHt/90r42LK3agVvH//OcwP+Qwtt0s6UCa0sQbBz60a SKG4s1AZheRf/9wa53odPVxu4lAUoTnd7Xtpe5++21uDsQUzROHhCUmLnyp7efw4Xds80qmyZD7 LPkx+MmY2lOOVJqsceRrywPuuqhsTGadMsHBhYLTneJJLiOf
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Using named initializers is more explicit and thus easier to parse for a
human.

It's also more robust to changes in the struct definition. This robustness
is relevant for a planned change to struct zorro_device_id that replaces
.driver_data by an anonymous union.

While touching these arrays, drop explicit zeros from the list terminator.

This change doesn't introduce changes to the compiled zorro_device_id
arrays.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/scsi/a2091.c     |  6 +++---
 drivers/scsi/gvp11.c     | 17 +++++++++--------
 drivers/scsi/zorro7xx.c  |  2 +-
 drivers/scsi/zorro_esp.c |  2 +-
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/a2091.c b/drivers/scsi/a2091.c
index 204448bfd04b..f81e53b53e20 100644
--- a/drivers/scsi/a2091.c
+++ b/drivers/scsi/a2091.c
@@ -275,9 +275,9 @@ static void a2091_remove(struct zorro_dev *z)
 }
 
 static struct zorro_device_id a2091_zorro_tbl[] = {
-	{ ZORRO_PROD_CBM_A590_A2091_1 },
-	{ ZORRO_PROD_CBM_A590_A2091_2 },
-	{ 0 }
+	{ .id = ZORRO_PROD_CBM_A590_A2091_1 },
+	{ .id = ZORRO_PROD_CBM_A590_A2091_2 },
+	{ }
 };
 MODULE_DEVICE_TABLE(zorro, a2091_zorro_tbl);
 
diff --git a/drivers/scsi/gvp11.c b/drivers/scsi/gvp11.c
index 0420bfe9bd42..79bd64e12adc 100644
--- a/drivers/scsi/gvp11.c
+++ b/drivers/scsi/gvp11.c
@@ -442,14 +442,15 @@ static void gvp11_remove(struct zorro_dev *z)
 	 */
 
 static struct zorro_device_id gvp11_zorro_tbl[] = {
-	{ ZORRO_PROD_GVP_COMBO_030_R3_SCSI,	~0x00ffffff },
-	{ ZORRO_PROD_GVP_SERIES_II,		~0x00ffffff },
-	{ ZORRO_PROD_GVP_GFORCE_030_SCSI,	~0x01ffffff },
-	{ ZORRO_PROD_GVP_A530_SCSI,		~0x01ffffff },
-	{ ZORRO_PROD_GVP_COMBO_030_R4_SCSI,	~0x01ffffff },
-	{ ZORRO_PROD_GVP_A1291,			~0x07ffffff },
-	{ ZORRO_PROD_GVP_GFORCE_040_SCSI_1,	~0x07ffffff },
-	{ 0 }
+	/* .driver_data specifies the DMA mask */
+	{ .id = ZORRO_PROD_GVP_COMBO_030_R3_SCSI,	.driver_data = ~0x00ffffff },
+	{ .id = ZORRO_PROD_GVP_SERIES_II,		.driver_data = ~0x00ffffff },
+	{ .id = ZORRO_PROD_GVP_GFORCE_030_SCSI,		.driver_data = ~0x01ffffff },
+	{ .id = ZORRO_PROD_GVP_A530_SCSI,		.driver_data = ~0x01ffffff },
+	{ .id = ZORRO_PROD_GVP_COMBO_030_R4_SCSI,	.driver_data = ~0x01ffffff },
+	{ .id = ZORRO_PROD_GVP_A1291,			.driver_data = ~0x07ffffff },
+	{ .id = ZORRO_PROD_GVP_GFORCE_040_SCSI_1,	.driver_data = ~0x07ffffff },
+	{ }
 };
 MODULE_DEVICE_TABLE(zorro, gvp11_zorro_tbl);
 
diff --git a/drivers/scsi/zorro7xx.c b/drivers/scsi/zorro7xx.c
index 6aca9897b231..1f74586f0428 100644
--- a/drivers/scsi/zorro7xx.c
+++ b/drivers/scsi/zorro7xx.c
@@ -68,7 +68,7 @@ static struct zorro_device_id zorro7xx_zorro_tbl[] = {
 		.id = ZORRO_PROD_GVP_GFORCE_040_060,
 		.driver_data = (unsigned long)&zorro7xx_driver_data[3],
 	},
-	{ 0 }
+	{ }
 };
 MODULE_DEVICE_TABLE(zorro, zorro7xx_zorro_tbl);
 
diff --git a/drivers/scsi/zorro_esp.c b/drivers/scsi/zorro_esp.c
index 1622285c9aec..178d46140674 100644
--- a/drivers/scsi/zorro_esp.c
+++ b/drivers/scsi/zorro_esp.c
@@ -706,7 +706,7 @@ static const struct zorro_device_id zorro_esp_zorro_tbl[] = {
 		.id = ZORRO_ID(PHASE5, 0x19, 0),
 		.driver_data = ZORRO_CYBERII,
 	},
-	{ 0 }
+	{ }
 };
 MODULE_DEVICE_TABLE(zorro, zorro_esp_zorro_tbl);
 
-- 
2.47.3


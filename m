Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D73FF893
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 14:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805086; cv=none; b=cD23TMWENW7NHRZ3iJF03swSjpudfX9msLnFptnY/y2x4Kbgo7VyENKfXmjtbufoId7YQYcSDnkixM/bDAd4pr7xBH0zhnQmsgmbPoLmDlwJ8iLbqE1ez0D7YRVpU4LcWSZX9OCHLZrBLWoPfONbtEbXU5SNy4IIcUi9TxvURjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805086; c=relaxed/simple;
	bh=wKCmxu4eGkF3WcN/PVgoFtXX14Flsa2TKrGv+0O+/Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIo6/4IJ7Qa7wwKX6sHNiAxNy9l0IqRp6QqnQIEZF+9w9kPtEQr2/K/reCIdUW+DRFYaTcYA0G6/Sk+sIyirPCsRS9m0/ULlKTAYr1CcW92R3Z1cYlspkFa/oYi7qTRuo78NATPrQ6HamUR0JjSNlrFdpKg8F1fTcOQ1tv3IffM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PUzEHfBU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PUzEHfBU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so56378605e9.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 07:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779805082; x=1780409882; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjSTfw8hd2DUAbCsC0PRSZ2dw57NRb+ytH2a+7S6Oy8=;
        b=PUzEHfBUYrUBJ1pIBG4BbKnitWS9VHtH3g7uzL2iEXn2oNcgYNnzphnfW5pGipkP6q
         6/tILfWawueT1oponBqJ+a0uxyKKwb4YCqtFlXrhzgIsZh1WVxGz5SDau+rU9lVB3n/x
         ZTsk5ZJ3NuijoP026Q1c//D7fNFcVnlsNlnZlIOfjzZemTHgzYv/UENkrzgxIhgw6v0J
         4W8mnpC+159STy2YmkwOPVgVy1P6/HlZuLiIwSr9lROCtlCG/zlpzSew2okBTWNqK1hT
         P7GdY38gQ91TPG/ULpnyWSp3+GCathfWXY77pmb9D1C7XKjF6fuRxXXnSgynz2hAF4AW
         lC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779805082; x=1780409882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zjSTfw8hd2DUAbCsC0PRSZ2dw57NRb+ytH2a+7S6Oy8=;
        b=BxXGM3vu+ueBTcs8Owbwpw6ZyF4R+0WL9xbYdIp6a7GOX+79ML8+wDgePAs40CUTFL
         2rmdiao9AYvsgPs4P/RLWe9/axToCtzlMI3ga44NdSEmxaiEJtlxevbEBWfPlN8Jra0T
         Im9uqOut5piW1F/0mEZNrGpc7Szg8Nt5MllvqSV6NKHVSWn88DdOgWFfu/peFl65+kFN
         Zzon4Se0gVjx4RJrJccHG+2lq9CQsEoLcjSQIq9vqY+L9mTL8Rc7gYy21JQFp9mG/9Jg
         ZAq4XNd23tWdqBUHV08Sq9QhvE6/s4rjpEju8/ddJxrKFvqECdJOxZR9+JvQ2IkpUXta
         tKUA==
X-Forwarded-Encrypted: i=1; AFNElJ+x9nzSHE9aGPYPnf8hO9+kRJGE5H9XnjLQgWNhN1CnAbZhUoraqqpSYt0xm+KtqLc4TBbNNpNomFCR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxfT/6+f+/swbbDMZJt3NAzmFnq91auAUU1Xccm6SzOCs/g4jNq
	f6Ue6PlqYvD8nSUVNKzFtzTielk7Wm7n65cQF1FK4HjEzbCytf87pGTbsvgfQFjYzsc=
X-Gm-Gg: Acq92OEjkXjDUWewFolAmSicNRrppQhM4aopwxojbc3skpkU0H4itZ6yIgyc7EObOcJ
	BZdeBWduGimTuUrZKzi+B2NKhfUUOHJ9Vzf35LUpr0z3Oy2MmT6uGTXHWS5Ga2Iz2nzuZv6/2fJ
	v2i4dd/nNZwOQMhixVSDOw0Jfa8jxFW3SKBdnOTMzHidIonl7MjhzT+gX+R7V9AlY8a4TZ2L8D0
	Jlx5jV3scsu4pHJavKg7D2C0ZFesS8ZMP1SdIXYupXaqaqgbNe7Ea9e5ZqtJkTYGKRNcGstpQX7
	xSxy0tmmhBdOC649eSK+lKqp/AfqM4pwiJ0RvDWntM8A7vUBKWkDTF3SHXkAge0ngmjjy+kFkog
	VXOIU+o64xNGX0pfizhAwXJqZ82yKkpZXg/bvgAATo6Q78AR1H9qqQzb3Z4ND0iBfx0nLI6b0NF
	DrKbgyWrR98MGYU3K3oeCVsONMreuJP0m7/fpyV3xROzFpNyXMO8YhCClYzP3cFReyBzO7MnvbV
	cdP7Ke/LiTEm28=
X-Received: by 2002:a05:600c:4e0d:b0:490:58ef:ce9b with SMTP id 5b1f17b1804b1-49058efcfbfmr220400605e9.16.1779805082510;
        Tue, 26 May 2026 07:18:02 -0700 (PDT)
Received: from localhost (p200300f65f47db04a716d2bdeddb4813.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a716:d2bd:eddb:4813])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49054638d7fsm81057325e9.6.2026.05.26.07.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:18:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Max Staudt <max@enpas.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>
Subject: [PATCH v1 4/8] i2c: icy:pick  Use named initializer for zorro_device_id arrays
Date: Tue, 26 May 2026 16:17:30 +0200
Message-ID:  <3d7690c7a8948f977d6c50bd0c8010efb715fbdc.1779803053.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=885; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=wKCmxu4eGkF3WcN/PVgoFtXX14Flsa2TKrGv+0O+/Yk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFat/tAXc9tABs5ijVzlOY1OYUpuZsyoD2hmEh ILeBu0bh5mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahWrfwAKCRCPgPtYfRL+ TnaoB/0d1xQvc5YSkBTrnPeeaHiaC7esFNf8x8IQr2K5Hzi6Ae79ZjfE6Ojx9JEjKm+n1Rk4KwE Ql/16xqi52kbiaF3wrzAmwPej3JsxhGi35OiZfPXPM94YMvyDRK9/klQSjUsJCn5OGshCBJhkXY 39ZdJMA7tQx6FFJ8aStDyN31UN6d682IExxxhWhyEedefuvIvyPJ2X28xvy0kjdyijMql5dz9fj HwhyJj2ptrAvgC9EW+YGiJdw1Dbng9XhFoOhBr9Uw09X4R+sr38aT80qBtRiYBVdkcVwYZInvmJ W9dL/+l1+vtFNSeG4h0Hni85qRYXuIjDv8APqpxhEfPHMtYq
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Using named initializers is more explicit and thus easier to parse for a
human.

While touching this array, drop explicit zeros from the list terminator.

This change doesn't introduce changes to the compiled zorro_device_id
array.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/i2c/busses/i2c-icy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index febcb6f01d4d..55496e48ccd1 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -193,8 +193,8 @@ static void icy_remove(struct zorro_dev *z)
 }
 
 static const struct zorro_device_id icy_zorro_tbl[] = {
-	{ ZORRO_ID(VMC, 15, 0), },
-	{ 0 }
+	{ .id = ZORRO_ID(VMC, 15, 0) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(zorro, icy_zorro_tbl);
-- 
2.47.3


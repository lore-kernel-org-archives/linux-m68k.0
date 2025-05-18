Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC12D023
	for <linux-m68k@lists.linux-m68k.org>; Sun, 18 May 2025 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608644; cv=none; b=esjVeEuPbHLPlhO2dzz2/FFycvwzj1XkLUqsEUe4I3FF0CqWuPGFQJTw6iG0KrOvOp9208Nx1gA5WMDgK7yeIA4HpzuEM4mxjhjn3nG/3EZXpVSi2K9sb7mv8Joig1HczFIebvF6ZrUdbvy/RUI93h/WyMwmaTObEilaH10U1To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608644; c=relaxed/simple;
	bh=YYkciApprTBW61Xe2c/9f1R4usCCh7pTaYq7TehA6mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fiSVqHBsGS2viezsruFeMWJ0weiSITOo2ZAmOGD8vPpCW+qD3htn5udWOCvpQIbF2B427MYcATtCWYrHq/6Vc88/f8z7Hz1CQbaLwKoEttQBqBX+Fs29KTbWD/vd4OMNUxIJMx+wSHk1JNo3Gl1pZbsnOYdT9LALZQakG0p8d8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJ2w4g8G; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ2w4g8G"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so31445005ad.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 18 May 2025 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747608642; x=1748213442; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tifdmFQDJps1lChYSd+EGnHuJQb6A1Xc67Aae2G0Ozs=;
        b=QJ2w4g8Gf2nX4R3HlTvoPiWBCnWmOzwowUuIommbcPj07VRarR+sHR63uljHKi50m3
         ofpwhCSGcOfUb1nJFzOiLx/jGCBiw7X2KycOnbKZ3VybMLZok1xrEiokDZJhYr4K7f4v
         +2pmUAoOimDe6+ZsVLC2xr576YB3qiYthB+AQWWz0zzCHNr04Fbx1dMIS1DooSj2bfJN
         lXpMUs6NfySu+4o8iA6OSC5JlJCkyxOwEgup0i4+Y10Qtl1QR5iUMSQ2H7h4VOH7hmXM
         hDl+RFTkw5I6qvNgfPbR4p7ZRVIDL2QIoJ0GZ/wj90K2E52AG749BbfSLLjoTmRlwX/B
         Q4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747608642; x=1748213442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tifdmFQDJps1lChYSd+EGnHuJQb6A1Xc67Aae2G0Ozs=;
        b=p7f1AWOZyxUY4jLTtG9/Z900KpNiPsan+4/GQI+BU1wgYG8HiKB9cKWWY3itTpSCos
         FK6LzSamD/RuYu/PBigqLE3J9v0QPU4IPJUbUnEP7eaEdYG6bP8cNtlCbRQVlrpWqYj9
         Bzo7zGchy25ioNgvnvsVc27eBrRYLF8bbrspTx05sOLCcHoPkcqgMFcRVtQvJGzwZ/1u
         h+vCahjQLwfV8kekfovca2q8vBbVLGSrAu9DN05Di40STPqvH3NVBVUcmRyzM9PybMBi
         Xs4r13iTqaOrc4r9WK9QmaSIZS+Y60j0GamsYhHL9spsEIq0f2L2cd1C5yVDAxK298+c
         kNlg==
X-Gm-Message-State: AOJu0Yy1gcaNuWYgnMaEKjr5bg6vafnTnMQP08MTeLIh6MhIHcdeFAWh
	+yuj1ID6/osOm+YtFIPWyWhujqb2JfOnmDhX+Zxui9FVPPzOPL+sq2fZ
X-Gm-Gg: ASbGnct97dOchaUNo8k6tdjtkle9/OKz1sHGkaWvabxhouLmSglLb7WntFt4LeVPlrO
	e25tmm6FC/bPL70LsjCKUlLu0KgEoqk0drKfFTRw9mLcbcAGfXOX/9Ev9NQ501hLwrJIo1l3Sl9
	qbMaLqi6BsnJ2yaHzMAqL4gSNQ6V20mYqFnADzt9iBiLnYP/btqWOHrFyZMqdHWSgIY+nyDNJvJ
	hnprj+UUJNLVWfojyIU561ef2qNq/N15S4Syk7vhDuFbVBZIGjgonidF2RCVsR5Xod5AErN4h7h
	NunaiRmwwhO8rxTgjtfyNBdnTBEOHFQEKgY37YpMC6nLPRHICC/2CdN0+JiVL5xsnlTmt64=
X-Google-Smtp-Source: AGHT+IFDVyQnFmoqqGPJkqxSu2Pdvvb212In1H9P8PzfsGFz4fbsCW0TSpcfHw5lbipt/B2UA9BEsQ==
X-Received: by 2002:a17:902:d4c2:b0:232:11e7:47bb with SMTP id d9443c01a7336-23211e75f95mr71816695ad.43.1747608641831;
        Sun, 18 May 2025 15:50:41 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.228.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb157sm47616605ad.176.2025.05.18.15.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 15:50:41 -0700 (PDT)
From: Siddarth Gundu <siddarthsgml@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	elder@ieee.org,
	Siddarth Gundu <siddarthsgml@gmail.com>
Subject: [PATCH v2] rbd: replace strcpy() with strscpy()
Date: Mon, 19 May 2025 04:20:35 +0530
Message-ID: <20250518225035.227880-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() is deprecated; use strscpy() instead.

Both the destination and source buffer are of fixed length
so strscpy with 2-arguments is used.

Introduce a typedef for cookie array to improve code clarity.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>
---
changes since v1
- added a typedef for cookie arrays

About the typedef: I was a bit hesitant to add it since the kernel
style guide is against adding new typedef but I wanted to follow 
the review feedback for this.

 drivers/block/rbd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index faafd7ff43d6..863d9c591aa5 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -46,11 +46,14 @@
 #include <linux/slab.h>
 #include <linux/idr.h>
 #include <linux/workqueue.h>
+#include <linux/string.h>
 
 #include "rbd_types.h"
 
 #define RBD_DEBUG	/* Activate rbd_assert() calls */
 
+typedef char rbd_cookie_t[32];
+
 /*
  * Increment the given counter and return its updated value.
  * If the counter is already 0 it will not be incremented.
@@ -411,7 +414,7 @@ struct rbd_device {
 
 	struct rw_semaphore	lock_rwsem;
 	enum rbd_lock_state	lock_state;
-	char			lock_cookie[32];
+	rbd_cookie_t		lock_cookie;
 	struct rbd_client_id	owner_cid;
 	struct work_struct	acquired_lock_work;
 	struct work_struct	released_lock_work;
@@ -3649,12 +3652,12 @@ static void format_lock_cookie(struct rbd_device *rbd_dev, char *buf)
 	mutex_unlock(&rbd_dev->watch_mutex);
 }
 
-static void __rbd_lock(struct rbd_device *rbd_dev, const char *cookie)
+static void __rbd_lock(struct rbd_device *rbd_dev, const rbd_cookie_t cookie)
 {
 	struct rbd_client_id cid = rbd_get_cid(rbd_dev);
 
 	rbd_dev->lock_state = RBD_LOCK_STATE_LOCKED;
-	strcpy(rbd_dev->lock_cookie, cookie);
+	strscpy(rbd_dev->lock_cookie, cookie);
 	rbd_set_owner_cid(rbd_dev, &cid);
 	queue_work(rbd_dev->task_wq, &rbd_dev->acquired_lock_work);
 }
@@ -3665,7 +3668,7 @@ static void __rbd_lock(struct rbd_device *rbd_dev, const char *cookie)
 static int rbd_lock(struct rbd_device *rbd_dev)
 {
 	struct ceph_osd_client *osdc = &rbd_dev->rbd_client->client->osdc;
-	char cookie[32];
+	rbd_cookie_t cookie;
 	int ret;
 
 	WARN_ON(__rbd_is_lock_owner(rbd_dev) ||
@@ -4581,7 +4584,7 @@ static void rbd_unregister_watch(struct rbd_device *rbd_dev)
 static void rbd_reacquire_lock(struct rbd_device *rbd_dev)
 {
 	struct ceph_osd_client *osdc = &rbd_dev->rbd_client->client->osdc;
-	char cookie[32];
+	rbd_cookie_t cookie;
 	int ret;
 
 	if (!rbd_quiesce_lock(rbd_dev))
-- 
2.43.0


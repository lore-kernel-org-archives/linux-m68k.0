Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B451D049E
	for <linux-m68k@lists.linux-m68k.org>; Wed,  2 Oct 2024 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875716; cv=none; b=mur4IMhMeVvklRjRFA6RwIHvuUcrzs9yTOft7XNq/iunkI9iIkt2HohUEVWwSH4xn3X+kCXW/rdTUYkQgUoJQijuBW6f/gR5tjHFeUYpvGiNkv4HtKcZsX8GqsAn/nBKrLk1KUwxFBvttBTSbdflqsuU6qqTgcnoSbJNkLpdR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875716; c=relaxed/simple;
	bh=5TU1SW8qHIohE1BHdZzxN64tdjxnxFrqA9ZfQdbi42A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jjL2CUcc4W9ps9qYqGG5VHsIuXrShXpMgamCDPPu4TEtdXaCofjN5qOh7r32yLFRhyCZLbIfBfs6R12MNemQNkHM4cT0xGPv39NBhQyrYh98KOqRTry87mWe5ZCuO2l5vWBmXSrUQb4uduRqL7vcvpdYk3WX3M6agrFxmUgYfWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJtuOnuI; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJtuOnuI"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e109539aedso3149207a91.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 02 Oct 2024 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727875715; x=1728480515; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2KUdZPsxrxfYclDZ4cMZEFGNcVJaWq3B2wNfqyElyQ=;
        b=QJtuOnuIHA0IIUsiCSQZOkZ9PJw51p7TRah3vv6HVwEjHeNXApZS4CkPuHv+zsEqMW
         qqRjqvZ8Hp59tKAJyW9+E0HwEBSiqt9y7raXILfwlXWW7sbLB4uKV76qX7drv8ASWA2x
         +KetgFNhycsC9i5PhfxuCu4+8pQn/Y4kRAxrfAfWynzAdrlyWr6S74Wg/pxxFn4dYp6l
         d8F1OPeCfcBeycmrNzQkWA60pYSpbKJ/RpBvwA8wfNuUTHlEaFY0/H2S475f+e6VISMl
         VzDYv86soGRi6YCybX5FjEqHT+DtbcTiOPQuJprTJFx4QNYNtmcxw2lEq4kECfXhIsEI
         Rx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875715; x=1728480515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2KUdZPsxrxfYclDZ4cMZEFGNcVJaWq3B2wNfqyElyQ=;
        b=TigYsdWbMPfK2Pik0Eex6vOr82vLQKtTHaKqzi1gzPQi/0FM3xqV+ifqbMk4SzJSeI
         wjWWY/hLvESg8VCFU2Ps9P6lkqTZSfUxzucylDmmgrDzXbUG3iyPJVAehdqVsrhf3tN3
         xoozJxCYIWdzFLcZrtl7aF5tU+lwUo7YY6jmO8b8UWiB48GX7/DVjWkDKmDuU9r0n4k0
         6Dzp3lb7iPfoIDix5l3ztuPChmmaGETi0s6vQcAsp6Tow/UcV/HpyP0N7IG6Yh6kV7vl
         aPLTH4gHL1utl2nJNCuDaKGS3HwBHVMSlcehAzM1rEdverAYI5FRowkk99YyWUvmO8xD
         tasg==
X-Gm-Message-State: AOJu0YyKP8cCfftDnT+ppZ1piV6h5SMOpxYrS7zDpCiaehMd/29yBVEr
	vcxF4KuHPLhadIOu+PrVS2UawHp0EaktS9XEgFL9/MMe6OCVUpR8rIC/dC2j
X-Google-Smtp-Source: AGHT+IEK5Ju6McLDb52scMYJjRIvfLxCIblhg4hiIlR/DRXCuiHOHjza5McL7RCgEWXhSriDM7Bi9A==
X-Received: by 2002:a17:90a:ead6:b0:2e0:a067:4208 with SMTP id 98e67ed59e1d1-2e1846e773amr4307123a91.23.1727875714597;
        Wed, 02 Oct 2024 06:28:34 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.173.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18f7734basm1528740a91.19.2024.10.02.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:28:34 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: fthain@linux-m68k.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 1/3] drivers: nubus: Fix use of tabs in nubus_get_vendorinfo and nubus_add_board in nubus.c
Date: Wed,  2 Oct 2024 18:58:18 +0530
Message-Id: <20241002132820.402583-2-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002132820.402583-1-sayyad.abid16@gmail.com>
References: <20241002132820.402583-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change maintinas code consistency and compliance with
rest of the kernel codebase by implementing use of tabs for
indent where possible

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/nubus/nubus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index ab0f32b901c8..08cf585cb471 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -615,7 +615,7 @@ static int __init nubus_get_vendorinfo(struct nubus_board *board,
 	struct nubus_dir dir;
 	struct nubus_dirent ent;
 	static char *vendor_fields[6] = { "ID", "serial", "revision",
-	                                  "part", "date", "unknown field" };
+					  "part", "date", "unknown field" };

 	pr_debug("    vendor info:\n");
 	nubus_get_subdir(parent, &dir);
@@ -783,7 +783,7 @@ static void __init nubus_add_board(int slot, int bytelanes)
 	/* Set up the directory pointer */
 	board->directory = board->fblock;
 	nubus_move(&board->directory, nubus_expand32(board->doffset),
-	           board->lanes);
+		   board->lanes);

 	nubus_get_root_dir(board, &dir);

--
2.39.5


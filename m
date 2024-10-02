Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734491D0487
	for <linux-m68k@lists.linux-m68k.org>; Wed,  2 Oct 2024 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875719; cv=none; b=EryK1YASscXtQue1Mf1XMY0G/Vgq6zxBxWQv2eH7/uCN4yP/eaxKWf/JC/BJuYq2xsAB/DewBopJdbfVtH46ITXmrR5gaZCq9W5aENMvQHqZ03DaYPtpaOKMDrrarDeWI7QKzAjxhz8cKgODlbXRjv6UZ298nvCX6ws9WuRsC9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875719; c=relaxed/simple;
	bh=CP+LjX5Ha1RSIaKYk38UX/wez45MJy9R7FnyyIWbaNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UB0Xba8z5b3UaO0Z7TvYPeGlukpjR0VcdbwcjISkFlgWyTh7XL+psSVGiVBZPfkXSFKDEBxZGPbT75n47xuwOS6A81v2Hl6OdnUfcbwiZ/SLkmnxUMuPvIHk5asmGOrivhtflOL+dtHnE52MlMe1u5ObBB23jkikCSRs+1LbsII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhTHLVlr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhTHLVlr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20ba6b39a78so19850035ad.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 02 Oct 2024 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727875718; x=1728480518; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGEsc1vLwVoQWt+H2cqF3P6yuJ7Om9q/TgHm7xbL028=;
        b=HhTHLVlrgZ07sagH0JpykNMLogKm78SNMcYTsXxB1vknCoQoqKfY16TFiA9fjXcWoG
         XQ60B2bcmvazGPafZBtZDUGUtcQZQVDl1JTz7NmjCyi7z7CYG2IhZNV1PCqiuVPQ1E90
         chXsoDcjyfbmTLBnh8hFe0fa1C5GTOOlCN1aQ/jM611uXRTNQLZmNPyI7fnLGgmTZI2S
         R6sGE/5npIxOSWcnHc2JNXcEatKETICIUFHp63ztdl8//z5PGIAQrMF0JjjzRWKLM+J0
         APLCOXzUTVbZCUUO/Q+u+2oQMxzFwYCH+rxF4lK4rUws46oWpZn0AE9Ln6Zv5zFJOI5A
         07mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875718; x=1728480518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGEsc1vLwVoQWt+H2cqF3P6yuJ7Om9q/TgHm7xbL028=;
        b=JtkIuKggIan8g7eZt/Uh8XJRqt6MQjRTnN5EbCkqV8YV9FOR4V320QEkfInhn0OrR/
         r7LLcIe9zcKoqYcS/9K8qHZwizb0LRyOXFSuj4ATx5PugBlF1i8KKAPiKvxIM59bdMMV
         5cm3h/S9oKC32BERlTqPZrb1dnF74o0UsTI5NxOhDgfRns5dqEi264g9UNvM+WqVNKLo
         v/IyQZmTk/+RGVc2eBXaIttTxR/5+w69AAQPCCQsDHUSOSbPiP1/0QwnxBKFLHPT3ZmP
         KtLXs9RcVAfSsUdYvGqeVHEIELP4HEEJVRem69Mq5osY/1P3dAMnr6cx+4bnHpQ3GFnY
         p5pw==
X-Gm-Message-State: AOJu0YyOIvndPTnJaaeRQ36jdiz6p0ZX7aniL6tOeByH/JKumDRyAq1o
	NvGWlnBYtAv1Yfkrgl6uDWWJWFQq6HhlHHoqYPNAef+p5hTuIeATgmCjAQiK
X-Google-Smtp-Source: AGHT+IFsKpNwqXE5x3dxm3/kt7gMGUNFQTOdgX0GXLjKfy1tHTtuqHZ2VTYuUx2B6kMnq7kj08Rt9w==
X-Received: by 2002:a17:902:c94e:b0:20b:6a57:bf3a with SMTP id d9443c01a7336-20bc599f0e7mr41246075ad.1.1727875717546;
        Wed, 02 Oct 2024 06:28:37 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.173.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18f7734basm1528740a91.19.2024.10.02.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:28:37 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: fthain@linux-m68k.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 2/3] drivers: nubus: Fix use of assignment in if condition in nubus_add_board() in nubus.c
Date: Wed,  2 Oct 2024 18:58:19 +0530
Message-Id: <20241002132820.402583-3-sayyad.abid16@gmail.com>
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

This change help improve code readabaility by
shifting the assignment statement just above the if statment,
which was earlier inside the condition.
This makes the code clear and easy to read.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/nubus/nubus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 08cf585cb471..77da1d14a1db 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -735,7 +735,8 @@ static void __init nubus_add_board(int slot, int bytelanes)
 	nubus_rewind(&rp, FORMAT_BLOCK_SIZE, bytelanes);

 	/* Actually we should probably panic if this fails */
-	if ((board = kzalloc(sizeof(*board), GFP_ATOMIC)) == NULL)
+	board = kzalloc(sizeof(*board), GFP_ATOMIC)
+	if (board == NULL)
 		return;
 	board->fblock = rp;

--
2.39.5


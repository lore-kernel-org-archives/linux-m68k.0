Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2262D8DD4
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Oct 2025 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829024; cv=none; b=QDCHmhEVmipDpmZ4GxsqLTgrn6B8a9c52jQdnBB2uLxLdXWj0ABhRMXql2XgSpzaepfPcOlRMBmFoeas6b/qvET9ZXz5rCMxDqIwyrOI3oruzPSsrPDjIYiBUd4HyMdyL0WC8NUY2myPzhquhYqGa3AyhgS/dS0ugp8OwtF1fEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829024; c=relaxed/simple;
	bh=DCke+Rgyj5qSCGTteE3WiBXknhrXT31kjNGo+dEDh6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8zUBKxg4QRl1tTaSms3otNzTe6WfA3vz40YhYj81iCn1gNC+aDQ2nPrpxLaRFxUYOHD6spkybwO+oYzgCv5sJxJS3EDzZCFKZpd9Nuly7EUzWaXwmp2ULoKsiH891FNeLkn+sG/VjLRocexIx/crJSPKXRJn5DE6k2F4SUFB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=dGOJ34/O; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="dGOJ34/O"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7811fa91774so4479213b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 02:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1759829021; x=1760433821; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYIeDOuQqkaMDFPi5xbBNKu5rw0w8hiBYlZqsaimji0=;
        b=dGOJ34/O3k3D3Oqr3iRMzpFVtkodt3qngKZbmMraPlRhSz48/ydfFp+ugcglwAy+S1
         zbgEo8QJRKDmW9TB5aEZru0S1Vp3GnTYfhJN1jYQnbImbC6CgG/mqpJMnexz3F6XgzwG
         uEidR4JS0hBGEoz0AFrJrR5LxXW2PjLeV4A60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759829021; x=1760433821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYIeDOuQqkaMDFPi5xbBNKu5rw0w8hiBYlZqsaimji0=;
        b=jqM9aGzSjDwqAlbeOd2qnSWiniL7g5qnXvoufd1F2266tOjg+JJCGOabnK5FOTEIKP
         YPDxVelPusE1d0FFloDTAMaWRKJRVYcF2Q51zgRrLOA5eqpjUN75yQpghRMXgVP8oh3w
         twBvnFG0DNNW907HdzN6Y1iIgyKF0Dtp+WJ8XFJmR9dORlMwBBB9HWbUThe1H83N3hZI
         dEXRbPOuf+ayQ1oKUe07zQa/D64mh1oDFW56roZUzQf9913sChreA0igJWTf/Q75S44X
         y26wErIdGFl6dOLuiwlylmedNEREJPV/bFOJOmTgAYl2OPHPNfAcDXHRQ133e/Q6R5hL
         mLEg==
X-Gm-Message-State: AOJu0YzJK/6Wv0XtfZWYT9O+liC4jiC9Xr2EdYx891KrQZXzzsetWnjK
	RyZuF+zeqXDDsbMXzQ4ho6B6fTTcyw2J67B8Ml7g36wHBtY87B3D0v5sUj+nzXiZWfpLMUokybv
	Cjbxbris=
X-Gm-Gg: ASbGncuZLTEA2W5eKkyQM8ywrKS3KbciGF7rplgN0IUMoF2S3rG4v51Ag6GmIdIlFAO
	m9qFy4WT93fvOeKutE6NP7q8z3kt5hlZLozZ9ztmUZBYk+nyVH34s+F5iknnK8Siq5ijYrll3w6
	4ZODd8Xn2Gedm9X9je1aP1XzuYFGMiO+brWZRBkgIMOnnldEhgXc62u+u+hp+1HUjHoaRcjmfIq
	YlYsgMLVxTtA5L0KJAUPSV6mKyXxItfu49gIVfEER9Lfhbb5QcMoCrEytTaXToDFxl11ZeB9c52
	GfjwqckjqjX/Cm5XqMzAqz934tXk0edrtaP1G3HbU0IeyyR4EBDe2yebUm9yPq1DT8SLBTUmTSP
	1+5Ur6K9ZsmsOp2cleKu19bFB4zVgANHbPEk0Cm7inS1o+3DwCZifn2z0W41/SaJmesMlNQwJWw
	d17hUxFB5f/mKCccjrPGeSDDBN6L+I8wpYO5o=
X-Google-Smtp-Source: AGHT+IGnvuQXkfGwuAEx+Yb7NtSe2KQaKWhVmybTLT2ISlnYdo/gl3gHqlFXl6t/Wt6B4xnc3vLRCQ==
X-Received: by 2002:a05:6a00:988:b0:781:d163:ce41 with SMTP id d2e1a72fcca58-78c98d5cc70mr15969410b3a.11.1759829021537;
        Tue, 07 Oct 2025 02:23:41 -0700 (PDT)
Received: from kinako.work.home.arpa (p1522181-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.198.181])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-78b01f99acesm15123273b3a.5.2025.10.07.02.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:23:40 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-m68k@lists.linux-m68k.org,
	linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH 4/5] zorro: Add ids for Elbox Mediator 4000
Date: Tue,  7 Oct 2025 18:23:12 +0900
Message-ID: <20251007092313.755856-5-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007092313.755856-1-daniel@thingy.jp>
References: <20251007092313.755856-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the two ids for the Elbox Mediator 4000.
There are two because it presents as two boards:
- One that contains the control registers, PCI config + io space
- Another that contains a window that contains the PCI memory space

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/zorro/zorro.ids | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/zorro/zorro.ids b/drivers/zorro/zorro.ids
index 119abea8c6cb..fda1db905412 100644
--- a/drivers/zorro/zorro.ids
+++ b/drivers/zorro/zorro.ids
@@ -369,6 +369,8 @@
 	1900  FastATA 4000 [IDE Interface]
 	1d00  FastATA 4000 [IDE Interface]
 	1e00  FastATA ZIV [IDE Interface]
+	2100  Mediator 4000 (Control) [PCI bridge]
+	a100  Mediator 4000 (Window) [PCI bridge]
 0a00  Harms Professional
 	1000  030 Plus [Accelerator]
 	d000  3500 Professional [Accelerator and RAM Expansion]
-- 
2.51.0


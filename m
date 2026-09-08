Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B175221ED
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Sep 2026 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860465; cv=none; b=H0ISyScMA2favKEPt/NYIP6EBdpiP3IfPO8Rng16k3w/6mFNlc4BL+sTFayILfCTR4N0cLUanLvjccMt8F/8+JO9+Nkid7BQocaT3Z+JY3DNkY7yyD443jTXjOibNq3U70pVnibYVkl8SyY6QBEcJFIbnVOinyY1KsC3Wj9NyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860465; c=relaxed/simple;
	bh=llnT/Nhi0T0PSHQzd9OBlgDGZy6ViMTn3F2kEpxp+Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3FxkvRsDObRQM01GI675E/75JxNsK+GF4KPvyp7TS/N72DJRNKYLqVgxdgPWbLYdr8VbhGEoK6FebA0mRDIe3Pd7iuKMsXN3aFUyxCdFjSQ47T4zzxCbNw/OTTxhl/6TK5DjHIj0Pml+LYh15KDgjiLv+dVPENIK/GaDk96g6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJ9A3OwW; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJ9A3OwW"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38511175ad3so3745399a91.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Sep 2026 02:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860463; x=1789465263; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXOoZtg2JwC8xSALXmsKi6kXLvJ+n3TB4KwXOFfrD0U=;
        b=hJ9A3OwWZQx9IsexunAUsF+ondkCXY8LGTfF/3rm842hinsER8MAVtodd0KCD0YsLh
         vj48N1gNmK3b9HOUXt5jW+WGJpq2V6pNxON/fYjRaw9jZdn03MgIzU5oND9Ap4YLBeJ8
         cRcm8MPWuWLUGYDP8btaXh2ICpkj5apQr7WNYv7XhHGAyI60ROvckhXyKaXtuUw+Ygj0
         HYPzR5cZ/TsBmr882LxbnD9UHZblJ+mcHhMVepdfK33Y2cyN2dvPdkLD6gRlkHa6Ti1A
         TQwXJ2zLAhkjEGqgWU9wHCFQqOBxegTGA4OpebLXCI2AcvkOmu4TujlAMYTg0FaHetyt
         IfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860463; x=1789465263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXOoZtg2JwC8xSALXmsKi6kXLvJ+n3TB4KwXOFfrD0U=;
        b=BAMmF5Q10P0SB4A6YSgEjHuSPmm5TbmNENCYfTF1wDizdAQMMa7FrU2IdOrhNBHkD2
         2998MdAkihoKRZ3sTBSF41IV0yVx0/dWQU/EOYywRPCK1O8DDG1fwuvWF91SE1I/kZYV
         lIKnOkYubD9g1LrNdJQ/AEdbFCtzVmrUTg6QcJn6dCObaExXWr1IxeUNKBPtOUNHwqy0
         nUDARb9DtF1J5tRTfkEDOBuucvlWKMhacvj1cjOmm1R80E08W3bRo70sWGJRf+4xnNg7
         IEkxWpCKq6d/7itiMu1TNK/R7fcdHzt/2UTE2+mMQiaOOTjzrPw1HFZHCRf0hZkZkdA5
         9F6A==
X-Forwarded-Encrypted: i=1; AKwUvByre6DbggVjvEKQyPoavT4XDsuDVTqkbsmBQZxDpCTsudcaSNJR2oA2U11Qf+PQV0XPjFjMo8G1Ej7T@lists.linux-m68k.org
X-Gm-Message-State: AFuF++kxYYLw9OnzybD7xNhl9jwf8S1g0xFhSaQpYau1ihKl8t2Vl1+2
	JYVdfr0fB64akbgw2t0Vb/VgqGt5y68k2rjvo4hk3ZQoKNPzcSJ5Aol2
X-Gm-Gg: AYBFou3fnuaLzU+ANhejvgJVYirSRfNkNcBB/sm48xY2Fxml/Hygo87Eg9WT6pOFDWS
	HYnUIh0YSctmaqTmhjazHOlELEUIM0BLxfRaDczeksJFagNLybfv2wpGvYmZ9Eo3QoAuXdqWm8W
	rrs2xxk27v+dbXWwtSYQCzr5tYDZY6KoNQXMd2Op2cl8f+ZGogTG/72PjUz54zyum8aAhpnifI8
	yTgvl5NkGWmu6/DQwoz3kLSw77u+475WQPHWd4WjUl5mCZqBGkUv4tGhyRKpWXfm+LyEyHynhDT
	wpy5EztbkamAoj9oOcojMRvRVtA1jha3pZ7w2Wz7I1IjehV/TxMKQXpaEIUaQkxmjNdW8FL0XSO
	mcai4vXU430/v0cZLQhJIF2eQeHouG14b0y7wrpmF2jhM2Bz9tEFkfa4veOgb2BPqJyE1Vk/8Q3
	zh7piEe+Mi+KBco3YxEhTebsi11dxHbrjGC2EsukY/fIB6YvXVUvU4wa7hkZu5+LXf54Ld5m9UE
	vweQlUAESyyqAwd7gawyrjnWctP6Z0EKenTeEiss1RgLHrZW7ArtTtK8Dx9sdCeKJs=
X-Received: by 2002:a17:90a:e7cb:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39b2624a3famr41207276a91.17.1788860463271;
        Tue, 08 Sep 2026 02:41:03 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:41:02 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 5/6] m68k/irq: Add empty irq_eoi callback to auto/user IRQ chips
Date: Tue,  8 Sep 2026 09:40:15 +0000
Message-ID: <20260908094016.1997918-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an irq_chip lacks an irq_eoi callback, chained_irq_enter() falls
back to invoking chip->irq_mask(). On auto_irq_chip and user_irq_chip,
this leads to a NULL pointer dereference because autovector interrupts
are masked via the CPU SR rather than dedicated mask registers.

Add a no-op m68k_irq_eoi() callback to auto_irq_chip and user_irq_chip
so chained interrupt handlers can safely attach to these chips.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/m68k/kernel/ints.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index cf2b13488476..731d04ac95bd 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -33,16 +33,22 @@ extern u16 user_irqvec_fixup[];
 
 static int m68k_first_user_vec;
 
+static void m68k_irq_eoi(struct irq_data *data)
+{
+}
+
 static struct irq_chip auto_irq_chip = {
 	.name		= "auto",
 	.irq_startup	= m68k_irq_startup,
 	.irq_shutdown	= m68k_irq_shutdown,
+	.irq_eoi	= m68k_irq_eoi,
 };
 
 static struct irq_chip user_irq_chip = {
 	.name		= "user",
 	.irq_startup	= m68k_irq_startup,
 	.irq_shutdown	= m68k_irq_shutdown,
+	.irq_eoi	= m68k_irq_eoi,
 };
 
 /*
-- 
2.55.0.979.g7e5102b832-goog


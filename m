Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29673C38
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Jun 2025 00:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600809; cv=none; b=c7KmvbOB4hhdc/cpx3x1+SlyOfxhyVHN8B7nfULsApOwTa12pPIW4t2XW2W2xPFiauVlsohhi6f/o4QTbIZ6USCOJj+eP2Ta5mScsGwqEBifFoCfn7FSG73JyCkC8kqtLRIoN9z1v6zva9WBtOrVkF8ZycXr1OYqBIiN1c1PuR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600809; c=relaxed/simple;
	bh=dwUJ7UY4/AdpLsjkizOjRC8+Cmv//bzgTORe5RWfApU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rD+olOaySos8qtzc2dYogPQzVIYVD7x8pewnb/3sXMFueoVMhnUAq7x/KmzmDRrC1epO93O6O1Sa6Yq7PuBce7Nwkgb34VNFfMV9z9O3WXYVKaacnCXkvU+S43ECc/UX82sVLij0T6FOqt9+RLJy5M23dANPS3ZoNPoRp/Xxb5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWKyLQWI; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWKyLQWI"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3138d31e40aso2516575a91.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Jun 2025 17:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600807; x=1750205607; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyrdBaG/o2f9v9S5ulHJy7hZxE9PG3XIz3q5zTdj/0U=;
        b=XWKyLQWI8uYmEM/djR0fUBywXr8IcgqTYAqkapp/8CS8+HZqVFO8EsebCXTIPNHEUG
         8j8+SXTlAsh0gKU2gQEcRhpf3m12ZIWhP/z5mC95Z1r8CNR5sgQVlJIX13cH/rqKHEah
         WRcnl7GKmUeGA68KkovBtWeWl5l6Q3zJ+RSJi8lyFyz0eX6SAw30S8rlIv++4InUAnuD
         BBxZY9UkhoUf/y568XeuzGArUvw3hgu3a0Y3Y+yYI5Z0+AwoKGWiXwiYYvPot7qDsj3d
         IFqiqtpwzI1Tqz3H9iagDShuJjJolmoitTT0/Rqhyz3rWQPJi8yC1yZoSMMyEYaMdL3C
         OoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600807; x=1750205607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyrdBaG/o2f9v9S5ulHJy7hZxE9PG3XIz3q5zTdj/0U=;
        b=vIBSOkHR5Ag2eC1hIV4dlPYrzEQTIdnHvP2/DD9BcZi/lggK1FeTu4XKQnUxCJtgP2
         XprEFJ1VprQdvmknqu+zasQ6/D6TqPYI11NhFEjlUkji6oZ3s79PSLJDFBB67qNjCC/s
         WT2LDGjWfBnS8lrPS8/1pfLoIkHSPAH96nSsp03b8PeLqfXgZuTTtDQ5y8Odg5vVuI8G
         MN+XTDjjtuY/avy6Nzu+2/xFqe8IQADOoTTCGE2ebqG9UNPMTikRq9fqBrwGagy4dYAN
         HEeaGpprnXlNuALqTbZ9I4l1ISFNBFvRB0w3z1w+fk7k9c7tdhr8EVuNmsdR87+yqo0A
         pUFg==
X-Gm-Message-State: AOJu0YyiFjPiULktegWbn7R0WyNNiPut4JhNGj/8A0DQIJwl2BxsI7Li
	OG5BIFvxSLcVtOhJ32AAmFMcud4wtfDSmIE2O5gEePry/LysXLz8nDb1
X-Gm-Gg: ASbGncuhNIPIripsyHm2DTKRiMvFNLaoIgrLr+LegioTiyongcSXL53FNW2YTao6EsI
	cJDzki/o9bDROTvrxDBJVsVMTyL2n6wPw8/cQ9xG1aDuurrQPBVNbx7b/td4k+VCuZgona2hLLN
	suBry/KgUBjwfLMm62K9yQFKWff6c//XGxisqjvLieDq63aJU5vKDZ3F4JvIKfdzvBIzrsMx3Tn
	hCa/mkoJ7QiHYEuPIYyDlIWcksq8fyWhTuepwSqQDsXutVQ1Suk26s/fSHz5C/aRn5VsggtY+9Y
	bpUh3Af6rrN7UwwSpGgSHg5HUk6FkydhZaB2JDOq+rULlh5SAlK4psGMRloBZd8g1uh66msmLUr
	GS8vxpBDsFABV2mFmHejO
X-Google-Smtp-Source: AGHT+IEaWPUEFyrcYIrlxXbVgER+aXtbaiqm9DJoQ0ba6gY2akRmhHIZeKUuESnsAXIcvcpp5vW0zg==
X-Received: by 2002:a17:90b:1b0e:b0:313:14b5:2532 with SMTP id 98e67ed59e1d1-313af292ec3mr1569683a91.34.1749600806727;
        Tue, 10 Jun 2025 17:13:26 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:26 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 3/4] m68k: mm: Convert init_pointer_table() to use ptdescs
Date: Tue, 10 Jun 2025 17:12:54 -0700
Message-ID: <20250611001255.527952-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611001255.527952-1-vishal.moola@gmail.com>
References: <20250611001255.527952-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Motorola uses init_pointer_table() for page tables, so it should be using
struct ptdesc, not struct page.

This helps us prepare to allocate ptdescs as their own memory
descriptor, and prepares to remove a user of page->lru.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/m68k/mm/motorola.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 6a459710b2a7..9bd79f42abd5 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -121,10 +121,10 @@ void __init init_pointer_table(void *table, int type)
 {
 	ptable_desc *dp;
 	unsigned long ptable = (unsigned long)table;
-	unsigned long page = ptable & PAGE_MASK;
-	unsigned int mask = 1U << ((ptable - page)/ptable_size(type));
+	unsigned long pt_addr = ptable & PAGE_MASK;
+	unsigned int mask = 1U << ((ptable - pt_addr)/ptable_size(type));
 
-	dp = PD_PTABLE(page);
+	dp = PD_PTABLE(pt_addr);
 	if (!(PD_MARKBITS(dp) & mask)) {
 		PD_MARKBITS(dp) = ptable_mask(type);
 		list_add(dp, &ptable_list[type]);
@@ -133,9 +133,9 @@ void __init init_pointer_table(void *table, int type)
 	PD_MARKBITS(dp) &= ~mask;
 	pr_debug("init_pointer_table: %lx, %x\n", ptable, PD_MARKBITS(dp));
 
-	/* unreserve the page so it's possible to free that page */
-	__ClearPageReserved(PD_PAGE(dp));
-	init_page_count(PD_PAGE(dp));
+	/* unreserve the ptdesc so it's possible to free that ptdesc */
+	__ClearPageReserved(ptdesc_page(PD_PTDESC(dp)));
+	init_page_count(ptdesc_page(PD_PTDESC(dp)));
 
 	return;
 }
-- 
2.49.0


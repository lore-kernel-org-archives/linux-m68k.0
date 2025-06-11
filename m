Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4781F16B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Jun 2025 00:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600810; cv=none; b=KmmJNGHH88NxWS/409xnNQFzVfxudZDsn+ZYDZ7sGLh6RsB+VJrLQBAKM8Rs0ePYN/SwD470NkuyExjUW1S4kAKRutsJC3V3IbfLfT7B8k3qh2+W+OO7omhfL8icckxXZWfV9V97uZ70K/PVyEKT1aUX0fmJwec8QNhsPNv8mvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600810; c=relaxed/simple;
	bh=Tk59bj12fvUycun5eL5ZOvoI4KgbJQNjrO0owh/QZQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZwSb0NEUpG2Nd3zxfPIrGRor2Te+Oms2QLWdmCLe3YPC9GzvGo3D3Q08CORRUi9FH8bekWoooBo2ZWgRr6wYfc2hxqzYTRW28MWvYq1SJlGD6XRgSmA1ecE6Ve/4ZTcl/h+0r/yYnTXvyHp5i5CFXGdQoCX019WXpSbFgrBCPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D42Awx1w; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D42Awx1w"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234bfe37cccso74031695ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Jun 2025 17:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600808; x=1750205608; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VX97V5WXBlpRMsHKR0FvbYTfWMju4JMBW7YXcZZ9+1g=;
        b=D42Awx1w+hHCjgsWS5pLe4w6L+UWk1WczXkEKTOhuDCnCloR11/5YTtNCdcnMQqgby
         GoJvdD1aH92SqotAgWTspJikHGV8GLdMafx82Ya+PQn5hi8gYm/5KZDCnlnyDFRt8FJk
         QQ2pQSRgL0e3hSuH/zon2MPF06eTAllg3fwMFa1WZKPFG5oHu8Oxo0ddKJjSj/TKWiXr
         KeTWSl2G7xG0ttZKqzJurDEy8qArd4GGLzFt7uCS2nzTk7719tGKJVxvkdgaHEmGrmFH
         lpewL7wZ7cUy7eoAdh+6NMhbfUlAxeqBhi/1zMvfHFPB4QbDfoA6hSotB17ZLeyKsOw5
         Et5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600808; x=1750205608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VX97V5WXBlpRMsHKR0FvbYTfWMju4JMBW7YXcZZ9+1g=;
        b=pr1uVO8dxmGNrOzAXXcdFJCcSAm5yEfyy8iIAQkTH9Q5Nl8/yi9mYbrjIlI941QAhd
         ebEohbNOzDTtYpzVqeOeSZcSknf/QTVWeQOHWciJFdiiNMz4fqPBn43Ecn9ZjYAtErOA
         mrK7c3x7BuuRbkgUw8eXTub0RQOSF/EpApgvoRGNnsG7jCFsGExEDO37NfHaDxI9NrbF
         NlbzUvvmLKf0KzcVNh8Ccf9SCLYkYcI6lwEF+laaKkZZgmFAMJ15N8dXnhPOGYDuchaj
         6QdcJua1ReMlZBEoVi1sCcDSxP546XaGDDtJOkygCkyXrQzzPUyEVpoYc2UEjnXn1Qbb
         BHDw==
X-Gm-Message-State: AOJu0YxNZPZza8NL5fXlCcjVEaciy3vtG+snWWb1O6MxMF2omx+Fxewj
	K/ZDtPL2zNhhuxTOb/99B4z9NmyCdCvgDbs5w0K1DtENrTNbv6KDzG8u
X-Gm-Gg: ASbGncveKbv2cSZlJdxWsRAwSTR0xktqAbTnUQbsvPQsUxKMhECwfafUZbEPQcYApl9
	VQXo1RzNpQXelJCpIMFxFVTtBExnZ98DMqG2iG5a0xCuXboKrBvb4uHzh+nK/NJTNPfx8WiPvBy
	edGjJK2YFrkoF1jv+MuZW5L3Sd+iRwWagzCr5llO5d/yjCetoosFs/Hsh5ht2jPwmkhir1Df3a/
	inPr80nKwaN5VAegTiivyhQ51+G+quTvOPX3VL0wSvHuZjF9moDoewDSS2FASu+6Rsm63DFC31x
	1nh2oEQw92mVgfkgKP3HpjZyTUUEGoMcdHaKo/eQxDi1abDQpdEWrLIMSxkwX/z/KqOWjhr8P3C
	Bd6CXfbUXQrjQP6bbegCM
X-Google-Smtp-Source: AGHT+IFxydpYDFIY1qglfk1WxXOf2v7Y+C0/riV5WM3uO8rPBNEhREzF/OowZ0R+dvwLCexdOMD+Tw==
X-Received: by 2002:a17:903:11cc:b0:235:2e0:aa9 with SMTP id d9443c01a7336-2364261fa0emr9590815ad.14.1749600807959;
        Tue, 10 Jun 2025 17:13:27 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:27 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 4/4] m68k: mm: Convert pointer table macros to use ptdescs
Date: Tue, 10 Jun 2025 17:12:55 -0700
Message-ID: <20250611001255.527952-5-vishal.moola@gmail.com>
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

Motorola uses its pointer tables for page tables, so its macros should be
using struct ptdesc, not struct page. This removes a user of page->lru.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/m68k/mm/motorola.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 9bd79f42abd5..492e34dc45e6 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -92,7 +92,7 @@ void mmu_page_dtor(void *page)
 }
 
 /* ++andreas: {get,free}_pointer_table rewritten to use unused fields from
-   struct page instead of separately kmalloced struct.  Stolen from
+   struct ptdesc instead of separately kmalloced struct.  Stolen from
    arch/sparc/mm/srmmu.c ... */
 
 typedef struct list_head ptable_desc;
@@ -103,8 +103,7 @@ static struct list_head ptable_list[3] = {
 	LIST_HEAD_INIT(ptable_list[2]),
 };
 
-#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page((void *)(page))->lru))
-#define PD_PAGE(ptable) (list_entry(ptable, struct page, lru))
+#define PD_PTABLE(ptdesc) ((ptable_desc *)&(virt_to_ptdesc((void *)(ptdesc))->pt_list))
 #define PD_PTDESC(ptable) (list_entry(ptable, struct ptdesc, pt_list))
 #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PTDESC(dp)->pt_index)
 
-- 
2.49.0


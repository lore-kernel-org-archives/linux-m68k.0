Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740D513D509
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Feb 2025 03:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455201; cv=none; b=SdMpPThAoFY6qcjS4HPowRi/RjS2q1jUMbMKiHH9Oki4PWrOu7WgFqqqdsFEcFyHDgJzmo3KI47YvRrXl5PIPN/Wj1Tejryo67Jv15l9FXpJZY5zBj0JPonf9ngVU6bJQLrX+MdGhmJjarXsWFp0uyRrpC6m1ukJ80BruYwWbu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455201; c=relaxed/simple;
	bh=oBmV5ytFANypY5PKhoeTOhUVK0FgP+zeeiYW6bw8jKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=achbb3IfEjqmpqnQMdtQbexQTdJ9ZhQTEzM8e5nMa5M24f9lYqAamiVJUeQmeie7wMJX4yfRfJIPcgLQa1dBarfS8in5fWwA9eQu+2yiKZukSI7lULl8Fjw+/M/rjTfPytS15oJEh8Nel8Frv8OBoKDRtXvSAUwAaeNzTcNT7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LFMhU4/y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LFMhU4/y"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220f4dd756eso106403435ad.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Feb 2025 19:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455199; x=1741059999; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OP1Tf7pAaJ4pNIvAgoQe1yrsY5TH0xWN2DlWHIb0tQ=;
        b=LFMhU4/yvnisNDNlLdkIimYBhcyZixom/2teB/besM47btR7pyWZ/yR3DvJJpR7wGN
         QuAYqHfA0rK0uOUGCBLD2XU6oBCEBjl30FWegnnyUJjR+LSLyxcfQ+epZ3UI5KgXlNr8
         yy9ltwO3s6YrCUUAlCK9Og0Y3FGTMglzOWs9OESa2UTJ00SIx+IWBSmtqq0xE6uk7fv6
         KKnEN7TJJctYT3Qq6oKezsrf/baV5GgyvZmxWxS+VIrnZ0szDYOf24n3Bfdt/DKtt9+G
         0omim9kbBVPzZBa9DLTO4ZtqdoN9P2eULAr9yQmzoJ1azFQYHgjM/8vuneWxjT6XQl8B
         sgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455199; x=1741059999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OP1Tf7pAaJ4pNIvAgoQe1yrsY5TH0xWN2DlWHIb0tQ=;
        b=ZhIBkeLNEobj2yYZrUtVY5tulXNWrc69dOM4wlt3CxAGPlsCcTgHYSR8z5xM7YAMbQ
         Z9mLSSVnGJQg9w31VOsWsrBLMkWT/WQUflXGalfXHIEWD0uCdRaqsmH5fij+yVSnrMys
         82T+i7h3annFHLYsoJ/Xb08RZG4SRV50DJY7MFp7NEcy6fBwgU7Wj5/9bUGJvoEiA1ao
         M6gW8/vf9ZMQ19FZ+33hOc6q8dUzLCHuYIlABmb+0BVm8dvmk4jOrzWmQACrTzuomH4t
         weLQj5XJZJvCUbqWcrFTWlhCJAor55m9NHDH9r7wzC1UdoQDrlnyFOu9IcQAZ4TrtV3H
         XO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQXrFLUEVP/IwmLRTerf5GolFVFh4HQ6iuxqB0VvcKayOdFwI7DUk/wKHLQtXzF+L6Y3Gu8vGyoTiU@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwYLM5O7gT2wzRLsoBhysQ48alqDauYY/pAuZ6qkN9ZplMqCSt0
	QSRkfzUlFC35DoHIyNhucZOwMVtG9mJBgpaLJoovSexIxmmL9hpnvxAgaaNPNMA=
X-Gm-Gg: ASbGnctTlLbpV4ZccCj9gAmm9bDFrTF5ptgs8NI6KEfTeTIgDs0c5iwJSO35We/SxVP
	2nsjXPMMzMnQU+srRWOkrw5bS/0rbuL1mdR6ubAao/RyKaoDTgj9NorY7xUH7pXnRjXtbT6ELKf
	kU+HPF/7KLMYWRfJmt7JwHyV4N6EaWzcKREakKQkSzCV97ttInpDunKUA2Z92QJSZsIOH1YDbQ5
	2eYOfdDoFs1lrcLQK2s1aL8cMDRGbFZiCtoDXIGKvZxLZk6AQqIh/rjbPKAIYbD4CZI1zSgnWIK
	NUlGHCjaDb3m5fABFPyUuyQ9yE+bIKq3bxxAN6s18U33KL3A4pkH2jh+CcHPVtLSkA==
X-Google-Smtp-Source: AGHT+IFHXm4yz9k/q53vQDLsSd2kyUiUDLPeAK4sNAWc/t1WzpyNSO/kW4XJ16gHc0dMjVe/gJ+ItQ==
X-Received: by 2002:a05:6a00:230b:b0:734:9cc:a6e4 with SMTP id d2e1a72fcca58-734791ab6bfmr3168643b3a.21.1740455198810;
        Mon, 24 Feb 2025 19:46:38 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:38 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 2/6] mm: pgtable: change pt parameter of tlb_remove_ptdesc() to struct ptdesc *
Date: Tue, 25 Feb 2025 11:45:52 +0800
Message-Id: <60bb44299cf2d731df6592e446e7f694054d0dbe.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All callers of tlb_remove_ptdesc() pass it a pointer of struct ptdesc, so
let's change the pt parameter from void * to struct ptdesc * to perform
a type safety check.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/tlb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 54f579750c8e5..18bf499ef8801 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -506,7 +506,7 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
 	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
 }
 
-static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
+static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
 {
 	tlb_remove_table(tlb, pt);
 }
-- 
2.20.1


Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48A5443C0B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Sep 2026 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248757; cv=none; b=A6wHMzbs5BYE49gVxMfFNofEGkRQR/awEQzDZ75gaBxx3BH19+SmND5enKgw7jQciNhQ/E1mwu1dkcTSeI3ScgAcJREhSyFQuZQjLWZw6AZDUE90srufP/xbnMCyFA0X4s1klp52G/BmV6FJIk4GMCfaUdMVZqAxJ48ws68d9x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248757; c=relaxed/simple;
	bh=/uCNuyAC+bB2LSuLUVVmbArZTQ+h/k1E0mj7CM6a0k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOTEBH/JayN0lMux4rH8lhyF87JdMqy28LVFpIofTXWXhrh930ZzwkuwZ45vUMIy2PUtv7gRjjKWUG379c16lER3gxXwL94TlDG1eLsD7b6ThxXgvNc8R3zdXA03FbRijlWDUo+ugNHSOGTRaPXSeigAx9fX++V9DREXbdeqdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=uv1HlwtH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="uv1HlwtH"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso12258675ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Sep 2026 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1790248755; x=1790853555; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NER6dA4qTx1oxMdjLFfWJnc+/DEral7661ynzmv99co=;
        b=uv1HlwtHp8hmFPAELj/Uu7LEbk+baNXTJ330H5d82HujOWIi2hs4b+XxZwbdv81rFy
         laUvzswA0ce23D4nnZEIQ7OsyHLsfb9zk71DiiDZpWeMq0+Eqr8fqIV0Qauw8n/VHYSR
         6b0f6eBDgLo0mLt3s49qJNfTe/B6uA+HBAw9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248755; x=1790853555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NER6dA4qTx1oxMdjLFfWJnc+/DEral7661ynzmv99co=;
        b=kj008/Tpd5hv+sAEritQdk5YX5hmT0w/Gnugs3a32t3T4+ZL/KMo/IisEuDo80gaAQ
         h06W0bEsL9z1ypClKZ8qvKc++vXbjo7tjbF6yYmVS5WziYpp00+Tc9EtY+ajK/941Jhc
         YKUNlYGtxf6sCId7C+NUWp0N2/eORmLyCocvIGJkR9ZbseqEC9OJUuNQMG8MLEd+wsmp
         wvJ4dnguiP9iNTIxs8bl/SVs2g0aQk7IzZKOPk8goyV56Q/64GxQbBHwgAAJ04B5lJEr
         x3siynvwkNfGxo4vIfcX0sLoaTLVPT1hX69m4tBkJ8jHnlEDe8m/0s+azOOvLnwyx+7R
         5xUw==
X-Forwarded-Encrypted: i=1; AKwUvByd9g/DVuYxQ5wVNx3IuAISKOaxqAAe0rbRlz3o7Nr65U5CXWxoOYX3UY9rMGLMS31q42+fXJKCss7N@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lj5lX3iqKTthPxz8mIL17InAfxwlxN7NQyf4Ocwr9IN9cSM7DS
	6g7q80joU3QdOjpt8OW8CT/fVHIKycIe8YKcNh+aFhgaUtN5lwTekpV5JrxFdqJnQ0Q=
X-Gm-Gg: AYBFou31MOU90GkHUmv0n6af1tTtO+ycrZ6yJEkOMmNrxLA4kdlbWP4ewhWPfQN6Qom
	sZCrMG0ZHTFOoP9ABkSxkyiDZ/GMLeSVZmA4NgAPW2VC00C/oyhWpTK0FYECRwAmWyUfcmbAOOh
	Gm73Zpd5Gt1LAvwFoLdsiTXqh36vMsQ4FmRVPK031VDE8w6Kb1R9D3SlkIAOGVYujj9RI9goQ6W
	betFYSzThjpLjL5SJORnNYw8Cu3d5j4baBnmL3+c9Kf6VL0yhFpvxTyiVEm0DnncAW+KLAEIVCe
	/kkKeq1rU6ArhLvxYyPWamqji3aZovlGm0Jktt53segAb5KqHUAncd0NzOYOFalwBIecRTtssUB
	cqax65gUg3tYIaeAmnQaPY3/7hfjhlyTKal1Yv7Ifa6bWAPHxfv5ip4odw//yFwGuWOX7BhJiIq
	emsOoaKvN9VPDAktD/gS89nFrkIBYo7djAZMjsO/ue6CEbISHaMQPCkgorcR0F08aBUHma4APkc
	76j1KX8726Sn5DvEn1LWEVaOcFwsnwxpqG5tb4=
X-Received: by 2002:a17:903:98b:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2df7e24f225mr18698905ad.11.1790248750293;
        Thu, 24 Sep 2026 04:19:10 -0700 (PDT)
Received: from shiro (p1935159-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.129.99.159])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2df6a5c18c1sm24683465ad.36.2026.09.24.04.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:19:09 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: sammy@sammy.net,
	geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/2] m68k: sun3: register RAM with memblock and set the low pfn limits
Date: Thu, 24 Sep 2026 20:18:50 +0900
Message-ID: <20260924111851.3501100-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924111851.3501100-1-daniel@0x0f.com>
References: <20260924111851.3501100-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sun3 memory init never talked to memblock, so paging_init() and the
first slab allocation found no memory at all:

 * register physical RAM with memblock_add() and reserve the kernel
   image (and embedded initramfs) below memory_start.  The generic
   m68k_setup_node() no longer does this, and sun3's paging_init()
   allocates its page tables straight out of memblock, so without it
   memblock is empty and paging_init() panics;

 * memblock_set_bottom_up(true): paging_init() runs while only the low
   RAM the PROM handed us is mapped, so its page-table allocations must
   come from just above the kernel rather than the unmapped top of RAM;

 * set min_low_pfn/max_low_pfn: memblock_free_all() clamps the pages it
   releases into the buddy allocator to [min_low_pfn, max_low_pfn); with
   them left 0 the whole of RAM stayed reserved and the first slab
   allocation BUG'd.

Assisted-by: Claude:claude-fable-5.1
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/sun3/config.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index cd8af809e0ca..cb4e19b95a1b 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -118,6 +118,30 @@ static void __init sun3_bootmem_alloc(unsigned long memory_start,
 	high_memory = (void *)memory_end;
 	availmem = memory_start;
 
+	/*
+	 * memblock_free_all() clamps the pages it releases into the buddy
+	 * allocator to [min_low_pfn, max_low_pfn); without these set the
+	 * whole of RAM stays reserved and the first slab allocation fails.
+	 */
+	min_low_pfn = __pa(memory_start) >> PAGE_SHIFT;
+	max_low_pfn = max_pfn;
+
+	/*
+	 * Register physical RAM with memblock and reserve the kernel image
+	 * (and the embedded initramfs) below memory_start.  The generic
+	 * m68k_setup_node() no longer does this, and sun3's paging_init()
+	 * allocates its page tables straight out of memblock, so without
+	 * this memblock is empty and paging_init() panics.
+	 */
+	memblock_add(0, __pa(memory_end));
+	memblock_reserve(0, __pa(memory_start));
+	/*
+	 * paging_init() runs while only the low RAM the PROM handed us is
+	 * mapped, so its page-table allocations must come from just above
+	 * the kernel (bottom-up) rather than the unmapped top of RAM.
+	 */
+	memblock_set_bottom_up(true);
+
 	m68k_setup_node(0);
 }
 
-- 
2.55.0


Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2DC13DBB1
	for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Jan 2025 07:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736061307; cv=none; b=gl9JDG9zyYQmh+Xb6RGqX0ZFRLK0ahtMtySQSMK2wvRYKzAQ7R+S541bM4VR2nuIVYoPba2Mml/p4wavVzHgeDqoCKBHrAz57sDC3WP9Ei8vXX8uH74itY95L4NkHPWBWKQZoQkd9ORwQRcPy2X9XcNd01l14Hx+9vkrsGTYgK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736061307; c=relaxed/simple;
	bh=B1k9u6Ut55Q1yDg67JhK1vQvtIPsl10jceFNbmp++q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyMGw1ZjKis69dWdSI2qWNrtL+5DjqFERrmChxYDiQyXOpb4VqeiLkQ/eznwcioWu5M6qOaK6K7sxGVaSutDaPRcCHIoYqgBD5bheFj/cpcHxZxuUnNTwDxOflzgPdaeKrSu1ZrAuD/brncrY1pJTdR+3qM1Ghac0CEFoUkNRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=hSwcNK9s; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="hSwcNK9s"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21634338cfdso275203925ad.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 04 Jan 2025 23:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1736061304; x=1736666104; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kHweRIcONRT5tLJtckOeOXgzzh6Qs9WFL/vxgnpeF0=;
        b=hSwcNK9sro+uPmFSpmdoMMcu7Gtzw9VJRUy/ORcKD3IOLJ5mYDm1u0KpQgbPgCAEGX
         lFmZyED5RVA+JvaaO2tqcmYEEaS2+jYMD0SykoSq8pZlbF0inDgondjel73Mj5wlnsRa
         Wtj+VAVh78eYpY/GYs52r/tTVBZELrvmO6ne8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736061304; x=1736666104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kHweRIcONRT5tLJtckOeOXgzzh6Qs9WFL/vxgnpeF0=;
        b=KZvhoGFvxmH5HUAdpuoNHl6ySF/7azuc74jzArVKm/N7vPyYI01MoSFkSh/HAT9UAH
         LMAHGGNvJKbmPh7wXeMAmDx/l9vndcHisRDvEw/vhQ6w+X8iBPoTLoReAoaWn78dmXg0
         pdmAcQYMz+8Zw2EKCr2RMnzn/5mpuTCDINcD2I1CDysKq/lVV9ePhm/cPyMe6BPFP7c3
         3aIN6Fe5VZ8CFBSzKBAVOOtm91/edKjHqtc0AN0wwI3XvqnT1/VLUhDvY4BCvCMuoAjs
         dIuAAVF4N522RevFeYzMCpKt0iF7FN18sSloNOplSXKAt0A5xnlcXVNLPI46X0UYPm56
         h/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVjv1+K/IdK0vv1aYdbqn7ttYsHUAj00ImslKgchOSGdZCUIjt5pRwz36/+eH6iMpuL18X2C+qPwsbW@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzTIvfOtdv7tKe1j2F+7PDxf+T6no7aVEkLUvlu0Yr7exkpbQwW
	LVIfJQstbGZ8uiG/wCuvLWepl7hA83VpIhVwWmn+PISH9SU9v+XOltygtiyYbNk=
X-Gm-Gg: ASbGncvzZfhtuEkCF/UtbtT8D48DAcJsihTG7TXMy3o8Lizyoqa3Cc+WGaHBHrBSgyg
	oSfMq4dKW0IIHiqY92WHAqIzf7TGsM9e4wiP7k1KHf8hDZzvwv7COGgusozRbbq3o51bCqpPvUB
	cbdZxrfRKP0y91HA56eEnqOcuPkvqj8xrpbrDB5x58f4LS6Q1gKdianfOQ171ph1QcCTNhtfFu4
	y4tZ5ZS4qjGDDFVGOc+1xVPZnsrJcwTeD5kwGNFMV/6LS8PEEyJt9d25gFlSq0eFwLK
X-Google-Smtp-Source: AGHT+IEGU1Vt+Pmj7jkPTcwq1RTapVlQfMVVIuOabCz0za5xxjYc9YrGvNyMitcyIlU8PC3yyLIELg==
X-Received: by 2002:a17:903:181:b0:216:66d2:f172 with SMTP id d9443c01a7336-219e6f4a86bmr726109815ad.56.1736061304228;
        Sat, 04 Jan 2025 23:15:04 -0800 (PST)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:e94c:e5d:106e:3582])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9cdef7sm270007125ad.133.2025.01.04.23.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 23:15:03 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	fthain@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 3/3] m68k: Add dt support (proof of concept)
Date: Sun,  5 Jan 2025 16:14:33 +0900
Message-ID: <20250105071433.3943289-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105071433.3943289-1-daniel@0x0f.com>
References: <20250105071433.3943289-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is not ready for merge. This just adds enough, probably incorrect,
code to get the FDT blob from the bootinfo and parse it.

This is enough to get drivers to probe using devicetree nodes instead
of manually registering them but looking up interrupts etc in the DT
will not work.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/Kconfig           |  2 ++
 arch/m68k/kernel/setup_mm.c | 63 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 7c4f7bcc89d7..e348e6822943 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -39,6 +39,8 @@ config M68K
 	select OLD_SIGSUSPEND3
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA
+	select OF
+	select OF_EARLY_FLATTREE
 
 config CPU_BIG_ENDIAN
 	def_bool y
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 15c1a595a1de..6d358124259e 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -50,6 +50,10 @@
 #include <asm/natfeat.h>
 #include <asm/config.h>
 
+#include <linux/libfdt.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+
 #if !FPSTATESIZE || !NR_IRQS
 #warning No CPU/platform type selected, your kernel will not work!
 #warning Are you building an allnoconfig kernel?
@@ -107,11 +111,57 @@ EXPORT_SYMBOL(isa_sex);
 
 #define MASK_256K 0xfffc0000
 
+static phys_addr_t fdt_blob;
+static void __init m68k_setup_fdt(void)
+{
+	pr_info("m68k generic DT machine support, FDT blob at 0x%08x\n", fdt_blob);
+	if (!early_init_dt_verify(__va(fdt_blob), fdt_blob)) {
+		pr_err("FDT blob is bad?!\n");
+		return;
+	}
+
+	early_init_dt_scan_nodes();
+}
+
+static const struct bi_record __init *m68k_find_bootinfo_record(const struct bi_record *record, u16 bi_type)
+{
+	uint16_t tag;
+
+	while ((tag = be16_to_cpu(record->tag)) != BI_LAST) {
+		uint16_t size = be16_to_cpu(record->size);
+
+		if (tag == bi_type)
+			return record;
+		record = (struct bi_record *)((unsigned long)record + size);
+	}
+
+	return NULL;
+}
+
 static void __init m68k_parse_bootinfo(const struct bi_record *record)
 {
 	const struct bi_record *first_record = record;
+	const struct bi_record *machine_record;
 	uint16_t tag;
 
+	fdt_blob = 0;
+
+	/*
+	 * First attempt to work out if we are a generic DT machine,
+	 * must have an FDT record.
+	 */
+	machine_record = m68k_find_bootinfo_record(record, BI_MACHTYPE);
+	if (machine_record->data[0] == MACH_GENERIC) {
+		const struct bi_record *fdt_record;
+
+		fdt_record = m68k_find_bootinfo_record(record, BI_FDT);
+
+		BUG_ON(!fdt_record);
+		fdt_blob = (phys_addr_t) fdt_record->data[0];
+	}
+
+	/* Revert to the pure bootinfo method */
+	record = first_record;
 	while ((tag = be16_to_cpu(record->tag)) != BI_LAST) {
 		int unknown = 0;
 		const void *data = record->data;
@@ -124,7 +174,6 @@ static void __init m68k_parse_bootinfo(const struct bi_record *record)
 		case BI_MMUTYPE:
 			/* Already set up by head.S */
 			break;
-
 		case BI_MEMCHUNK:
 			if (m68k_num_memory < NUM_MEMINFO) {
 				const struct mem_info *m = data;
@@ -162,6 +211,10 @@ static void __init m68k_parse_bootinfo(const struct bi_record *record)
 			break;
 		}
 
+		case BI_FDT:
+			fdt_blob = (phys_addr_t) record->data[0];
+			break;
+
 		default:
 			if (MACH_IS_AMIGA)
 				unknown = amiga_parse_bootinfo(record);
@@ -240,6 +293,9 @@ void __init setup_arch(char **cmdline_p)
 		}
 	}
 
+	if (fdt_blob)
+		m68k_setup_fdt();
+
 	setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
 
 #if defined(CONFIG_BOOTPARAM)
@@ -329,6 +385,11 @@ void __init setup_arch(char **cmdline_p)
 		panic("No configuration setup");
 	}
 
+	if (fdt_blob) {
+		memblock_reserve(fdt_blob, fdt_totalsize(__va(fdt_blob)));
+		unflatten_device_tree();
+	}
+
 	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && m68k_ramdisk.size)
 		memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
 
-- 
2.45.2


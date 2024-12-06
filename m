Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D820200114
	for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Dec 2024 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733486241; cv=none; b=tESbrqHBDvHDWxj1JVAqUCjVhOYrjo554PAElUmEEQJD/4fpjUgvG2EHNZi3JPmLvesB584fRlnUfqOx3kR+1nGGGtzyPUKGkJyuLXEroBOIF2lc7tG04v37vZvBl3briT8DLz6/fjEe8XpI7yMQlk8CdHgH/JRl2thCadycVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733486241; c=relaxed/simple;
	bh=Accix36M+AxTmcfmBGlQ59iJFKXYFsUKU86Dgc5lV1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIITFT7lAadyUn3v6QclZCdj2FQLSjGyKxBSux7UZdULCsv2sFITxOjV3DTglhThVqbeq5Dz5NVqDZib3gsjZ8ncSXjIv7J6/eUk/80X1vvxV8m3fyLDrebItrEatgNU4CV6WS6kbQIQTN1fe+z8D0CG64ZK053+TCy3c7/jeqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fU6MsdnZ; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fU6MsdnZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733486225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZZpO9SIbEhiQV9ViJKVsnJwYEYoj5NMepZbe4iuQWaQ=;
	b=fU6MsdnZvR4aMHp9fxO9v9vE6eBn46NYZkQ1G+A9BDovLLykjjRRqNEgs20IKiSO5ylf5R
	5PMgSsqLv6q3u8sKno0abgTqs358QeYcje1b3CMMvS31hsUqnIDFBKa6ekupqjciYjX5uG
	jBd+P8N71Ev3xDGNWBgmZO6CW4P3v7s=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k/atari: Use str_on_off() helper in atari_nvram_proc_read()
Date: Fri,  6 Dec 2024 12:56:32 +0100
Message-ID: <20241206115634.47332-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/atari/nvram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/atari/nvram.c b/arch/m68k/atari/nvram.c
index 7000d2443aa3..da490392e994 100644
--- a/arch/m68k/atari/nvram.c
+++ b/arch/m68k/atari/nvram.c
@@ -198,7 +198,7 @@ static void atari_nvram_proc_read(unsigned char *nvram, struct seq_file *seq,
 		seq_printf(seq, "0x%02x (undefined)\n", nvram[1]);
 
 	seq_printf(seq, "SCSI arbitration : %s\n",
-		   (nvram[16] & 0x80) ? "on" : "off");
+		   str_on_off(nvram[16] & 0x80));
 	seq_puts(seq, "SCSI host ID     : ");
 	if (nvram[16] & 0x80)
 		seq_printf(seq, "%d\n", nvram[16] & 7);
@@ -236,7 +236,7 @@ static void atari_nvram_proc_read(unsigned char *nvram, struct seq_file *seq,
 		   vmode & 16 ? "VGA" : "TV", vmode & 32 ? "PAL" : "NTSC");
 	seq_printf(seq,
 		   "                   %soverscan, compat. mode %s%s\n",
-		   vmode & 64 ? "" : "no ", vmode & 128 ? "on" : "off",
+		   vmode & 64 ? "" : "no ", str_on_off(vmode & 128),
 		   vmode & 256 ?
 		   (vmode & 16 ? ", line doubling" : ", half screen") : "");
 }
-- 
2.47.1


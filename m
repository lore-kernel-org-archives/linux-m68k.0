Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0698F2206AE
	for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Dec 2024 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722117; cv=none; b=k8GmkxHOBrU52XfTk7y5CH6DyhSroSORjyC3Se4jezx5eUZB3v5bbpzR9w5aVhoozcfUefal5Varg6x52qHLOK0qIEMBEJ+OtQTnwVHhkfBWI26c0tzSJSyaI+MevG+u0vd5grRuR7DbAeJBm/b5LHYvRAePiQScfFYw1ExcB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722117; c=relaxed/simple;
	bh=Accix36M+AxTmcfmBGlQ59iJFKXYFsUKU86Dgc5lV1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dip55IF8h5oOMoh0sc2dZxPphbqtHk24mmjcuiUySQYFQbugQFutlqfM+qd+w17rdKA2uExocqk36UtgzyLpEtrNJ2Ld0XvbxxiuoSi0o04rc/ZdVNszFloFt5RDTgAyspAUwNYUoiTxshBEaagELGEyHgGuZCSG54YCIGzIS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DXthxhB3; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DXthxhB3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734722110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZZpO9SIbEhiQV9ViJKVsnJwYEYoj5NMepZbe4iuQWaQ=;
	b=DXthxhB320F1Krwdj7z56Nsst4HOb1NCYxa2H9XsDheKIsjK1Nkj/gmNGe0zYraRptYlu+
	7jND2GbWDGE+HpvQYnyW1HzffP58JfYYAefhHRYfQA8pjqLw+7L/o+5Uq9KgYXcUAJUO/r
	u2plcRjGotcN5hIYkdEFumVflHmcS1s=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] m68k/atari: Use str_on_off() helper in atari_nvram_proc_read()
Date: Fri, 20 Dec 2024 20:14:34 +0100
Message-ID: <20241220191435.1254-2-thorsten.blum@linux.dev>
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


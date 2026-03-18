Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062D7262F
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Mar 2026 00:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773793054; cv=none; b=irrdOEPzKe64IokGi3GLAdq6+M9pZhbTAYWQBugTRN8NM6UH8KuDgLBV4JemRsBfHk3SrPgZlOpVUn/Pv/aoyIQ+SP4PgheSYwFycL+Inikr/Sj/zYXaT+XPhP63tgTgJd72eP9TGG16CGl99ts5WxRfG+C9sMKWZKEcJAitclI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773793054; c=relaxed/simple;
	bh=+m2WuH3pKOU6uW9Som3QAR8EoNz1eJ/C+WZTK28/qrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dt/ROHMgsitojI3EmEj5L581cFzHdGaDJwJk2AcROAJQmexFf+DpSlHjZu/EY9DNQCDCrQ9luDPh4D6sJnacqXW8MpmP6/KhZwEY+rtUgKbOgwFRPjWjhsz9K9zUZ6BQAn9N+zfYCxrSvXUiFnf8UoCoUZVOjeu+DG9bUErskp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gG3JrvMk; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gG3JrvMk"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773793041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2zT3sN0sJ8d3jHItJVSbdoYHcXB8lPreJZWlPzv8baI=;
	b=gG3JrvMkQTktIwkWnMSFeA6qboNHH47XfkTaNCHCE6AtrTTVI4IURGXbt1SJ5a9eSKRfBK
	Eb0tPNPAzjUVoHDAeYjwGNnVOJzifVQskzW4+7PWNXtKouTCA4T3zrpStjWjG3JghQJMSW
	PGzkUeXBvMsONXRa7eTV4NCNCDQiu88=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Jens Axboe <axboe@kernel.dk>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Kees Cook <kees@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] m68k: emu: Replace unbounded sprintf in nfhd_init_one
Date: Wed, 18 Mar 2026 01:16:33 +0100
Message-ID: <20260318001632.2974-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=792; i=thorsten.blum@linux.dev; h=from:subject; bh=+m2WuH3pKOU6uW9Som3QAR8EoNz1eJ/C+WZTK28/qrQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk73z0QfnjBwVYr/PjFyCd3ledo1efNtZBfe4hleXPPo 0unj2uYd5SyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEasUZGebvvLto1TmDrh/s /9Tu6a3vV5r0pZVL6/LR2/8nab95zV7JyLCvN/NwPbfM9MQf58O4pz+7clI7xyRc/hbj7qlXLf2 V5PkA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace unbounded sprintf() with the safer snprintf().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/emu/nfblock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
index 93536cf2a38e..fa6256c5af22 100644
--- a/arch/m68k/emu/nfblock.c
+++ b/arch/m68k/emu/nfblock.c
@@ -132,7 +132,8 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
 	dev->disk->minors = 16;
 	dev->disk->fops = &nfhd_ops;
 	dev->disk->private_data = dev;
-	sprintf(dev->disk->disk_name, "nfhd%u", dev_id);
+	snprintf(dev->disk->disk_name, sizeof(dev->disk->disk_name), "nfhd%u",
+		 dev_id);
 	set_capacity(dev->disk, (sector_t)blocks * (bsize / 512));
 	err = add_disk(dev->disk);
 	if (err)

Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4C211CAF
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Feb 2026 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771780100; cv=none; b=opGuorAvPXgvlX7nTX7NW0KzkTpera9t3oJ67K13FPW4G75qwCBkckVr4t9w/HM45XIAV5mFevcmkPSvF6TueDZ54gI2b+aA6WDfS6PeSDQyBQ//HQa98u4AHo/H5aOO1Neb8NoPfxWJJv/LXMNisFvkKgfn39ylXaVzgOr9HxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771780100; c=relaxed/simple;
	bh=enog2pjfT+gpsvjvBLEdOSNBDUYcVvRopWCeQqk2sWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tXXwKV+HQuJYa7tvGXc3ZjpfMJnKPc0tqJFe7LvXNrMdlwXUmg5vcNYWiBtX4VGbkOxJIQU8YHrxwOSzrLE/Grem1RoZJ0iSRVeeDOASXDpYAMdnEs+oSnm9sKyH7FYD/rakbT3h4/Q60kIth34wlV1eTtmYPq4awPqTCWszw7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B81uCLgb; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B81uCLgb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771780097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cPvWU2PLL42+/9AwnW0YRXcUxyormkUAhizG8jHetE8=;
	b=B81uCLgb3yBNTcVa2nqO551D/HAs1onZHe86SfATJonxsaOsDdiCSfN7HYxCFCkpx+gmN8
	Y4sGB30k/sRs9y/44/cYkulWjmfegOVvAIKyAUnEvzHabpcAv5z6Dxe5FI4CnpWmQISCGn
	YIGM4WCUa/MP2cfYPGOUwRVGpGgFLy4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: emu: Replace unbounded sprintf in nfhd_init_one
Date: Sun, 22 Feb 2026 18:08:08 +0100
Message-ID: <20260222170810.282383-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace unbounded sprintf() with the safer snprintf().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/m68k/emu/nfblock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
index 94a4fadc651a..96fed5cd7677 100644
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
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


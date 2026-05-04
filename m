Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF43C0626
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777897632; cv=none; b=mvkKpRghcTOuE3dpwir5hbgiLvZ922GifvpPdZBsHkGUx4FFKwScZhBgwhQMS2jh2y3wJ/iqIhJA1U9tLAyvgCxZ54V9nPB+p/A0hSUip1Xr+/Qu6YDNuw01fMjdVkRwU3wjzNXnj8hBwcmUpZJHV+k6R3VElQPE2soRNet/Wy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777897632; c=relaxed/simple;
	bh=K3js56qeKQSMRUKIlM2cv8p51QyX5toTicuwOv4ySjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUFPP8Bgqqul2NerE1R2YwVsfJdlIozxSLKv6ZhctjD+I3GX/x+fkyabDKotOSicIkionDGx/uHRO6Ax5pyDQh0N7N6NqNu71+m4ein0vA/enrbzsyxyQCog9cTagjRD7KIZj24eOXwhj+oW7VNCrnc89Lzc7+gxv6w6lewSSNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 441284438A;
	Mon,  4 May 2026 12:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1B9C2BCB9;
	Mon,  4 May 2026 12:27:08 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Kars de Jong <jongk@linux-m68k.org>,
	Philip Blundell <philb@gnu.org>
Cc: linux-m68k@lists.linux-m68k.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] dio: Update DIO_SCMAX comment
Date: Mon,  4 May 2026 14:27:05 +0200
Message-ID: <5aa3901baaa5d145804e1a836dd8ee3fb07ea144.1777897387.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DIO-II support was added in 2004, update a comment to reflect this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v7.2.

 include/linux/dio.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dio.h b/include/linux/dio.h
index 464331c4c4a7704f..894e50b917925f69 100644
--- a/include/linux/dio.h
+++ b/include/linux/dio.h
@@ -112,9 +112,7 @@ struct dio_driver {
 #define DIOII_END               0x20000000      /* end of DIO-II space */
 #define DIOII_DEVSIZE           0x00400000      /* size of a DIO-II device */
 
-/* Highest valid select code. If we add DIO-II support this should become
- * 256 for everything except HP320, which only has DIO.
- */
+/* highest valid select code */
 #define DIO_SCMAX (hp300_model == HP_320 ? 32 : 256)
 #define DIOII_SCBASE 132 /* lowest DIO-II select code */
 #define DIO_SCINHOLE(scode) (((scode) >= 32) && ((scode) < DIOII_SCBASE))
-- 
2.43.0


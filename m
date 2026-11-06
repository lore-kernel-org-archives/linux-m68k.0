Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007876;
	b=KrVYIfawfbX9PtPE/rHWbcRFr0i5U6nrT7gOHSBj6wABI8dRWb9vu3nFw1zFdQAD/DXU
	 Dyj/lAv3R6lPil89fer5R0SqYdC3u+fIDP12BmYrHo8RPc1+/nztkHFdFJFZ+ELUW06R1
	 NgkpzD/HuB94iHx/N6WkRz9Om39RDv9S041ezFnoHGGT1A+vvzNQsO6ZiN6YnrrfPJyyH
	 RRsqHXRAgZNAYuPGQptvqS3KiqACrB7KF4hDNtkDiP3Cdg4fRV8xMBN+NHg1Uy0b0KQFH
	 blbMS9PuYUPowYjC4PNbP3aANk08ihUFtHSWJoCPxxcL41IbPCsjLkcnlc7VxrJy9vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007876;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=KxDNcFzjGkbUdjmkdE/Lvs3kMztmWZwJDH5eU0pXD4Q=;
	b=YBG3dJ63VdTFlJRbRb7BY06uAIM5IDkjiwwcw7eK0/A+EpJ6XiZ64gRf89jKnxba9UP9
	 HuOm0mKYhQoH1yPue8BJvbf9gC4hyswC4jGcyVxZ209c0nHSrEc3horqLxhdecAk/2vBW
	 VRxunNPT5FkTTcWUTM2krkCxzPXPkhFD0G1cUW+Wa02QG1L1xVzSDErDlIeFR2MPFGCnZ
	 bO+b0JP0d4lSRmaawQDvWImn0N3Xc5DdF3ug8qJRXebDLnyUUVOfWNvwtfDEPGC1JdO04
	 a2jP3Wb9Xz9xi/+imujDnXg5RTt4G/2Db2fwreMQnEiuyAJLfm4E2Gn6OsLtpSUgbDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAkbH2uQ;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F1606A32D
	for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Nov 2026 23:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91F1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAkbH2uQ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FC5742467;
	Fri,  6 Nov 2026 23:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD3B1F0089F;
	Fri,  6 Nov 2026 23:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794007875;
	bh=KxDNcFzjGkbUdjmkdE/Lvs3kMztmWZwJDH5eU0pXD4Q=;
	h=From:To:Cc:Subject:Date;
	b=NAkbH2uQurcfEeSotMoC6v/IS9V961K2gGDd2Dpg3hLxWLhcCK9zPtaE8WeXuSlXY
	 JvYkw9V6WNWORghQgJduQh53a7bFIXh+wJRTbUfcOHIuiHvbnndbhNxkc+itxrHI9w
	 pCbiPgo99Zvjot2JiDpWSkrsZdPT7xGSwHljK4f5RG792WafhIV3LGNEJHygznW0AE
	 v0Nj4oQRhEfRQiZiCw3oLKdkE2N7IkNd7kkfQ4+4fqnwjsqQ8qnxBV8+SgN5W6vXcN
	 HGkN5Hk4Y3N4UU9kXFK2r9S/zrenfTB7w6bpRpCbyHxPf6yOHhdyvnOjSZwn4pb3F/
	 LYdRx+wFmwj7w==
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Miro Kropacek <miro.kropacek@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: atari: Use strscpy() in atari_switches_setup()
Date: Sat,  7 Nov 2026 00:31:04 +0100
Message-ID: <20261106233105.281683-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016; i=blum@kernel.org; h=from:subject; bh=gkYI4DWvjAn9+h0nH84MIS350bRDMYP7XG2ktMjhb7U=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnvki2NdFx+P3/xxPDxJvULp7V9tC/wOpybvX9j1zbXP tGFx/eqdpSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEJs1m+B+0qqDxwCLJhBMc b5Y/ZpK4kHvz9pamyEvr3z1y50/cW8DIyPD9/I7HZ84KTbr6hNNJYsGdCYfMr2w65qTBVp7CxsV 34zgvAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows.

While the current code works correctly, replace strcpy() with strscpy()
to bound the copy to the size of the switches buffer.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/m68k/atari/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index b82bbf93d8e7..09f4219faed6 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -35,4 +35,5 @@
 #include <linux/usb/isp116x.h>
 #include <linux/module.h>
+#include <linux/string.h>
 #include <net/ethoc.h>
 
@@ -154,5 +155,5 @@ static int __init atari_switches_setup(char *str)
 
 	/* copy string to local array, strsep works destructively... */
-	strcpy(switches, str);
+	strscpy(switches, str);
 	atari_switches = 0;
 

Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A502BEFF1
	for <linux-m68k@lists.linux-m68k.org>; Sat, 14 Mar 2026 12:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773490595; cv=none; b=auMhtI8imB8jMpb2i8tdWVLd2b3EPBA0nE34KGj42xg8p1NMVOday3hNuAKyWdcdDj+uQN+8Rl1Kc7nlvNzTLeT/N9Kn+XmsC2aPwEVWnReCTU+ysl4P/NafLB5chRPfyXZPZh9R2SBdSYVY9STHNfxtP9DJvnFZb9cdVtaosF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773490595; c=relaxed/simple;
	bh=38Ft+2PSGTK33b/8Bcu0nac56SydJO6rPdRb5tLth3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c/jqSizhhe77joeS+88WQl7nAdSb94I2oYeILRh7KbnK/doiEWmRtTkY8LsJUgxgoD/gSkCNbAZVR37TI0mFGJVbvX1p1XENrvFGL1nPw9ZsfC7qGv+84idTi7HqjbuGzsvckVp7o+4bchNU/qT9v8QaZ2XKcYIcNKIOj02FFaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Y/sAAsKr; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Y/sAAsKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773490590;
	bh=38Ft+2PSGTK33b/8Bcu0nac56SydJO6rPdRb5tLth3w=;
	h=From:Date:Subject:To:Cc:From;
	b=Y/sAAsKrTclhx7wZpUlC/56dP8nQjq5KRchgQgiZC5jPVYpR1scvUv8duoU55ER8U
	 8DAmCRSZHc+6j5wmYfUrMxKS7dkoUVJuGnPyUjCUKwZOhX+4thShqQ4be2/OLkP62j
	 krlXYVGWIBir0eXGvQn9TAhEtXqlMMK1D2xaaT1c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 14 Mar 2026 13:16:28 +0100
Subject: [PATCH] m68k: uapi: Add ucontext.h
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-uapi-ucontext-m68k-v1-1-1b8b0e082b79@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MT3dLEgkzd0uT8vJLUihLdXDOLbF2jFHOzpDRzy1RLE0sloMaCotS
 0zAqwodGxtbUANQ1dKmQAAAA=
X-Change-ID: 20260314-uapi-ucontext-m68k-2d76bf79e949
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773490589; l=1203;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=38Ft+2PSGTK33b/8Bcu0nac56SydJO6rPdRb5tLth3w=;
 b=LHngr33mYN0E1ZlGRR67n+KQcvvw9VDIex6fhw3VDaX5Tdgi5zzojiP3JqZCojNBCbjf7t+75
 dLqsOrobQJYDJdb1TxkFOPojt6JYI9OnK2jzh9dO5+xww2TH5VKaVya
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

ucontext.h should be an UAPI header as it is used for the kernel's
signal handling interface.

Move the header to the uapi/ directory.

While at it, also add some necessary includes to the new header.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/m68k/include/{ => uapi}/asm/ucontext.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/ucontext.h b/arch/m68k/include/uapi/asm/ucontext.h
similarity index 82%
rename from arch/m68k/include/asm/ucontext.h
rename to arch/m68k/include/uapi/asm/ucontext.h
index 1523a8e5ff22..ffac691604b4 100644
--- a/arch/m68k/include/asm/ucontext.h
+++ b/arch/m68k/include/uapi/asm/ucontext.h
@@ -1,7 +1,10 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _M68K_UCONTEXT_H
 #define _M68K_UCONTEXT_H
 
+#include <asm/sigcontext.h>
+#include <asm/signal.h>
+
 typedef int greg_t;
 #define NGREG 18
 typedef greg_t gregset_t[NGREG];

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260314-uapi-ucontext-m68k-2d76bf79e949

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


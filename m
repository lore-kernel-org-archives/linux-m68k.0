Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145581;
	b=wt4X/RYwbXmPAWOu9jNSYdN4q7IMVcwArBAfjmjdUIUBI4Nkwy0pJd8smx89bFKpvku1
	 HWOXiBgo6xzoh6ygEv5rAsCghepbTM3zQGJX1ZxGJrw/4NkMm9JIh4qFvhpkU8ykV/zAe
	 LxdqT6AkkGulBb6iNgHaL0Z83zN760+n1ZN3TGn3QTy2GblUkW5dlFw9rZ3LTUpiCcAPu
	 kNH+h+geU8TRBgwIP5OD+PYVbw5OyFmDofw51GvH9SwEo2KyBmT8qCkQlcOBq3vCxGXfH
	 w2lGUNXyTSCXij5h1zTnVn3zdVJR/mH2eh8EpPf7xw4k50bpIrj3VcrcKJZZ0SHtA2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145581;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=O3/VjpsT3j+gzFeQSixRzH0RuopYSoSSLufZz9nn3zs=;
	b=s/rhFLcSC1mk+lyk3pe45I9yv4eMIUFmkbjQFByQONi7el+X4EHJz1nEqZ7f7vsScbGG
	 sdLAdMcz/mFchPnAJTA5mLyCoTqEOQ4b/6RUWVbahGhN6XnJwdR841jeNqdnJOwt65UB8
	 8nxu7hFQQN7SLVIOjR1sc1W3N3PWJ09viIuTXFcForeJMJzzL2zfU1l3Mi54rQ+JJm9sn
	 unvf+rVm7wnjgU26VMZ/V+1yaCcEIy0P57jHWjb/CmDIwhLxqqJs2kqHH6qqbqZLX6wab
	 Va0QNBXNusG4DluwJSJSIx/L+PHbsAEVsggdkrbWgSazpLMlgw8SBokB/Sia9lMwz8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aaxIkK1j;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A677606A323
	for <linux-m68k@lists.linux-m68k.org>; Sun,  8 Nov 2026 13:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A677606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aaxIkK1j
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B4BA44D4B;
	Sun,  8 Nov 2026 13:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8791F008A1;
	Sun,  8 Nov 2026 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145580;
	bh=O3/VjpsT3j+gzFeQSixRzH0RuopYSoSSLufZz9nn3zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aaxIkK1j/cwCd52vc/W6DgdqsQoIXSlKeIOrmy7nFhABUPf9MbP7KJLUxePR3dJpq
	 hMgAW33c8BCF5TTi/feaPGIGzd/dFNa1VsrAk2ydDjASVqKKejJvIxm7tXTXn3yuX5
	 oOF0oH1jfoMVnYllP3BaoZnytzoma46z3nSj6ar1JZ7wAe7L2j8hx9NIjTya48uB77
	 kdUHP2sMaZmd5Dk+R0ULp+DLOfjmD/JqB3ZIQfro12fokj8Zik6U5L7mwbTwidqjcW
	 wQ4l3qbcdCChPPFbmujEsL1MXI8OyzWq+pdzk9U2O1jhHaLqshsp7lhoes5pobVpUv
	 kFCCMgrcNCRzA==
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] m68k: amiga: Use clamp() in amiga_mksound()
Date: Sun,  8 Nov 2026 14:45:01 +0100
Message-ID: <20261108134501.404852-4-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108134501.404852-3-blum@kernel.org>
References: <20261108134501.404852-3-blum@kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=blum@kernel.org; h=from:subject; bh=/Q6qQpNq1Yh96WuHApb6gUa/Ly37IdV3WPRCtp4ZhJk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfapkn/lRr1p/QvjT0pizrc+sfOxj0G1smyx+09DVdr LXe9tfKjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiIRRsjw/aJmm5P6hcfkpS+ atnq1cV3dmHsiuVGZdW5Fz/y7HA4z8Xwz+DFbq3Hvcl7nFOWfrrwLNBIz6v068ODO/jnnkxQd05 4ywwA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the open-coded period bounds checks with clamp() and remove the
redundant comment.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/m68k/amiga/amisound.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
index 5ae1f017b39b..5b9d265b2cac 100644
--- a/arch/m68k/amiga/amisound.c
+++ b/arch/m68k/amiga/amisound.c
@@ -12,6 +12,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/string.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 
 #include <asm/amigahw.h>
@@ -81,17 +82,10 @@ void amiga_mksound( unsigned int hz, unsigned int ticks )
 	timer_delete(&sound_timer);
 
 	if (hz > 20 && hz < 32767) {
-		unsigned long period = (clock_constant / hz);
-
-		if (period < amiga_audio_min_period)
-			period = amiga_audio_min_period;
-		if (period > MAX_PERIOD)
-			period = MAX_PERIOD;
-
-		/* setup pointer to data, period, length and volume */
 		custom.aud[2].audlc = snd_data;
 		custom.aud[2].audlen = sizeof(sine_data)/2;
-		custom.aud[2].audper = (unsigned short)period;
+		custom.aud[2].audper = clamp(clock_constant / hz,
+					     amiga_audio_min_period, MAX_PERIOD);
 		custom.aud[2].audvol = 32; /* 50% of maxvol */
 
 		if (ticks) {

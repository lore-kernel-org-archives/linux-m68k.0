Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895486;
	b=CR4LxknApJreCOd9SxO9BW/p9RWW0JWbalvwD3pAS+zhWgfzzoOkdx7NmVBFmMqToPw7
	 0cye1t+ZOaAqsIC+acIjD6eIWpgMS6BnDf9IlbhX6016oPnLjj4MLqqWfLWg+MkIujZOI
	 JcoTN5khjp8bDDInPpNzrbNhuOp9jbLUkrF2j1hhYo+tX11Omoc1F8e6kKLXrCkP6ZfOu
	 dccepQjgQmXaWXlyVX5OzUxKDz04By1roLGb726UoUrPTQJoRXQp9gRkSVJGMuq/Ow+al
	 bol3sMNHtN+kfQARZERDS1KJyI/IzKKrEu8D44U+n/meSTmSDa2Cx3maWnxAyzkn1Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rcpn9+uSzInsVdObsHDfzPAAeCWQb6QnmPjXwJKGazg=;
	b=qfZh4ouvS5fLwGKC+wYWtvPE7EeLwK6ZNsdSSmDDY+izwWiqsv/TqYouhcfgdvfZa+M9
	 M6LWPwp1iTf19OODZqVszhDV/dt8AkmTO/YbP+Jv0/LNCVg79G/dqZYO8XVOihYHAQwEw
	 2BvaHiNwBTbMmEAaEzWQueuXjTKRpNdy9/m6q/wVNtiiWqjqH7mtsFTbTUidUxVYHiaH2
	 DLdQsbgTWn5NQGTrb6W/9km9fF8iohWevQguzU4tZMC3rozJDRuy+yZp9aigkrEF0zFg4
	 Jzd/2WdMv+kEjIZ9jsxno8UCFrr/ZS3yCRE2sKYM0h0do16QcDXS5acu/9hCAmO1Bng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSlVHWTo;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB910606A32C
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 16:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB910606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSlVHWTo
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso643217a91.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895485; x=1794500285; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rcpn9+uSzInsVdObsHDfzPAAeCWQb6QnmPjXwJKGazg=;
        b=zSlVHWTos+sBYJDKaI7EUyQq/MB2085Af3zyxsGug4iMhr+Q8IqD7+4Ou53uKsSAPK
         /J9ilLXl6dPPBaBoI9kbS2uybBrBE7jRkTn4miLPrNBDftS0xmgs31nVusSqPzsCo3+h
         jUHWlwKzpYBFhR+nlGHilpKP7puZDDjLtRBd3H6v4sRPWQoCDFwiZPjciE6tMIL5r6xt
         OEkWQNatzbcLxXM1K1WdlOMmDE2SklUrSlxUWBml0fKdRSTvn/1ZRfVmAAq/UHHagRA2
         o5HM046bji5HCWonMU3nl3JDK3sTDKayzKLl/0aljv9A27p8hE0Gya9bk/3KmvsXTNHz
         qClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895485; x=1794500285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rcpn9+uSzInsVdObsHDfzPAAeCWQb6QnmPjXwJKGazg=;
        b=rxrROBTWgBX+PUomL3/2/EWI8PWCcKi70IzjZsbqIilbqVwhJ9VuJ/3vMx7M333tse
         DjcejbrtWJ9Ct8XfZp3hY6oAhcuapvDlOKn2kDkEnp7hBpXl0LF3bsqaKQnUdE2gE4tY
         vsBuUj8N8Gsw3uvilhR6y29/JtxhjF1CJI5lxq3mBHRrBJRw8/0Y+WKMbTzE8Hn4VOmf
         RIDzijsEV8L37Mfm+jR/w9wS5/JatSDX5cWIBJ6DK2QjDtP6GRmXDvkMo5rlVxopEifG
         THlYft0wQ+LYgc1YABYZxLZzS30Q5TEtI5GBcT8q64aEwPbrpG5mKwdUAA0hY58VQRcX
         Cjig==
X-Forwarded-Encrypted: i=1; AKwUvBxFirswcFmQtxA5wpxHOV9xwsw6ezsFnoWW6f8Cl6QQKpZ0BKkezep3QZgc81fAf2eGRoUSLtsGt9Wz@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+vkz9wSlFqKWfSy/aLCl0xviEJRlU5yxa6N9YDTWX93hftGj1Z
	6o18XIAIy8ZK5fX5H88u4Kkhv4Yp8ZAnBN2v+Gsh6Jd8djCREnVvAOHw
X-Gm-Gg: AYBFou2bCo4S51YwOI1hk/Pbc5ivWoMkaNB3v97CFQ7zTbrUt461TT2vwoI5jYKky3D
	53mSK/RRB3Jye4rAmZHRwE97dgOUpF6VqDLFmfZ7hNpb49nICfpKKYpRg8/oeqhSKx434P9HEZk
	iCz3vlfoqZVqqkY3qqYZCU+TyAfD+Xdl0LiRVJtfG1iDmP9fLCxHzHZAfQ7sF5o6MW2BW5rdu75
	1xO4jPJok9VrC8f3aA5h+UZ6Wpp8l6r/YHMODcXZwr+rCPUlO0rwpVPwkDgwDd2mIDgYxLW5uK0
	Izh4b07EZs7Rwz/3/6jGJiiL+0Nyc/th44lTL8Cm8tgUIuSPJswsSHI9iJE3was6B2Hk2WFWiwJ
	eZ8ev+xY9FygleWbWGzdhXfKYwBBgLd1aEKZfssyK6Zjt7A8EO0fcv6z9E/AIUPnrSwGrs+GMLk
	lCBcXQZ5g5rQ0aYRbLpixZKatZC/iN69YeeFTYIIITp5ep3DQyXz5p/Q8pTbC3OIm4yt3IL5xMM
	5MRejKKEN7BckBaf/6zhBaBlCRLBpUanCHPFNTR2x7dWeUcGaviZ7LMgFXVpf2R0xPkCexhd4yd
	nJMzbbHdzhko+OC5LwqT4ayzP+K+WDYhdOo8UhLUe8PZ4PIEZThIbrVi+Uq0y109YA5sHGmTlJg
	xL/gI/a+ZLi7UtjsA7KJFkcM=
X-Received: by 2002:a17:90b:184c:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3ae897c4ea4mr15905533a91.55.1793895485124;
        Thu, 05 Nov 2026 08:18:05 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:04 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 6/8] clocksource/drivers/timer-goldfish: Set clock_event_device cpumask
Date: Thu,  5 Nov 2026 16:17:00 +0000
Message-ID: <20261105161702.3515900-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Leaving timerdrv->ced.cpumask uninitialized triggers a warning in
clockevents_register_device() when num_possible_cpus() > 1.

Initialize .cpumask to cpu_possible_mask.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index bac84e0f9b7b..208b80c46193 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -117,6 +117,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
 		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.cpumask		= cpu_possible_mask,
 		.set_state_shutdown	= goldfish_timer_shutdown,
 		.set_state_oneshot      = goldfish_timer_set_oneshot,
 		.set_next_event		= goldfish_timer_next_event,
-- 
2.56.0.398.g882cbad275-goog


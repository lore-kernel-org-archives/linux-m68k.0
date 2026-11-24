Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514783;
	b=faTvySFYnWrvtA62dS+DXnIlMn0XIi8LZclN/6o2Hg+FACGQbwQulactQFCh3x4a6r7x
	 vpemPMVcT3ezpgvStWaxG4fs/45B7R2DXcEir4l4cQ5q47v8K4jdqTqDlX/j4y8nKw4UE
	 bACaeeA1zpW3BMWhk9WzPmgCOlB5hg4W1PFkeGnlZBzjfSpgjxyGoAKQ7VYIB7wEI3K2y
	 HWXf+Dv3cp2VOnxEGYR4m55+f4CVx/rxeBJFAlHl2rRSU9bdCN1nbn/ZN6tl2p8tocm1V
	 B7HhXvMHExiihANlcB3Zeg8e+UHaPhuo1aqyPo8BBb9iCcnFmHLJ5O6ol6B/4D9BijQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=goejSGAp4IfnqTSxRNc89CxXB1nwqTfFiuZjHrzldo0=;
	b=wmWWuCb+epjgsFV+j/TNcpv6v/OvkC9UFE42lI3peVgqJ9W8QD4FG+7hK1nutHF5S1Pt
	 c0qundNXb3JudyF5qxb+7PgoMQfAViQaZ7lc5I1rJ6z4W+/vgn1eBqAcZ6KVSdXRlgudc
	 dDQPqJ7xGcbcMupyj2e1A0XeBcUqd7iczTAH7/e6l7W2HMxZ+eVNRRjjWwyBzvFC9/7za
	 51H21UnXNEtl3Fq94x48kL/vNl6LwqXe7M+zY9uhsQEQp7h9FtlDH/qqmgNL0SgxxGJPv
	 xkxA267tYFRWwgHJTUSTMq/7uu4IK1bf7mqj8msvW/Efxx639du4oKKaOVsIer9JrQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=YiJm7Ata;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9C606A321
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 10:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE9C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=YiJm7Ata
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cddc597d062so2557114a12.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795514781; x=1796119581; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=goejSGAp4IfnqTSxRNc89CxXB1nwqTfFiuZjHrzldo0=;
        b=YiJm7Ataa6IhA4lnuJtyZozlX6JSHopltDY2LBpDbgyshWSYD10SumtfPrggUJQpVx
         op5tt166ynF6kKd2P6vpz5k2pTPJLB/WgOZ/qUBE2lMBSHOqG5STXfiNHAlQoyAt2fva
         LiOR9/RYQXNjRHKmjLo+doOLqYmpmoK3ivXbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514781; x=1796119581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goejSGAp4IfnqTSxRNc89CxXB1nwqTfFiuZjHrzldo0=;
        b=ee4f8I0YS2tJHFkSVnLCsHAP64nSC9U/siS9HW0gSSGX8qoFfA6IAIRC0NAO1TTlxM
         Qsbv+Qcl0sZ2kWKO0Le7u5YA/TtQ2XIVn/t3YLDxt6gq2GJMVUPeyXLJFgquQV48uLy5
         7234wdOnE9iYY8R7Sz/6snMSwTC3c/QjiLiyb8mW2JTUac5ss4gV4TKnUT0rZjgdkoRY
         8PR9zwfOqzx/aaetixNWfVrmhBHQf7wNX2vP2MiXB85EAP3LefYVyFZqW9l1qkqHTKWg
         ioDyqp9gt95ViP5k0uhaXaq0oz8Z8QP9zQPbyWChlkSaUa6z7Wj+ZYLFe53rczH9SODq
         YmYg==
X-Gm-Message-State: APuU4Z/l3xlJCcNshryNrTTJD3d6dcf1yl+2CIlIOhEgqHwstKd3Tg/6
	643yE4uRO5+69rOM0muI9qQbdl44DirO2axOpKl6yIMR1fKniiW+TRu6J5KdeOJWXyo=
X-Gm-Gg: AZFdTZcTNX4GnlEeje/hGRCumJrIWS77sGTbsDoqtj+b7oGKyI3nJ7y2Z51yCJ1O+cw
	O4eblkC3N0zt1GECRkGfEtsYYdfP/yEcfYrtY9LBZLourzm8XoZg5rM63ftdvqdkVPNw8wxhmB1
	SjeG9CUazCbyoycdUY69RWk7UV225BlvLVIwTu7x7R/fFjTrZg52+6Vh4CyEMkxGessoDn3RtFP
	4HM4AZkqsnEtvjyGU902EI5gfCb+temuJ5vkCsNWrzBQNO+IjunhdEluGqvtNXM0hCOWY02F5C7
	4GxtemLqz+JfSFSV8dJrvSFcjPQip/mR4JsVEPP0wmmD8INiCq79+VEixAB7Yc9MX+bd6+IB4QD
	AyBH56De9WcC2/GxXWP7hRuSpmrE+kFiuF2+jH31JIgRsjLa3w1WU0TucRrxBcc7u1YvaNWRcfz
	vnYDzn7S75NZk6c4UhNnidWRT9mQF7nXISqqvDJxQJtbSsOTAoPBd5z9BtXe0L7ejLLPL0R1nFq
	4gd3Xslg83CAcZGWvmIbdTHCkTuwg/7ocrUJnUoNSp9fUgUf+WbSBAcmVChimuw5V1j5spBD6bm
	yxbVVBbeLtVCRh5Bsh8hHmYMkWz9tEgJvgyHEpZry64SkjZ6hZCX4jfeLvMYcGRBTIJnH7s=
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b41c92a3dbmr13975688a91.29.1795514781425;
        Tue, 24 Nov 2026 02:06:21 -0800 (PST)
Received: from shiro (p1721212-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.141.212])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm21080437a91.7.2026.11.24.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] Input: amimouse - Fix the buttons
Date: Tue, 24 Nov 2026 19:06:04 +0900
Message-ID: <20261124100604.2380938-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
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

On the Amiga the left button is connected to CIAAPRA bit 6 (/FIR0)
and the middle and right ones are POTINP (called potgor in the code)
bits 8 (DATLX) and 10 (DATLY), all of these are active low according
to the "Amiga Hardware Reference Manual (3rd edition)":

In chapter 8, "Interface Hardware": under "Mouse Buttons" a 0 in CIAAPRA
bit 6 means "switch closed", and under "Digital I/O on the Controller
Port" reading POTINP "will produce a 0 if the button is pressed, a 1 if
it is not".

Invert the bits from the registers so the state of the buttons is
correct.

Tested with Quake on a real Amiga 4000.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/input/mouse/amimouse.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/amimouse.c b/drivers/input/mouse/amimouse.c
index d203c2a6c438..caf35ddf3d06 100644
--- a/drivers/input/mouse/amimouse.c
+++ b/drivers/input/mouse/amimouse.c
@@ -58,9 +58,10 @@ static irqreturn_t amimouse_interrupt(int irq, void *data)
 	input_report_rel(dev, REL_X, dx);
 	input_report_rel(dev, REL_Y, dy);
 
-	input_report_key(dev, BTN_LEFT,   ciaa.pra & 0x40);
-	input_report_key(dev, BTN_MIDDLE, potgor & 0x0100);
-	input_report_key(dev, BTN_RIGHT,  potgor & 0x0400);
+	/* the buttons are active low */
+	input_report_key(dev, BTN_LEFT,   !(ciaa.pra & 0x40));
+	input_report_key(dev, BTN_MIDDLE, !(potgor & 0x0100));
+	input_report_key(dev, BTN_RIGHT,  !(potgor & 0x0400));
 
 	input_sync(dev);
 
-- 
2.55.0


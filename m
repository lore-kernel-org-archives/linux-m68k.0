Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719100;
	b=Pcoc4QmEAR7DlscLRXlNCLyQj5MZuNBUGKlZTsaZN/iYQOT47O0Sufj1vI91BwGdRLwX
	 KyM0JQf0Q86rmauSM4XCvkN/XDBt/vyu3vGZX/OPu6XzcoB/wpP31Fpj2LOCk3DAT6JcP
	 aAyo9+IJ0faN7rSBcMTbryXc8UPbYjFpwnrk0N7Vm3uW7kB9eX4ICYyVlim8RnFylwSiH
	 jHwU+C0tYR8MMr94OXgP/fgMQ+wNQM4YkGqI35zL7O8MJlMIBSDmZ22e7APNWQjKH+vtD
	 /78UMxIufyjO95qfOVkC/ws1tOanH2fiHcOCUnZEoMfDl5vVrWVaPNBFpISHTe6Jzkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mrLEC/tUIlpyHMdC0wLVawPYUHVLQLEsP0xd9iCsuyc=;
	b=llniPL7/yKOyXWW/nkYQb4dajrGU90hsRrC7oKjQZ7dtP7XMmFooDLUiPs3glPRJq+BN
	 NQfyXVC0PVBhgGq+RhSJ0BiGfWLqZE524eyAZf/xnUc90VYS5mBmN9TI40nZB9jsVGb7r
	 bFPmE4/IQ2TLCzGifTk4ZNitw1mlLJWTjXCKwJJ7SRhDdMbrL1vuzQSASEpoAntFWfiXh
	 sm4lSkQ7nUIbbddt8Xgcis909paCSV+UpfWtUzrGYi4UYpUS95fAlFSBBL9RzxstdbcZV
	 KytCfhnKr2Jo8zwIO1fgr23rqU1TNIE5nfw10HS+RMsXsOg3vpL0ATXGumCTYEb4txw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9JhueEw;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D574606A32C
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D574606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9JhueEw
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f041f88577so40190735ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719100; x=1796323900; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrLEC/tUIlpyHMdC0wLVawPYUHVLQLEsP0xd9iCsuyc=;
        b=u9JhueEwMYHXpZtY5shWVY1vKrtGKLcAUPFh2zqegm4kvj+VEpvgme90+hxXlxApJu
         ECmrEHMZrCPSyKnnvhKgPLKwGoMtgYf/pVGT5Sg3lEplnsgT7HJKwykO8CzaDNjg2yEP
         lVaFMEcGzPRgKjVPCD8I52r/Swv8Zatx1ZN1v01N8KLV0bF/NxM6IyINZNFq17UYzCa8
         wdWhSUZDP7DMwyF+cFk5W/SeIAMlKEqbpKupjZi/hLg6PVS6t9IiogsOsEH90khSrcyQ
         zJhY915X1T84qGrK+z8fH/D1KuWFngPwpFGqIwcOOinfbOnve5TuRLnjFqnGzsghQInN
         69Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719100; x=1796323900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrLEC/tUIlpyHMdC0wLVawPYUHVLQLEsP0xd9iCsuyc=;
        b=DeZciyvrJQb5GA2FmpHaOSy9LSae74Fx8eOttfUHuBYY5L5LvtOzG95mdHXCezKB/7
         uXTPG1oRQB261x6k1vcFn1nGPUuu09xOSjgCNpYEGOzTRAi7Wotc1oWuNqCcXnuRDilB
         X8Hx5rIwGpHvfvBLWqYwkkja000wFIG6RAqfEmdrFodcH70ZQWv6z4kPUJz74wu2x5lE
         qFpW7r5Y/yRDeMYZ+VQCH4zn1qehAfh/jLCstaEWjfRg1jtjG/uKvCBIA42YzbclnmgY
         bByLUkmceSxeUFsqKkz6D7YIDhbHA8UXGhYo0DEtYOUpbvdBwL0P4NqBd2tSwBaBieii
         8HFw==
X-Forwarded-Encrypted: i=1; AL+hErHNbQHozWKkb+vBVOPHQQLcE0l7XeYhsXbZWZghaTczNDePAKRaWEzSlD/0I588ElCqDk9nyksiYshS@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/N+0lUKjKLQ3UU6QqBXjLVJL/GMR7rzXtIM1iXgOO3sgImPqyV
	IF4k3sKVZvwuyrulLOlqzgsf7rdb1wGDNWbSYADxbJG+NceUAkUdt6aj
X-Gm-Gg: AZFdTZdwR20oSd4gxcvi96WNoHlLfSezFNLE54m/etWNzkuIhib/QPyEyCTaLidrYKo
	ZezcTu9qPDvjCwG24XpHcIQLpAdKgLgZj9g3yj666AU7I6484aMeZrI9TRQcEmXTv78+bqr7jaJ
	s5LNrYPrh+y+Q1ZxI9Hwl1o5tZtlT83bosVABVQvyte5m9ugzD+MzVgBeDHaM75Eh8fuF9AlGoX
	PB7XROrEB9CarBx/TA3g+zmTCDdXL+sPr5YdMF9iRcju8C2IwCYBPzKEMwiAQv7aF6e9BERpRuC
	yKf6JGliRh5St4EqdMBwX7hrIRR8pvmsDyzSBiKW2GigwDeed1Qq7ABQrghGPAm3Hp/kRqQs0Ms
	1ALdqITe8oZgB3UqZi53mUz5P2B5eWUfXLAdC3YQZetovXRqo8TphMEvFrhn+8MLrQbpy9slU+z
	oIb8rzy9P+Ox36Y5YrcX8aA4tqQT00Eg8yX3O0Z5nXWUANaZFQxnGqIADTqJdpnXCkf6hClMaBu
	1uUDCQZhwSRDXcmvzBfyO+EO6Wx3kfh4vv/ZAAFv8qzo4fTkdZsMazTJ/0qXj4peA/vHxMqG4xA
	Ef1U/fDzlWR2iikDYbSWloW57+jugL2wkxrKx/7Nmy+BwbEy9hZBZEz9nxOcREsvHGJZkKeLo68
	u/sDYGj6nZdPmwQNX5VnpTbo=
X-Received: by 2002:a17:903:32ce:b0:2e9:7ff5:5459 with SMTP id d9443c01a7336-2f03f17d17amr238824525ad.15.1795719099914;
        Thu, 26 Nov 2026 10:51:39 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:39 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 2/7] irqchip/goldfish-pic: Use for_each_set_bit() to iterate pending IRQ
Date: Thu, 26 Nov 2026 18:51:15 +0000
Message-ID: <20261126185120.3815699-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
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

Use for_each_set_bit() instead of open-coding the loop with __fls()
in goldfish_pic_cascade() to simplify the code.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/irq-goldfish-pic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index c3c33f066140..12113ca90872 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/bitops.h>
 #include <linux/goldfish.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -35,16 +36,14 @@ static void goldfish_pic_cascade(struct irq_desc *desc)
 {
 	struct goldfish_pic_data *gfpic = irq_desc_get_handler_data(desc);
 	struct irq_chip *host_chip = irq_desc_get_chip(desc);
-	u32 pending, hwirq;
+	unsigned long pending;
+	u32 hwirq;
 
 	chained_irq_enter(host_chip, desc);
 
 	pending = gf_ioread32(gfpic->base + GFPIC_REG_IRQ_PENDING);
-	while (pending) {
-		hwirq = __fls(pending);
+	for_each_set_bit(hwirq, &pending, GFPIC_NR_IRQS)
 		generic_handle_domain_irq(gfpic->irq_domain, hwirq);
-		pending &= ~(1 << hwirq);
-	}
 
 	chained_irq_exit(host_chip, desc);
 }
-- 
2.56.1.839.g22a8290db9-goog


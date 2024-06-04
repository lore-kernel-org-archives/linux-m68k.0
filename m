Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92CA148305
	for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Jun 2024 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717518142; cv=none; b=gmL6i5U1//gU7tAJAMVnOS/3jgnxWg1PZWAhELBTWJoNYf5AMgOAnv1ntzckOQRvNuW2/9k9ZpUfyOzkcPcuNXAgsp6KEWG3VaK4ULGSNdMbTGVuiXv41rY4ZEqD3EvE+ze4rFjgTiZ8UhqQ2cCEWS7kBp+pQYclbLhzch85VpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717518142; c=relaxed/simple;
	bh=4q2hlNa+zDXJa5COBXQIsc3F14V8x6epzxiAsFAZOoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZSVrfTMkZLh6svOcIdlo5rB6I1Z24V+BReEJleNT0ff2GhfkdBbQ0YbToxZpzqg7sg4oJ0oxkqjweUDYD2m5FCZUu8dTsJUqAWt4689XRd4hGpHhZTjdoK7b8a+h8OETmjpn1oc+khQGsZeN8oaYWG9jdpaW/NDApXXMausgQdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbXd/hJP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbXd/hJP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4214f52b810so10989315e9.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 04 Jun 2024 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717518139; x=1718122939; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWy2LKPjdhg95BnqbKt1+lV4wGwDYmeoHKDzPgQ6cjs=;
        b=IbXd/hJPOz8hLu2uDQO23Lp+SbKMo2xJpFjIshAI+53fYT3desNjsrQH47e1iYfksg
         hGHiUvcdAPMzhGWOCvMCTrzPy2ljmzDIBQ3MsAblaX5k9ebIEngye0KxAHWXgcOoOn5p
         i95vQWCBPZGfqO9LwytiuR7fMM7oNBvhJNZ4USfqFjHB7J0NpYtTzYE9fgRUTY4IoCtR
         hIWW2QHB5i5N86L/T7KYDRQLTxOxB4N+S5DdTVaTirfiONC0HWiX51n2Qv3N2EAtsGKs
         eBhGGrJVjEt8HggxjdQYmpT6QBwyM7MT9vj24FnN9is6H9YE4V7XKIjajdYCf4hzPdxi
         O2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717518139; x=1718122939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWy2LKPjdhg95BnqbKt1+lV4wGwDYmeoHKDzPgQ6cjs=;
        b=pEq1KSymjAa9A1QeGW8y/dnKEJR+bLHs3/+ItcWYjl4hIxAcbPMwckNFqeS6b1Cb6H
         htTrtwIoahZP4GspQ3ahK3nHE2aiIjxqGx82vnHDlFDvj12qkKmhRvCWt7sDCkaJMVCL
         LhiZFpubySWeq4LOuU/BJBH4Ah7EdiCoutDLxVZbgonpUDyvnzyfcUl7Vg13EHuJDz5D
         +/Hkbn0x8wjIhK5lLXrgLvLxhaY8r/uI2kCyZFNsZxha1/SzviDOZ//iNxjhRq8Ghjcn
         4bJ67hLdGWtQmP5eiHzXjjSQIB/S++Iu7/Fj19FkmrFXjrjEjWVZnFVVnRDll3bsY/Bu
         E4rQ==
X-Gm-Message-State: AOJu0YzPypIqOyL6939i6Y325XnE0I6VoYUgmcx0qHVqp9v5x+GMaIk9
	fr6EMkik277i9oIsERLxghRzaaQK4p6zGP3Mnc/MuRDyvaGBHEQb
X-Google-Smtp-Source: AGHT+IGQcn2kH+FRLVL+o4Kd4ZgcFfbOBcIgSYJPbm8MUBhAkjLzud9V+0CWj8XCDLx/0EhwMUv/VQ==
X-Received: by 2002:adf:e38a:0:b0:354:f286:4f0c with SMTP id ffacd0b85a97d-35e0f325d08mr11928496f8f.51.1717518138501;
        Tue, 04 Jun 2024 09:22:18 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:1c26:7f4d:9e87:9ebb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04ca981sm11955409f8f.33.2024.06.04.09.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:22:18 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ata: pata_buddha: pata_gayle: consolidate .sff_data_xfer around libata::ata_sff_data_xfer()
Date: Tue,  4 Jun 2024 18:22:17 +0200
Message-Id: <20240604162217.484789-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pata_buddha_data_xfer(), pata_gayle_data_xfer() and ata_sff_data_xfer() are the
same function, consolidate around libata::ata_sff_data_xfer().

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/ata/pata_buddha.c | 40 ++-------------------------------------
 drivers/ata/pata_gayle.c  | 40 ++-------------------------------------
 2 files changed, 4 insertions(+), 76 deletions(-)

diff --git a/drivers/ata/pata_buddha.c b/drivers/ata/pata_buddha.c
index c36ee991d5e5..234278eb26e1 100644
--- a/drivers/ata/pata_buddha.c
+++ b/drivers/ata/pata_buddha.c
@@ -60,42 +60,6 @@ static const struct scsi_host_template pata_buddha_sht = {
 	ATA_PIO_SHT(DRV_NAME),
 };
 
-/* FIXME: is this needed? */
-static unsigned int pata_buddha_data_xfer(struct ata_queued_cmd *qc,
-					 unsigned char *buf,
-					 unsigned int buflen, int rw)
-{
-	struct ata_device *dev = qc->dev;
-	struct ata_port *ap = dev->link->ap;
-	void __iomem *data_addr = ap->ioaddr.data_addr;
-	unsigned int words = buflen >> 1;
-
-	/* Transfer multiple of 2 bytes */
-	if (rw == READ)
-		raw_insw((u16 *)data_addr, (u16 *)buf, words);
-	else
-		raw_outsw((u16 *)data_addr, (u16 *)buf, words);
-
-	/* Transfer trailing byte, if any. */
-	if (unlikely(buflen & 0x01)) {
-		unsigned char pad[2] = { };
-
-		/* Point buf to the tail of buffer */
-		buf += buflen - 1;
-
-		if (rw == READ) {
-			raw_insw((u16 *)data_addr, (u16 *)pad, 1);
-			*buf = pad[0];
-		} else {
-			pad[0] = *buf;
-			raw_outsw((u16 *)data_addr, (u16 *)pad, 1);
-		}
-		words++;
-	}
-
-	return words << 1;
-}
-
 /*
  * Provide our own set_mode() as we don't want to change anything that has
  * already been configured..
@@ -131,7 +95,7 @@ static void pata_xsurf_irq_clear(struct ata_port *ap)
 
 static struct ata_port_operations pata_buddha_ops = {
 	.inherits	= &ata_sff_port_ops,
-	.sff_data_xfer	= pata_buddha_data_xfer,
+	.sff_data_xfer	= ata_sff_data_xfer,
 	.sff_irq_check	= pata_buddha_irq_check,
 	.cable_detect	= ata_cable_unknown,
 	.set_mode	= pata_buddha_set_mode,
@@ -139,7 +103,7 @@ static struct ata_port_operations pata_buddha_ops = {
 
 static struct ata_port_operations pata_xsurf_ops = {
 	.inherits	= &ata_sff_port_ops,
-	.sff_data_xfer	= pata_buddha_data_xfer,
+	.sff_data_xfer	= ata_sff_data_xfer,
 	.sff_irq_check	= pata_buddha_irq_check,
 	.sff_irq_clear	= pata_xsurf_irq_clear,
 	.cable_detect	= ata_cable_unknown,
diff --git a/drivers/ata/pata_gayle.c b/drivers/ata/pata_gayle.c
index 3bdbe2b65a2b..febffc36a18f 100644
--- a/drivers/ata/pata_gayle.c
+++ b/drivers/ata/pata_gayle.c
@@ -38,42 +38,6 @@ static const struct scsi_host_template pata_gayle_sht = {
 	ATA_PIO_SHT(DRV_NAME),
 };
 
-/* FIXME: is this needed? */
-static unsigned int pata_gayle_data_xfer(struct ata_queued_cmd *qc,
-					 unsigned char *buf,
-					 unsigned int buflen, int rw)
-{
-	struct ata_device *dev = qc->dev;
-	struct ata_port *ap = dev->link->ap;
-	void __iomem *data_addr = ap->ioaddr.data_addr;
-	unsigned int words = buflen >> 1;
-
-	/* Transfer multiple of 2 bytes */
-	if (rw == READ)
-		raw_insw((u16 *)data_addr, (u16 *)buf, words);
-	else
-		raw_outsw((u16 *)data_addr, (u16 *)buf, words);
-
-	/* Transfer trailing byte, if any. */
-	if (unlikely(buflen & 0x01)) {
-		unsigned char pad[2] = { };
-
-		/* Point buf to the tail of buffer */
-		buf += buflen - 1;
-
-		if (rw == READ) {
-			raw_insw((u16 *)data_addr, (u16 *)pad, 1);
-			*buf = pad[0];
-		} else {
-			pad[0] = *buf;
-			raw_outsw((u16 *)data_addr, (u16 *)pad, 1);
-		}
-		words++;
-	}
-
-	return words << 1;
-}
-
 /*
  * Provide our own set_mode() as we don't want to change anything that has
  * already been configured..
@@ -110,7 +74,7 @@ static void pata_gayle_irq_clear(struct ata_port *ap)
 
 static struct ata_port_operations pata_gayle_a1200_ops = {
 	.inherits	= &ata_sff_port_ops,
-	.sff_data_xfer	= pata_gayle_data_xfer,
+	.sff_data_xfer	= ata_sff_data_xfer,
 	.sff_irq_check	= pata_gayle_irq_check,
 	.sff_irq_clear	= pata_gayle_irq_clear,
 	.cable_detect	= ata_cable_unknown,
@@ -119,7 +83,7 @@ static struct ata_port_operations pata_gayle_a1200_ops = {
 
 static struct ata_port_operations pata_gayle_a4000_ops = {
 	.inherits	= &ata_sff_port_ops,
-	.sff_data_xfer	= pata_gayle_data_xfer,
+	.sff_data_xfer	= ata_sff_data_xfer,
 	.cable_detect	= ata_cable_unknown,
 	.set_mode	= pata_gayle_set_mode,
 };
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719119;
	b=ZDA8VjlsOiIN9+bOBHc4kaDdv+JtYRVrKS8K6yf/EbVLKA5yc7yqs/6c8Vt0/DCFYjK0
	 eQb+Th8nC23qeARmUj5WIE32F6F0EfqbqVXlLB8H+ILUsFwiUc2MmVLmX3oLJp7WVADf4
	 3gdhgsTBNppTANIE7Vu6j47sU6W4e4ZXtdXPeFQ2R0K4zmUF9sJaI87GTP0iU7bSZzui4
	 aInJ08UJMIUaJRgVHwMQjGDdeE5Xj1wMfplYwOqMnOfcTV3ZIhVLUdha58DHztXPWcvvw
	 kx+o5rrvlvmgIWg2AgmB7RzYPD+xk4NuFtXKNAHH9p6Fnq3/BcGxHpH0SiDjeR+FZ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XMYQyEtwx5GngECoxaqxQHLv5tzhAgtmgz3LLMihPqo=;
	b=o0EKq2qA1AY7Zpz3Abhp7ElAU4+n0SYIpzympam/2IjblRpNTSTqv8DP1eqen3015Ifc
	 7dtJZp0YQx5+TRwiS069aOOiOPne8oGaHgAQM35rIjbdRiOCDdyu4p9l8HmGgNhbEjRrB
	 gx/rlIxT/VIIdShy8DWpo74XXrZQTRUoNKFoO5HxhCZNwNy6xg0s8mq5YJGuiUlJUYP8o
	 P4YLaSWepkXN/ZlUphN25ivkB3bJBIiVBXGefzELC/76uXFKa11xWpT9HXVQ8wAj5kSQs
	 UMCkeCe0ze+/sbPs9GezoJbgiwJzVyNwyFZizZDHKnyhIKG3o+Je/rkF+owCXzqnb0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsiyDAU8;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB72606A31E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB72606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsiyDAU8
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0464dd6b6so45119575ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719118; x=1796323918; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMYQyEtwx5GngECoxaqxQHLv5tzhAgtmgz3LLMihPqo=;
        b=tsiyDAU8kjtOxlKPDcmY0gaC4Mn/YIasbPP+g47JZlP1Vc1FfcXjXlaWtSwEu/BVdk
         pi766b2wgVc3a2Zpqn7vTkOiuFqAd3Q9/ntRRZwIAj2jLLnJZrr3QQLtXTKvwCdC7KbO
         138DYmS7WAmQyY76jnVAPxiQteAP7EaaAJisCnOCKZvrgl6PzZLRG0CHjRRIt5aYS63E
         uhargFaCeBXjfnjs90n28JSuxp+Vq/G4AVI9fV1CzHpBY+6l0rh+x6ntLiLtVms0o8nR
         tJGDH8zmlWqrdf++Bu+AJ8RmUbODF+j1YuSTllL1nJ6L2dce0yKtbCvmzqQArDkeJqkt
         fWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719118; x=1796323918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMYQyEtwx5GngECoxaqxQHLv5tzhAgtmgz3LLMihPqo=;
        b=nNieErbAYe0AuFjhRvNNCOUdCGTO1uhl0z+KwHVDPlEOaJt+x4I4pvcFpibv6YVb1c
         NUVn3/smVW1nOHV2H/BsCVm0nwL0ayt6ve1Azg3jpFtcl0ry/zUCrvB8n/q4CYrjQyEe
         3RlGDYP+bxaMfWMGwhyT61nmGwkg2gzDHzp9c6YBIx3c5YWERErNZrSRWcWuKTBwcpCk
         74aFwi8+T9ZxcuMKNm+TTkwW14mYJd1FqPDPZKyPsv5T6F8eKkKktxmez7xx9UwKUn3J
         HBR88XN5axzLaqToCWuQldaGPNPNBvI3MP1VCabDL6DbPfaqB95/3TuEW0sEIDQRRVjZ
         C6WQ==
X-Forwarded-Encrypted: i=1; AL+hErH+9xcXH5mtbZjOoxGkXzG/MW3MaHb7XFXjTQq2//w6iatMXHFc/RmrRVRLIYfpWCUYcJccVenktAmZ@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/ASWR6bO9yAO+ijjDTD9V5P8oLRkRzNcvOKP76PYwuVzmXYoHB
	ALw7u2chrDrAUPhiJmuZKcOG0RiYWX6nck3fAitYC2F1E7fQQ5WVHWHZ
X-Gm-Gg: AZFdTZe4jQlPQzm/k5viYdYum+NJUDB3CoCNPnu4mlFmkF7I7fW6kX2N6yhy35TX6Ic
	OR6OFPCnucZEQ4QjYMibT++HSqaEtAL9NRwukv/OPr1nwBo75wesXxAWRX+yE7/SI//HJuA2PXq
	EpthtHlqHmiJFe8ylFf4p3n54gJXBS5pbcCf4cpF4abzSJvKQ3SqBR350S5T+AsvTkwlO3AyXuN
	d1A16J7//VMmuOfSyoAqJfmmYB0lPiQL5wkJ6uk+1Pniv75d5jt94dbYmR1HyWTieAxYj5GJIhF
	0dSR5n7qxE+Q9cYcIJp68jUADsUfcgl5DM4I+hY2SX1SyM/+dWkDbK94AHQlzfK+mW97tJfr69C
	G+j0Gar//U13ut9rFv+ChawqhBMHAGcRA7Ym2eM8nFfDZB+oZY4lu9cGq2Q1ChxJM4h42m7c75w
	KClwRMj9z6NDCN2IOHTSN0lPUSs/5gzetEhKuowWOnbwUQPidn2ytMiUaBeq5zIU55YE/X51uhU
	P3DfMr5Xt/oracUKXUsfrUshU2Oc37CAYAWvitAix6dtM0P+52Pas0tX8CB2wvYypsjmez6VizQ
	2TqBspn8wwkz0jq74Wcqdh8tSRZxXaAP1wduELzn3SNZ0aDtnxvrVYRk81i2FfQOxOzi8QuUW92
	XTva7LiewMf0N08fia9bcoik=
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr207485285ad.7.1795719118446;
        Thu, 26 Nov 2026 10:51:58 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:57 -0800 (PST)
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
Subject: [PATCH v2 7/7] MAINTAINERS: Update maintainer for goldfish PIC driver
Date: Thu, 26 Nov 2026 18:51:20 +0000
Message-ID: <20261126185120.3815699-8-visitorckw@gmail.com>
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

Miodrag Dinic's email address bounces. Take over maintainership of the
goldfish PIC driver and change the status from Supported to Maintained.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f6c37e1dbee7..b69c1a334587 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2000,8 +2000,8 @@ F:	Documentation/netlink/specs/binder.yaml
 F:	drivers/android/
 
 ANDROID GOLDFISH PIC DRIVER
-M:	Miodrag Dinic <miodrag.dinic@mips.com>
-S:	Supported
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml
 F:	drivers/irqchip/irq-goldfish-pic.c
 F:	include/linux/irqchip/irq-goldfish-pic.h
-- 
2.56.1.839.g22a8290db9-goog


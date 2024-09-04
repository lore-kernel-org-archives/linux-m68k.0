Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950CE1DC05C
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Sep 2024 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459988; cv=none; b=qk2Nb9AOZUrEb1sxSEHctZbtNtOrBumyZL3vF6LbL3IciAJmK2YQlXUMXEmItMwb47rlLMZNMaL7BH/cIIpI1cG472LJ0NhUmYPcYbHysVitD4JGIjdWXmaSmC3czDUL3gqfR9OPwldEEkCDDNqqrcKJ+1yF0SR3fP+/pI7yF7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459988; c=relaxed/simple;
	bh=JTAfJuc8CEhMfVKnB1OHnMcA3Cwy9VgtGg+atB4qv5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tMdK8m2OiLdLJz8YjNPV/1oHhWKfgnCwue3MYUbjc+JGVKpYGKQkxm13Hq0wYcgFel9QA+st9nn7zDn2Z5fzfz3ut3+3AoRQN/JYz149AS9zzBTjVt1QAPTz/q7jR/8ZVh1uVOMTcuuRlk/2yQk3ugIdBfGcyf4+0/efgr4uT1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=USaydPoS; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="USaydPoS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A33E81BF20C;
	Wed,  4 Sep 2024 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1725459985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MENUZux6zY1MvMtEZZaCqvuw/b6RpCHFCjp4OOGqZ+I=;
	b=USaydPoS7KRncnf4DVHnbFNlBNDwGKjEgkRxQzO78mpnD5QwgbuU2CNkDYWdUMjpKrw5za
	WfgupQH1LRubehYjODiAtj9lQyq+g0PsKwhGdKv2AHTXb7PKtPnSARXtnTlcMo/MA5yZdL
	MvFhBfOGuNxR4e6avIJfMNZ2W/EfLwiOP5uhOSmHPgdgXIoU1UEHY77N8TCWLFprRQwHMR
	mKtC6VbXxOhc7VOJB53wo3IvE2DS9m/U3DrAOEmJ7kRCBuNqUtUTnX74a3AQA8Rn3Oqi6Y
	20vtIqgDD5/wqTwV4u41S0R9IEWgOA+As8Pv/q7V4QB680909EeBebLhf7aenA==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Wed, 04 Sep 2024 16:26:14 +0200
Subject: [PATCH] m68k: disable SRAM at startup
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-fix-cf-virt-mem-sram-v1-1-fb007028d717@yoseli.org>
X-B4-Tracking: v=1; b=H4sIAAVu2GYC/x2MQQqAMAzAvjJ6tjDHQPQr4mFurfYwlU5EEP/u8
 BhI8kAhFSowmAeULimybxXaxkBcw7YQSqoMzjpve+uR5cbIeImemClj0ZAxzCHNrmNmx1DTQ6l
 6/3ac3vcDATKjwWYAAAA=
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725459984; l=1315;
 i=jeanmichel.hautbois@yoseli.org; s=20240608; h=from:subject:message-id;
 bh=JTAfJuc8CEhMfVKnB1OHnMcA3Cwy9VgtGg+atB4qv5o=;
 b=VtSjZwU+CAjQ5kkErA4EvNrzW3JBhDGiv/jTbldRTdQe8FKPa4vSOX3Bj/XAgx5MUoELLDklW
 SvpAZ6G5kj6DD4Y1YNWCAAhfh945xlyj7NrzkWpgiiLE+R70WOfFXD4
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=oMZuYhJzT0j5MI73RlNUVYaA8VdWpFR/Sao0JKz1D2I=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Some of the internal SoC registers have a higher priority over the MMU
virtual mappings. The SRAM bank is one of them. If the bootloader
enables the internal SRAM at address 0x80000000, virtual memory access
at this address will not hit the MMU - so no TLB data misses would
occurr.

Since 0x80000000 is the virtual start address of all applications that
bit of memory is getting stomped over with inconsistent code and data
access.

Fix it by disabling the internal SRAM at startup.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
Tested-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/m68k/coldfire/head.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
index c6d7fd28c6023..3901a49c47c89 100644
--- a/arch/m68k/coldfire/head.S
+++ b/arch/m68k/coldfire/head.S
@@ -207,6 +207,10 @@ _start:
 	movec	%d0,%CACR
 	nop
 
+	movel   #0,%d0
+	movec   %d0,%rambar
+	nop
+
 #ifdef CONFIG_MMU
 	/*
 	 *	Identity mapping for the kernel region.

---
base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
change-id: 20240904-fix-cf-virt-mem-sram-abadb27fff2f

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


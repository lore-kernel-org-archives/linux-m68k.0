Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2E725A35C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883137; cv=none; b=kYMbYYvrJe9WaED2j07wIRDyP4tUS1i6wtC1fU+EKv5+rzGK8KKmn2imJ+3PQBLmM/f4Bh1EA54ealZSc/oyEfkx+Pnh0axwa3tIFr14BNNFW2cLWGc11zRloDMaDw9LcJKKBYzp8VkVLKbCvD7GoB2cq7Ce7ZVjmWRo1WEmEuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883137; c=relaxed/simple;
	bh=FMS8kBtu0s1aSLYAUoDX4Su2VJBLZMxSrJ7bIzY1s4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q/ACBHHIvaOFD8j7iNhWfGhIDd20r3DykQ/Md7qGavBkXBOejjVvwXSV2KAkyiQiuUcbrWPIohWL2O+hUTt3q/Bp6/hqS0hwqZHxZupg8hjY+v++q9vxayPTsCLN1k4bc7337IsgiLATFEvLPXfFW+bQ6jiargKzTlQRwI1s0HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBEE15C2D0F;
	Tue, 18 Feb 2025 12:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF20C4CEE2;
	Tue, 18 Feb 2025 12:52:12 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 00/13] m68k: coldfire: proof-of-concept devicetree
Date: Tue, 18 Feb 2025 22:46:20 +1000
Message-ID: <20250218125124.2692982-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proof of Concept only - not for merging.

The following patch set is a minimal conversion of two ColdFire platforms
from using the legacy style platform device configuration to using a
devicetree. The two platform types supported here are one each of a full
MMU target (M5475EVB) and nommu (M5208EVB).

It takes a few short cuts (that is hacks) to prove it is possible and show
how it can be done. The problems and more work required include:

. proper conversion to use clock framework
. proper resource setup for interrupt controllers
. conversion of more ColdFire peripherals to use devicetree
. cleanup of changes for sending to appropriate lists/maintainers

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig.cpu                                |    1 
 arch/m68k/boot/dts/Makefile                          |    1 
 arch/m68k/coldfire/device.c                          |    4 
 b/Documentation/devicetree/bindings/net/fsl,fec.yaml |    1 
 b/arch/m68k/Kconfig                                  |    2 
 b/arch/m68k/Kconfig.cpu                              |    2 
 b/arch/m68k/Kconfig.devices                          |   11 
 b/arch/m68k/boot/dts/Makefile                        |    4 
 b/arch/m68k/boot/dts/mcf5208evb.dts                  |   57 ++++
 b/arch/m68k/boot/dts/mcf5475evb.dts                  |   55 ++++
 b/arch/m68k/coldfire/clk.c                           |    8 
 b/arch/m68k/coldfire/device.c                        |  221 ++++++++++++++++---
 b/arch/m68k/coldfire/intc-2.c                        |   59 ++++-
 b/arch/m68k/coldfire/intc-simr.c                     |   61 ++++-
 b/arch/m68k/coldfire/intc.c                          |   50 +++-
 b/arch/m68k/include/asm/mcfuart.h                    |   12 -
 b/arch/m68k/kernel/Makefile                          |    1 
 b/arch/m68k/kernel/embedded_dtb.S                    |   19 +
 b/arch/m68k/kernel/setup_mm.c                        |   33 ++
 b/arch/m68k/kernel/setup_no.c                        |   33 ++
 b/arch/m68k/kernel/vmlinux-nommu.lds                 |    9 
 b/arch/m68k/kernel/vmlinux-std.lds                   |   10 
 b/drivers/net/ethernet/freescale/fec_main.c          |    5 
 b/drivers/tty/serial/mcf.c                           |   49 ++--
 drivers/tty/serial/mcf.c                             |   12 +
 25 files changed, 627 insertions(+), 93 deletions(-)


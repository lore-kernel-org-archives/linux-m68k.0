Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F8B4D17B3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Oct 2026 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893339; cv=none; b=QqZcMdlsNcztXc8e48oKhFNYkHmAyGXSItkTLxf7xPD2s0pZsPdn9F5sTpuRCkwCgDg5IJboxvvx46klYQ02CpPuKYfHqv3GLF1PmUf2cukj1/dwQH+NuwWGp87mkcxhnDvzFcU/OxJ6WxfuaFo5B4804h2jlz8gOjAOHCo5yJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893339; c=relaxed/simple;
	bh=PBALWC1OrzXlrNThhw6DnFYPw/+t2E9n8UIn4ARMX2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a4pux132UXll+BVEfvediFZelBu7aWBw4zpkP14lFZp1B9ainxt4NRbl0MAcRv8J93Rz9JGoW0WS5WI6MYG/UVvhNckvgV6N3X6ZsnSjat5Xuj1U7Qw7gektIC2xzPEKh6DZxs3JEAIyyluHYStHsfQvKLlFmlIt5O31JP8txMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6128E41A55;
	Tue, 13 Oct 2026 12:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FE31F00893;
	Tue, 13 Oct 2026 12:08:56 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org,
	linux-serial@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 0/5] serial: mcf: add devicetree support
Date: Tue, 13 Oct 2026 22:06:58 +1000
Message-ID: <20261013120831.1046590-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is designed to add devicetree support to the ColdFire
serial driver (mcf.c). The m68k/ColdFire arch support is not devicetree
capable itself yet, but this is an important first step.

The first patch is a cleanup, the second is about normalizing the existing
platform device setup. The third changes the driver to always use dynamic
memory allocation for devices, the forth and fifth patches add the
devicetree support itself.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 b/Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml |   43 ++
 b/arch/m68k/coldfire/device.c                                |  179 +++++++----
 b/arch/m68k/include/asm/mcfuart.h                            |   10 
 b/drivers/tty/serial/mcf.c                                   |    4 
 drivers/tty/serial/mcf.c                                     |   93 +++--
 5 files changed, 235 insertions(+), 94 deletions(-)


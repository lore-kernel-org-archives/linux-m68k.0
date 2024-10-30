Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965211D0DF6
	for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Oct 2024 19:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730318220; cv=none; b=Z+rIu38grblR33096ublnlZBg5BS3JWQJf/iX3PGUO+UXFompOAVZMwFlqfRQjYMPAQgK1fyyGkLL1gL5QrI8qNx+2Gttjxe/J6hvwwYifb/V0Bly+vyad3TUKUjZM4ryc4+ts4NgMZtIvtPhxB/09jSvihx/evNqTpkhm45DBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730318220; c=relaxed/simple;
	bh=ycBA5rQ633qHtrgsH/1UuH4lcA9FLFSnQ1HGmzbyy/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D26Y0kmvSpEhw2rtJP63UTLjkCxBFPmqRnQaWhxYi0Sh+BOzdXnJwzARicSxovJVlP92fIp8iGGIsgozDG2linphNaGZgfxP0lZR+vFMxnXzHyG7IQ+OMB8Zz8T3Ki7c+7LozFZ2sUwcwiGINzyBCguz82eJxYhvrdQl4g8W/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxAjStk3; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxAjStk3"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F00205C5C81;
	Wed, 30 Oct 2024 19:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C23BC4CECE;
	Wed, 30 Oct 2024 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730318217;
	bh=ycBA5rQ633qHtrgsH/1UuH4lcA9FLFSnQ1HGmzbyy/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PxAjStk3NRHbwgxtP4Xu9QCLn1WSKnikydeH/as344Dy+uAUjbiDlK1OjCjuRhNR4
	 H+fVqzpmPoJHtYm+7Adjhe9wFk1gVTh7brSffpzqG2J+6sXRlnDuz5saaROzPybqQQ
	 1zRu466XcdAHGY+anFQDZbmY+A/PZzEJe5m4iAZ7XJjnWB2WAM7jQg1pn4ljIXhI+a
	 GEmB/BhdK87ApE7dc+AxtJCR2vlmHj8escxses/b1Mf/hiYtj8MMQ1A2NR3/fsSjDU
	 M2Tw8Px/oGVD852DFa5H9KTwma0rO/M/B6pPc1mrvupa0vV34/IgwVeUYWhPkVG2LQ
	 SipedeRmhh23g==
From: Arnd Bergmann <arnd@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] m68k: select 68020 as fallback for classic
Date: Wed, 30 Oct 2024 20:56:14 +0100
Message-Id: <20241030195638.22542-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241030195638.22542-1-arnd@kernel.org>
References: <20241030195638.22542-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building without a CPU selected does not work.

Change the Kconfig logic slightly to make sure we always pick
68020 if nothing else is enabled. There are still some
intentional warnings for builds with all platforms disabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/Kconfig.cpu | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index e7b5f6b55947..c9a7e602d8a4 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -21,6 +21,7 @@ choice
 config M68KCLASSIC
 	bool "Classic M68K CPU/machine family support"
 	select HAVE_ARCH_PFN_VALID
+	select M68020 if MMU && !(M68030 || M68040 || M68060)
 
 config COLDFIRE
 	bool "Coldfire CPU family support"
-- 
2.39.5


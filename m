Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA474219303
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 Jul 2026 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784467209; cv=none; b=L5QNxYwxItwkGkJK8e61W+lxHgrYJOWjecORbPzPqPUqeJzmwTMvs8b2D7LhnRpRM+tActh43XEaGjUgxnA51zCx6keR+D1mK16+T9t4Q/88mh6exRpgbkugkoizd+PQoInCvtt4AEdo9TctrBb0dnn2CE1sbgdLfMTUN+Uysy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784467209; c=relaxed/simple;
	bh=x5fGYeWQIFczXpVMJe3BXwo6y1IrMNQ3YNFqR3NRZoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4LtA5JiIB01gGwuFF/FkY4fUBre/935n1m0v3pYIZCBeQx0/giBwikq8cN49H5d+GHFjedNrp4Ew4y6vJkONtzvBCbGszXx+uUMlOqQMFL7rD2SVbvdxpZBmP1EljZi69Rw7uVDECUkGws1dOSAeB81cj6rrFf2YLbIKg3FMRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROZvXyKW; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROZvXyKW"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F93B600BC;
	Sun, 19 Jul 2026 13:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95801F000E9;
	Sun, 19 Jul 2026 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784467207;
	bh=4d8u3R2TInNCc0qdjp4t52OMSIZuLE3zCqZ47gqpL3U=;
	h=From:To:Cc:Subject:Date;
	b=ROZvXyKWuZ7IgTaTpbGJh7sB6uUBJWSpV5KPwxD2Lzok4gsWi9hIJxoqvUG8Cm4r9
	 u1ru4Js2nsA+1J+jkOyHk9iqvb0xJ0OtZ/VuNzYwqPI0JsbSydDWveEaFJQkRZWyVV
	 UsuH4G5NCFF+eDWenVA1xfqD6e15JIfm/g/QxYwixLk7e7a0+SKArVkxnjTh9UJzgE
	 DAtFrUHrn+AzbyGUy5kCbrqPKngRg7iRuf5rAvqEalokf6zwsYi/PGIzjpInhqEi5y
	 He25IWxocadSLRbcjYt5Jp3+ldTeEluaN3BsS60vyFPS672x93pQGour/3quQdi8E2
	 28Shsf+P/y3mw==
From: Greg Ungerer <gerg@kernel.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Greg Ungerer <gerg@linux-m68k.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] m68k: coldfire: fix breakage of missed IO access update
Date: Sun, 19 Jul 2026 23:19:26 +1000
Message-ID: <20260719131926.1150032-1-gerg@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@linux-m68k.org>

Fix the last remaining breakage caused by missing a SoC IO access
update. Commit e1f3a00670d1 ("m68k: coldfire: use ColdFire specifc
IO access in SoC code") missed this read16() call which should be
mcf_read16().

Fixes: e1f3a00670d1 ("m68k: coldfire: use ColdFire specifc IO access in SoC code")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607180731.U4tiwFcQ-lkp@intel.com/
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/m528x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
index 3383b1ba106a..f9874bba9e45 100644
--- a/arch/m68k/coldfire/m528x.c
+++ b/arch/m68k/coldfire/m528x.c
@@ -110,7 +110,7 @@ void wildfiremod_halt(void)
 	printk(KERN_INFO "WildFireMod hibernating...\n");
 
 	/* Set portE.5 to Digital IO */
-	mcf_write16(read16(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
+	mcf_write16(mcf_read16(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
 
 	/* Make portE.5 an output */
 	mcf_write8(mcf_read8(MCFGPIO_PDDR_E) | (1 << 5), MCFGPIO_PDDR_E);
-- 
2.54.0


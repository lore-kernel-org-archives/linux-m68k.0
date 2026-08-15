Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B663345EBA
	for <linux-m68k@vger.kernel.org>; Sat, 15 Aug 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786779201; cv=none; b=HhOWvy6BOpMmsk96Lu+PhUOLUY42eDhHLonH+CTDv1+yUIMrl/vLPMu8j2thCmo1P7GIeeOp/5vW3gz8KiiBhbcdiCzpeAklPU50u0JbISCybS9U74FUT2ccytHEghOEBzn6yMjF9gmsBw4t2y0gTYHJHEXqSoBIlkQZfzz+o9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786779201; c=relaxed/simple;
	bh=+S3ikEVtQOz7W4YUPYRRnczCQLLT0AMxaly+8SFzEDU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F+jKjSfhPAXUMjVeMoPUHMAdY597Sn4vuONGXeEd03czMaW5HHiLHSVpWQFNMgCkFGqtmz0UNaAnXk9Ykv7DnT243xJNl4+nOsf0F7VQifBuwunRxpRq5iko/uMSwo2IDDanzxrXKP/XdZd7fG/1urA64D3e6huclcii2FQeJv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4hMVw758mYz1sQ43
	for <linux-m68k@vger.kernel.org>; Sat, 15 Aug 2026 09:24:23 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4hMVw75310z1sQ3h
	for <linux-m68k@vger.kernel.org>; Sat, 15 Aug 2026 09:24:23 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4hMVw74fjRz1qqlR
	for <linux-m68k@vger.kernel.org>; Sat, 15 Aug 2026 09:24:23 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id b4vJarCfUA70 for <linux-m68k@vger.kernel.org>;
 Sat, 15 Aug 2026 09:24:23 +0200 (CEST)
X-Auth-Info: ZF/Oy+Rspqy756tPTSYDck/S9l2zqDAHAzmBDQ9KOFJnZT91LCfzEiIQjA8zuaWb
Received: from igel.home (aftr-62-216-202-77.dynamic.mnet-online.de [62.216.202.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA
	for <linux-m68k@vger.kernel.org>; Sat, 15 Aug 2026 09:24:23 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 4DF582C0AE2; Sat, 15 Aug 2026 09:24:22 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: linux-m68k@vger.kernel.org
Subject: [PATCH] m68k: nfcon: don't call console_is_registered in nfcon_device
Date: Sat, 15 Aug 2026 09:24:22 +0200
Message-ID: <87ecfzsv6h.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Since 7c2af0f634f1 ("tty: tty_io: use console_list_lock for list
synchronization") show_cons_active calls the device method under the
console_list_lock, but console_is_registered tries to acquire
console_list_lock as well, causing a deadlock.  It should not be necessary
to check console_is_registered here since the function should not be
called in the fist place when the console is not registered.

Fixes: 7c2af0f634f1 ("tty: tty_io: use console_list_lock for list synchronization")
Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/emu/nfcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
index d41260672e24..f4657d9f4f15 100644
--- a/arch/m68k/emu/nfcon.c
+++ b/arch/m68k/emu/nfcon.c
@@ -49,7 +49,7 @@ static void nfcon_write(struct console *con, const char *str,
 static struct tty_driver *nfcon_device(struct console *con, int *index)
 {
 	*index = 0;
-	return console_is_registered(con) ? nfcon_tty_driver : NULL;
+	return nfcon_tty_driver;
 }
 
 static struct console nf_console = {
-- 
2.55.0


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

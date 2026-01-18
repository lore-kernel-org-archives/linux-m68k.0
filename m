Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B3B2EE611
	for <linux-m68k@lists.linux-m68k.org>; Sun, 18 Jan 2026 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768757642; cv=none; b=KfFtEXjB3MTpjfHzzIlVNTxYQ4nB17AdGhJu3ferRGbcMoInSNSlwBto5DTO2unbrPBn0p4D+ocw/+5kP27f7mLuQ3dNw1gSfW4GJBGrHfXuAn9c7thRJmmU4ef/ZsjP0eoD/biP6ZWkJnBv3nQD5f21CJ6tGwiU6WEa3msPnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768757642; c=relaxed/simple;
	bh=yQrvuAM+jyAa30aIDV8qGFS0NmslnywQ3ZtSVoKChjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WevbTxvs1HWgbg7G7VqDqvQLtRh3ufi6J7ZA9MjzTzsVNpP+C4fTLQr0KBtthzkatsMvAZHsJTwKqQqnfMSm+NwzYYo0Pl/kClmI5O9KeuAVj8SYnPy/lvMQrEbysPezXs4GUMceOOlZxFAlNcqzuzLOi8NMX4AkYWxzw8B9gZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I8zcESbG; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I8zcESbG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768757638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2t/tirZ2t6GUke0fiFkoZfIjHR57XL3GSnj23R3fG3s=;
	b=I8zcESbGD6z5UCziVUc2HKLfdA218Hlb0zqnBVccK5F+cnV5upenayJAMM3+geLA2Pffny
	N5hPd2Wq1bSKkGPCE4T4wKCHUEd8OlIQuSWez/fxKhEBIoN+CQpghxOvWTL18o4ZK0uUnq
	0XELhb7ol2zelZsHK+wh88qou7/ZonM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68knommu: Replace deprecated strcpy with strscpy in init_ucsimm
Date: Sun, 18 Jan 2026 18:33:49 +0100
Message-ID: <20260118173349.1197500-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows. Replace
it with the safer strscpy().

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Compile-tested only.
---
 arch/m68k/68000/ucsimm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/68000/ucsimm.c b/arch/m68k/68000/ucsimm.c
index c54fde75eae8..6b84e826040f 100644
--- a/arch/m68k/68000/ucsimm.c
+++ b/arch/m68k/68000/ucsimm.c
@@ -9,6 +9,7 @@
  * for more details.
  */
 #include <linux/init.h>
+#include <linux/string.h>
 #include <asm/bootstd.h>
 #include <asm/machdep.h>
 #include <asm/MC68VZ328.h>
@@ -31,7 +32,7 @@ void __init init_ucsimm(char *command, int size)
 	pr_info("uCsimm/uCdimm hwaddr %pM\n", p);
 	p = getbenv("APPEND");
 	if (p)
-		strcpy(p, command);
+		strscpy(p, command, size);
 	else
 		command[0] = 0;
 }
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986D6BA36
	for <linux-m68k@lists.linux-m68k.org>; Thu,  3 Apr 2025 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743639474; cv=none; b=baNRdFqtI5YdzTH6OiaP37M/EVprQRpeb7U6KzPpmQwfqcCsX/zrWyHI8kmb+ZPWGQuMERlRjfCR9fRmJUa0UpCKrl+jg7YaFiA8PpPBQ4Gse+4PLIU8kIffWxBlPI6gNgioBGwOMqD8UDlpMiY2MxySogt3tZvOc05tk9SK82c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743639474; c=relaxed/simple;
	bh=lQS4ILMHudgZnoFkuuWQtzQru9rvUMdKZa7T9T4nCE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grIY7T7Jk+RX1u+21YB1mEqCZcphgkOraVel811OeqVSbbRSRcXwA17nc26LeaeEVR7OgMoqUO2PbxoYFAeXlG5Vm+DC1qXqwzeuLYshkOiybc5Dy/igc1J+UN4lARXnspxlX7q9JVfCdBGjBsIrj4SVi5/8qYubPO/4sOs0G1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jb3Fi/2v; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jb3Fi/2v"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-391342fc0b5so244806f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 02 Apr 2025 17:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743639471; x=1744244271; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WaNe1THj7jAMauZ+XWm1kJQFr9+oN7TD1YulnniykuU=;
        b=Jb3Fi/2v/vqpQBeqZ6agtjXqT+9QoB4Wn5P/bau42L1AFWKsWD4Yt/XlyF32VmC+EA
         rHX+oSnDk5WCszIJyfmQzFcrIEIO2ibYIOLyfDwKNXcBRtblIBxBboj8L4+8vIeHqly6
         FuVs2jcOGHrICUc2C+BvuPZlNU/CZ82g9djTdyBxEf+DQNyuZrapu206o0eSUEQWmp06
         2EufS1RxFhUWbdurWKew1SxdjpUYTjH+/zY6BxTp/FMPRaoxNq+xdqi3+DKwfxmqdH6M
         LQd47YtbWbuACghAvDLcaTXC5gVpeKwPIOhJ06R6YztQxmblJkXDyZX2goXXtxjarwzc
         f+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743639471; x=1744244271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaNe1THj7jAMauZ+XWm1kJQFr9+oN7TD1YulnniykuU=;
        b=rnJwbRnjq+vQhlFCXR6e4eviZjzAAf5bPNAbMBREjkjqNZ3JoSv5VpjXJ0S+S65vvg
         yT66W/9qU4xYYNrIM9N6ZsbTHo1zKSd9IcwfX+sPMW2lFEEk2qUWsK3AV4Okwv0A9UpW
         PJa/iGcQOsIu4qfRGig9WWed0VWhB72stSQrf/uKLfIBjHl42879Agcrj/e0cvKyY2iG
         rCGwiiWwTFdIQP+9iUzfK2imMqULUVdxd/l9UuS8cnOhenU9PO2NadLXt0MyAnB1hjUf
         V0qtfvacl0P40W687O7RAndaA9Jt1pce7Zk8BFueOeqBFbicd7SzIOZAHEfcHnaQEbCI
         fRNw==
X-Gm-Message-State: AOJu0YydhGoJQZQzJLr90Unzz3tgh1rfj3tDeW83v0rgW4PLObdj62+6
	i9oq0/6fqP0ya1ouXtkKIWpt3g/hO/nKyshp34xsFO3v0kYm12U2
X-Gm-Gg: ASbGncupW7P8NEjYZyD8ZpsukEASupWeD5NOuvQZ7oiu8XeAVWnef5H+R1c0+nUI42n
	KrgGkIga2HtBiI0CjBEO6hrqn3v8UltButpSU1DLNK34hb+/gnBJGY1ogzp5acFmfVd2dMjZxGV
	GGbOT277QdoU9DFjtOrh4W31esUZ+aw6I12xAwfHEEElNQhp2TImGyKIfdFryf5MMvG79b5Mb5l
	pm3X0SJohpEjSyG3L9bPbWDXWUSsOM9lxPMftqsIRq/W+y20ZyQr3Ky1XJmT3H1+2NNtcc70qSx
	m36Fw6TtAeeA8gZyymQwk70x7ydgycUgXY1UTCxHFmcN2yILsmUXLsamhIjagpKD
X-Google-Smtp-Source: AGHT+IFX4EGKGwjZ/B7B0Z2W502N718VlfIqEydxIIY5HkliydHgTiZt+B1VkjYzzhgyehCuq4Wlcg==
X-Received: by 2002:a05:6000:220d:b0:39c:16a0:fef4 with SMTP id ffacd0b85a97d-39c2f8e0dabmr418220f8f.24.1743639470690;
        Wed, 02 Apr 2025 17:17:50 -0700 (PDT)
Received: from localhost.localdomain ([109.72.196.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a0a90sm255250f8f.21.2025.04.02.17.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 17:17:49 -0700 (PDT)
From: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
Subject: [PATCH] m64k/kernel: replace strncpy() with strscpy()
Date: Thu,  3 Apr 2025 03:46:27 +0330
Message-ID: <20250403001628.29920-1-m.mahdianbaraki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Swapped out strncpy() for strscpy() in parse_uboot_commandline() while
copying to commandp. strscpy() makes sure the string is properly null-
terminated and gives a more useful return value so it's just a safer 
choice overall.

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
---
 arch/m68k/kernel/uboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index 5e52ea150..fa7c279ea 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -73,7 +73,7 @@ static void __init parse_uboot_commandline(char *commandp, int size)
 	uboot_cmd_end = sp[5];
 
 	if (uboot_cmd_start && uboot_cmd_end)
-		strncpy(commandp, (const char *)uboot_cmd_start, size);
+		strscpy(commandp, (const char *)uboot_cmd_start, size);
 
 #if defined(CONFIG_BLK_DEV_INITRD)
 	uboot_initrd_start = sp[2];
-- 
2.43.0


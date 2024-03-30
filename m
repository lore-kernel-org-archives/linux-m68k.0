Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50776374C3
	for <linux-m68k@lists.linux-m68k.org>; Sat, 30 Mar 2024 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711821520; cv=none; b=NV4xmFujtQJGgKpqZeYjgwE2kuVnokwY4hz5wtkLu/Qh6NPPfj1FEvB17jX2eARIHBEsECHeQSGqfox4dewDh3oIhYJGE2BoCCqnroxsWW0wHUKcZ13lktYeIr7fb2oIaCUX8qYrnrtvOkOywzNwY2wDlEAilfiJ9DeE3vqaVhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711821520; c=relaxed/simple;
	bh=sUrCeSRuN1AgHGz+TliAi2YSUcHKJxlopXa8Nm66Vxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RikabD7QrFfhnvoA6Tc2WfsHsIfeiGeoBwW35MVsGwtHvLCrU5sdJbAjbuWlD/mjz74c6X11rgWlkmEKbcw+09NzjhOyEQf4JfNWeqythnWugFb57VnuhZgrJTGU58nuF9EmNz7Ql4eCzEGhc2WAoT+iuZxUt2/VLQgTuYhVKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=udZm/geE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="udZm/geE"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-515a68d45faso2922969e87.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 30 Mar 2024 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1711821517; x=1712426317; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ32s1BONnzC61piCM2zghhCEX6pmq6Ffv/Ga55RjGY=;
        b=udZm/geEv9x9qeh3KMhi8ZCzTRwS8WTzGbJix0aDyUI6+EtDih0uuvJDfMPw0ztCJS
         iSMxCgcas8Ck1qyj6L/jQC2Y6Z0V0Cr6oPl8o8wem14VPYkml/g96Lfer/+VN6lEj+wP
         fs14t2EN1sH40WJBSXFbGrAy+Smlye9hOABR+YPLlYwRjGd2ZfLzRv8hJn/Uysmw4/9W
         R155enIU9JOeD4psZqBylH0EiuU5v0M6odzhJPzqZfYJqJH2zak1jeV1S7qYBrAKDUss
         SdpPRzbh5+leF+KlK8aQM6ifO8F/mCljcWuX5lqiAkUiCU25mSITl8J/6DKqdq0dUyY1
         VW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711821517; x=1712426317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJ32s1BONnzC61piCM2zghhCEX6pmq6Ffv/Ga55RjGY=;
        b=VLBXf3Up71TxfozTEnwjcBzWFbd5XN7fWFmdxLDaSdDGJlkyy0UpcZ3OmEkrkOMM4D
         vZ8bhhsMmxhDupjut4utilDxa5B6iJpTWxRmOcAzP9AO/70YNXHKV9LLZWNdcYSdZ2v8
         hint5Bu1DqKAx5ZKwzHRU+1EfQ5pvp5pgvFrZYjHuCBIUf+ciAtM1eEjq6sjRltim6aZ
         26iq0DeLLxC05+837UQAc1MU82blNCu4ZNmSxz1A10pfrdkyP4J+BfGd1WX7gpdqZhiw
         7n9mOZjiAjfa+7kM6XElOLK6oxvL64kR5hD5K3nul3umwrhTpErRWPGHfgjVW+V9Hd6T
         Mihg==
X-Gm-Message-State: AOJu0Yz4mv+gtkEXb8tImJkWWx8Vripq1tnvqxjFG2MbppwthkUG/tUj
	cYtU4rxNWpPbkD6940JgQ1u1ncS1xblwT1dtN07vpBh68souqaNzJOM7sFtNMK4=
X-Google-Smtp-Source: AGHT+IEL8I2vsogLCMr0HEwhiqpPqjFAQ1oeM2F5ZdztpgYYmySU9i4qVMxYTBePrrza9FQjnYzdFA==
X-Received: by 2002:ac2:4e95:0:b0:512:b0a7:2943 with SMTP id o21-20020ac24e95000000b00512b0a72943mr3187347lfr.5.1711821517403;
        Sat, 30 Mar 2024 10:58:37 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-212.dynamic.mnet-online.de. [82.135.80.212])
        by smtp.gmail.com with ESMTPSA id fd6-20020a056402388600b0056c53ea5affsm3213368edb.77.2024.03.30.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 10:58:36 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] m68k: amiga: Use str_plural() to fix Coccinelle warning
Date: Sat, 30 Mar 2024 18:57:21 +0100
Message-ID: <20240330175720.126122-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following Coccinelle/coccicheck warning reported by
string_choices.cocci:

	opportunity for str_plural(zorro_num_autocon)

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 arch/m68k/amiga/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 99718f3dc686..d4b170c861bf 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -836,7 +836,7 @@ static void amiga_get_hardware_list(struct seq_file *m)
 		seq_printf(m, "\tZorro II%s AutoConfig: %d Expansion "
 				"Device%s\n",
 				AMIGAHW_PRESENT(ZORRO3) ? "I" : "",
-				zorro_num_autocon, zorro_num_autocon == 1 ? "" : "s");
+				zorro_num_autocon, str_plural(zorro_num_autocon));
 #endif /* CONFIG_ZORRO */
 
 #undef AMIGAHW_ANNOUNCE
-- 
2.44.0


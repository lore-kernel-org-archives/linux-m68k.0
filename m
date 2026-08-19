Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D03DA7D7
	for <linux-m68k@vger.kernel.org>; Wed, 19 Aug 2026 22:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178536; cv=none; b=Fu8TYL4aY+KAGfEnS/AxGZP/JVkqktcLFkBc8eX2GbOF/TjWC02z/hC1suqwfzYzqlgBoR37lM7KPuWKHPYYJ3G3cY6fV7AA75EYJeAHyHgezPYIA9QIhqZcZepQENdIwQysiDUKtLjJvmwYZ+3c3rIGDbfz6rCY4dWWXy32hhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178536; c=relaxed/simple;
	bh=w04FCCwpJDIBg2u2Ugiop1PhPjDYLMaKHY0WwXweRK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=i9JRdk5H4TSWIXI5J6hAvjB+quSbFuvFBZsPPyrzF+FXODUQ4mwUZb0vkyrKu+PTkY7MHE2fJ1+DPSg/Gj5R7C2vXny5YUdshCTZ66GAKTpC1fOJgtJQqU/a0a0uMZt+4p7Tdk1NARtnBFqsfKwWFhmr1xhGSBz+zidNA6/WVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rh9z2WWa; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rh9z2WWa"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so278756a91.0
        for <linux-m68k@vger.kernel.org>; Wed, 19 Aug 2026 15:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787178535; x=1787783335; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qUV4xoTyLUSRv2FhGM0sk0uIprDCdmyirtr1g03/2pE=;
        b=Rh9z2WWaEWewFJj4XnoZOhzqXSPwIPMGEiVFIMdzyIJh/j2TbSiidmQyZMp8a+fgQk
         ED60Wdn7NbA+7r4Sekf3JLUFyXS9FhlbEKxDA5fe8MCcgSa58ODL2VoZyn577Dv4BIOd
         WLa0Nu5Ei1aBMCyXR7XmVfMz3wrcoLxygLmOv8y0mR015B2HZgYstd9CW5aepaB3enHM
         nwkmEee7SJLCubqxpF7cm/GD5DzYetplxSFKWfJaMo2meg8mrnhlnvsq41zrdvo5Pe0G
         0ssAs8HOffLARfwJOOn3dO/YV4l6NN/dQTyh2hWrR+bGSNCHkM7/w7OqAwI9i6LoKUZp
         6aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787178535; x=1787783335;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUV4xoTyLUSRv2FhGM0sk0uIprDCdmyirtr1g03/2pE=;
        b=MdXBpzYIGfTq6LnF/vUw4XgA6kbsxQSZ2JDMDjcOhMu+tGmhENVzRUkhxRhYlgvS/r
         jyroIfkQpJiHbkSG1+BMcq0LNwIGgDreKBaC9Enrn0dcZIABimAOTGg32FHWCkYJfZeb
         d0KZVNjoawSXmjYsIYm3+279gQjbD+B5jYprCRhE9y7dbfyTiebxRWK4t5+N6+Mojy7P
         dQItkWBCYOD+jRVuMcPOTPD/l6UHW9LocCVH+3ii2gFSfjQRHtU3MkMGyhuTeoxCqh0E
         EutS5am78tjMd60NKw3x/v1goxEV/PGgy616DRqE6n/Gp/sm8HeoFy+O+Gzehxidcg8L
         NMwg==
X-Gm-Message-State: AFuF++k8Ik26jxguRTLMHFHa1BTQ2SfB/dJIsE95BB2YRA2krxyZEOup
	LTa2SXitJBc4bIAP1OODqCfEPsHXR7v0+TpeJ9MP1b3arG7YXH1A5iPq
X-Gm-Gg: AR+sD123ZMEBFPFrRJkFava2rePaygxB5CE0+QPsbaQ/IMunIu4ZaVaJhpgxh/VUogz
	QV8EDPH6XRXNA/Qz3wVMC5u43WFqXWQqZ4JS4TJJWBwOGYVY065B4JWn8cl9oNIWz64srnFbndA
	Xyr80dLOLJGSXpPWZzII2hdm5hPsKUMsavc7jgwtfVLfrzRn3MTIEwsYFmzh+J0hBBnkjX2o/hh
	46wsQ0LXyiniFtHJWsVj8WSobrq0qE7cWKSXgH9yKsil1jngU8h85Wt2oHAXC95zWyJPLkXXp3w
	gh6wQvgFeMuNo2SCIzKzozk1BVfN+mbs4a8zPRRCxhAEhrGm4O4u/z2EGknSpNi53az5UkBqgU/
	zwxiCCwDzdxlm0g0ZMRTWBEXlLdLXN4R7dZPth+KmgG6XnmT+8mlM17oF61o+tCUFrAgSGAqcAJ
	YFd/s8JhoJPSAQERPnC6Fme/dKUsIN1TKgEDj+hSdt4sLNC3OntPBOsD9Um+yaQZxAvlwGZlot0
	xeVblRIAkQe90HNGW3gatCffqZ18M54rOH62jb7CR7hfZuBnU/wwM2S+Pfg
X-Received: by 2002:a17:90b:3851:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-395a06ac272mr2656779a91.14.1787178534596;
        Wed, 19 Aug 2026 15:28:54 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ac3d1bfsm9539719c88.0.2026.08.19.15.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:28:54 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 44F7B360490; Thu, 20 Aug 2026 10:28:50 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>,
	linux-input <linux-input@vger.kernel.org>
Subject: [PATCH v3 1/5] m68k: Fix atari mouse movement
Date: Thu, 20 Aug 2026 10:28:34 +1200
Message-Id: <20260819222838.21256-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260819222838.21256-1-schmitzmic@gmail.com>
References: <20260819222838.21256-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Miro Kropacek <miro.kropacek@gmail.com>

Kernels are built with -funsigned-char since version 6.2, resulting
in signed mouse position deltas getting misinterpreted as unsigned.

Cast deltas passed in (unsigned) scancode buffer to correctly
interpret sign.

Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-input <linux-input@vger.kernel.org>

---

Changes in v2:

- change atamouse_interrupt function signature to signed char *,
  drop signed casts (Geert)
---
 arch/m68k/atari/atakeyb.c        | 2 +-
 arch/m68k/include/asm/atarikb.h  | 2 +-
 drivers/input/mouse/atarimouse.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
index 49a9a459bdf4..86ab73a79177 100644
--- a/arch/m68k/atari/atakeyb.c
+++ b/arch/m68k/atari/atakeyb.c
@@ -39,7 +39,7 @@ void (*atari_MIDI_interrupt_hook) (void);
 /* Hook for keyboard inputdev  driver */
 void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
 /* Hook for mouse inputdev  driver */
-void (*atari_input_mouse_interrupt_hook) (char *);
+void (*atari_input_mouse_interrupt_hook)(signed char *buf);
 EXPORT_SYMBOL(atari_input_keyboard_interrupt_hook);
 EXPORT_SYMBOL(atari_input_mouse_interrupt_hook);
 
diff --git a/arch/m68k/include/asm/atarikb.h b/arch/m68k/include/asm/atarikb.h
index 68f3622bf591..c5a84c7ee85d 100644
--- a/arch/m68k/include/asm/atarikb.h
+++ b/arch/m68k/include/asm/atarikb.h
@@ -37,7 +37,7 @@ extern void (*atari_MIDI_interrupt_hook) (void);
 /* Hook for keyboard inputdev  driver */
 extern void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
 /* Hook for mouse inputdev  driver */
-extern void (*atari_input_mouse_interrupt_hook) (char *);
+extern void (*atari_input_mouse_interrupt_hook)(signed char *buf);
 
 int atari_keyb_init(void);
 
diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
index b1219cc4d9a2..6bac2288c494 100644
--- a/drivers/input/mouse/atarimouse.c
+++ b/drivers/input/mouse/atarimouse.c
@@ -60,7 +60,7 @@ extern int atari_mouse_buttons;
 
 static struct input_dev *atamouse_dev;
 
-static void atamouse_interrupt(char *buf)
+static void atamouse_interrupt(signed char *buf)
 {
 	int buttons, dx, dy;
 
-- 
2.17.1


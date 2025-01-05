Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECD3596E
	for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Jan 2025 07:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736061302; cv=none; b=ifCrHbc8/WX0fT8notQkZ3X/hYEQ4e0T8Wk1fZBPRwOFcVKpwfvtrBQN/S1YpLVk2N6V6YQIAJ75T1tPy301ys2cU6X+z8jQ/bepVjZReJvhMhXzVi5zIPxytLJmBbFgBNrQqIjCrjw+HseJA0BWqs7yvBfdo/bM1VTRqoLNPII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736061302; c=relaxed/simple;
	bh=NtIPh46BeBBRavGAIlzmNcOKuXgtwLSH38m5dpJNAys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOsW81UQ6cp9DreOwG0MDue+fco+0L72M6qwfHMIhU/WxolE0roPQy3XMYCQcuVoj+kDii8PRQpVsmUvttJb8tXwSIG6Its9MzxCjqw6QuTlmUeQNhwPqD3wbSaYaGRRSQswSSjztgwKH/TblYclyIfmNq4vufjSEiUrVjeDYtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=OaZuD/aX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="OaZuD/aX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165448243fso226525555ad.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 04 Jan 2025 23:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1736061300; x=1736666100; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1UM9YxumSC7m8fCEV77dLpbLIfMqY7kUCOGI+oWymc=;
        b=OaZuD/aXGRVmRGJ42HTbTXUKC9jB5ltFMDo97e5XOVz5DPIagahPNryszVuEgkBYrQ
         JlPyk33kSoNPo6b9D5jQa7HaTD2T0PFxQH/UQnk8id4IB7BpqWLZGIIlXwe8PRfmta/S
         YatEe+HZm4u+cdHWVngNX/s2XKeCl9/l3ycwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736061300; x=1736666100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1UM9YxumSC7m8fCEV77dLpbLIfMqY7kUCOGI+oWymc=;
        b=PnyPtBIpx5brLWzlaeZCdtrj4YYEAyzvTsgWBH8TSBhJvj/9pog6MVH5H612+o+3f6
         tBKzmSIMPIMgsvwKZOy0Goc6ogC1MA380oBTXn283rx08ueo5B74h9X6v6XZUWrHn6+e
         RodiEYumk23EVD8TBuj0NszPchS6jCWOmB15H2PodkidOS9yfcBqjtevmyKV1J/mRhZG
         CWlBs+fC1uLXEzESdEYUMa7jwbOMsv8bsYbWqCsJ7O6zKzV/Gw1SuRiw09CiawBrHhm1
         C/Kk9hYu7RzLafv0TuPnq3iyjiAP3tnP/tWOzYkoUpCePmDRyFQ2Eo7Nt13+IZaoIK5A
         Cu3g==
X-Forwarded-Encrypted: i=1; AJvYcCWiU8NZoTCMSJ2gDBGHxOeGG0UumBzeCjGLTiTCajDabl7P6do2b5XJdrEOHntcPUQoZ3GkkhEJ1Eul@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy1WXKiOK6tA/SdBxsv/i5imMWSfGGroR2/P+EygxZ0vIX/8Miu
	MI5OWR+J6ntD2qZHltyJJ1IP6qfIORb3Ejzx3nwNjIzaTJZfXUuOWubfmvnYH7U=
X-Gm-Gg: ASbGnctDEJ63LnRD4A3ee+W1YSZBW658U9/yQB4KwTF65ni8Qoyerhpjyz5TKls7yEn
	XHwiPtIDrRVZZb7tWOUs1Ljr/VCUu19vRpQhyHM3RTa/Gtnrxhi+pc7hHCKOkaTXApwbMQXR36o
	hj0uYS0xOBQxuWMLpcTds+lMFaJkJ0+Aon65LRX7e92IrKBQxLFMJLki9bDZf/TAT/zjsM0p+K1
	ueaxJkE2Yt2bv7RmQooIkx/nvzJeVrIRlx/lagwKANcRD/zUJcHc4TKKaHngIqCtG8Z
X-Google-Smtp-Source: AGHT+IGcMNkP197o6owDLgc02j2lkk8bugUjCIOVPjuJglq0i5lpZO+GOfRIhTciQjmqE9Uo63QlRg==
X-Received: by 2002:a17:903:98e:b0:212:63db:bb15 with SMTP id d9443c01a7336-219e6f14f81mr858741595ad.38.1736061299988;
        Sat, 04 Jan 2025 23:14:59 -0800 (PST)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:e94c:e5d:106e:3582])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9cdef7sm270007125ad.133.2025.01.04.23.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 23:14:59 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	fthain@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 1/3] m68k: bootinfo: Add tag for FDT address
Date: Sun,  5 Jan 2025 16:14:31 +0900
Message-ID: <20250105071433.3943289-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105071433.3943289-1-daniel@0x0f.com>
References: <20250105071433.3943289-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow bootinfo to carry a pointer to an FDT so that the
bootloader can pass us one.

This allows for devicetree support without changing the
boot protocol too much and breaking unmaintained bootloaders.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/include/uapi/asm/bootinfo.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/include/uapi/asm/bootinfo.h b/arch/m68k/include/uapi/asm/bootinfo.h
index 024e87d7095f..326f20e82769 100644
--- a/arch/m68k/include/uapi/asm/bootinfo.h
+++ b/arch/m68k/include/uapi/asm/bootinfo.h
@@ -73,6 +73,9 @@ struct mem_info {
 #define BI_RNG_SEED		0x0008
 
 
+/* Pointer to FDT if there is one */
+#define BI_FDT			0x0009
+
     /*
      *  Linux/m68k Architectures (BI_MACHTYPE)
      */
-- 
2.45.2


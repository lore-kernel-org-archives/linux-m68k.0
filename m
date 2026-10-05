Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8D0443E43
	for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Oct 2026 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194790; cv=none; b=tcS4qyYxNpZpyeARAvHSB8FpLev87yaCTeEF032z5si+zjIWurxUq9SaivqL4VNapPG2FhQbKH+cgS44W4tp/yvAq4lVFe48NDbuWYnuay4ED2U8p5IYMzaymn/uHYasC58o2/tRtMbdAEJla/XrEJ5NVuQHGv32UxiglnmSXtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194790; c=relaxed/simple;
	bh=kkvQVRadmIQGTvKLcaujad4OYyUKVMAdBbtxh9GnyQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjD2uvqpMBRF0hb37kG8wZg4cHl+ftoK7nXt0A9Dzd4jnpCcpyVhDx8argkiH9n1nNHi3TQUblsEY/F/RYaNlgofE2/+2rNpLAXDqcTA0K/qth2Z7X+CM734BKWKliJ21JpIZZHnSy34Tb3D0SCvIfEldAzrmMPEEEhXVKhS5Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CvTycTSN; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CvTycTSN"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e32f913c3so249170566b.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Oct 2026 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791194786; x=1791799586; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsiKtn36BJ7XHGErl6qttUUVPC9Oz5hd7o1Pd38Jb+I=;
        b=CvTycTSNSeUHL0NwypOK5YDmkmlOu/nWjvUOKt+o9CWSR7kponYScw7nbd/E7P7vXh
         dtSmTcBs3y1b6up3kh/K1iOfl+jJRAQUKXUGGT1zFsQHO3rp98oDVTVM2mPh/xKP62iT
         3TCyrV/4tYDBjW13pTEIY5TK3wHP2Yzbv1oyQsENLxtEqYfwPDUnYd0e8+IbJ1ad4RDc
         5Z0bFj5QIOwMSOUWYl+xL3+M8pgAGhwx7EdyemrYFdYEUaRNSOBAuanOqPVVCbiitRoc
         xW5ce3vNrgx2DhX6rGkS4FhOQP9iTbDW94oU+W59uNiQeQLwqPI1l+BVAb8nlpeeyRRG
         2AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194786; x=1791799586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsiKtn36BJ7XHGErl6qttUUVPC9Oz5hd7o1Pd38Jb+I=;
        b=FBw7kfSDxS4kb1pn2mv3OmaHsNDENdtXPzrSvusG4XFnuihhD4hhq+lsQ9eDoaGyWd
         V4O8c8qRlOeVt9o9RqfO+U73GY+zvYx57mtVMZ3S7G7AEtJOV+BYyLR4hQPixY7bC1kU
         NkRcj+gfnKSKuii3dZrZbiUNufczCm/TLq8A+dQC/F/+6EkLXxKvmWMjHvRIamRDnztJ
         wie/+I9sDvSON+IBn7blBkG3M/bIXKrEBXMMg5B37laUEzB/IRw8Pwxdxd/jWmEzbQo3
         B4oRq1LmnQMh8+DNwYWqqskSCUEbTw3EZ7KPqXaSqAdZd5ZZy6g6DU6kcy/W9dmyG5Mh
         eesg==
X-Gm-Message-State: AFuF++mwjr1hwVEQ9g67CkDa7l9EEyRw/71/kOq4tAeEMePiE/LpvemN
	/lm6O5XJZqHSYJpTx77iWXUKt8zmpcsIbKkTnvocHKCYkhTblCxNTogYCkTABrY9jMY=
X-Gm-Gg: AYBFou2zlJl7RWLjCN91HwxhdoBE26vElRx+kdbB/JddRI8Jq16fyF9BNSsPW/id5vG
	/xAf+F3HWmenhaYxBJoIWeDq8tEUsTR5WWbz0GRiXKStxzcAnJs/axvEUQWADy1BrpjXPnM4aJ/
	VFxSiDwu2euf0QmuKFZ7L8MEZ2wBqa7h9fFdDkyxy/TywyNvwmc8Yffx1iQ3eAYdY/Uz1iRgW/F
	ozkvJXnXrsBVyK1dkXMwlNHL5S5hS9KWBiAPuhYGDap9qNQ+cbNcpU7lq0QfxB3Gp+PKlXYbYEo
	eFJ5Yup1EpocAXNl5n8FAhIzFiXpK7FJg8O7uS6RaFP3uiwQtLC00D8xMslXiZVNXJ2NMhcp8MM
	GDJTr5wXrkRJYozpDbaTqFjgF4grbh6TXlJU7aR/aR9sTnQ9ErsKa+9uJTIyL5VEI0KGcmaEsus
	CQf0JMQHDkoeCcf8OJRG0Ch0cHP0SfJT7T0IqPlmLRwTZ6ixwVob9VoplRQu71WvD3x0/yC46Po
	5sm4O/vSNWy6A90gLBDHvBbWdiLl6/GWLw/hm4=
X-Received: by 2002:a17:907:7212:b0:c29:f5d5:5aa1 with SMTP id a640c23a62f3a-c2e4b295951mr836086766b.43.1791194786464;
        Mon, 05 Oct 2026 03:06:26 -0700 (PDT)
Received: from [192.168.0.42] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3156360832sm50800766b.75.2026.10.05.03.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:06:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 05 Oct 2026 12:06:23 +0200
Subject: [PATCH 1/2] m68k: mcf5441x: add PWM defines
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-wip-bl-stmark2-pwm-v1-1-168b9dc653f2@baylibre.com>
References: <20261005-wip-bl-stmark2-pwm-v1-0-168b9dc653f2@baylibre.com>
In-Reply-To: <20261005-wip-bl-stmark2-pwm-v1-0-168b9dc653f2@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

From: Angelo Dureghello <adureghello@baylibre.com>

Add PWM defines for the mcf5441x family.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index ea01c7753b7b..aa925fac87f4 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -375,4 +375,11 @@
 #define MCF_IRQ_BOFF1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_BOFF)
 #define MCF_IRQ_ERR1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_ERR)
 
+/*
+ * PWM module
+ */
+#define MCFPWM_BASE		0xec088000
+#define MCFPWM_SIZE		0x150
+#define MCFPWM_SUB_SIZE		0x50
+
 #endif /* m5441xsim_h */

-- 
2.55.0


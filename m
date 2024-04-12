Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FF61509BB
	for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Apr 2024 21:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712959121; cv=none; b=gAc7alrx7GfoxOdYiNmapHr1ELW0MAC2yQqnfqwOgF+zRJZdBKIOL/jlN/a+T4Z+Q3lAVp4OzIDm9VreIsYTV1rNY2EK5mHFkREmQvNWwtoUATu0JpCAfWxAtLyhW1Oi18vmDhFf472wetYMOVeDs3TdzIhyAMk4qBf/3p1TVEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712959121; c=relaxed/simple;
	bh=sUrCeSRuN1AgHGz+TliAi2YSUcHKJxlopXa8Nm66Vxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHn8YkSRLCcbqcOKuLVc8K2FRVgVLFlRcn5QfRhrEm7Y65PI6WjcBA8GXT4wfF5IVgsSvNqD6K8pqyTNECBY55viENfDLHrLX61juqzR3/oDnvBrQ94gPbI++7p27wFNn6O6O/ZCp5Uww/wPf9InQ/9IWiKJ7kFdzmk4/hpAIz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=CSew6oRu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="CSew6oRu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4181e85de8cso1024355e9.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Apr 2024 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1712959119; x=1713563919; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ32s1BONnzC61piCM2zghhCEX6pmq6Ffv/Ga55RjGY=;
        b=CSew6oRulahcoa/RRMSuMAMbXDxqZmByMUd4Dzmvewke8gZTZtDvc4rn6bhQk/83Lm
         ysNpR+r7sfsZwa3zUUQooxdtb2xjwRuiYzQuXMQieu094oZHIlVHoYusSfQdH0OjouSm
         AnGOpRYf8mZiFfaiHJ0OWC0bHk+t0nm1ENqGKU0ng2mkyKV1B1gRDvMhyd4IEhsY4SfV
         vn90irtPjeSRAJRVTFiGasGYG00+M1xsMi9ziYp9DzfQ0X5ykOBfqsVQ4XXR3Yhnwqzz
         yWu8EJeMRjwk+t1/GvDAfEGJ9F5uwqkGbWQm+44yMGELjbUpzWAM5y/7sDbIlIg/hN5z
         5kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712959119; x=1713563919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJ32s1BONnzC61piCM2zghhCEX6pmq6Ffv/Ga55RjGY=;
        b=CtRIe+IAGtWDSfqFnzUUm8dCdxPf1J9vEdM0PLvBpJnDb2wV4M5M6kxUJewMOcyWgB
         uaj73ltsSK/vHse8DJXm7Lm5of3mhgTZeY9So2u8EtDYBEjnvbGJf1F9T0NH3Qgae5n/
         5rPjodYDgcmvZIfwIjzxbsW1zGZ9tJmNKwqJXyzACVDpNs1NW1wfe92K9Em+kkhh3o8w
         VfAyjfl0FuOKJaeWB/OQfSzwQ+lBBK5RSDpFVPFK6XDGxUBss962Wlj5el1SVn5v0lJl
         3fYNnW98gdtJLtcWy5puRClgJJU5QHEKNI2pBMP6ZnddaNThAXU6iwMZvN/XF3Ua0WeX
         9iDg==
X-Forwarded-Encrypted: i=1; AJvYcCU9mYCCQQVlIsOtkPZ0czr6mXOOBh8sM3mVkGs796l5LC+5IUiy4Q+7FXnIiV/0HeSO1cPsKPGKFZnTme6eeYu2Bzd2tCN68Zs3+KGm0U+z
X-Gm-Message-State: AOJu0YwQ13haq7zpHGXotVn4qNPrIO3Nd2vDf7EcljRwNfhyNHnSt/Sj
	xXl8Lc1aqSMQ1KGUO7dGSd67b+NG+EtTWC6uDhp25P2HAAg2LFJZ/y3aFwo2bbQ=
X-Google-Smtp-Source: AGHT+IHV5fCe36SFn7L7PyMHbd3nP6FgtWZBD0K/H/INpxXjFgp9zRGGtBW0eioaeFkNgAT5hLK9dQ==
X-Received: by 2002:a05:600c:5693:b0:417:eed9:e29a with SMTP id jt19-20020a05600c569300b00417eed9e29amr3125688wmb.23.1712959118717;
        Fri, 12 Apr 2024 14:58:38 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-212.dynamic.mnet-online.de. [82.135.80.212])
        by smtp.gmail.com with ESMTPSA id c18-20020a5d5292000000b00341b451a31asm5079516wrv.36.2024.04.12.14.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 14:58:38 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: thorsten.blum@toblux.com
Cc: gregkh@linuxfoundation.org,
	javierm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	lukas.bulwahn@gmail.com
Subject: [RESEND PATCH] m68k: amiga: Use str_plural() to fix Coccinelle warning
Date: Fri, 12 Apr 2024 23:57:07 +0200
Message-ID: <20240412215704.204403-4-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240330175720.126122-2-thorsten.blum@toblux.com>
References: <20240330175720.126122-2-thorsten.blum@toblux.com>
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


Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F703FC7
	for <linux-m68k@lists.linux-m68k.org>; Sun,  1 Sep 2024 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725206332; cv=none; b=VYgtL4Ev73KTB5sk34enJo+U4r2HEs75Dog6k2wZeAedzcNaCVezmQAkMzmaCgyN3Jeo+RYn8eMAdKgrK/exBlkIvW+WFfCKlqCb2V3I1A/raJjBa0e1xfV6tBKQP+hjgPGzpFHF2oCwLg6vo5PpGzCuf/Ghz8MipZ2xQc0AQnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725206332; c=relaxed/simple;
	bh=Fd0bb3YMgevpo+aFHgL9hPue0EfkpePLJPpVGruGSMM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=L5TN9pXxU2Gg1AoPDqcOw1UbnLz0V1teNAfhBSa4uQid0LcMDUPIHcdPsFKKKrUFEq8zkGHCmd4EnJZ4WOmfjqxq1CmyoiwiIiBe3A8PoAvCnEOmF9l6p5Xxbp4SyJNnTK+MkFZUuWA+Q/jYp5PGK0Xq1Y2ngbnxer6yOpo5Xvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVYQ6SYq; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVYQ6SYq"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5bec4e00978so3284466a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 01 Sep 2024 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725206329; x=1725811129; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix5Lt4pX5BzybSP7o0NR7nn740Ac2JLNvIgvnvkwPSo=;
        b=EVYQ6SYqJbfb7mIBxShTRi23GxzioDUCPt24cuvLa6/q/RXn4QIvHeaTiWzB5D1Edj
         66pkgNO75W4IorWYDemEoHo8+iA22wPPq8BxkkQKaufCwJnQ8ttd1xNnsmAvsGdQ+KPv
         z3WRPYn5MtJeq3pU34yZU/M7W+DV14zMhOIJiaZmS9WQy3WSH0XDBIoXjDQF1Te1TuXK
         A8jVRt660bMrOeRvojr3sgX0VhSSbkqlBaI6MnKhNtjsWoRLhRM+C4GRyX0h7Pu/CLGy
         8/xW9HtI4uZmam4jSIIECjjcj52ZcEw0AP7knGmNqaaKXbPrUBf5EoC1BxeFVxQiDHlu
         4Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725206329; x=1725811129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix5Lt4pX5BzybSP7o0NR7nn740Ac2JLNvIgvnvkwPSo=;
        b=P5M3CbaV+asimMnH+Jgrtuq0552Wqi4HJV41ubmz+0KDE5NiU5ghVYkfA6eUEZcTLy
         Gkc2yGT/jjZNvOZjNeF7OAWAN7nAuCWgRmp2oSx1xfjVchX2MPUXS89FFSxEi+Lm/Jtn
         kEjjLPPZyLnYEx11OOS0c2fxhteyZBLen7G3t0p9Gy2NTi2/LfXC0iYJpRZB1Edj83Tg
         JCnwykEpYjyTc5aXliCHXfenP9k9Lo1JpBroL0BecOP8DcMZIZAXMdS2R2cA5TXuw5xD
         2hvsvFMVYLtf4bISHk2FqgGThURD4vJvNybCWafx3A7+T/yytMYqLrWcXkZ9sZ+Nc/We
         y8nA==
X-Forwarded-Encrypted: i=1; AJvYcCX3GVIaXazaX0PETBr2iEhB167EJ44f2GoJL01W8Y2dyBHHHlG5BeBF/vwNsimHgzReBI4ikyTwW8FD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxJWeDEfTMU/mCd6oLJlTCDcO6nNfQfV1OYauLkfzgcY9/iHLhq
	C3z50UYkOk6pQRPpy9f3ACKsYQinu2tEj1yW0Vj7LUG1kJFTC44M
X-Google-Smtp-Source: AGHT+IHzgrO8NU44+fJNcWnq66TFNrhLOjVWgk9tgTrJy3nNrgGeA8GYKexNqTa4lGy/w9c2kViNNw==
X-Received: by 2002:a05:6402:42cb:b0:5c2:5cc8:b1 with SMTP id 4fb4d7f45d1cf-5c25cc803c1mr752921a12.7.1725206328654;
        Sun, 01 Sep 2024 08:58:48 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ce96ddsm4144760a12.94.2024.09.01.08.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 08:58:48 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] m68k: remove trailing space after \n newline
Date: Sun,  1 Sep 2024 16:58:46 +0100
Message-Id: <20240901155846.142816-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a extraneous space after a newline in a pr_debug message.
Remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/m68k/kernel/setup_no.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 37fb663559b4..c926da9d5ec2 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -138,7 +138,7 @@ void __init setup_arch(char **cmdline_p)
 
 	pr_debug("KERNEL -> TEXT=0x%p-0x%p DATA=0x%p-0x%p BSS=0x%p-0x%p\n",
 		 _stext, _etext, _sdata, _edata, __bss_start, __bss_stop);
-	pr_debug("MEMORY -> ROMFS=0x%p-0x%06lx MEM=0x%06lx-0x%06lx\n ",
+	pr_debug("MEMORY -> ROMFS=0x%p-0x%06lx MEM=0x%06lx-0x%06lx\n",
 		 __bss_stop, memory_start, memory_start, memory_end);
 
 	memblock_add(_rambase, memory_end - _rambase);
-- 
2.39.2


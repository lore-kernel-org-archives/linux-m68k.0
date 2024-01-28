Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2697A1EB2F
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Jan 2024 05:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706418383; cv=none; b=Hwa9+V7GTiL9qYED41NWrxUvshIj9Q8RYrF3iBF+9swml2lUwNgavaO4UE5mRzsuvGxfHNKYhrvbcuwC5OvinNoONOcaiWvaNWSs8FPWsc96MVeOv4aAPOJm+VZMOgG6aXL90kbXMlFmN8Qr1Bn2e4/4M15L1R1zXl2jYMXRxbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706418383; c=relaxed/simple;
	bh=R1pbFLI03IlZKTp/TgcUS71vFBkjz46xTjfOd1hIJ0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XO7PV3s41/qIV6wzoHClEkHmVdhLUreOc4L42sx4cbJbt2aa7TK9FJEan0NIM+UaN/pqhnoe6UUzvK6E7bIkR0/7vhnl5uuvv4PwoTTCT0ukwgdhIjB0VlagtJcIfNY3gMD3lw/lkO4vFq8SvDAVDDcvuJcMkZXCjBcbTgKBymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNkT3M6l; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNkT3M6l"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-59a181a46b6so639926eaf.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jan 2024 21:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706418381; x=1707023181; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQBsNQfE0P3AMOj6B4RUDeOxeQtA43qqvQ0BuQwr7rw=;
        b=XNkT3M6lwfO2pX5di37f2wmrAVORTS5Aoi0uaIaaHGpfwt3Ut/H9boVyzXV5EqfNSj
         1j97tP5S3itvtdwmbuuOL+zE4aLE+DiNEI7JPPD5KgMNakS8v3xmEM2YW0IpyVLdReIe
         qr3wPokz2DH7ErVvBqYINLHxbdJ9NMaU3nkrtUGgBEUAervYv74+p0h+Vk/BgZLEladD
         7qlFbocK56Id0PywgboO13H9y4qZ8XYhJK8EiLoF1deOyf7cJ4UJJjcYuNddmS2ssGFO
         nT8DQv5WlEyLH+1NAza5mQGjxQeo54OPgl7h/C99FPjLyZkjir8xC1gdxoIOHe9nwQ+7
         O26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706418381; x=1707023181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FQBsNQfE0P3AMOj6B4RUDeOxeQtA43qqvQ0BuQwr7rw=;
        b=QZnsaPq8BcVKUWt7mqDpfx4e6TOoZ8cTExkPgzR+haXyhyFbomh8ab9rabwwZdgFFu
         z61zX8noOq/UANwPHowkFuWrwxxYLDmLjN/sY0CaM5tnyMMbjiogEPc3qbPuGTOc/xv7
         Xf58C4FBiYRz0H63nyIBXK8/FTSQE527AH6g07pF40n/dAEN/1NbjbebFIemZxe74R4N
         ItxJRm/bPOgaBNyshsw4bjLjn94V/OcUwNroEe/AxCLFSKajTGSTX5e6GsuKdhCpIbFj
         h+su18qyyttoYz+SjBrFQQdoWlrjpg61Dkv2M+jgw9bragQI2qBJf1vwLYVPp9/PkKzb
         o36w==
X-Gm-Message-State: AOJu0YyGZiLxJRQdalEDF7UAnkoWmdBk32mlyeGoCXlt60GhQQdVnRGd
	IN0/TSjyA2zI/YR65/jyhBNv+X2nd25MgtnH9fNxVtLK7YheVVlf
X-Google-Smtp-Source: AGHT+IEG7nBxPu1DZAQ3x4bvDDnlqVoOR9wWy15hrjJ//5bm1LQ2RgGqogRvkweP/oDf95b7NCqmJQ==
X-Received: by 2002:a05:6830:4106:b0:6db:b046:2189 with SMTP id w6-20020a056830410600b006dbb0462189mr3439811ott.24.1706418380989;
        Sat, 27 Jan 2024 21:06:20 -0800 (PST)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm3550372pfb.46.2024.01.27.21.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 21:06:20 -0800 (PST)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Kees Cook <keescook@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marco Elver <elver@google.com>,
	Brian Cain <bcain@quicinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Matthew Wilcox <willy@infradead.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	linux-m68k@lists.linux-m68k.org,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v4 4/5] hexagon/bitops: use __builtin_{clz,ctzl,ffs} to evaluate constant expressions
Date: Sun, 28 Jan 2024 14:00:10 +0900
Message-ID: <20240128050449.1332798-5-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128050449.1332798-1-mailhol.vincent@wanadoo.fr>
References: <20221111081316.30373-1-mailhol.vincent@wanadoo.fr>
 <20240128050449.1332798-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compiler is not able to do constant folding on "asm volatile" code.

Evaluate whether or not the function argument is a constant expression
and if this is the case, return an equivalent builtin expression.

On linux 6.7 with an allyesconfig and clang 17.0.6, it saves roughly
4 KB.

  $ size --format=GNU vmlinux.before vmlinux.after
        text       data        bss      total filename
     4827900    1798340     364057    6990297 vmlinux.before
     4827072    1795060     364057    6986189 vmlinux.after

Reference: commit fdb6649ab7c1 ("x86/asm/bitops: Use __builtin_ctzl() to evaluate constant expressions")
Link: https://git.kernel.org/torvalds/c/fdb6649ab7c1

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 arch/hexagon/include/asm/bitops.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/hexagon/include/asm/bitops.h b/arch/hexagon/include/asm/bitops.h
index e856d6dbfe16..c74a639c84f3 100644
--- a/arch/hexagon/include/asm/bitops.h
+++ b/arch/hexagon/include/asm/bitops.h
@@ -204,6 +204,9 @@ static __always_inline long ffz(int x)
 {
 	int r;
 
+	if (__builtin_constant_p(x))
+		return __builtin_ctzl(~x);
+
 	asm("%0 = ct1(%1);\n"
 		: "=&r" (r)
 		: "r" (x));
@@ -221,6 +224,9 @@ static __always_inline int fls(unsigned int x)
 {
 	int r;
 
+	if (__builtin_constant_p(x))
+		return x ? BITS_PER_TYPE(x) - __builtin_clz(x) : 0;
+
 	asm("{ %0 = cl0(%1);}\n"
 		"%0 = sub(#32,%0);\n"
 		: "=&r" (r)
@@ -242,6 +248,9 @@ static __always_inline int ffs(int x)
 {
 	int r;
 
+	if (__builtin_constant_p(x))
+		return __builtin_ffs(x);
+
 	asm("{ P0 = cmp.eq(%1,#0); %0 = ct0(%1);}\n"
 		"{ if (P0) %0 = #0; if (!P0) %0 = add(%0,#1);}\n"
 		: "=&r" (r)
@@ -264,6 +273,9 @@ static __always_inline unsigned long __ffs(unsigned long word)
 {
 	int num;
 
+	if (__builtin_constant_p(word))
+		return __builtin_ctzl(word);
+
 	asm("%0 = ct0(%1);\n"
 		: "=&r" (num)
 		: "r" (word));
@@ -282,6 +294,9 @@ static __always_inline unsigned long __fls(unsigned long word)
 {
 	int num;
 
+	if (__builtin_constant_p(word))
+		return BITS_PER_LONG - 1 - __builtin_clzl(word);
+
 	asm("%0 = cl0(%1);\n"
 		"%0 = sub(#31,%0);\n"
 		: "=&r" (num)
-- 
2.43.0


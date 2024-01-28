Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD50D520
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Jan 2024 05:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706418374; cv=none; b=VHDmBpBtSzv8DmFOJDPVUvjxVmA4qHLz7mSCKpCLaoqEEML0um03i3hqnGqkdTS3dKqw3k7bPie4bIVu+UfwLxxGcz8I0HqmBIoq5e3/pY8M8wEEXJ2HNjqIKoHAnrPYh/kvwl4OK0pQb7f2OQQba6Ldvuyzv9Wel5toauaqAa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706418374; c=relaxed/simple;
	bh=ExuY3mPusE/FWbLSFzM/M9SA0b5v24qHPt/95eQI/Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asnBv/nWq0niiAz7ja7ToC8bpHi5ZtaQjG63025AWwTqQ0HUEo3/wpyaAgmt5kI1V4Byzgb9N8zauO08t8QOs3uPkUKEDcg8i2dztetm45bTJ68cxwEDExY9yDo1wLVMDXSEuEfcjKPYAUxbgSAdg+jo49wkVvGjkfKhDqVboao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeZkCCGS; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeZkCCGS"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so1291253b6e.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jan 2024 21:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706418372; x=1707023172; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Afm8icB/y+Dcgg++6LXAA0U3DRuhdcifD/F9kyq+8Bw=;
        b=MeZkCCGSfLCtvM0h/MxQqj8IWn1g/GxTc8VzY2D6SD4qcawuP3HPuMY9C2mKyJAwii
         478FXNMSaro4OjMfUKzBEyVMO9wuprytZTuBR58aF65Cg62ABP+bTLFBoxdnPwonG1sN
         /+CI29Pz1jzFwrERj/PLZNBGkwHKMc+tZCw9lYt8a1miptv4nhaGMiRNO7wWh+69CwyT
         CJlqeb6lZdGT0vGpRUQT9IMyNXSpcIkBT9+yeGy1fHElRy7W2I+384vsPVR40VM3bdfR
         4l/LI9JtSjs4TSr6j0wgVSx3u6pU8h0neUln11F1NTVBeh9UrbGTYAKKZtPViz8urRjt
         mlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706418372; x=1707023172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Afm8icB/y+Dcgg++6LXAA0U3DRuhdcifD/F9kyq+8Bw=;
        b=wGUBj94cKeGx5pr3hP1XnrQV3y1JAV9el5MvYnqUkfZ9IGfbC4P7gg90FrWAq2uf3n
         82zPdTqbcs6ohA30fdNmXwVbZp/C2ngx9tG2FQomZzyFlkBQPIeVDtfdE4dJeg0dCeyf
         hczrbCooXHfVr3HzkjC4SuS4pAyi2mV4p1LqU4ez9JWgD8e2VHIhFOKtEgjmnOFDlLu9
         fcqZRZQJ8p519yGBArSAK+hT8jTU/mcnP8vL9OKjUalS0RJGIVNNrksv0zCpeADgm+0Q
         V+8YZzvkwQBRg5u+LRdLsggpqzKL58uzr2L4I7GhwrzYNRCJ+cyyXGMRvda0AanpIfZ3
         b36A==
X-Gm-Message-State: AOJu0YxfhAxgaZcq7tMc9g5m2zrK/553DwfCdXJbdiFm/HwPzmqFv4b7
	bj1y57Qj3iXPRe6SlS71DhiestpUPf3O7CMahdjWCtKk8yrMlsQp
X-Google-Smtp-Source: AGHT+IFX51ILylxaSYnl18EoW6kL48m7lSuyH/v3viP4NEjjW8STalhGnaCEAi2BeLIKKaIi3ElmTQ==
X-Received: by 2002:a05:6808:1189:b0:3bd:a71f:9bf0 with SMTP id j9-20020a056808118900b003bda71f9bf0mr3657759oil.39.1706418372492;
        Sat, 27 Jan 2024 21:06:12 -0800 (PST)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm3550372pfb.46.2024.01.27.21.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 21:06:11 -0800 (PST)
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
Subject: [PATCH v4 2/5] m68k/bitops: use __builtin_{clz,ctzl,ffs} to evaluate constant expressions
Date: Sun, 28 Jan 2024 14:00:08 +0900
Message-ID: <20240128050449.1332798-3-mailhol.vincent@wanadoo.fr>
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

On linux 6.7 with an allyesconfig and GCC 13.2.1, it saves roughly 11 KB.

  $ size --format=GNU vmlinux.before vmlinux.after
    text       data        bss      total filename
    60457964   70953697    2288644  133700305 vmlinux.before
    60441196   70957057    2290724  133688977 vmlinux.after

Reference: commit fdb6649ab7c1 ("x86/asm/bitops: Use __builtin_ctzl() to evaluate constant expressions")
Link: https://git.kernel.org/torvalds/c/fdb6649ab7c1

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 arch/m68k/include/asm/bitops.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index a8b23f897f24..02ec8a193b96 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -469,6 +469,9 @@ static __always_inline unsigned long ffz(unsigned long word)
 {
 	int res;
 
+	if (__builtin_constant_p(word))
+		return __builtin_ctzl(~word);
+
 	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
 			      : "=d" (res) : "d" (~word & -~word));
 	return res ^ 31;
@@ -490,6 +493,9 @@ static __always_inline unsigned long ffz(unsigned long word)
 	!defined(CONFIG_M68000)
 static __always_inline unsigned long __ffs(unsigned long x)
 {
+	if (__builtin_constant_p(x))
+		return __builtin_ctzl(x);
+
 	__asm__ __volatile__ ("bitrev %0; ff1 %0"
 		: "=d" (x)
 		: "0" (x));
@@ -522,6 +528,9 @@ static __always_inline int ffs(int x)
 {
 	int cnt;
 
+	if (__builtin_constant_p(x))
+		return __builtin_ffs(x);
+
 	__asm__ ("bfffo %1{#0:#0},%0"
 		: "=d" (cnt)
 		: "dm" (x & -x));
@@ -540,6 +549,9 @@ static __always_inline int fls(unsigned int x)
 {
 	int cnt;
 
+	if (__builtin_constant_p(x))
+		return x ? BITS_PER_TYPE(x) - __builtin_clz(x) : 0;
+
 	__asm__ ("bfffo %1{#0,#0},%0"
 		: "=d" (cnt)
 		: "dm" (x));
-- 
2.43.0


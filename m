Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D909476
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Jan 2024 05:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706418371; cv=none; b=EC6z77PPhYmHXIOV6HcFaQZW0DQY4iFkvNnvT+udvD7Yb0Pit4ENant1VS+jkIBmY6Htxt20xxJx4oH1YY76oBBp3LtLn76HIhrk3rMtGeGKbQC+6fmcRP2n+pHqbfr2tNg3Tio9IPy9CZvrOLQ0ruyI4RrPE0uKeXxM6rNDi1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706418371; c=relaxed/simple;
	bh=qP1S1rXP0UMtjHp5qx9OgsIHVeo/JJwGD+kMiT1E4bU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvTh+tmoyfWnAjp80a1gK8rfw+cSFCIsdHEM47YUhtHgf9XVzSAk1fbFJKU/FaQFP49hgaY9S9BAiCOR8fF558KuU8+S3+zRPzzSQHVrT833itiDumrHHefPuFLqXl0O0tYxXV55qgNLR0EgavW1dcFmcLhFLlXj183Qn71avas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBMW52/7; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBMW52/7"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so1291224b6e.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jan 2024 21:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706418368; x=1707023168; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19sNIGW0pghbkIABBLpZ8u04puBnH22vL76jF4wAKJM=;
        b=RBMW52/7nM/C74dKaY3a5EjDqeaDBDqMceu+WVtCG/HDyMW4gdaKfTG14iki56Sztg
         yYR3eoeQAybkx9eqtfq0zUlnR7cu/7dK5wgAXksykoF06YkoTkVnShoZymvjp4/tFcOU
         n7Uv6T17cBmHSBXKfF6nDxpgVIL7r6S4eqsqamuB62DJb2PChmQZmOZMofrR4yJBOJd2
         CZmbZpE4LN4nS4mS49OvD6kYr2RcN5LUNItHp3AL3GtltY6832QOj1NpsNhCbi3n7rzC
         mhplNwvIyq19BEYB3oa+VgL+BVR2cOkTMUcCs1FaOVl5/kHxRPwqSyfWtrCKfp/f0c+0
         4JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706418368; x=1707023168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19sNIGW0pghbkIABBLpZ8u04puBnH22vL76jF4wAKJM=;
        b=bIFiGcZEP16j/wcG01MT/tFqGq4Cvo+CsnRkwwco/5gj8v0RXZTcLKlZ9rAPJXokXq
         Uv7o5b4GpJO/uxYc0oXsiY8OE3FvWNettY1GeFVz8x9/qPr6LxIhewR/vm0I65OdXOzV
         fV+2PJ4rYM/EPzm71Jkzs5g26jisFvpeduoicBhBdLAxkiwOowqSCAnI5pA+eA8Llp6p
         0QBpCADcabwmIXy7e4EasVlGGXVVxCfM3wdsRYtrW9B7IT9r+Yp2DabD6AzpI20JOPPM
         DMQFT/9yyHGpfAU1WetbEEQGWk9hHsN6Gwefet8z0R8ldfgUe6CNjQQrlydgm3aRqFZ8
         hwrg==
X-Gm-Message-State: AOJu0YwnuChv5CY/9mUMB7zj1tWZiCiAz0uka+Mv4p0o2X+Kv47PzQsN
	RvI+R/Z6hcx7JTw1mbi+JZqlISDDmaOe0AUqqkAUx2BcPk1KO817
X-Google-Smtp-Source: AGHT+IGBTtbhRceHwTa0x3eZf1sJmCivqoJmPoyAxwOiobLNypPD+byqKoFmrztSRgvKweXB+qAZ3Q==
X-Received: by 2002:a05:6808:1815:b0:3be:2175:98e9 with SMTP id bh21-20020a056808181500b003be217598e9mr2912252oib.18.1706418368391;
        Sat, 27 Jan 2024 21:06:08 -0800 (PST)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm3550372pfb.46.2024.01.27.21.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 21:06:07 -0800 (PST)
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
Subject: [PATCH v4 1/5] m68k/bitops: force inlining of all bit-find functions
Date: Sun, 28 Jan 2024 14:00:07 +0900
Message-ID: <20240128050449.1332798-2-mailhol.vincent@wanadoo.fr>
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

The inline keyword actually does not guarantee that the compiler will
inline a functions. Whenever the goal is to actually inline a
function, __always_inline should always be preferred instead.

__always_inline is also needed for further optimizations which will
come up in a follow-up patch.

Inline all the bit-find function which have a custom m68k assembly
implementation, namely: __ffs(), ffs(), ffz(), __fls(), fls().

On linux v6.7 allyesconfig with GCC 13.2.1, it does not impact the
final size, meaning that, overall, those function were already inlined
on modern GCCs:

  $ size --format=GNU vmlinux.before vmlinux.after
    text       data        bss      total filename
    60457956   70953665    2288644  133700265 vmlinux.before
    60457964   70953697    2288644  133700305 vmlinux.after

Reference: commit 8dd5032d9c54 ("x86/asm/bitops: Force inlining of test_and_set_bit and friends")
Link: https://git.kernel.org/torvalds/c/8dd5032d9c54

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 arch/m68k/include/asm/bitops.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index 14c64a6f1217..a8b23f897f24 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -465,7 +465,7 @@ static inline int find_next_bit(const unsigned long *vaddr, int size,
  * ffz = Find First Zero in word. Undefined if no zero exists,
  * so code should check against ~0UL first..
  */
-static inline unsigned long ffz(unsigned long word)
+static __always_inline unsigned long ffz(unsigned long word)
 {
 	int res;
 
@@ -488,7 +488,7 @@ static inline unsigned long ffz(unsigned long word)
  */
 #if (defined(__mcfisaaplus__) || defined(__mcfisac__)) && \
 	!defined(CONFIG_M68000)
-static inline unsigned long __ffs(unsigned long x)
+static __always_inline unsigned long __ffs(unsigned long x)
 {
 	__asm__ __volatile__ ("bitrev %0; ff1 %0"
 		: "=d" (x)
@@ -496,7 +496,7 @@ static inline unsigned long __ffs(unsigned long x)
 	return x;
 }
 
-static inline int ffs(int x)
+static __always_inline int ffs(int x)
 {
 	if (!x)
 		return 0;
@@ -518,7 +518,7 @@ static inline int ffs(int x)
  *	the libc and compiler builtin ffs routines, therefore
  *	differs in spirit from the above ffz (man ffs).
  */
-static inline int ffs(int x)
+static __always_inline int ffs(int x)
 {
 	int cnt;
 
@@ -528,7 +528,7 @@ static inline int ffs(int x)
 	return 32 - cnt;
 }
 
-static inline unsigned long __ffs(unsigned long x)
+static __always_inline unsigned long __ffs(unsigned long x)
 {
 	return ffs(x) - 1;
 }
@@ -536,7 +536,7 @@ static inline unsigned long __ffs(unsigned long x)
 /*
  *	fls: find last bit set.
  */
-static inline int fls(unsigned int x)
+static __always_inline int fls(unsigned int x)
 {
 	int cnt;
 
@@ -546,7 +546,7 @@ static inline int fls(unsigned int x)
 	return 32 - cnt;
 }
 
-static inline unsigned long __fls(unsigned long x)
+static __always_inline unsigned long __fls(unsigned long x)
 {
 	return fls(x) - 1;
 }
-- 
2.43.0


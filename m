Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63971CA9C
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Jan 2024 05:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706418380; cv=none; b=j6hdLCrUJTFONlZHDt0Lbj+Eu50fygItN6h7WHatNSlQBRbpfWMnvLTvgY1ZtLsC8Eqvjn6gKfKvI1mY/FV1wAUfZUo0V6FbmA9LhMh8jZILRUef3PrYiVOzW7sSWUnBxyiCsFsxWj1Houid/fSkyoO0BTOXyt8R+mY0dlOyaVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706418380; c=relaxed/simple;
	bh=EUVQyICOpBqVWh6g3IN6x5mNM2NGmg0g/sEBs5QBZ1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aiG3fi/IKAt7UdesJtH8dRP8lcGieneMCUToHpSBQ/pXVGgsSEmaVN55kBfg0I74vJRSF5NRbqeRMBcTFIdoC2h7mUyIwPft7uf4QA/30XEYGsrjn/fTMHW9tyecC+lNUY0DU2SRiHPU6jKNs41TNTyxH/9oUR4btfr/svUotac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIu6nAKd; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIu6nAKd"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5986d902ae6so1121789eaf.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jan 2024 21:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706418377; x=1707023177; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLlJCmhI5JZIPAQYj2G74sUtNrIAZ9HIcrgV/zcgKnA=;
        b=kIu6nAKdezuoNHyxp7s5FYNA8cSQmc4+RRkIQgQ1vskt4+SZSgOBGi3hEYD/ohAtBY
         E3wpo497PTBIWF5pc2IIfu4wiImQzMYRIw1l+4ZU5/r0rEbnw/eMsMhT23/CBbCBcF91
         DNnvpweJk/56YjOTlBXgRHVA6UUgxGW7xkD/TTPCm97QVmhdchS89Ra5RbynRgh0dIOM
         19jrIt53+v/lvcheqW/OYuW2h9XeqIlDt2UZoPwdyLN8epV9Nx6tJAikFE1cMUZ0T/O3
         O0zt6d+oJUA/+qZ04WTIoYRtK5VUcTQbc7PuB4qmV1hstywb+DaqK3Xu/0EWYTncpzPV
         8shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706418377; x=1707023177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GLlJCmhI5JZIPAQYj2G74sUtNrIAZ9HIcrgV/zcgKnA=;
        b=mB/P2JqM296idFmVsZ/0oGrSRmNwyZVR6IxzSLsxICSgxV8zZmPXcMcGCPl46zldtR
         KfhSez977OlfnRE67tcyLHnPLIXk0MoBfERGAXDunUHjGoXN3vGhrovXO9OisfrnZK+9
         Y7C5e+VqUMlFYspMWh6QjJE88LhIUYzNoVRQudOKv+kNWilwgBtdDjqqWpFTKJwuUJnd
         areyqSWl2lbgUg6GCFqj2f1g9BfQKo06rt8r7cf47SwwI/YRCUVYQt4RysgZ4UkEQPw/
         X+go3cd3LBgQFDPbZ8okCpeLPknpmaDPk4UJf5YyNHhIfCSdzXTaoULU0QVbZdLywQ9a
         RDWQ==
X-Gm-Message-State: AOJu0YxcwHdMR9y6nRCXaDgLP7ZiiLqQgkYB08T8OCyFrDtLKMxxfow+
	od92Sx5AsdelJYODN0Jr1cy4Khpx8OwDuzboOZZcgqAbaJ9r1yfA
X-Google-Smtp-Source: AGHT+IHoQbPQZIJSI+buf7XdlQZCHJPSEHdvtWV2n+RU3qSWFQbxHhbebOSg/814TJZcUf51VrOmCA==
X-Received: by 2002:a05:6359:4114:b0:177:2e7:cd54 with SMTP id kh20-20020a056359411400b0017702e7cd54mr3368594rwc.32.1706418376523;
        Sat, 27 Jan 2024 21:06:16 -0800 (PST)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm3550372pfb.46.2024.01.27.21.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 21:06:15 -0800 (PST)
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
Subject: [PATCH v4 3/5] hexagon/bitops: force inlining of all bit-find functions
Date: Sun, 28 Jan 2024 14:00:09 +0900
Message-ID: <20240128050449.1332798-4-mailhol.vincent@wanadoo.fr>
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

Inline all the bit-find function which have a custom hexagon assembly
implementation, namely: __ffs(), ffs(), ffz(), __fls(), fls().

On linux v6.7 defconfig with clang 17.0.6, it does not impact the
final size, meaning that, overall, those function were already inlined
on modern clangs:

  $ size --format=GNU vmlinux.before vmlinux.after vmlinux.final
        text       data        bss      total filename
     4827900    1798340     364057    6990297 vmlinux.before
     4827900    1798340     364057    6990297 vmlinux.after

Reference: commit 8dd5032d9c54 ("x86/asm/bitops: Force inlining of test_and_set_bit and friends")
Link: https://git.kernel.org/torvalds/c/8dd5032d9c54

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 arch/hexagon/include/asm/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/hexagon/include/asm/bitops.h b/arch/hexagon/include/asm/bitops.h
index 160d8f37fa1a..e856d6dbfe16 100644
--- a/arch/hexagon/include/asm/bitops.h
+++ b/arch/hexagon/include/asm/bitops.h
@@ -200,7 +200,7 @@ arch_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
  *
  * Undefined if no zero exists, so code should check against ~0UL first.
  */
-static inline long ffz(int x)
+static __always_inline long ffz(int x)
 {
 	int r;
 
@@ -217,7 +217,7 @@ static inline long ffz(int x)
  * This is defined the same way as ffs.
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
-static inline int fls(unsigned int x)
+static __always_inline int fls(unsigned int x)
 {
 	int r;
 
@@ -238,7 +238,7 @@ static inline int fls(unsigned int x)
  * the libc and compiler builtin ffs routines, therefore
  * differs in spirit from the above ffz (man ffs).
  */
-static inline int ffs(int x)
+static __always_inline int ffs(int x)
 {
 	int r;
 
@@ -260,7 +260,7 @@ static inline int ffs(int x)
  * bits_per_long assumed to be 32
  * numbering starts at 0 I think (instead of 1 like ffs)
  */
-static inline unsigned long __ffs(unsigned long word)
+static __always_inline unsigned long __ffs(unsigned long word)
 {
 	int num;
 
@@ -278,7 +278,7 @@ static inline unsigned long __ffs(unsigned long word)
  * Undefined if no set bit exists, so code should check against 0 first.
  * bits_per_long assumed to be 32
  */
-static inline unsigned long __fls(unsigned long word)
+static __always_inline unsigned long __fls(unsigned long word)
 {
 	int num;
 
-- 
2.43.0


Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2119D090
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Feb 2025 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959252; cv=none; b=DYw9DkO6nzl5yy/BQEzY/Wj9pnClCdHbyk54GojKSGLIQh1er9tTXAL9DC7/xkGSE5q9yHJY3SevR0YKsoFfQPy5EyLbGMDbNVOVfuFeyAa3PPSCL0EQqadJmastHOnSc1M0Hohr8j4BfSOtXTWGta83HXtP5aXGPxp2h0b4xJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959252; c=relaxed/simple;
	bh=CkmqeKdb4UmlPMqyL7e2jFIV9Sf8zIq378b0S2c6DzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J181gG7/H9uVzobeAOAl/XK8tRwfZZ20lyja6rOxrkzegW4ayRebeiyxxdfkAMSR4/jvVHv3k/4dXLcBJS7TvJo1gB5EjOHPR+e8jlFefg7vRLX96HR48lAHAGLT0vO1RgwfIXDOa8/2bUTFzAsJkK6cl+Zr3mK3xuj5WHXcF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiA4zPqO; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiA4zPqO"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7be3f230436so226873585a.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Feb 2025 12:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738959250; x=1739564050; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZxkSETWBGyS9QsIncAjdUCkDXpgCrsMQVJ3J6dEfbc=;
        b=UiA4zPqOT/pL30gp5igDVDwyMiKBfd2hfp9+VTOCoJ/6Cmwptb2O82dUuROJjljK0Y
         I7xic/6yyZTp7pagoKriZpE3uIGNXJNd+KtA0T/HHWYR+iqGAYC0S115sM8V5kTliZYI
         7OuSwxXS4vWCmhs40DEad69gIMQoi+7V00ofT7RxD1+PvChnon9aFQN50sdO9LO1/3Jk
         5UjrP/eJ0gqYmUrj3nfHQOGFyuomr/DTPg9+wlGlwiGw+mF+rcO1ABZ2r8TTaHZ90XOz
         vQXjuYn82jvps6EgW0+jbFMvfpwr06dLvGb2fWoNqU3OdkK/zRs7TsCa+RGaTQUCU3eM
         oS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959250; x=1739564050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZxkSETWBGyS9QsIncAjdUCkDXpgCrsMQVJ3J6dEfbc=;
        b=Gcjnu7n5xdMj/R/pdS35Czxl9j9EejTqtaYB9jr6II0ikU3+ScwZj+pjaI7C9RzySN
         5Lq3aMy08lmAjxxi7L1ExlCICBKHfb09pcgE8gP0sSF8b+rBoC/f/DMb79yReox7nhyb
         ilnEt9KEruJKDSEBqtIpYYTTS/cqeB0AhiOZVXk552Yy9kGmzNyyAkDehyDHAJHmPydG
         vxjQvzszl5efm/o0W4xiYZ761nIvI5JGGK7SyFYJNpw2I+yDzJOIxVXw4eSPw8osCUxn
         IB7mtpB/QDk9QtmtTuKrE/J/JZrLX+jRuVl7Sc83OGXfkBEK0t4BMPBZl/v7wey4LnBi
         LP5A==
X-Forwarded-Encrypted: i=1; AJvYcCUlurXXDDm9ntoNmq0Rk2jESwbUvAZ6JI8ENSP230DO6A9DJTeE5DjdUWxs/0/aSHB2ZaAC9JkP3mfE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwzrpIY40VqsCxK8eavbXqEcnAs4pOsg9sIyq+kjTatYAavEvs2
	hQjM7tRKJYLf1EqBH38L1mFmSLc/oSefoUFkxEYYXuAHHe9DHNas
X-Gm-Gg: ASbGncu0z75xHPDS44b2xiIB1iUGUxah1ZZx7YQgjonhD2eXZLHP/RgCO6VQ9i9Ci57
	mXOnr+JTfwrTYiB7uYO5/hgxpaZDxSkjBfR7DEqF6dyqk/EiYMyMMobMBWbrXI/Mz76LfJQioqR
	UvSlQFebIkp/pWCQMfUPrPPOz19wwXO3sjKscj5JxGiaLQQMzMN9QexFy7oCShQbjUWz+mlmpoH
	RRPp04w0wBxG76DpWjdtUE9ZwPkgeB+jp3cug0qSzIre06ufmc7Nx8uF1DBagOfVzd/ns1V2xPA
	E0+yGFVZlMIT2HVMHGdaEwhAElP2lOAKXcOb/GCJrZdHLvmvA+0jF/G8yonzHtrmEZmqGUrg5fo
	nCSpLsgzcWjO7grwduwacC+mZWW6jn4b6hKgcvw==
X-Google-Smtp-Source: AGHT+IFu3LnMnZppr9scjvCc/cSU/9PZACsPok2gL4YMsF6uEMfT/WzvaxNeLs4vM8mQeUo9sHI+ow==
X-Received: by 2002:a05:620a:2621:b0:7be:2a68:6d79 with SMTP id af79cd13be357-7c047c34ad5mr860389785a.7.1738959249714;
        Fri, 07 Feb 2025 12:14:09 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4041:5be7:7c00:c58e:ed03:1b60:c56d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e13895sm228851285a.58.2025.02.07.12.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:14:09 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 07 Feb 2025 15:14:02 -0500
Subject: [PATCH 1/3] bitmap: remove _check_eq_u32_array
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
In-Reply-To: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
To: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Shuah Khan <shuah@kernel.org>, 
 Kees Cook <kees@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This has been unused since commit 3aa56885e516 ("bitmap: replace
bitmap_{from,to}_u32array") in 2018. Remove it to avoid the need to port
it to KUnit in this series.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 lib/test_bitmap.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 65a75d58ed9e..c83829ef557f 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -100,34 +100,6 @@ __check_eq_pbl(const char *srcfile, unsigned int line,
 	return true;
 }
 
-static bool __init
-__check_eq_u32_array(const char *srcfile, unsigned int line,
-		     const u32 *exp_arr, unsigned int exp_len,
-		     const u32 *arr, unsigned int len) __used;
-static bool __init
-__check_eq_u32_array(const char *srcfile, unsigned int line,
-		     const u32 *exp_arr, unsigned int exp_len,
-		     const u32 *arr, unsigned int len)
-{
-	if (exp_len != len) {
-		pr_warn("[%s:%u] array length differ: expected %u, got %u\n",
-			srcfile, line,
-			exp_len, len);
-		return false;
-	}
-
-	if (memcmp(exp_arr, arr, len*sizeof(*arr))) {
-		pr_warn("[%s:%u] array contents differ\n", srcfile, line);
-		print_hex_dump(KERN_WARNING, "  exp:  ", DUMP_PREFIX_OFFSET,
-			       32, 4, exp_arr, exp_len*sizeof(*exp_arr), false);
-		print_hex_dump(KERN_WARNING, "  got:  ", DUMP_PREFIX_OFFSET,
-			       32, 4, arr, len*sizeof(*arr), false);
-		return false;
-	}
-
-	return true;
-}
-
 static bool __init __check_eq_clump8(const char *srcfile, unsigned int line,
 				    const unsigned int offset,
 				    const unsigned int size,

-- 
2.48.1


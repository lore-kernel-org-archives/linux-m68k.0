Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE2CB663
	for <linux-m68k@lists.linux-m68k.org>; Sat, 23 Aug 2025 05:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755925376; cv=none; b=rrSwtBPDIRMnAe4FZvwz7baemXAxOAbvv02qxQMHLoO3TWZUqXNoFFsX8Tr2N61Tt8/PiqAc6NsgK9+pN8TUHJ/ijMFnHR7y1rbqyCfan3ExwxflZSdU4j4tWSKeWP4nM6B+0HYDpwO6juPZT/E28e6q7eJ8R8BAOs/M6dnPW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755925376; c=relaxed/simple;
	bh=PUw1CEY9BF2A4FCoMSDLPSzSajO6DMKtVoLXf9xDEPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9NC6dlC5Vmdlz7re5AZD/ICtA0KyztURanG272Um7fPq4IWrQ/Oe+UIkZjQqCaqb9xX9NkMEfYmrgVRnln052UwlezrKBr8/eqHX7G+BV4c8e5EvyDn0dg+JPDneLuL7O9fBvMpKgG4xUTMX7onZF1Xht7hB6YKY9Uft7pwAs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b49d3b48d8aso8231a12.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 22:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755925374; x=1756530174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/d62ZhyQDkr88P3RsdKpz2BL7mo3EK8sLLtOc02S/I0=;
        b=KwV5nM0JrxYg4wP/2lilj3WJTLme3PW7ecVsHOxXrO4/ewAG8ME/FecrteTn4YzF7M
         eKtym1mCbK2Ya67OnZjsP/kleS9UOQqzCSo5t92r89VXIGzLn7W4QxzKwQeVTdUH8IQx
         F353oIkuwt/wcEp1IRRPtXh8zosZcq4vW8qtthQg0/YTix1JWPQmOYh71i7L8D50dJtD
         Rt6VGBbwvzjNbqKFxo65M6kbLyIvj4CDJTcwp+gghYnWqPcP7KiZssw63KXjsCcukM2h
         7u+gNnPX+b7BGicTuOOtkZEPA0zRq6kclWbn+FhH8tBTOrg12Nzano3F2+sfHlQlmPwt
         74HA==
X-Forwarded-Encrypted: i=1; AJvYcCWjXHo/n6dGiqxp6DGuueyPN/lIXAWyFNFp+Ct+glbDXR99B4X9tmOzKi2TjyNiMtrAVz2Xk9YRkWYH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzdXdfKyPa6qltv9xpA4iN10iP09aN0eXgBUkHvBhr3/Khl5VFs
	W+KhH/3VOdlcFN7T6h7C68gDp005hG1jVzd3rBVApzSfgC/VxBB57uRd
X-Gm-Gg: ASbGncvm4SL5REfStR+maVOLHOQiTyaOC9Qcw/BqW4E8bU8KJtsa6uy54UrJBPdga1M
	AWjILS7k7KcKM025Os6EMIeRzUF8aZDpjNhsAFIV+73AQ47cDwB75e9Wt12jYcNRc+Kq0ICv+HV
	11CAszN8QTVkPgoq5/n19p6vJay4EhsTBvsuX+XW++p+rLkJdjr5MQvHiLqNrV98MPoPEwJt9z7
	awMuvGHiOxP3dardzTyH0wLudclprQTl2/VmJpEzT9v/4an8l1qnjpA8WmhObyfi/1FM0QzSBTg
	YZM9NGrdowqY4DzRoJo4adAlyOYcuXT0VBAjn4TjJl5DFwhWLbhRz2UjkgwASyaM97hFeJwtRd/
	VLgVx0Ptv7oN0QMRdxrpraDi7rMf5
X-Google-Smtp-Source: AGHT+IE8770SMYUXmPTg9FqFtmb8WBT+htAHMIkfnPossk9y2D5JS3AQrYJBFyN+jCsWvbzmTaOlqA==
X-Received: by 2002:a17:902:c946:b0:246:39d7:8e6a with SMTP id d9443c01a7336-24639d78f54mr74824125ad.43.1755925373870;
        Fri, 22 Aug 2025 22:02:53 -0700 (PDT)
Received: from localhost.localdomain ([2403:2c80:17::10:4030])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877c732sm11997115ad.1.2025.08.22.22.02.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 Aug 2025 22:02:53 -0700 (PDT)
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org,
	fthain@linux-m68k.org,
	geert@linux-m68k.org,
	mhiramat@kernel.org,
	senozhatsky@chromium.org
Cc: lance.yang@linux.dev,
	amaindex@outlook.com,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	ioworker0@gmail.com,
	joel.granados@kernel.org,
	jstultz@google.com,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	longman@redhat.com,
	mingo@redhat.com,
	mingzhe.yang@ly.com,
	oak@helsinkinet.fi,
	peterz@infradead.org,
	rostedt@goodmis.org,
	tfiga@chromium.org,
	will@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/1] hung_task: fix warnings caused by unaligned lock pointers
Date: Sat, 23 Aug 2025 13:00:36 +0800
Message-ID: <20250823050036.7748-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <f79735e1-1625-4746-98ce-a3c40123c5af@linux.dev>
References: <f79735e1-1625-4746-98ce-a3c40123c5af@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

The blocker tracking mechanism assumes that lock pointers are at least
4-byte aligned to use their lower bits for type encoding.

However, as reported by Geert Uytterhoeven, some architectures like m68k
only guarantee 2-byte alignment of 32-bit values. This breaks the
assumption and causes two related WARN_ON_ONCE checks to trigger.

To fix this, the runtime checks are adjusted. The first WARN_ON_ONCE in
hung_task_set_blocker() is changed to a simple 'if' that returns silently
for unaligned pointers. The second, now-invalid WARN_ON_ONCE in
hung_task_clear_blocker() is then removed.

Thanks to Geert for bisecting!

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/lkml/CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com
Fixes: e711faaafbe5 ("hung_task: replace blocker_mutex with encoded blocker")
Cc: <stable@vger.kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 include/linux/hung_task.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/hung_task.h b/include/linux/hung_task.h
index 34e615c76ca5..69640f266a69 100644
--- a/include/linux/hung_task.h
+++ b/include/linux/hung_task.h
@@ -20,6 +20,10 @@
  * always zero. So we can use these bits to encode the specific blocking
  * type.
  *
+ * Note that on architectures like m68k with only 2-byte alignment, the
+ * blocker tracking mechanism gracefully does nothing for any lock that is
+ * not 4-byte aligned.
+ *
  * Type encoding:
  * 00 - Blocked on mutex			(BLOCKER_TYPE_MUTEX)
  * 01 - Blocked on semaphore			(BLOCKER_TYPE_SEM)
@@ -45,7 +49,7 @@ static inline void hung_task_set_blocker(void *lock, unsigned long type)
 	 * If the lock pointer matches the BLOCKER_TYPE_MASK, return
 	 * without writing anything.
 	 */
-	if (WARN_ON_ONCE(lock_ptr & BLOCKER_TYPE_MASK))
+	if (lock_ptr & BLOCKER_TYPE_MASK)
 		return;
 
 	WRITE_ONCE(current->blocker, lock_ptr | type);
@@ -53,8 +57,6 @@ static inline void hung_task_set_blocker(void *lock, unsigned long type)
 
 static inline void hung_task_clear_blocker(void)
 {
-	WARN_ON_ONCE(!READ_ONCE(current->blocker));
-
 	WRITE_ONCE(current->blocker, 0UL);
 }
 
-- 
2.49.0


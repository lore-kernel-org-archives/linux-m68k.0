Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F704352094
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Sep 2025 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429726; cv=none; b=q8AufP0NFdwNl9tm6XbHwzuWp9X1D7OWOwS73FKqF4CYrhqH2/EdQIUle3S+8mNhS54V94xWTgRV09WS1BULevQ9OFfgLHLSwE4dZrz5Ul1KNWMM6XMymrN2m7X4AtBhrGJ3waX040mcoTnihWryJmbMIRHACht13skyHi0qoMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429726; c=relaxed/simple;
	bh=ky57FsK+ZwLKbku/saNrnr9EUH82r7jT4ICfgMJnqLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cWF3xArQU3j1nUrX8mkrpJ013O4h7MxOWG6Pysq9RtT9xi5m0p2pL/6BmEJdyquupsUpkFItM76fW2WOoExkoSJJaYaS8/db1Xxg8tn+cKp6ZofxSG6qWxFYKNZwfU7fgOPVbqOxp7AO/nMqFTXA0FaWxhfP+687HI4eN6I2Kh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4c72885c8bso4670221a12.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Sep 2025 07:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429724; x=1758034524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHogqelsTwxeycQ9MTU1T+FN83tx+jucaPlsIWSCXaw=;
        b=h2jkqgCNw3XBXhiRGKo2XEP0Zaa5Sh3zDFVwJ9T+AvJGRl8xGU8LpbBn9Y3nzZEg5B
         bQvRDqgJqxQhdetk/Z2yQhO2oY/MSTdXeHZzhwtgr2rWLj0qx8vj6eFW0Nrqzn9Rc0hS
         baOP2QswF8vjWc43J1CwRRW+s2+sKAJNH1dxCIAxoaZvCVkfBUfm5m9TiUHmjww/xTK4
         r+26RLJwpcNFqKZb6SQKGe65/x+MxM13U5TkuDYY6B/4dHsoVPHfug55ev6if+FW6IOH
         o/Hw3TeUKR6SJStEbZH8moDkuTti6C0kr3ZPEVILCHUd61r0hg68kLuGUkw56Zm1HfOi
         mkVA==
X-Forwarded-Encrypted: i=1; AJvYcCVLEaJgGW3o/DCXoU/2lrXPpCmskV6EvuxpSdcZXrqW9ZTTPnQKuBSZSbwMgJPqs5sOmuqFfYJarjIF@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyO9LYBgvksjIrlw5m2JKkSJX0hWlBmfhvR3t3TlEbIyeTxA1YX
	Od/3NOLxF5D+iQ6zu868CKwrtl7/3Myttpb4GgDbS4t3xo3nOh8OX49E
X-Gm-Gg: ASbGncv40mjcfX3bAQYAL6Df6wI/SWZ8xMq/MQSIzc2X1CZRC5dnXeW8ZVIuKc98C9t
	erfbAWFKQOAgBkPiquU4iNMANZof70yr3iE8PcSdKkoT8ieWLCAkTstAbzMl74JIf8NzErU0GiK
	zZBav8Utq6maBIMf3DOjcjVwgq+wfdcPnUQU9xSFYYw1GwgwmIKHtlDuk7aQRFsc5QSbpwqhGhE
	PHqRwwDcyF5eKLlLJRFgooWATTTGjWIxCQg6RrW7DYlMJpHC0gNNrY2YcDYRwcYMpPbwblwKLd5
	brRTJ4mADM/Pn1HegzuftGHOfYlUUBBPnqieGTUuoHJvegy7R04hocHlEyyfIa+2alRTCiZzTjm
	NjR+q055dTUdAascvINKvrg==
X-Google-Smtp-Source: AGHT+IHkIshl/aWZm2fCaWybFluAZHPfI6tLwJLETX4ig8R0dYCu6Ub2msMWpJ7VlLiEPnyVDF1nyA==
X-Received: by 2002:a17:903:ace:b0:250:1c22:e7b with SMTP id d9443c01a7336-2517493933emr169088305ad.43.1757429723785;
        Tue, 09 Sep 2025 07:55:23 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::20b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2a9229desm305035ad.105.2025.09.09.07.55.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Sep 2025 07:55:23 -0700 (PDT)
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: amaindex@outlook.com,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	fthain@linux-m68k.org,
	geert@linux-m68k.org,
	ioworker0@gmail.com,
	joel.granados@kernel.org,
	jstultz@google.com,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	longman@redhat.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	mingzhe.yang@ly.com,
	oak@helsinkinet.fi,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	will@kernel.org,
	stable@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v2 1/1] hung_task: fix warnings caused by unaligned lock pointers
Date: Tue,  9 Sep 2025 22:52:43 +0800
Message-ID: <20250909145243.17119-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
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

However, as reported by Eero Tamminen, some architectures like m68k
only guarantee 2-byte alignment of 32-bit values. This breaks the
assumption and causes two related WARN_ON_ONCE checks to trigger.

To fix this, the runtime checks are adjusted to silently ignore any lock
that is not 4-byte aligned, effectively disabling the feature in such
cases and avoiding the related warnings.

Thanks to Geert Uytterhoeven for bisecting!

Reported-by: Eero Tamminen <oak@helsinkinet.fi>
Closes: https://lore.kernel.org/lkml/CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com
Fixes: e711faaafbe5 ("hung_task: replace blocker_mutex with encoded blocker")
Cc: <stable@vger.kernel.org>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
v1 -> v2:
 - Pick RB from Masami - thanks!
 - Update the changelog and comments
 - https://lore.kernel.org/lkml/20250823050036.7748-1-lance.yang@linux.dev/

 include/linux/hung_task.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/hung_task.h b/include/linux/hung_task.h
index 34e615c76ca5..c4403eeb7144 100644
--- a/include/linux/hung_task.h
+++ b/include/linux/hung_task.h
@@ -20,6 +20,10 @@
  * always zero. So we can use these bits to encode the specific blocking
  * type.
  *
+ * Note that on architectures where this is not guaranteed, or for any
+ * unaligned lock, this tracking mechanism is silently skipped for that
+ * lock.
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


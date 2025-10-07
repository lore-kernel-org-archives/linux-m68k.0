Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F9C240604
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Oct 2025 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759870566; cv=none; b=alXSSPn0VClZDXIbz0J9/5b0xxtOfO0Q8iBMP4BCzFkGXoVKUA82AajH74DFuduCToq0sKRrjVNpYwLTrC6HJB/nqsBKg9LFlOC8QJFRHYPsopugKl7cWG9H2yDwBoCqHuamfGawjjJsW51wjo6QlUqACaUbYdLcCK8anihPg5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759870566; c=relaxed/simple;
	bh=Gg93q9CWxU5Fuu6tdVUBKMJqQ0HTtVaIEb6Cg6dpU9s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HBN6qDe1UVAs3D0mbAgZu/RpKX7+QMWwcvpT/t70xHqI+ObaWSe82DETJAmZuoG4mPXadecvzXFOD91XK0ujy+22gr4IhmXm+DJf0iDa3/KVIH7r2PAjZBY3043KhpAGWUhU9p3urgSvch8u+2pty9w0sdezBci5M4jx7efl800=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vpy3OQSP; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vpy3OQSP"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18CF5601FE;
	Tue,  7 Oct 2025 20:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24D4C4CEF1;
	Tue,  7 Oct 2025 20:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1759870561;
	bh=Gg93q9CWxU5Fuu6tdVUBKMJqQ0HTtVaIEb6Cg6dpU9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vpy3OQSPxKsYHofaY5nTubfqbeqCcI02CR2QjQABytRZminMP/SlUK8Lg0Yy5Rk1t
	 nMiGpw5x0NaHJU4Go+SY3vkeu+6DN8Cn0B4yKwuZUBgyXWkb3Iqa0a++tobdurFO0E
	 JVfOHj0NBLGpUSlj+d3VbUWwq2a0dxVBkpi7QCiU=
Date: Tue, 7 Oct 2025 13:56:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain
 <fthain@linux-m68k.org>, Lance Yang <lance.yang@linux.dev>,
 amaindex@outlook.com, anna.schumaker@oracle.com, boqun.feng@gmail.com,
 ioworker0@gmail.com, joel.granados@kernel.org, jstultz@google.com,
 leonylgao@tencent.com, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, longman@redhat.com, mhiramat@kernel.org,
 mingo@redhat.com, mingzhe.yang@ly.com, oak@helsinkinet.fi,
 peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 tfiga@chromium.org, will@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hung_task: fix warnings caused by unaligned lock
 pointers
Message-Id: <20251007135600.6fc4a031c60b1384dffaead1@linux-foundation.org>
In-Reply-To: <inscijwnnydibdwwrkggvgxjtimajr5haixff77dbd7cxvvwc7@2t7l7oegsxcp>
References: <20250909145243.17119-1-lance.yang@linux.dev>
	<yqjkjxg25gh4bdtftsdngj5suturft2b4hjbfxwe6hehbg4ctq@6i55py3jaiov>
	<99410857-0e72-23e4-c60f-dea96427b85a@linux-m68k.org>
	<CAMuHMdVYiSLOk-zVopXV8i7OZdO7PAK7stZSJNJDMw=ZEqtktA@mail.gmail.com>
	<inscijwnnydibdwwrkggvgxjtimajr5haixff77dbd7cxvvwc7@2t7l7oegsxcp>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Getting back to the $Subject at hand, are people OK with proceeding
with Lance's original fix?


From: Lance Yang <lance.yang@linux.dev>
Subject: hung_task: fix warnings caused by unaligned lock pointers
Date: Tue, 9 Sep 2025 22:52:43 +0800

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

Link: https://lkml.kernel.org/r/20250909145243.17119-1-lance.yang@linux.dev
Fixes: e711faaafbe5 ("hung_task: replace blocker_mutex with encoded blocker")
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Reported-by: Eero Tamminen <oak@helsinkinet.fi>
Closes: https://lore.kernel.org/lkml/CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Anna Schumaker <anna.schumaker@oracle.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Joel Granados <joel.granados@kernel.org>
Cc: John Stultz <jstultz@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: Mingzhe Yang <mingzhe.yang@ly.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yongliang Gao <leonylgao@tencent.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/hung_task.h |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- a/include/linux/hung_task.h~hung_task-fix-warnings-caused-by-unaligned-lock-pointers
+++ a/include/linux/hung_task.h
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
@@ -45,7 +49,7 @@ static inline void hung_task_set_blocker
 	 * If the lock pointer matches the BLOCKER_TYPE_MASK, return
 	 * without writing anything.
 	 */
-	if (WARN_ON_ONCE(lock_ptr & BLOCKER_TYPE_MASK))
+	if (lock_ptr & BLOCKER_TYPE_MASK)
 		return;
 
 	WRITE_ONCE(current->blocker, lock_ptr | type);
@@ -53,8 +57,6 @@ static inline void hung_task_set_blocker
 
 static inline void hung_task_clear_blocker(void)
 {
-	WARN_ON_ONCE(!READ_ONCE(current->blocker));
-
 	WRITE_ONCE(current->blocker, 0UL);
 }
 
_


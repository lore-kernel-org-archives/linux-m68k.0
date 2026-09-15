Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035314B1271
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 11:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472030; cv=none; b=iEt8Ds2NOe53NKPZat8LKFY6CNPDKMW7sZHupX0ADcHTt3N4ql5X/ph/x1f41Xc8wDqtO4Tukb2hOzL91Yx03+UMwEzIZ0zatl7b7J++jfuSTWvwGxaFGeldZh2Xls+JStoxADhLaayPAuKavCLyBI1GChZA/1yXrvt+QwkLAXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472030; c=relaxed/simple;
	bh=kO5/kQT0XZnIdRnIvngddyYIzT4ZNU9mDakuELDqlrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JB4YhhgRgMZEtikYLtNV0fOmbaizkGWNyDd5UfTP/QWEekodVGTOcimBVoMFQbdeLviqJTp4xvJhxpYz4QzDO3W3CUvVPwk92q8EQ3gsvsV53yuAUp9JSu8NCjp83WmzQi+IEQ37j8VW1MDQnFz3kSX47JJO1VgEf2euLS5dSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nmpj4NaF; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nmpj4NaF"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88ED742A92;
	Tue, 15 Sep 2026 11:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EB01F00898;
	Tue, 15 Sep 2026 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789472026;
	bh=fPUeEhZalZFbuqvBU8/iDG2tqjgIH/ueKLGrOGx0E/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Nmpj4NaFXMtUCUBJkK324vi22fpzvX6uomFULBZJOjhgDQCroZWI/8lb8hRAJVCHh
	 9EhYq/igSRVSJd0Z69cCAreFakLrT8v7g5ED2rGJFufV7eihjNzGDapElAJqkyWjpl
	 lBXB4AtsKeIiuD1UD4coI3pcXNoLmTr78UlIqOkuglt9Hw0oChJkwnEGg4w0f6UJ0f
	 E3lrRN0G+U0+0MXEDUccPLURv/tGCWrEtzl5wBa6tk79GG6qHRxEjmf3jJK1LMmPo3
	 /VFHB2tZrT068p2qgHGbLHusKwE8Tye3wqbBTFb6QOLjp++ERuzcM9sRPxtZnWLn1E
	 KgqcMBfnsrMfA==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 15 Sep 2026 13:31:05 +0200
Subject: [PATCH RFC POC 19/50] file: require the syscall exit hook from
 every architecture
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-work-fd-reserve-unify-folded-v1-19-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, 
 Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, 
 io-uring@vger.kernel.org, netdev@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 bpf@vger.kernel.org, David Airlie <airlied@redhat.com>, 
 virtualization@lists.linux.dev, kvm@vger.kernel.org, 
 kexec@lists.infradead.org, linux-hyperv@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=brauner@kernel.org;
 h=from:subject:message-id; bh=kO5/kQT0XZnIdRnIvngddyYIzT4ZNU9mDakuELDqlrQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSt1Kmt7K/PWBxqv33Jx9xZ93feiJvYXvn0wyGRJfor4
 xvDgz5O7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjImo8M/0t6Hp5cOHfxxr5q
 5ZTEWby+CmuzN2gtu/o25VNw3Kl5VQ8Z/ns2bzkbtn3/k1lfb3I0OE2bn/HePMr9P8+ZRZUPSuV
 nr+YCAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Every architecture now either uses the generic entry code or provides
TIF_FD_SLOTS. The fallback that deferred without ever committing
can go. Make it a build error instead. A new architecture can't grow
fd_prepare() callers without the syscall exit hook.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/file.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/file.c b/fs/file.c
index 6fa481d63dcf..2b041b45f225 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -652,9 +652,7 @@ static void fd_release(unsigned int fd)
 #define fd_slots_set_work()	set_thread_flag(TIF_FD_SLOTS)
 #define fd_slots_clear_work()	clear_thread_flag(TIF_FD_SLOTS)
 #else
-/* Nothing commits until the architecture provides the flag. */
-#define fd_slots_set_work()	do { } while (0)
-#define fd_slots_clear_work()	do { } while (0)
+#error "the syscall exit path must commit prepared file descriptors"
 #endif
 
 static struct fd_slot *fd_slot(struct fd_slots *slots, unsigned int idx)

-- 
2.53.0


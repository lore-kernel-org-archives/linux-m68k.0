Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E4C4A5C2B
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472156; cv=none; b=r4Umzp30iBtacF4Usgo8bo8RNI42ubhB61Ii2+r8Ep1vSRi63E1Mb1UHtOjCv3loph0FXe3VuXDcXSICJtGc9duBsJ5Nj1/s/sbJGneHDyJOMRDtkBKuVIvwbhczP/M3Yff0HGiK+iroAinkn6prYFtpVHVBU2FNSMQaivaZNV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472156; c=relaxed/simple;
	bh=QV1nvuOZOTXbG885TIwwr0E5buagCxFnNDHDpDWzkd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLjbABShaMA+XkyM5m/O1D0PcmT5nak5lQz6tP1JM+0Od9T5xO/6mNMXamUdzZ0X7jlQKV+y26ZB85cWQtq8LENzhpMADAlufZ6PndiHFW3nCjRZ48uSskwnOdSHg/jIoN+tKuVGjr3YWc9dKyMOQIvSfdBKvvJ/zUNJ4wjumcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdYtXPMr; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdYtXPMr"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C705841253;
	Tue, 15 Sep 2026 11:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDC21F00898;
	Tue, 15 Sep 2026 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789472150;
	bh=RYwvcYgPe7F+yniz25uY8kYzwfi4Dpf3GuV+JDSn+cI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MdYtXPMryZ+6SAlSbL19CQpX3Z64/AWWELS/WUVzAp8Xg1GKcwta2ZBYcN6wG36Mt
	 as5Dtg1uHZx0++57+0zFQf62SXXotYbTuzCZx9KtLUQmxwarrRVEc5GHr8NgTGLTnD
	 fm7wTaE+frwG78TGBDzq5+X5mT91CNgxDsAlIIvj/82S1VRyMtU0YNLM25MFctgbyo
	 vTKRbl5GQlZXJ0hhVYRlwEl093ozZ6/IECB99aVD24EC0zmPYaRRHVzNiU6egwU8ae
	 gX3+hqTSVslPaF8dAefZoz9w+FElBtfBAJO7mXAQPx7QPzbOBB9Xhv3/9TzLihtFHy
	 3qlJrcB+1giaw==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 15 Sep 2026 13:31:21 +0200
Subject: [PATCH RFC POC 35/50] ALSA: compress: install the task descriptors
 when the ioctl returns
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-work-fd-reserve-unify-folded-v1-35-4d5217d6b246@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232; i=brauner@kernel.org;
 h=from:subject:message-id; bh=QV1nvuOZOTXbG885TIwwr0E5buagCxFnNDHDpDWzkd0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSt1Kk7NZFnW/2OMo2T/F2ffljdXrzpyBybxa2xOhV3m
 5euvTinqKOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAidmKMDD3u79olF+/8fDpn
 05GGxJ924Sr7JVZeMFmoxWl14Jl/rCQjQzvbH6/0789fvC17P2P1pnCZsljB76s+Sl9/e0W5ZEW
 eETMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Rely on the fd exit path machinery.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 sound/core/compress_offload.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 23d62fede06e..94bc226f8db9 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1065,7 +1065,8 @@ static u64 snd_compr_seqno_next(struct snd_compr_stream *stream)
 static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_task *utask)
 {
 	struct snd_compr_task_runtime *task;
-	int retval, fd_i, fd_o;
+	int retval;
+	const struct fd_slot *fd_i, *fd_o;
 
 	if (stream->runtime->total_tasks >= stream->runtime->fragments)
 		return -EBUSY;
@@ -1080,29 +1081,26 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 	if (retval < 0)
 		goto cleanup;
 	/* similar functionality as in dma_buf_fd(), but ensure that both
-	   file descriptors are allocated before fd_install() */
+	   file descriptors are reserved before either is staged */
 	if (!task->input || !task->input->file || !task->output || !task->output->file) {
 		retval = -EINVAL;
 		goto free_driver_task;
 	}
-	fd_i = get_unused_fd_flags(O_WRONLY|O_CLOEXEC);
-	if (fd_i < 0) {
-		retval = fd_i;
+	fd_i = fd_prepare(O_WRONLY|O_CLOEXEC);
+	if (IS_ERR(fd_i)) {
+		retval = PTR_ERR(fd_i);
 		goto free_driver_task;
 	}
-	fd_o = get_unused_fd_flags(O_RDONLY|O_CLOEXEC);
-	if (fd_o < 0) {
-		retval = fd_o;
-		put_unused_fd(fd_i);
+	fd_o = fd_prepare(O_RDONLY|O_CLOEXEC);
+	if (IS_ERR(fd_o)) {
+		retval = PTR_ERR(fd_o);
 		goto free_driver_task;
 	}
 	/* keep dmabuf reference until freed with task free ioctl */
 	get_dma_buf(task->input);
 	get_dma_buf(task->output);
-	fd_install(fd_i, task->input->file);
-	fd_install(fd_o, task->output->file);
-	utask->input_fd = fd_i;
-	utask->output_fd = fd_o;
+	utask->input_fd = fd_stage(fd_i, task->input->file);
+	utask->output_fd = fd_stage(fd_o, task->output->file);
 	list_add_tail(&task->list, &stream->runtime->tasks);
 	stream->runtime->total_tasks++;
 	return 0;

-- 
2.53.0


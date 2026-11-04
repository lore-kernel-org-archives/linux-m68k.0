Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821956;
	b=vj2ZF2W08/gaRZP3M4fM6GcOiHPxOwcWA8mZNfPUbktdEzHhXx/WmRg209pSPkHYaORT
	 9/MQqsYPw1IeSnjl8I0+pUYQObn42AtGwDcyInJF9jX8nIkjm2r24D+1LJzq/nncSbDoc
	 EdLiWwh9D+tgu97N/VsfDW0ejeEOD0WsKSu+0CZkyt5K8ggS6yGvWlnVPbEwOuKCLy6s0
	 ptBcRoYO46PCpuvkLuIWD2ozzIrVg9s4v/5BRwC72tbcUz1KrFZpJDAoMPmeef83Bfjvi
	 aPG2plxkYjQFuHRIYQeODoCdLIzI53Yrv2dpESgGQMKRG8rbWVtF8vWjwdJMJlXTeLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821956;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=yr3akMspnIWFpqWJkjrAgv6glOgJhJX8fSAifemHFwA=;
	b=bV9OowHJ+Bk2XXyERgEZFH/3gdhb8mToyik+tS0eg6iKp/mitxjy8++kqfTUNDrK0+jA
	 TB+ipz/vhxscE4vgaXBs8lOH1vZQbRF6lwrf967jmt++/iohd2K3pD7ECEd9Cd0jPardT
	 YQ2aZgc/gKXgS99l/wGNOrn+AWQhdrNxHWqxGGY+ucYUXsvRoYUSvohXQNuDZSkJVIC7A
	 Xh7idxkyGn94sv4DqPP2Ctwfr9ln6G7esmO+OrExxJIfAfFrXAOEFuQR2hDiGBZ+YMrff
	 FixvY+jqRii478aguze4WiXf3ab6hUetRYAFiL8WCE0WpXgpc61Ib6jl96XhAIiErvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Wdi/cBrV";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2660D87A2
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE2660D87A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wdi/cBrV
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4D5A408A2;
	Wed,  4 Nov 2026 19:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742AB1F00A17;
	Wed,  4 Nov 2026 19:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821955;
	bh=yr3akMspnIWFpqWJkjrAgv6glOgJhJX8fSAifemHFwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wdi/cBrV+aPpgWRwzXpiA+ib3De0K0pQhXbyKJhu1iexPEaDfaOTHNqiiiqzPXo1n
	 sHBvBkYLvUp265kZxirmL7Ost0iN+Glcw1jB+xXLZfNzc7jQ/+vNrfyJuIub3D24aH
	 FJeeaeTI1JKYgVteizb9BzRe2OXphrQw0/Z3qIHs6/g1diX9mzri9ugVAFK0faPBni
	 4fNDrMwo9L4EM/Oii/TzK2gV2q/Po1jRRBmUKKs+oPw3OgQB1bIjbd27ca1yrbdHfk
	 Mgqqa9yGsWvWaLe2ghGBqK/zKktWtu1oUQAE7grmxfWRAs9G65+CGMdjqpjfo1wZXs
	 QP7jFCWB/AzOQ==
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Jann Horn <jannh@google.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Chris Mason <mason@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Eric Dumazet <edumazet@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Joel Granados <joel.granados@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jan Kara <jack@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org,
	ntfs3@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	coreteam@netfilter.org,
	kexec@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ibm-acpi-devel@lists.sourceforge.net,
	jfs-discussion@lists.sourceforge.net,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-mm@kvack.org,
	linux-sh@vger.kernel.org,
	linux-usb@vger.kernel.org,
	samba-technical@lists.samba.org,
	sparclinux@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-doc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	Takashi Iwai <tiwai@suse.de>,
	linux-input@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	"Christian Brauner (Amutable)" <brauner@kernel.org>,
	Chuck Lever <cel@kernel.org>
Subject: [PATCH RESEND v2 11/30] latencytop: let procfs copy in writes to /proc/latency_stats
Date: Wed,  4 Nov 2026 20:52:21 +0100
Message-ID: <20261104-work-procfs-fs-v2-11-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=brauner@kernel.org; h=from:subject:message-id; bh=9/PXHkkWFBWwJpiw0GjnsftfBxXIsWStv0RQuWJfsao=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97rHYoefdeeu3Wu6hdxnVaz7v/WWclHzHXeCSxcHZu dEaxyrZOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZiz8Xwz0LT9mYft9DOxTmH s3zMX0Q82m1+d9ocNc7ZMcs3fnzYeY2R4XCAwMyUHolzwR/2ZJ/ocma7der9hQWXfd9w6kXPqxW I5gUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_write_buf() so procfs copies in what is written before
it pins the entry. The write only clears the statistics and doesn't look
at what was written anyway. Writes larger than PAGE_SIZE - 1 bytes fail
with -EINVAL now.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 kernel/latencytop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/latencytop.c b/kernel/latencytop.c
index b764f47606d3..35f73ca07656 100644
--- a/kernel/latencytop.c
+++ b/kernel/latencytop.c
@@ -267,8 +267,7 @@ static int lstats_show(struct seq_file *m, void *v)
 }
 
 static ssize_t
-lstats_write(struct file *file, const char __user *buf, size_t count,
-	     loff_t *offs)
+lstats_write(struct file *file, char *buf, size_t count, loff_t *offs)
 {
 	clear_global_latency_tracing();
 
@@ -277,7 +276,7 @@ lstats_write(struct file *file, const char __user *buf, size_t count,
 
 static const struct proc_ops lstats_proc_ops = {
 	.proc_show	= lstats_show,
-	.proc_write	= lstats_write,
+	.proc_write_buf	= lstats_write,
 };
 
 static int __init init_lstats_procfs(void)

-- 
2.53.0


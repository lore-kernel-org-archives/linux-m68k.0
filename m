Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819192;
	b=km/ezakFrRY9l0UpnxqsPY+YK9bo9UWfW1ids63CgjqR8Qa1Wlo5tjj/ZuqfWILN/col
	 xGk0n8R2kwHAqFNDz48l4QQhlcltUZI10RZx/mOheeYbH+W5Re4mHGM4p82v2zfrTfMMp
	 qjUCeNd1RXmLKDBqsayKeAQMMHkS2j1L1TvHEWU4c1iC1LZpDRnaA679kk8tJRSr1K9wg
	 ZAMbuPvjjJ+wwmUllA4zpjUKY61fjJOG3pigHJoUrglvFfLoe6gLH/rqiZKL/6ycmjkE8
	 tWRNCWBXUvo4jrs+6p6HqQU+Um6povlYhHm2s723eFmsZ/vCv65X696KtyeVvxW+ldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819192;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Em8mdDwLTSxa5ZBRNu+oIoQ2F8Zgf6ZNSHVwHsLTxqQ=;
	b=AhziZXGUeUbCeJia1tThHEfHfavMeSyFaT7pAzR9efphrn+RVrMGOOeNpmew46hyN3RW
	 SGs6/PSq2waKSEmjkjhDhlsyJPNnpIS7JWK6a2k49KwqEchOCwbo7H6NgNUPkc9aSdyDP
	 iwTHLNpREPteZag2RpFvSBCKUOi8l28XkRl3HmNZAAVzLZjoiZSpGtYxpCIZB0Ju5/iA+
	 kxk6JYekG0ZLbq+MQ48ZAEh4LcgWop4RdU1d+lReZYc0Iz4zp4/UJg2yNkKrWkZX95/7/
	 nIARs1U1CmXztdizMFauzdD+A2z62Y6gTCGyMRgMGmyJmGVA5SLM2r2oXKm2vjMR4kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+rigGmZ;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACFA606A329
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACFA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+rigGmZ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54F2D60A59;
	Wed,  4 Nov 2026 19:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07691F000C1;
	Wed,  4 Nov 2026 19:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819191;
	bh=Em8mdDwLTSxa5ZBRNu+oIoQ2F8Zgf6ZNSHVwHsLTxqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I+rigGmZOHwTEm4j8esTdHrM/VIiE0INnQhd67U/op8joUgvrnIpOWQaZW/5O6v8W
	 YxEI7BBt7v7/iIbWMDqC5P5gDErHxVHWNk1oGdOPy0hEJ+WUpryJaozkMYgBUtrWg0
	 sWZCtiuywTFRHSkiBUPK4QLCU0lZ7vJCTHK/XMxCkqriiS2yD20bZTUzzbqGfPLf90
	 fwuSv2m2/wipu/jn3L2lYjPBm4qGv0ChVoXWzavogJKkLpjbp4SSDjOwlmAhi9kDBE
	 eeqtjf+Oh+xvRu78j7yJ+V4rVi+09wJxB+QXcwZqc6PJmh+iNzSxkYcNL9ohdK55Dr
	 qQwSCTNUDjgiw==
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
	Chuck Lever <cel@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH RESEND v2 01/51] alloc_tag: don't remove /proc/allocinfo under the codetag module lock
Date: Wed,  4 Nov 2026 20:06:06 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-1-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3465; i=brauner@kernel.org; h=from:subject:message-id; bh=C5Mw1tWGzCvAVdyOdBCkcSqd8MeBZuRbzsUttoDJMVc=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bjx9IHaO3wuTJ1+WO4i+5dMLjYtY9+Wvw48Lyxdt2 LlN5/Ib145SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJHH3KyLB8S3D4hzs35nf3 6kca3bE/MoFXXPH/QrfldyYEbj711Med4b/vz9/V52SPbSoPmzq9udhnRnl3scqhkl1dHNJhZhI 7fLgB
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

codetag_alloc_module_section() takes the codetag type's mod_lock for
writing and calls reserve_module_tags() with it held. When that can't
reserve the tags, because the section's alignment doesn't fit, because
there are too many tags for the page flag bits or because the memory
for them can't be allocated, it shuts memory allocation profiling down
and removes /proc/allocinfo, still with mod_lock held.

remove_proc_entry() waits until every reader of the entry has let go of
it, and a reader of /proc/allocinfo takes mod_lock for reading in
allocinfo_start() while it holds the entry. So a module load that hits
one of those paths while /proc/allocinfo is being read waits for the
reader and the reader waits for the module load, for good.

Let a work item remove the entry in that case. The profiling is shut
down right away like before, the file just goes a moment later.

Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compression")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 mm/alloc_tag.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index 82e2c3448dcf..7d7ad6704953 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/string_choices.h>
 #include <linux/vmalloc.h>
+#include <linux/workqueue.h>
 #include <linux/kmemleak.h>
 #include <uapi/linux/alloc_tag.h>
 
@@ -604,6 +605,26 @@ static void shutdown_mem_profiling(bool remove_file)
 	mem_profiling_support = false;
 }
 
+static void remove_allocinfo_file(struct work_struct *work)
+{
+	remove_proc_entry(ALLOCINFO_FILE_NAME, NULL);
+}
+static DECLARE_WORK(remove_allocinfo_work, remove_allocinfo_file);
+
+/*
+ * A module's tags are reserved with the codetag module lock held for
+ * writing, and a reader of /proc/allocinfo takes that lock with the entry
+ * pinned. Removing the entry there would wait for that reader for good, so
+ * let a work item do it.
+ */
+static void shutdown_mem_profiling_async(void)
+{
+	if (!mem_profiling_support)
+		return;
+	shutdown_mem_profiling(false);
+	schedule_work(&remove_allocinfo_work);
+}
+
 void __init alloc_tag_sec_init(void)
 {
 	struct alloc_tag *last_codetag;
@@ -855,7 +876,7 @@ static void *reserve_module_tags(struct module *mod, unsigned long size,
 		align = 1;
 
 	if (!ensure_alignment(align, &prepend)) {
-		shutdown_mem_profiling(true);
+		shutdown_mem_profiling_async();
 		pr_err("%s: alignment %lu is incompatible with allocation tag indexing. Memory allocation profiling is disabled!\n",
 			mod->name, align);
 		return ERR_PTR(-EINVAL);
@@ -905,14 +926,14 @@ unlock:
 
 		module_tags.size = offset + size;
 		if (mem_alloc_profiling_enabled() && !tags_addressable()) {
-			shutdown_mem_profiling(true);
+			shutdown_mem_profiling_async();
 			pr_warn("With module %s there are too many tags to fit in %d page flag bits. Memory allocation profiling is disabled!\n",
 				mod->name, NR_UNUSED_PAGEFLAG_BITS);
 		}
 
 		grow_res = vm_module_tags_populate();
 		if (grow_res) {
-			shutdown_mem_profiling(true);
+			shutdown_mem_profiling_async();
 			pr_err("Failed to allocate memory for allocation tags in the module %s. Memory allocation profiling is disabled!\n",
 			       mod->name);
 			return ERR_PTR(grow_res);

-- 
2.53.0


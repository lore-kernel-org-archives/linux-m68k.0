Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821733;
	b=aFEF2GH/pDIMJICgwQu4ci9ubgU9lc0oGAItVO6sVHJcwOb88BCEPtxT26DdY6+MB0CH
	 YAPDeFIYwdcE6/il1j+XBYk44rVETf2VLaNffQdzKI70XsORFhaYABerRtuoWINSVXX19
	 uJkX7bK2DQ46CDAusRoxiF0UvHQSoTluvu2bwvS/5d7A0pkUeleR6XZMe1tdm5G3iXuk4
	 xhhcLHlxAbZ2dCmty2F+TWjwKHOSUI1faymfuSGsy0wx8qBqYrmkZKVhB0DgDqhovXt7s
	 yxdJqBDZDNE0AM7+Z2zxiMtfZ8jBZriWDJLfwnZXOPZZ5N/PrsOdUMe1RPK7BPvhWtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821733;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=b8WPUZ8Xzk4Uf3KLwo9v6zFft8hyFZnIr4Ta+1e+n9o=;
	b=ruL+GhDSRvaabfUqXiJO3DvqDITG/gpnwnE9wW6sOL04J9OD1TPXEiH2tnw4HwF3LHhr
	 vwQGSN6jroKI0+dAAGnzNHk+arAxiOdAoplUtwXM5TehqupjFj/tiIrX0KD+AJbHlHRe3
	 FnxYG4SucwfiZlqgtg49tC8KIuTUEF743XL94gwPHepi8cDiWM2ITp2UGtHqTymKZqe0Y
	 vVwFYNDUJhhRuboiImzNbaIiWDPJELrghH0hTY3NMaBv9lObIypJMzXa6ZaKORzgZicCi
	 WV8zNepDxgUTKcgWF6rZtn558ZGIymW3D22WlQWqsgUlLwY3CMtHH/xX0kFfDwn29gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G1PL0TCS;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFA6606B2CF
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AFA6606B2CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G1PL0TCS
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 499E04071A;
	Wed,  4 Nov 2026 19:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A081F00A17;
	Wed,  4 Nov 2026 19:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821732;
	bh=b8WPUZ8Xzk4Uf3KLwo9v6zFft8hyFZnIr4Ta+1e+n9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G1PL0TCSVDwmq6lGU2BKIO3vpAy9ola4AujwmSLJkb5KMUnTLPKnCEvvzLMviPtgn
	 wND4dUemZH7RzXVci0wodw5Ce5v9lazZa2PJvSlXlL50ggFDTSmwojOvxU4655sT6V
	 da1eeT2llGyW2Eu8uZBGRP3z0bbZYTxk2n8D/Foa2zoY7iqG+BVIhTnHhNZAOkWxK4
	 00B0IFoyr+ECjUwAY17pI+6EKbEfW3y0CVh1pSS5m57e6CtXfHKw4ln+bCYcwItAdI
	 P9pOOC3vNTRs9xSAmPdROXPvJKb29eGdAkqsnQstZewCU65bM0CCjaHNhaQiD25bxA
	 MmdfbQAJQvIJw==
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
Subject: [PATCH RESEND v2 26/26] ALSA: info: drop the poll_table from the info entry poll op
Date: Wed,  4 Nov 2026 20:48:37 +0100
Message-ID: <20261104-work-procfs-drivers-v2-26-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=brauner@kernel.org; h=from:subject:message-id; bh=YteJ3j6/FblA5UteLfKk0N1VeXt3kJcYQjXVJOX1kxo=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97pocuEQtOyVxSrtIrlLVW6YsviVsb7cE3Er6v6NVN EuJ7xFfRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwEQSWxgZzvozyXl46z6zj9qs wOZhqjrL/zyXKUPnOr7f0ol3l6+NZGTY7Dmr8rLwiZlvru6dp3epj+dff5pW5ubNCo5fef2qu8q ZAQ==
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

procfs owns the wait queue a /proc/asound file is polled on and wakes
the pollers through proc_poll_notify(), so the poll op of an info entry
has nothing to do with the poll_table anymore and only reports the
mask. Nothing in the tree implements the op.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 include/sound/info.h | 3 +--
 sound/core/info.c    | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/sound/info.h b/include/sound/info.h
index d6cb0346f77d..327d92059f67 100644
--- a/include/sound/info.h
+++ b/include/sound/info.h
@@ -48,8 +48,7 @@ struct snd_info_entry_ops {
 			 void *file_private_data, struct file *file,
 			 loff_t offset, int orig);
 	__poll_t (*poll)(struct snd_info_entry *entry,
-			     void *file_private_data, struct file *file,
-			     poll_table *wait);
+			     void *file_private_data, struct file *file);
 	int (*mmap)(struct snd_info_entry *entry, void *file_private_data,
 		    struct inode *inode, struct file *file,
 		    struct vm_area_struct *vma);
diff --git a/sound/core/info.c b/sound/core/info.c
index f837cfbe7313..c8735a6ec789 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -193,7 +193,7 @@ static __poll_t snd_info_entry_poll(struct file *file, poll_table *wait)
 	if (entry->c.ops->poll)
 		return entry->c.ops->poll(entry,
 					  data->file_private_data,
-					  file, wait);
+					  file);
 	if (entry->c.ops->read)
 		mask |= EPOLLIN | EPOLLRDNORM;
 	if (entry->c.ops->write)

-- 
2.53.0


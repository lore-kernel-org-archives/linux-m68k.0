Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820096;
	b=AMqpL7m4xo4YOySLv3Wk39BELI1sPpVwwsCTettCDU1DX48+ncezUBmGiEMo3bYq0wES
	 57Mkwp+GsAqVKpfNqq5lJpmGURzFmRwmqdqlp/f4wVbJxrlOK4vs4RdYQYGNBd3Mt3cPH
	 omSJKiiZy9eKYJXMJFy4rH5OQfSyzRVq5MWZjHtQ31OuIxlgTVAcDw+kaeMbEuo/94sbt
	 n8u2DSRAHJrG3hBX5/W7sdzuVp2gRS5/Oznr2r64RMTswwlLHp2Ez32kLXGyMI+HUhkCR
	 XZzZGAeyHvmgQ1lWkfXS+SpRhVwKXZq4c5RYvBXdKrn7vlQuEmrnWtx3aNnVve4O5OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820096;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ih8EKkL3fEFrmnOibnSg6zuDA24U9CpFmMUb1+ThTQI=;
	b=aE/F6Bph+q0tJg+YoM5tYHkWUZwvmbg7DgIJz1MTE4x8cH4WOiZeQd2jeVUuEetoY6EP
	 4hUjc7Fw/PLSU+eBY4b0+GBKMvXYNBzRZdxfsX1n7xwgk8UABOseSnSl9UkEdHXi3ihRx
	 Nw/2ocGFe/EgjkqiuqwIl4G/Z/UQiamwMucxuUysF1pozpd8TFcUE0mDVUeU/I4LprRVG
	 QhKo+3JA42dje7WEPJO1EzArx9RS/TZJS6gomD56mH1HfktZbJWCCbgeBPA0Az++UcK9w
	 JjzZsYotCE2fxzEGjkI9X8KydVnQJL+Cln+3fc5x5FBpCK+Hp4FKIH9/WGM8Lp/spLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NV/pCHTx";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3274D607526D
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3274D607526D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NV/pCHTx
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D98760609;
	Wed,  4 Nov 2026 19:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDE71F0093A;
	Wed,  4 Nov 2026 19:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820095;
	bh=ih8EKkL3fEFrmnOibnSg6zuDA24U9CpFmMUb1+ThTQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NV/pCHTxChzVH1ioWmq+QeUT+SBXucwSnRPJOdBi/Q2y75DGHw15YBMqYjqgrtt2O
	 VyFPPs8v7zjoqFDFOJ5oAl9YXifHpXNyabEPReJZQwa8XXH4iQGv2Qty9h/jandirD
	 aUMSk23okxfo9KtkbC4/nzn1Iw09lddant5cO9hakE0csEjqm8lPvF90MPEOYpmUAd
	 IMkDVpUwfqgAQLlAK9nXdyRgIdGxWTHDKSyuqOT48xWUvA/iAJk+qPbBXnzRbF0y+d
	 wn/gLZpI4BHKSDGznFL2I2ZF9zF+c1mxFQKqQBN2chjmpu2miV52eKF6iZL2Z2lRgn
	 AL7Cg1xDOYz2Q==
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
Subject: [PATCH RESEND v2 22/51] ALSA: info: don't write past the end of a data entry
Date: Wed,  4 Nov 2026 20:21:20 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-22-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329; i=brauner@kernel.org; h=from:subject:message-id; bh=/wIh+WZXKaFyyFYwMjXKmLvFs42DoCHjOzS3J0v96D0=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bny2zMufh/VIknXNykPasit38Tx6t1dcVkb8Us6vt wpbDDY/7ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjI8+UM/3Qne19pyPzkZ7uK 4+ps9RZDLa75iTtP5zvl3PvzK0/j/yuGf5bm066vnniBYWL95HgLE52AGfqMMk4eWldmv104x1K Fmw8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

snd_info_entry_write() clamps the count to what is left of the entry
by computing entry->size - pos as a size_t. For a position past the end
that wraps and the write goes to the driver unclamped, for opl4 into
sample memory outside of what the entry covers. At the end of the entry
the driver gets a count of 0 and vmalloc(0) warns. Before the clamp
moved into the common code the driver ignored such writes. Fail them
with -ENOSPC instead, like a block device does at the end of the
device. Returning 0 would make writers that use stdio retry forever.

Fixes: d97e1b78239c ("ALSA: info - Check file position validity in common layer")
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 sound/core/info.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/info.c b/sound/core/info.c
index 023b4736aa6d..f608d335b6c9 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -171,6 +171,8 @@ static ssize_t snd_info_entry_write(struct file *file, const char __user *buffer
 	pos = *offset;
 	if (!valid_pos(pos, count))
 		return -EIO;
+	if (pos >= entry->size)
+		return count ? -ENOSPC : 0;
 	if (count > 0) {
 		size_t maxsize = entry->size - pos;
 		count = min(count, maxsize);

-- 
2.53.0


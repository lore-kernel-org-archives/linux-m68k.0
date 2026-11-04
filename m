Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814709;
	b=moPst2uh+p7jmjM2PlIjtum2IMDWU1O0/91JppvcJlbghnjcPI2UwPu/1QRexYCohBhC
	 O4QbojlAFhBLe+pRfpawxKfR6kP01IJWuu5FQlFZE5BupoW7avG8u0lRgnEhz3Ef7IgK4
	 g5vbGnJhf0XEBorwxg9wL2HBgJM8uKyCohfc/++awec7OQlKuO4Ke13RtNiO4L3Z15W7t
	 HKQ+I5Vu+nCnBQ7PkplO8ALPQDpLbKLDfA2jJKP87ejVpn7NrfM+g4zuD0GbltOT7RW77
	 I2qxq3v8w9h/wzvsS4m8dT3/SfjtLLw7ITj7D79DZzfkTZet/FWuHtN8etFFYNdu2bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814709;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=frXlYovGKxKiSN/Oj3/IY9GUET6etUhHzbC1M94LuG8=;
	b=OaEYmPirkYlVegckz6c6+0j/KPa5GVpqOV9m4Gx3IeZqVizTtNpc023swJB5wtDOUIDL
	 5LDKDLe8UNW27gj0thqjLX2gQzvZicaw02pK0D06wGn+QQPPVzqziKt0AeNi+tM1BMHZX
	 ECNoBVrJhMyCPwBndypG4TAqq7wb4s2MlKsYXugbqiYj8cza6zWAY8S7oOFtzVgwWTSXM
	 +n0GGNN6AugLzaNr+7RdWRXLIAlJvvGxfqH38Yu5TxJqMctYRo327AjZFKj54Mnoj+qXj
	 mwRgIL3OvL6mRIedyKq0juAIZWCgsuBmo9tpl3pxqfUrSVVPKj+RmP67ibOZ2qnMWtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5l8Zw0z;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC44860703D4
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 17:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC44860703D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5l8Zw0z
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A286342D92;
	Wed,  4 Nov 2026 17:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193531F0093A;
	Wed,  4 Nov 2026 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793814708;
	bh=frXlYovGKxKiSN/Oj3/IY9GUET6etUhHzbC1M94LuG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J5l8Zw0z4fZQ9sAGiyuZKFV/4Ks48j+EfxrlJEYi7n7otbyz7JFysKU1tHI5wpj88
	 CpOhI5fgv4CaHLI1k5XmU9YiA46xrA8Q/vpms1IHownsPnCRxeJYtvKMkZ0z9QgNGJ
	 Dt0qEGBEKG5uhOJH57H9KzWgwJVHzqSv2uWCyWP/yhmZTJIZYv4ihYn15949Cj3mSN
	 QjRMpFLnjQyEc/6vhtJSsBrbaSWk3wEW68rnJHO/8rURtjSRpPMZGCFfamkIjqxgLP
	 QLC4T97JjDLFJHcKQFwVspL3aQSwWyfRwRGbw9wXUukNHQZW8xsWkstW7G+uLWK9lD
	 r9NkjTZDIFp9w==
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
Subject: [PATCH v2 25/51] wifi: libipw: don't return 0 from writes to debug_level
Date: Wed,  4 Nov 2026 18:47:11 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-25-bbf7d5546809@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-0-bbf7d5546809@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-bbf7d5546809@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059; i=brauner@kernel.org; h=from:subject:message-id; bh=PSZyn/5j7f+UAGnOkF9zGJ8rErtLF7uTzeHltQyv5ig=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9zrsr82TRXDvnq8eP1Wy9Ln1f/sr/I6YcdTNlV3pEL JFvLsq/01HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRS/sY/ifVcHOsK0nzflX4 5M3zNcdYuHyXx97Te1lgK7btRfzEQgdGhgfMrr8XiR5rdt334XRQxNzpt78YSt3vXc1o/eVkzmm Ve8wA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

debug_level_proc_write() returns the length of the string it parsed. A
write that starts with a NUL byte thus returns 0 and writers that use
stdio retry it forever. Return the number of bytes that were written
instead, which also stops writes longer than the 11 bytes it looks at
from coming up short.

Fixes: b453872c35cf ("[NET] ieee80211 subsystem")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 drivers/net/wireless/intel/ipw2x00/libipw_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_module.c b/drivers/net/wireless/intel/ipw2x00/libipw_module.c
index 22358b2c2ecd..552c8ff3928b 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_module.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_module.c
@@ -236,7 +236,7 @@ static ssize_t debug_level_proc_write(struct file *file,
 	else
 		libipw_debug_level = val;
 
-	return strnlen(buf, len);
+	return count;
 }
 
 static const struct proc_ops debug_level_proc_ops = {

-- 
2.53.0


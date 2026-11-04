Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820140;
	b=I3syPzoa07Y75wbNGg6rxd3uTsnDxanQjqSRfREN6ypdRAAWFgduwloy8uFs1QcIuwBO
	 VqP3uYVXjTrrTpLtOvjr4G5Iq5GQeIt6318g2P3lvimMPR+ZdL2OJh9/HdBjQs0vruLK8
	 BXqTc30K0osc8UbA5/OUO4TZNoVgwUSuaOFUq72SYXPEWcP92yaP/9AEYB7/AAoCQn3vi
	 Rpp3qD2N7ALmhRdXfExWMju5TTqfy9s1O61RUb75Q5+O2Kfd6l4tUNai/TuJolXXg0IbM
	 Vqqh1m8HvcIweAQqkPgpr6NCRDWihKtUjqQ/iQulW7fX2YB6FHfAHvJiDC2t/Xrco8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820140;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=frXlYovGKxKiSN/Oj3/IY9GUET6etUhHzbC1M94LuG8=;
	b=m+doD+QIQKf9Ij9T1MW2aZ18qEFE+kwLkQ6KE0lcCJwXUd/G0iylM4aqinLzpHg2PcM6
	 8zhCTqZAxteoitsIPLOR8EHoq7VH66gLuz10+fWor92WgiL4XMbFWEXNS+x5SKYFu3HPQ
	 zlHjZG7uF8yHJ3YedUEVUQxXZlkMVcDEYZ5PCVjkGnnsXzVpM40hcnxWZo2xV5btg6qc8
	 T/xhTlGIfNKW8hIJfZR68Vjx2u09KX74utX4Z/jOJibhFuIoheustSFTTI3gWEkb9nKrq
	 Fjfkh/co5iyh+oJ4oVNKb1fnDmaqLCdi3kueb0sWb+l38S+yizrbpm5om3yf3a4h+9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4qlh5ad;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621066076CEC
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 621066076CEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4qlh5ad
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BEC3B60A77;
	Wed,  4 Nov 2026 19:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A39E1F000C1;
	Wed,  4 Nov 2026 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820139;
	bh=frXlYovGKxKiSN/Oj3/IY9GUET6etUhHzbC1M94LuG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m4qlh5adzIihmnlMCPV3MfzvM9clEODdoNPI2uMqY4fs5tXjOCWDUSzu6mv2JPcnd
	 rIPr1zKO2U3CjW3V1MIfmNbgfh1n07E+bfpMs8tk02/3DnE87bHvJw3d0jbyRKMVJD
	 IyG1TCJ8IDfIKO9zXzTPhcHA+ABY+MPRa3JEdRoY9H5TpyzNGzOxFD39D4e/nEzri/
	 xV3khedTdJnJfO/uoKUxMN3c9AMOVj129ZcQ4wKqGT6ApGnU+0jvS+ZI/4rijimnGb
	 2/KGqEkHg6aA14vgzVafdv5HLYM59RkWvexV7pVOwnU2YNnoy7SUAi1RAXlTmBHVKt
	 aZyeLWcmGYS+Q==
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
Subject: [PATCH RESEND v2 25/51] wifi: libipw: don't return 0 from writes to debug_level
Date: Wed,  4 Nov 2026 20:22:05 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-25-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059; i=brauner@kernel.org; h=from:subject:message-id; bh=PSZyn/5j7f+UAGnOkF9zGJ8rErtLF7uTzeHltQyv5ig=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bny1/eaz260dbT8unLZwrN5tXTy3yfvErX9TPsXMM V8nc4f3WkcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEjHoY/iffUCphqBDzD6jS 3KKZ9/nt+Yxbx7kDk6dL8t/4/j9YjZmR4beq8vlDlkeLZQ/dKD+x8ZzFnrPzDR5/5vD+ZfFD7WF 3CS8A
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629477;
	b=nVy4M1+p/gIs/4sLn9piyu9qaHrnagyh/qhUUUVc6nIRQ16ZER5AnEIGqB8h9FaccbI9
	 AP6viu5tuZRT3YIT0oeTuDB4oV4Rcwdc2ELc0A88Or4P9nQV0wcy6KwoobAuLJr17ROE9
	 rUMcRTuyzccd4KdOrZKUE+kP6FW7o6h/RryeBZppUITb4hb0XSyUkOcZlEtmB8mj2rwrr
	 OwXBUvBl5j3XFVFKTvxhO2FKrtgZj8FebmkzJvqPdWNbkm3W9S1RW1vBtaZcqZq+Zk9f2
	 UxvEx1sREo05fDcmuQc9Dz2sVT9caf31+cYJn5h2ll+3iiGKOJQffqt4lqW2c4/4VEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629477;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=frXlYovGKxKiSN/Oj3/IY9GUET6etUhHzbC1M94LuG8=;
	b=fdhTNu+yFjAn7OuGB5Rn1ZTlXhzlP8sur9x2Ku3Kk6S6h1mAGgm48qppC5stKCQmpNXo
	 GAjyL5Ork+EU3REto4FzqBgjKdRGOI9KrKxyJdK7V46eY7QJo3D12oQi2LhGfdnwqo509
	 QACfcKw3VwZPM/DlIJnOOo4/p+zB1hGwV/BEKy/Qir33Oi0ugppdmwkqjPnD20kY9x1or
	 lP4EBUui5ytS/fME1wS//HlDQOM5G3FtSyVY52iENqEVzhg75EO6c5jLFDRf3Hjt44/8N
	 fHZjFLjAUsLrit8GxBlTjuBzyONVDmhcNaAM+yYGGqxRdoCbjjXBFB/U8oDSvOhcCYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReJoE6zf;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE99606C57D
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 14:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE99606C57D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReJoE6zf
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79BE7605C4;
	Mon,  2 Nov 2026 14:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA8A1F00A16;
	Mon,  2 Nov 2026 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629475;
	bh=frXlYovGKxKiSN/Oj3/IY9GUET6etUhHzbC1M94LuG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ReJoE6zfwlMZdL/D4kBPHthe/7b2K1B/nPEO/E9fDnKPvAkMnG3q8iqFJyxNfgYxT
	 +l0bLxPIHxAyiwwkTWc0uyVHHVBYLTR/rNVKqQ159RwHOdEMgFr70nBybxd8JaVcAZ
	 INkOE+RqOwXO8hKmtfOe3uu52SEXEIDC8EbApa4h43uDc6EQp0NHZaMrKSPGxDLmTa
	 z3JiBZz/mUJm70MBn3REHME7mTQy2jABNt0dk+JRXthyckWXmXkXSvKDQjG8t3ZaWQ
	 U87w9Z+1qwvggD1ALH9JqxHF/VsBzvY+LBC2uMMhSucHH25d+pQJrzTmhyQC9KPZ4G
	 gBzTDPDZGkvzA==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 15:21:27 +0100
Subject: [PATCH RFC 12/38] wifi: libipw: don't return 0 from writes to
 debug_level
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-work-procfs-bugfixes-v1-12-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
 Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
 NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
 Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
 Greg Kroah-Hartman <gregkh@suse.de>, 
 Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, 
 Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
 linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 coreteam@netfilter.org, kexec@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 ibm-acpi-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, 
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-cifs@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-mm@kvack.org, linux-sh@vger.kernel.org, 
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org, 
 sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-doc@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, Takashi Iwai <tiwai@suse.de>, 
 linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-debuggers@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Chuck Lever <cel@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059; i=brauner@kernel.org;
 h=from:subject:message-id; bh=PSZyn/5j7f+UAGnOkF9zGJ8rErtLF7uTzeHltQyv5ig=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9mJNt0aR9f0p/qPzeecf+P/MKzGqZHjSv9nAx10fn5
 wXb57eqdpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExE6x4jQyt32MU/mspx/OIz
 9f/2BxhfmF6ZzrB0Ced7yZ3V6unKfxgZbjIUhrXNX37666wNDOpX7329dlJiQe1ekZ5/lQ3MWmr
 ruQE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

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


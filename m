Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814489;
	b=1MHzLFKSIbxkCSuXTGysFKkhyTaOAmVfaaFH5dpEqW8CcHLfg3UIcjHwXrT5+n4o+AoP
	 MOiEsSrUTs8k+lVnMbELajc40IJdLPkOidUtjeBgaqxoeFyYn+kBgVVWqP14mxne6R0hw
	 gPsvsfals+sJzBGUIy0NSprqWG2Y+LuFVh8KPfs/ua0gbBRGOCSjproJTNDuMIQWXNm4f
	 GGs4KjELJo5XYM4Yp8Luz7QJ/Ebv+AUfN9lNAbwJUypn1549Cv83Y8FL5poK3u+MunXAq
	 654SL3SgdqFxQ6ebpSd1n+CMsRqmF3l4QrPNYjmmkY33ifuLT7oStFIhhemt6QbW20g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814489;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=+QMuJvtMuQ+CXnn6xLeWoxU7H9VJY0mzKEyTXi76/+M=;
	b=uvpc+t6ARGHtqgcRHAeo3tQQTOuzzPh77yS0TZP8kkkXM2aQwiT9jVWHgDFo0KnBFlT2
	 Kerc3cKTRbdzKRznufdRwXlgAZx2E+UMLeuNSwZEsdxg+AKK2GeNi8xk3OtkTRW6heDPw
	 kXyIyNX4cX+bDV1r90fHr2srRcDa6iPWTBbF5j/+rzrDSjq6/SVRd6gQ0CLR3Rjf7LZlE
	 iLEiNoRJ2lI9bYhs+95zc2eqkrIk1uH4G0qq8cdhrv2NgMT/Ec16epHQlRCS65jSVjggR
	 7Rol0l08Pgc0OQ5Q8Q9oWhis++P+jPJ+HIxaQS5aR7te1BBOc9Z+hbv7keY5eIcM6ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVG35mDd;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB28606D819
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 17:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB28606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVG35mDd
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1D886021D;
	Wed,  4 Nov 2026 17:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9FB1F00919;
	Wed,  4 Nov 2026 17:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793814487;
	bh=+QMuJvtMuQ+CXnn6xLeWoxU7H9VJY0mzKEyTXi76/+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DVG35mDdrJ+w70lYp9CqgpxTuoGTpj4temyLsY3vuBl9elVVBnmHrviotaVGY/ppP
	 UdOgypZXpDWtJ7enRd3iIIX4vWx3xyqPaHPzOZWq/P4JUJrwgIpI4MwtSTSz/6po8R
	 Yvz02Y/vDREj2xNfVXWxFSvrw7Bvuiwjqz0knxKP5rsjzaWDW5qaKyJ9F3yEnh+EWh
	 A3TtW5nyoi8NpYae3YAaKFmJ3QPX5Rij2cVvQ/1JMiWehFHBZSo4em6YfVuXhfiqDi
	 JqHLo3hhdvujnwykhoFrIyHzHBnGpPwJgUwVLui5mJv4lfTVDRPXKF7pOVu2XHYste
	 DuNdex110TFZw==
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
Subject: [PATCH v2 13/51] sched/psi: don't drop the last byte of a trigger write
Date: Wed,  4 Nov 2026 18:46:59 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-13-bbf7d5546809@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310; i=brauner@kernel.org; h=from:subject:message-id; bh=/5ST8groFWC3ZYrB9+5K2L5OtN8hrslkTr6MpvXzbng=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9zjv/59LFdb+4Nqzr+cU3P2cS7+L2yauySvlfWb8/9 eufsCjT0o5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJmJkw/FM9sG/u0ochUvwi r25NnfqcY/Wv3m+1Rk6yc5TfvmHn3j+V4X8gx3Wx2Wp7OP7b/lW+zLTMQ+Qde1X2zk2aTqESmTX LCxkA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

psi_write() copies at most 32 bytes of the write into its buffer and
terminates the buffer by overwriting its last byte. For a write shorter
than 32 bytes that is the last byte the writer sent. A trigger written
without a trailing newline loses its last digit then, "some 150000
1000000" turns into "some 150000 100000", and a shorter one like
"some 150 10000" fails with -EINVAL because the window doesn't fit
anymore. Only writes that end in a newline parse as intended.

Copy at most 31 bytes and terminate behind them.

Fixes: 0e94682b73bf ("psi: introduce psi monitor")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 kernel/sched/psi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 7c5381423334..8b59635e95d4 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1566,11 +1566,11 @@ static ssize_t psi_write(struct file *file, const char __user *user_buf,
 	if (!nbytes)
 		return -EINVAL;
 
-	buf_size = min(nbytes, sizeof(buf));
+	buf_size = min(nbytes, sizeof(buf) - 1);
 	if (copy_from_user(buf, user_buf, buf_size))
 		return -EFAULT;
 
-	buf[buf_size - 1] = '\0';
+	buf[buf_size] = '\0';
 
 	seq = file->private_data;
 

-- 
2.53.0


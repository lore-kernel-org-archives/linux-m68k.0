Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822033;
	b=1eX8S4QTs1B/OJEPIOZtGUSr1/7gORs5776oIC0OBdWvpA8583d125NJI7Xr0drBpLBh
	 aF1Xc9TWaWacJEi0FgagGMAf4gNQYVJuk71DuYNrVidaqgAbrBCvrSp3qxepfqYOv+7j9
	 YD5s819OjzzY5wfzUjsFNr0t8RVsVkBgf8G0McXZxx3NUagglhSIFgvRdbaSSq/JCD1sx
	 0+d+/m0rlZhjS5OPLULzIl0UgZaj+20PbUH5kvjHEjc3r21xBF2JvQ2vsXYda/YfXEwix
	 07VdXB8kSWd3MP4XgQtYY8vjTYPEH5AJNwYs8TJ7ATgliZRviewXOgvGpXMd8trBUiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822033;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=f4E5LhgvAcYWZljBgO/W1U3MMJwdn+qZCE/pQraBe8U=;
	b=S49ccCaPLRMHP3u6cbYyl8DqRh3t44lmYIxjy/IWJcLO41KMGy4VpcVLkkdQXKh2h2Ic
	 yEOvJDm+uXdlhVUaczW1TCj0NvUtyoBJ01C8pMT4/zAH8QYX86DqY3ZjJwTFSINNGJTG9
	 A9/IExpBxztgLpr9z2qeg+xOLYXiS0kMFKKZlH5z9Yyx8sq1nvk/8SsgSVvn9PI62aent
	 1rP8nHESjniRdaAcsX1lk+pTiX4Iy8LoQiQfjkRL6mh/cucwbdrOLz8VCWbY/uWL0mMsl
	 yiNzupBZZwGem9il/3SQqvO6vDdjYBC9O78CrtOnnL0F3XGubvYZsZHaS12La7k587A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ay5fDaWt;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2CF60DF374
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A2CF60DF374
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ay5fDaWt
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C9C660F33;
	Wed,  4 Nov 2026 19:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAC11F00919;
	Wed,  4 Nov 2026 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822031;
	bh=f4E5LhgvAcYWZljBgO/W1U3MMJwdn+qZCE/pQraBe8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ay5fDaWtG/yWIDOYM+DggFzTN2LWbh0BW6otP+jIWAHXSuBEsVaLRZz5ZGfpgRvCE
	 6shldu61dY4NwBfkCYbw7q4cTqz3itoS1DSO0jJ/m80wdS5Zd4cXDBc3qovYZ0srLC
	 U+IQP3Cf9hMAd3vazbsilUbA8DkxquoHSwEkBJ+7nEkOcCIfxO9SZLsKEJkxUQ3qC/
	 DcxdbWZq7MCNC9JXaZdePv4FyzB69QN2POFSFhjzDTIlCOpxPJ8V89Q5VWoSMQ/EHp
	 J1FcUjC8ycDtKpuAOuzPui/5hlEvRP7hunia1FQ4b8dx3JEke6caIeMQIFr6OP34Hm
	 Nxddkhn+cC83A==
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
Subject: [PATCH RESEND v2 16/30] profiling: mark /proc/profile permanent
Date: Wed,  4 Nov 2026 20:53:37 +0100
Message-ID: <20261104-work-procfs-fs-v2-16-319e0f9a8aae@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=brauner@kernel.org; h=from:subject:message-id; bh=G0gwYdZ16oKFC7EZJsDlPxepqJg/P4CRWLJP6izrYeU=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97rGrTu0wWKSzkuXO+Urv0AN64bf3zr/V5uClEO3wY I7J/p1/OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZyag7DP5V5JQ833nexiq6f s5gt0f6uqxUzZ/T9PH2FDXJ9PK+sWhkZJl1nDLj2O2fpAYUv714J5enO/mdzabLGrvDt7b2/l0U pcQAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

/proc/profile is created when profiling is turned on and never removed.
Say so with PROC_ENTRY_PERMANENT, procfs then calls into it without
pinning it.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 kernel/profile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/profile.c b/kernel/profile.c
index 64f6a45834b1..0c2672adcbb5 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -203,7 +203,7 @@ static ssize_t write_profile(struct file *file, char *buf, size_t count,
 }
 
 static const struct proc_ops profile_proc_ops = {
-	.proc_flags	= PROC_ENTRY_FULL_READS,
+	.proc_flags	= PROC_ENTRY_PERMANENT | PROC_ENTRY_FULL_READS,
 	.proc_read_buf	= read_profile,
 	.proc_write_buf	= write_profile,
 	.proc_lseek	= default_llseek,

-- 
2.53.0


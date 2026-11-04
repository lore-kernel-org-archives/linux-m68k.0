Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819907;
	b=K7hiImHw9zyNRQnwVXfP/Kbpw6I56W/cy5wGC4bE57y9/z9LLglw7lzZeFaSCOnhZuTk
	 FpDH+Mo7SYawSxhbEXl4n1n/sukE1lGj5RHOg1sPf4+7hgnyR1InNwlQJh4/B1473xqqI
	 jJf6cTrNuQ7y6ESbIOJXU4KSEaW3K88YaPLAqyzRC2dXdUYdN9RVlFOCxCa6tVVimrhwB
	 Xs7RTMmeM/eMJyWO+xknMSmwQnyHgzpdRXOFCoTIHNLsJw+W+NmDZD4a08wuiWYQ8m2cT
	 tSYZynpdQ536M41qM7YE6IUn309DPzCr58zoeEWLF04KWXkQqLOIhgDWk3Mn42NYvtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819907;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=axjAzDMxe/T5Kt/VR9558Sdu9PB/HLdF+q053OKTtnM=;
	b=jZmD7iJjkG5KXPZLn6rRlsKmOnmAtJh/ibJxA0eYZ+1C8Lsr73mwuL+r2IRnO22Xjitp
	 g2mN5eIrLZnVRF5yBcFS5Zox246zl5phVDSOBXRi0EzkNootUz99ZrBy3po7ng0a4MtcG
	 cJlVyyFaP29JdsX6mpslMuvdMkiEFlQ9H7X1Jn/JMoK4Wdf1OwYE7SdqkvzYV1ORMrQGQ
	 CMWpX2p1C5hHviv0vYb5Hsa0g8Ak3gqdFqPVOMoY5FMkWbr4vvq+oldW/uhsqYZRMBLV1
	 rqFFlr+expBpac9mkmRAL0zfhNsEh85NpvRuLxP2TAV21iOxUQ+0DihPrnIF3+QqZNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtF7Ltpa;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68648606A84F
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68648606A84F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtF7Ltpa
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A84D260A7C;
	Wed,  4 Nov 2026 19:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DB61F00919;
	Wed,  4 Nov 2026 19:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819906;
	bh=axjAzDMxe/T5Kt/VR9558Sdu9PB/HLdF+q053OKTtnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CtF7LtpaCnKrvS5VracHtmez/lTDVmZLEAJMPsf5RyRtHK8331ZbVhu/+wfqQSNNp
	 k5kqnIbPjR6sVpgI8dl+aRQlbCOs2pnczhaDMKEZx/ZWxJhKcA7brLV8fiEaMbiuh9
	 MFwalEMmSkSmMudfVxnNahrVfbIp17CK1joRPuayEeMp2faKCSbZvgOaORRjZAcf99
	 D+S/7ltnAyBBNuf+VXhjPvzz/9hi+4KRi6bMiJuG/7hKYOJ5c3GtlY1t4+Db/rkvuL
	 jH/DdCnBKpMBBqg0/ET26Tl25sQsMCrXwsOIkyA5elhHUZdHUYVdfAatvui3m3bHkd
	 QSod2kP355CYg==
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
Subject: [PATCH RESEND v2 09/51] profiling: report it when /proc/profile can't be created
Date: Wed,  4 Nov 2026 20:18:12 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-9-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=brauner@kernel.org; h=from:subject:message-id; bh=tYIXM5EjsYRFpz3d9CdZ23LhMvzI2JA5U8qSrxldqzY=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9brwqovU2YO3sJayOU6SjJt6WZHyobvyDXUfg5ueIY sXw4vmmHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPh/8rIcHlz85mzfw/yeois tZ+X+nK/Y0nbTtuVF6duv2wgyFZ5PYmR4ROf8bk1y/9m+Rgw5Xqu+ydQsSxzObvU5rn/LzCHben y4gIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

create_proc_profile() returns 0 whether proc_create() worked or not, so
a write to /sys/kernel/profiling that turned profiling on but didn't
get the file reports success and there is no file to read the profile
from. Return -ENOMEM like the other failures of that write do.

Fixes: 22b8ce94708f ("profiling: dynamically enable readprofile at runtime")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 kernel/profile.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/profile.c b/kernel/profile.c
index e7defa90a34c..820d5ec909d4 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -216,15 +216,15 @@ static const struct proc_ops profile_proc_ops = {
 int __ref create_proc_profile(void)
 {
 	struct proc_dir_entry *entry;
-	int err = 0;
 
 	if (!prof_on)
 		return 0;
 	entry = proc_create("profile", S_IWUSR | S_IRUGO,
 			    NULL, &profile_proc_ops);
-	if (entry)
-		proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
-	return err;
+	if (!entry)
+		return -ENOMEM;
+	proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
+	return 0;
 }
 subsys_initcall(create_proc_profile);
 #endif /* CONFIG_PROC_FS */

-- 
2.53.0


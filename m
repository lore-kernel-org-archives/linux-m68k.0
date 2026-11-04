Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819979;
	b=aECWQyTo1OzUqi3jnDpnwfj9i4srSFs46/+8iBwUqcFIsqufzdpxt2S2xm6WMlEuVEh4
	 hyzNF/r1/glD3/Cc/nfGCxHB/RJifPPCFwq+ISx3KTooEYQjOWZXm1IrdSSu6353jr8g1
	 gOaDgjGB//4QwKYVSa67rnRMBFN3Uz3I/YOpgJIdZb/+7jxbxK9j6usey3x0CIqAGDlcH
	 8KmHuHiDwnh82qdXN8rapvOTP5I2sCdBI7MvOLW7pMjgyYuRbwnITd5z2u3TfLUjhBm3V
	 eJeIzot/e7m0cuyIHmKVRt5iVjVawM+y3tupSuzzRDxLgbk7hvBz3fxq/1oKMT7Tidw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819979;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3ZyIQLij17XFBIkY/FnNnjbp2RgAs/rkMBTgRuVD6WA=;
	b=O5FwfIol8lf15G1ERhQoErgK4VRKIYqORHmgL++GgQvvnDKaykO0GFguCCy9QJI6BwkF
	 /CJmj5Y5iw2AL/uZYCEqF3hLntW+eJ8SBxpDYZXnoYvl3e6qUJZKVVVvbeIn28oxiVg97
	 WI55xAPvqpn+EFx7Sg0yISmfDEssKeuSstr4epnPsBIRWjyYwOUhz5NXt1u4OB3bKw1l9
	 eQzQoCO2iI+jS4y+XdvrXy1PGJ7UBC1XeUxO4svBCNjjuXilwwbNSeRQN1AbHjUX7YvVK
	 RTnggMjRKDgqCljhBCrpgc7VlsJpSb3YPwsM3K6CuSAu1m1cyuVkjSkSB/mTk7pGFQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UquQVFdG;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D0C606E83C
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D0C606E83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UquQVFdG
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 808B941485;
	Wed,  4 Nov 2026 19:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2211F000C1;
	Wed,  4 Nov 2026 19:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819978;
	bh=3ZyIQLij17XFBIkY/FnNnjbp2RgAs/rkMBTgRuVD6WA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UquQVFdGSzwe7fOqi+LzTOMp+2rigsfWxIAUBskeYKdDPktAPBz0dC1Ky9xVgLPJ6
	 PxjYY4ad50AsLCrFoewzc6rxKhLSxBpDvF0I5ej6BOl/KhPCUg0fxW0LnI/ODrAteZ
	 gjr5s8RQxg56swgMcrzZtkIliG4rHYkP/qWWVil89NvValFsxYuugkdm3C+LD7HEVh
	 JaWz4IeTKnJ3KLOVpGdXpdtkBFXK3vnj1bwsYl7cZuhnH0ZL7cCDtZWYuzFyV19v4t
	 59bUwTSf4dkWbRcTPcvwXUGjo4Xs+7a4ChNX/KHaOiJQMZrRfbBtelWToON7Uage1C
	 8mpDuOEVUITsA==
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
Subject: [PATCH RESEND v2 14/51] proc: sysctl: don't stop readdir at an entry that is being unregistered
Date: Wed,  4 Nov 2026 20:19:24 +0100
Message-ID: <20261104-work-procfs-bugfixes-v2-14-021c84d852e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=brauner@kernel.org; h=from:subject:message-id; bh=6hLGzd3ohIjIvoG2NrLKRAR6DerSlran3UFG44ON0F0=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9bryzb4l1yo+SbW0v26c6WF3kejzthlPTlKvH65zrf 4ekRggkdJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkZRMjw7lnT3e45jJIFvEe lD2X/fbQ8Qfz7ab9fzQ1681BpYwLPlsZfjGre3twV17+P+2PxgzpuirDdx07b2yVkzfcP7Xlxf1 UFxYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

proc_sys_fill_cache() creates the inode of an entry that has no dentry
yet. Since ace0c791e6c3 ("proc/sysctl: Don't grab i_lock under
sysctl_lock.") proc_sys_make_inode() refuses to do that once the table
is being unregistered and fails with -ENOENT. readdir takes every table
it lists into use and unregister_sysctl_table() marks the table as
being unregistered before it waits for readdir to let go of it. So an
entry that is unregistered right then makes proc_sys_fill_cache() fail,
proc_sys_readdir() stops there and returns 0. If that getdents64() call
hadn't emitted anything before that entry userspace sees the end of the
directory and never gets the entries behind it. A listing of
/proc/sys/net/ipv6/conf can end early that way while a device goes
away.

So skip an entry whose table is being unregistered, like readdir
already skips a link it can't follow. Lookup treats such an entry as
gone too since ea5751ccd665 ("proc/sysctl: don't return ENOMEM on
lookup when a table is unregistering").

Fixes: ace0c791e6c3 ("proc/sysctl: Don't grab i_lock under sysctl_lock.")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/proc/proc_sysctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 6c0859c66563..b4a309d49698 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -704,6 +704,9 @@ static bool proc_sys_fill_cache(struct file *file,
 			if (unlikely(res)) {
 				dput(child);
 
+				/* skip an entry whose table is being unregistered */
+				if (res == ERR_PTR(-ENOENT))
+					return true;
 				if (IS_ERR(res))
 					return false;
 

-- 
2.53.0


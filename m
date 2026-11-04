Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822289;
	b=M4wLvjk5bVD69V17ps4faQ04u8NXOvG5MpzQZ4Rh9UwhI7UW6Ej3pR2FbOS0EV3K1a8t
	 PLwmlTBbeEZzRzJqze+OowSOrBFPYIf9SChBGnb+hs/f7dKkmwxso55tnNsT63IfDkpgI
	 vsMyYjxOxiRyF2ibWhEG+hSU/eCanKeUk0kox8w64IeDmSDfjTQOJlml7krpR4TQUidYr
	 FBIWUHCOcPo1nZ3txlEAzk7Cgk8KNRx9pnlMd/zhlQQ8iCR2+6eMd5i4R3tCoxG4fyxvL
	 R3SHOIJeA0LPkYYGXc8+pxQFiHVrXqaFc5PPz51TU70Z7/d3SM7AY631wQC1Zr5k7lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822289;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=8JYviDqoWsEGN3uNb5Mh66eaw6snQ2TUUnHcmJoMJ80=;
	b=xeZT94TiFzFBrtI4WOnUSN8tTPhDPPgpr++cLDl78wC/4gsLi5jrJ/UHpsXCDvfTMf6N
	 /qGKlIvrc9Tcl0wkDgR9Lm1P7uYU6U/3KyHnLrZgYrhrKZ780SpiBYDbZZAW+Ukk3ezyk
	 P4oJ6zrLSmS+Bbb0oaf53SPJjzQN7YTSbh/8fqOXnlo5et5zN/CK6g8NFYe4SdQ9d09w+
	 J+aQCQCIsY/THjvcufGf/bovLrfqm9mcN2YPPrdPJpes0/m3uFlB0kxup7sJYPrlE9AhQ
	 Ep1UzYNdjPmsI2s29PIwJ9U57Ie100aE8NMN7xZaZRL9PzX/C7IZAdNzsDluzT/si8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omYmnILU;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07129606C937
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07129606C937
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omYmnILU
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC4BF41AE2;
	Wed,  4 Nov 2026 19:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB771F00A1A;
	Wed,  4 Nov 2026 19:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822288;
	bh=8JYviDqoWsEGN3uNb5Mh66eaw6snQ2TUUnHcmJoMJ80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=omYmnILU6n/a/8ypDuatFcm5Yn1YdJM3CRKKuli7fcBySnvTgN50xiis4mVllM49v
	 PV+Quk0y9VPAUT7onGY2p/nLF2xkGIDIWXqi4tkrhVP7JJganO4BAn8bDHMRztyoBl
	 kDuAQDvNJ8Uuc3JHKiaYHNXgDWLaFbsRCKaJ0zpPBvI9qjf+zzVVphC8QUnWa1gAS9
	 TqNqVumOE5u8pqbbZNrZhXFAdBkCmBN9rMMWYN4XW4rPv+P/EOoobKcvq4QxkXRKVJ
	 s5UQbq8xS22dtefS2Q7ckkJlMa6rIUtShtzwuWqlg+ImTJMyCWJ++E2LN9ezNnICps
	 7WSbKOm7NJ/JQ==
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
Subject: [PATCH RESEND v2 01/13] atm: let procfs copy out reads of the device files
Date: Wed,  4 Nov 2026 20:57:54 +0100
Message-ID: <20261104-work-procfs-net-v2-1-221e2437fed1@kernel.org>
In-Reply-To: <20261104-work-procfs-net-v2-0-221e2437fed1@kernel.org>
References: <20261104-work-procfs-net-v2-0-221e2437fed1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517; i=brauner@kernel.org; h=from:subject:message-id; bh=gPjf1XFsI8l/uiq7gtBYaOS5PIZm1WCyT/xvmcgXYrk=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97lO2Xbpnsl62nNauWplf/xdYPBNLEnswIafyCd/XX xHhEwqnd5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEwkTZuR4eHSqRGfps/7dvOV 691dX8+Wbls1oSJgtmlB5Vsb0VvvEssY/hllnXhlJifSrl2270GVY8Ldju5SgRBVQfPATZXl+2b r8AIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Implement ->proc_read_buf() so procfs copies what is read from
/proc/net/atm/<dev> to userspace after it unpinned the entry. The
drivers' ->proc_read() keep filling their page.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 net/atm/proc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/net/atm/proc.c b/net/atm/proc.c
index ca0fc6b90998..cea930b4b840 100644
--- a/net/atm/proc.c
+++ b/net/atm/proc.c
@@ -30,11 +30,11 @@
 #include "resources.h"
 #include "common.h" /* atm_proc_init prototype */
 
-static ssize_t proc_dev_atm_read(struct file *file, char __user *buf,
+static ssize_t proc_dev_atm_read(struct file *file, char *buf,
 				 size_t count, loff_t *pos);
 
 static const struct proc_ops atm_dev_proc_ops = {
-	.proc_read	= proc_dev_atm_read,
+	.proc_read_buf	= proc_dev_atm_read,
 	.proc_lseek	= noop_llseek,
 };
 
@@ -246,7 +246,7 @@ static const struct seq_operations vcc_seq_ops = {
 	.show	= vcc_seq_show,
 };
 
-static ssize_t proc_dev_atm_read(struct file *file, char __user *buf,
+static ssize_t proc_dev_atm_read(struct file *file, char *buf,
 				 size_t count, loff_t *pos)
 {
 	struct atm_dev *dev;
@@ -267,8 +267,7 @@ static ssize_t proc_dev_atm_read(struct file *file, char __user *buf,
 			length = -EINVAL;
 	}
 	if (length >= 0) {
-		if (copy_to_user(buf, (char *)page, length))
-			length = -EFAULT;
+		memcpy(buf, (char *)page, length);
 		(*pos)++;
 	}
 	free_page(page);

-- 
2.53.0


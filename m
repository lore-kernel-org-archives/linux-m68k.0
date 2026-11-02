Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629533;
	b=IIOV5ofynAT9hbOLFLCauE+P171pxfnvZt3dWJliLa3Q8YB+cNpbRtRa2egPcdEm1vrr
	 ZeZXD7/vvVi9pHl45HPZ/srXZtGv1+3Z3F5m2/mMfk9UwAVLP8P5u0/08Wc09vL4dOwi4
	 UgtRRrov1ZzzC4bafKerDnmlPu+Cyrz4WjvWszU1+x67xJn4MXXxhsycRtagpP6p57xqt
	 HD/bj9sL0gNMJA4C9U97kpsObOB2FW/oEOe/57eth7KlgewBWtVvLeCgqv+wOU6qY1fRS
	 TThJIjiAgvXXyyOs925IAQvrwUw3Awg1uP5ygbo2yD91+F6NUGuggJ9Mav8ugEbDBOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629533;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mKU98amy9hy90zr0rIuEDpX5DG9FkJnMRpzgeAMYKDA=;
	b=joHzjX9CsqhVzB0UL7ee66GonK79HWxso0BTaFY1it0Hm8EM/SbCHNK7rK9oeK+qevre
	 ePhrs3alrKGhGQLH+Ov9JbhnqFAoKwoqgUcS1Emi8JErx/Rpq14g090YeL7MFBZRY0Fvr
	 K1jZ2twaHIteyoE+co8nHNSoWkDgYPZrR2orddIl6MQMD2OCbZlUT0RNjse2dKuuaOH9H
	 /jm07Huc1unNGJaFfVVcjBHKMwfYWWTQeY9lgXdYDB8Xe6FEtdNeWPUnzthpXiSv03ygw
	 yCw3WrkfGsCl8wSHEia6MtaBoyJJ6p1k/Hjr3h8IikV1jE2es/s8qRl+y4z3+ngnGvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuiXMui8;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D54606B0E0
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 14:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D54606B0E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuiXMui8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8B54435BA;
	Mon,  2 Nov 2026 14:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C7B1F00A1A;
	Mon,  2 Nov 2026 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629532;
	bh=mKU98amy9hy90zr0rIuEDpX5DG9FkJnMRpzgeAMYKDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RuiXMui8BjXqcKpOkZSSb2fzdRJqOkdTcBMExOILHIUKi584gE62EX9Rp9REsxAIh
	 tjfzstrESrt5D/m0KQUF1dxAhGVFfymG0E8Js/U44Ve00018P7C9iKFESKyfNdRPH7
	 jxqcAf+UyNqrfhgRtXxl4xxVCit/7IAdifFgBcmNi28pEmExfPZqlZQ4Q0GbNWzpIU
	 msgRoEl0hgaDf8LmrTDw9dYe6Yf6s53ZTxmKCSoEgxdjVUtQjEYNmUbpSyhFg70PwG
	 1lAYyQW6WwhB8zxcVpIbbkLDhHR6Rqo3KCYBrHb/1mUtI2SL/iwP/I6AQGkAgYxSJ7
	 LV6XKXIW55awQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 15:21:31 +0100
Subject: [PATCH RFC 16/38] proc: don't walk through a non-directory when
 resolving a name
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
Message-Id: <20261102-work-procfs-bugfixes-v1-16-59422ed3e465@kernel.org>
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
 Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2403; i=brauner@kernel.org;
 h=from:subject:message-id; bh=/ELhSiescDaKRjbpWYPGx1ceLHTHmhSA6KoiiBWZ7Vg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9mJOt9OXTNdZ5WT/1Ui5nzeZtP2wlv61nddee+08Ux
 Eyii1I+d5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEykaAvD/7pF4SLFW7W7Qx48
 CBf6zy7QHPZPaforsYxZ6W92nFswPYbhf+p3tsbuWgVbTQW7NyaGa9/nmy3g0Lj3LuPQBLv7vNr
 OzAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

__xlate_proc_name() walks the components of a name like "a/b/c" and
takes whatever it finds for "a" and "b" as the directory to go on in.
It never checks that they actually are directories. So
proc_create("file/x") hangs x into the subdir tree of the regular file
"file". Nobody can look x up there, but remove_proc_subtree() on the
file removes and frees x along with it, behind the back of whoever
registered x.

pktgen passes the name the writer of "add_device" picks to
proc_create_data(), and only the part in front of the '@' has to name
a network device:

  echo "add_device lo@"   > /proc/net/pktgen/kpktgend_0
  echo "add_device lo@/x" > /proc/net/pktgen/kpktgend_1
  echo "rem_device_all"   > /proc/net/pktgen/kpktgend_0
  echo "rem_device_all"   > /proc/net/pktgen/kpktgend_1

The third write frees both entries and the fourth one makes kpktgend_1
call proc_remove() on the freed second one:

  BUG: KASAN: slab-use-after-free in proc_remove+0x8f/0xa0
  Read of size 8 at addr ff110001134c8e70 by task kpktgend_1/243
  Call Trace:
   proc_remove+0x8f/0xa0
   pktgen_remove_device.isra.0+0x118/0x500
   pktgen_rem_all_ifs+0xeb/0x1a0
   pktgen_thread_worker+0x1b42/0x7280

The files of a network namespace belong to the root of its user
namespace and these writes don't require a capability. So once pktgen
is loaded an unprivileged user can do this in namespaces of its own.

Treat a component that isn't a directory like one that doesn't exist.
All names with a '/' that the tree passes in as literals only walk
through directories. pktgen is fixed separately to not pass such names
in the first place.

Reported-by: Chris Mason <mason@kernel.org>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/proc/generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/generic.c b/fs/proc/generic.c
index 2b1971da4a85..c560c96a64eb 100644
--- a/fs/proc/generic.c
+++ b/fs/proc/generic.c
@@ -170,7 +170,7 @@ static int __xlate_proc_name(const char *name, struct proc_dir_entry **ret,
 	de = *ret ?: &proc_root;
 	while ((next = strchr(cp, '/')) != NULL) {
 		de = pde_subdir_find(de, cp, next - cp);
-		if (!de) {
+		if (!de || !S_ISDIR(de->mode)) {
 			WARN(1, "name '%s'\n", name);
 			return -ENOENT;
 		}

-- 
2.53.0


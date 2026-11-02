Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629766;
	b=c8SUU5yL4L87vi8NTvBy+bE8miM8hkx5XDlC1vs4mOueA0o/4UDT9fqtfAVnu7+uxiJh
	 osti5n+71gel7dzJHthWykVnF7BGn+VAzBZJ4/ZkR8u/j9Ds8bbMlEFV2orOm0j17XjMS
	 sXO/fOhOGkDQu03a4/3Mco3t5kNwAw/ArcJafEMK3VvoNM6Q+I/c7WyDzYXV0uRfxW2Cy
	 ezM6Sz0PSPMesYkLOZMA4PWexCOfDxjXFguWcgQ+A3p00LRTkNgVR3o/mQgzBXitkoF/i
	 hgr79yJstDzcZZVu/g2UH3RRSTBtJbWSwSGkyCXJh7jgHzlwv1jJia88P9jzx//GsHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629766;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/Wx/9hEycnxG6QqWT58rgPjCjctkpbUJ1BsGJ+UfGVA=;
	b=nMFUxw+Uu4AY/3TopV9OSypqRV1usxEfpIgUFopH+R/JDaIxjT5yV9c5GIbUWPl1ikEH
	 Y032VcGH1OUddnvMfBwaozWTTZckgssirAlFLOjLCM+qnylJbDA40EhWBkk5/oZYh1hK6
	 yk/kvuwDl04N5e3i8n01yulBZpK50UP9m1V5wtGxjBVDYw7fSUYA0v1mpnN+1afVRN3IS
	 5c1z8ODpPHna7L9GsrTlcJV/XO6F+ljS9aUq3cZE+7hGGi5cEdzsHC3lbqpyDWSeBuJJO
	 6HTzUGiJlcbC8D/xCYKj/u4uK6u/N1BIJe948svHk2oFXubJJz2D6jvCeDfoA7nsMSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eW6R0uhw;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C59606C54A
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 14:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C59606C54A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eW6R0uhw
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0CE642DA5;
	Mon,  2 Nov 2026 14:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F5B1F00A18;
	Mon,  2 Nov 2026 14:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629765;
	bh=/Wx/9hEycnxG6QqWT58rgPjCjctkpbUJ1BsGJ+UfGVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eW6R0uhwxmp1LxYPzZlSqP55jX3R1bLXeaGtF+FDg3DWqKEMDO9KauKhOwQ8ubsCQ
	 fBe4h39HrP7xRV61MSsKKfiOFZzvbU/OzY7VZU0Fq3CrSBnMDq0rZXzZfnCu/uF48O
	 HPf9NbOeuXPLNHRGdye5RY6G3G+n0wc9qdGZeOuvgwbw2lDj9zICBQVS7t2oEbXlMn
	 8S5mBzFa4thYSzcTzqy+1xJdsRKmYjB8C1Ihqi+VpoXlrdWAMX5nyktL+fKIUpcZet
	 5atlLoyOrwbZo+AWJ0BsA/ElUz6LoJgm1k0YxqIK/Lt/7rH1YT0aokmyMdLB5DliLp
	 f+qLHZu8+PEYw==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 02 Nov 2026 15:21:47 +0100
Subject: [PATCH RFC 32/38] selftests/proc: check a sysctl listing while
 entries come and go
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
Message-Id: <20261102-work-procfs-bugfixes-v1-32-59422ed3e465@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5795; i=brauner@kernel.org;
 h=from:subject:message-id; bh=PoVb2K3h8KM7KPudC9ie8mT7qnQN29SNHExdevOrgr4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS9mJOz8euhrPDD6keYJt57ESafo71NyvTKB4XSe0vV/
 d2L0jmrOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbyPp6R4T1v/gO3yVq1bLFa
 9xR+MagsYBDe1Wu1ffOZjP07lprMfsDI8GKVk+DOKW/3SgRckbmd9SEtUYQ39/Vpg2IN4d83DE5
 OYgMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

List /proc/sys/net/ipv4/conf of a new network namespace in two pieces:

- with a buffer that holds the dots and "all", register a tun device
  whose name sorts first, finish the listing: "all" is listed once

- with that device registered and a buffer that holds the dots and it,
  unregister it, finish the listing: "all" is still listed

Both fail without the fix, the first lists "all" twice, the second not
at all.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 tools/testing/selftests/proc/.gitignore            |   1 +
 tools/testing/selftests/proc/Makefile              |   1 +
 .../selftests/proc/proc-sysctl-readdir-churn.c     | 147 +++++++++++++++++++++
 3 files changed, 149 insertions(+)

diff --git a/tools/testing/selftests/proc/.gitignore b/tools/testing/selftests/proc/.gitignore
index 8520c7878ea2..5b5e24e39cbd 100644
--- a/tools/testing/selftests/proc/.gitignore
+++ b/tools/testing/selftests/proc/.gitignore
@@ -25,4 +25,5 @@
 /self
 /setns-dcache
 /setns-sysvipc
+/proc-sysctl-readdir-churn
 /thread-self
diff --git a/tools/testing/selftests/proc/Makefile b/tools/testing/selftests/proc/Makefile
index e0c0d313f4d0..dae09f333455 100644
--- a/tools/testing/selftests/proc/Makefile
+++ b/tools/testing/selftests/proc/Makefile
@@ -30,6 +30,7 @@ TEST_GEN_PROGS += setns-sysvipc
 TEST_GEN_PROGS += thread-self
 TEST_GEN_PROGS += proc-multiple-procfs
 TEST_GEN_PROGS += proc-fsconfig-hidepid
+TEST_GEN_PROGS += proc-sysctl-readdir-churn
 TEST_GEN_PROGS += proc-pidns
 
 include ../lib.mk
diff --git a/tools/testing/selftests/proc/proc-sysctl-readdir-churn.c b/tools/testing/selftests/proc/proc-sysctl-readdir-churn.c
new file mode 100644
index 000000000000..0e067a3619c4
--- /dev/null
+++ b/tools/testing/selftests/proc/proc-sysctl-readdir-churn.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A listing of a /proc/sys directory that takes more than one getdents64()
+ * must not show an entry twice or skip one when an entry is registered or
+ * unregistered in between. /proc/sys/net/ipv4/conf/<dev> of a tun device
+ * comes and goes with the device.
+ */
+#define _GNU_SOURCE
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <linux/if.h>
+#include <linux/if_tun.h>
+#include <sched.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/syscall.h>
+#include <unistd.h>
+
+#include "../kselftest_harness.h"
+
+#define CONF_DIR	"/proc/sys/net/ipv4/conf"
+#define TUN_NAME	"a0"		/* sorts before "all" */
+#define TUN_PATH	CONF_DIR "/" TUN_NAME
+#define SMALL_BUF	80		/* ".", ".." and one short name */
+#define NAMES		64
+
+static int tun_open(const char *name)
+{
+	struct ifreq ifr = {};
+	int fd;
+
+	fd = open("/dev/net/tun", O_RDWR | O_CLOEXEC);
+	if (fd < 0)
+		return -1;
+	strncpy(ifr.ifr_name, name, IFNAMSIZ - 1);
+	ifr.ifr_flags = IFF_TUN | IFF_NO_PI;
+	if (ioctl(fd, TUNSETIFF, &ifr)) {
+		close(fd);
+		return -1;
+	}
+	return fd;
+}
+
+/* one getdents64() into @buf, the names appended to @names */
+static int list(int fd, char *buf, size_t size, char names[][NAME_MAX + 1],
+		int *n)
+{
+	long ret, off;
+	int got = 0;
+
+	ret = syscall(__NR_getdents64, fd, buf, size);
+	if (ret < 0)
+		return -errno;
+	for (off = 0; off < ret;) {
+		struct dirent64 *d = (void *)(buf + off);
+
+		if (*n < NAMES)
+			strcpy(names[(*n)++], d->d_name);
+		got++;
+		off += d->d_reclen;
+	}
+	return got;
+}
+
+static int count(char names[][NAME_MAX + 1], int n, const char *name)
+{
+	int i, c = 0;
+
+	for (i = 0; i < n; i++)
+		if (!strcmp(names[i], name))
+			c++;
+	return c;
+}
+
+FIXTURE(sysctl_readdir) {
+	int dir;
+	int n;
+	char names[NAMES][NAME_MAX + 1];
+	char buf[65536];
+};
+
+FIXTURE_SETUP(sysctl_readdir)
+{
+	if (unshare(CLONE_NEWNET))
+		SKIP(return, "unshare(CLONE_NEWNET): %s", strerror(errno));
+	if (access("/dev/net/tun", F_OK))
+		SKIP(return, "/dev/net/tun: %s", strerror(errno));
+	self->dir = open(CONF_DIR, O_RDONLY | O_DIRECTORY | O_CLOEXEC);
+	ASSERT_GE(self->dir, 0);
+	self->n = 0;
+}
+
+FIXTURE_TEARDOWN(sysctl_readdir)
+{
+	close(self->dir);
+}
+
+/* a device registered in front of the position doesn't repeat an entry */
+TEST_F(sysctl_readdir, register_in_front)
+{
+	int tun;
+
+	/* ".", ".." and "all", "default" doesn't fit */
+	ASSERT_EQ(list(self->dir, self->buf, SMALL_BUF, self->names, &self->n), 3);
+	ASSERT_EQ(count(self->names, self->n, "all"), 1);
+
+	tun = tun_open(TUN_NAME);
+	ASSERT_GE(tun, 0);
+	ASSERT_EQ(access(TUN_PATH, F_OK), 0);
+
+	while (list(self->dir, self->buf, sizeof(self->buf), self->names,
+		    &self->n) > 0)
+		;
+	EXPECT_EQ(count(self->names, self->n, "all"), 1);
+	EXPECT_EQ(count(self->names, self->n, "default"), 1);
+	EXPECT_EQ(count(self->names, self->n, "lo"), 1);
+	close(tun);
+}
+
+/* a device unregistered in front of the position doesn't skip an entry */
+TEST_F(sysctl_readdir, unregister_in_front)
+{
+	int tun;
+
+	tun = tun_open(TUN_NAME);
+	ASSERT_GE(tun, 0);
+	ASSERT_EQ(access(TUN_PATH, F_OK), 0);
+
+	/* ".", ".." and the device, "all" doesn't fit */
+	ASSERT_EQ(list(self->dir, self->buf, SMALL_BUF, self->names, &self->n), 3);
+	ASSERT_EQ(count(self->names, self->n, TUN_NAME), 1);
+
+	/* closing the device unregisters its sysctls under RTNL */
+	close(tun);
+	ASSERT_EQ(access(TUN_PATH, F_OK), -1);
+
+	while (list(self->dir, self->buf, sizeof(self->buf), self->names,
+		    &self->n) > 0)
+		;
+	EXPECT_EQ(count(self->names, self->n, "all"), 1);
+	EXPECT_EQ(count(self->names, self->n, "default"), 1);
+	EXPECT_EQ(count(self->names, self->n, "lo"), 1);
+}
+
+TEST_HARNESS_MAIN

-- 
2.53.0


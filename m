Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822238;
	b=TfjnCC/d7ldu8j9nS/goXl2oHQYjfg6eJ/Q3o8Mic88ha+yFy6F7L2pB/A2rkxEpew2X
	 qY4IoT97s5a+n63UnG3ZFNUq4NGkrmPDw5k2l6Fc5Trd7sqXWfIq5XDf02LV4vJlWH9nx
	 g3ucJE2VXpKRL7nWI3p1aRhNoDOBlcHpenrK012JHEHfointhjb5E5pS7X+6/3d6MGd24
	 NYTBsBgGTlYgql82LsW7x99JSOcFjCSVUHCazqv6ZPTLuQ8ZkKekuUz1lu2fgv9pJinsd
	 moRzNicr5DsyTDdHtNyMGM6zuL377c7rpynQl+yHMrf14HofOscm+3Om4UizwdtwPvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822238;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=TlMRmMUMe8QjAR6CrqBxKOo0d6t3LuUXfgeBLoU2aVQ=;
	b=DMC2fAEqlODlHD13lH4TL2vVQjvgcwvHm5QkwWIJrVKoF2q0spCMr/aZ1VcesYdKeaD0
	 lKzoMRntEAWr90eyWaDYpDJvoTSogsyZhby3Aq9rbWgbqjBobuK6Psp3j+zUnwX7XWAqp
	 ZVxmVbOg/AFjZt8di4UjD4hE23odkeCwsRMBQ95Wp0aErztUFqCM/NYlt10cZcKwni4Pe
	 9ppkTbWZpCa3+eTcuowv/7QqSpQOrtyCyFkEAdnNPixMBUoCeNDu/Sv6K1Pctv++E6qNj
	 0/Zczh3gLkkh22uk3cxi/qI203Msz8XcDPEn5qxVq3GBm6dT1JYVLsu7qubQzM68J3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqE7S5Xb;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3E606D16A
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 19:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D3E606D16A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqE7S5Xb
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0611160F30;
	Wed,  4 Nov 2026 19:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B4E1F0093A;
	Wed,  4 Nov 2026 19:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822236;
	bh=TlMRmMUMe8QjAR6CrqBxKOo0d6t3LuUXfgeBLoU2aVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kqE7S5XbuPIKNWgp4NcZtfxZcKDOczdTyfF6Lb8nBkfcnxaRlqnGD+MaRgRQBXNdL
	 cL1adcnEzbJdtGYfAsG5VHAqA4BETjnf58PLyPmqGWnQP0rpXnLeJ/+QmKPG7qeIKA
	 hRq+/iIxd2JbJ+p/at2OkZrx4ySzYMev1Cd2Jsd7KGS4shN4u5UzGNl2aeD7+6rjz2
	 Jz//M8FN+MIGMB8INEniatc1xDsyIDdvQxrW6TC6MgJiqUpNa9XPgFBq7Foxi5L6ah
	 DogTh1A4WvscXityp0tTb9b/tpjyhIQ5HDNDc9RYmgXzkAUT8tucExiczCpS3FKXuW
	 ZizaXv/BEuT+g==
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
Subject: [PATCH RESEND v2 30/30] selftests/proc: check that unloading configs doesn't wait for a reader
Date: Wed,  4 Nov 2026 20:57:02 +0100
Message-ID: <20261104-work-procfs-fs-v2-30-319e0f9a8aae@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6975; i=brauner@kernel.org; h=from:subject:message-id; bh=Zaf7aQXhU8HLaVPdOPllMB8eHKp+Tuk66nG4inrKqtI=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS97vHv7BDe1a4XkZsjGzjxhP5d1TaR9DwbEbXP7r+UK lx1gtQ7SlkYxLgYZMUUWRzaTcLllvNUbDbK1ICZw8oEMoSBi1MAJhIhzsjQ+O/84rDM6r9Orw9O bhF9KqEldSQrX6wjhOPqjMMJV2IaGf7XCCjtOGddIBLj/P/jR3XTdf+Epk/fMvvJmQWuDy6+if/ ODwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

Read /proc/config.gz into a buffer whose first page is backed by
userfaultfd and unload configs.ko while procfs copies what was read to
userspace:

- removing the entry doesn't wait for the reader

- the reader still gets the page that was read before the removal, and
  nothing more

- and the next read fails with -EIO

The test loads configs.ko if it isn't there, skips if configs is built
in or can't be unloaded, and loads it again afterwards. It needs
CONFIG_IKCONFIG=m. kselftest-merge keeps the =y that other fragments
ask for, so it skips there.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 tools/testing/selftests/proc/.gitignore            |   1 +
 tools/testing/selftests/proc/Makefile              |   1 +
 tools/testing/selftests/proc/config                |   2 +
 .../proc/proc-remove-slow-config-reader.c          | 157 +++++++++++++++++++++
 4 files changed, 161 insertions(+)

diff --git a/tools/testing/selftests/proc/.gitignore b/tools/testing/selftests/proc/.gitignore
index a1994bda676c..ed863db1688f 100644
--- a/tools/testing/selftests/proc/.gitignore
+++ b/tools/testing/selftests/proc/.gitignore
@@ -21,6 +21,7 @@
 /proc-uptime-001
 /proc-uptime-002
 /proc-pidns
+/proc-remove-slow-config-reader
 /proc-remove-slow-sysctl
 /proc-remove-slow-reader
 /proc-remove-mapped
diff --git a/tools/testing/selftests/proc/Makefile b/tools/testing/selftests/proc/Makefile
index 8fcab5af502b..95c9212fb670 100644
--- a/tools/testing/selftests/proc/Makefile
+++ b/tools/testing/selftests/proc/Makefile
@@ -33,6 +33,7 @@ TEST_GEN_PROGS += proc-fsconfig-hidepid
 TEST_GEN_PROGS += proc-sysctl-readdir-churn
 TEST_GEN_PROGS += proc-pidns
 TEST_GEN_PROGS += proc-remove-slow-sysctl
+TEST_GEN_PROGS += proc-remove-slow-config-reader
 TEST_GEN_PROGS += proc-remove-slow-reader
 TEST_GEN_PROGS += proc-remove-mapped
 TEST_GEN_PROGS += proc-remove-slow-readlink
diff --git a/tools/testing/selftests/proc/config b/tools/testing/selftests/proc/config
index 992577d15295..15b307189392 100644
--- a/tools/testing/selftests/proc/config
+++ b/tools/testing/selftests/proc/config
@@ -11,3 +11,5 @@ CONFIG_SND=y
 CONFIG_SND_DUMMY=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
diff --git a/tools/testing/selftests/proc/proc-remove-slow-config-reader.c b/tools/testing/selftests/proc/proc-remove-slow-config-reader.c
new file mode 100644
index 000000000000..5f7bcb27b315
--- /dev/null
+++ b/tools/testing/selftests/proc/proc-remove-slow-config-reader.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A read that faults while procfs copies it to userspace must not hold up
+ * removal of the /proc entry. Unloading configs.ko removes /proc/config.gz,
+ * which isn't a seq_file.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/userfaultfd.h>
+#include <poll.h>
+#include <pthread.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <unistd.h>
+
+#include "../kselftest_harness.h"
+
+#define CONFIG_PATH	"/proc/config.gz"
+#define CONFIG_MODULE	"/sys/module/configs"
+#define READ_PAGES	2
+#define TIMEOUT_MS	5000
+
+struct reader {
+	int fd;
+	char *buf;
+	size_t len;
+	ssize_t ret;
+};
+
+struct unloader {
+	int done;
+	int ret;
+};
+
+static void *read_thread(void *arg)
+{
+	struct reader *r = arg;
+
+	r->ret = read(r->fd, r->buf, r->len);
+	return NULL;
+}
+
+static void *unload_thread(void *arg)
+{
+	struct unloader *u = arg;
+	ssize_t ret;
+
+	u->ret = syscall(__NR_delete_module, "configs", O_NONBLOCK) ? -errno : 0;
+	ret = write(u->done, "x", 1);
+	return (void *)ret;
+}
+
+FIXTURE(configs) {
+	bool loaded;
+};
+
+FIXTURE_SETUP(configs)
+{
+	self->loaded = false;
+	if (access(CONFIG_PATH, R_OK) && system("modprobe -q configs"))
+		SKIP(return, "no " CONFIG_PATH);
+	if (access(CONFIG_PATH, R_OK))
+		SKIP(return, CONFIG_PATH ": %s", strerror(errno));
+	if (access(CONFIG_MODULE, F_OK))
+		SKIP(return, "configs isn't a module");
+	self->loaded = true;
+}
+
+FIXTURE_TEARDOWN(configs)
+{
+	/* an ASSERT may have fired with the module unloaded */
+	if (self->loaded && access(CONFIG_PATH, F_OK) &&
+	    system("modprobe -q configs"))
+		TH_LOG("couldn't load configs again");
+}
+
+TEST_F(configs, remove_while_reader_faults)
+{
+	struct uffdio_api api = { .api = UFFD_API };
+	struct uffdio_register reg = {};
+	struct uffdio_zeropage zero = {};
+	long psz = sysconf(_SC_PAGESIZE);
+	struct unloader u = {};
+	struct reader r = {};
+	struct uffd_msg msg;
+	struct pollfd pfd;
+	pthread_t rt, ut;
+	int uffd, done[2];
+	char *buf, *ref;
+	ssize_t ref_len;
+
+	r.fd = open(CONFIG_PATH, O_RDONLY | O_CLOEXEC);
+	ASSERT_GE(r.fd, 0);
+
+	/* what the first page of a read looks like */
+	ref = malloc(psz);
+	ASSERT_NE(ref, NULL);
+	ref_len = pread(r.fd, ref, psz, 0);
+	ASSERT_GT(ref_len, 0);
+
+	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+	if (uffd < 0)
+		SKIP(return, "userfaultfd: %s", strerror(errno));
+	ASSERT_EQ(ioctl(uffd, UFFDIO_API, &api), 0);
+
+	/* Only the first page of the buffer goes through userfaultfd. */
+	buf = mmap(NULL, READ_PAGES * psz, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(buf, MAP_FAILED);
+	reg.range.start = (unsigned long)buf;
+	reg.range.len = psz;
+	reg.mode = UFFDIO_REGISTER_MODE_MISSING;
+	ASSERT_EQ(ioctl(uffd, UFFDIO_REGISTER, &reg), 0);
+
+	r.buf = buf;
+	r.len = READ_PAGES * psz;
+	ASSERT_EQ(pthread_create(&rt, NULL, read_thread, &r), 0);
+
+	/* The reader now sleeps in the copy to userspace. */
+	pfd = (struct pollfd){ .fd = uffd, .events = POLLIN };
+	ASSERT_EQ(poll(&pfd, 1, TIMEOUT_MS), 1);
+	ASSERT_EQ(read(uffd, &msg, sizeof(msg)), sizeof(msg));
+	ASSERT_EQ(msg.event, UFFD_EVENT_PAGEFAULT);
+
+	/* Unloading configs.ko removes the file that is being read. */
+	ASSERT_EQ(pipe2(done, O_CLOEXEC), 0);
+	u.done = done[1];
+	ASSERT_EQ(pthread_create(&ut, NULL, unload_thread, &u), 0);
+	pfd = (struct pollfd){ .fd = done[0], .events = POLLIN };
+	EXPECT_EQ(poll(&pfd, 1, TIMEOUT_MS), 1) {
+		TH_LOG("removing " CONFIG_PATH " waited for the reader");
+	}
+
+	zero.range.start = (unsigned long)buf;
+	zero.range.len = psz;
+	ASSERT_EQ(ioctl(uffd, UFFDIO_ZEROPAGE, &zero), 0);
+	ASSERT_EQ(pthread_join(rt, NULL), 0);
+	ASSERT_EQ(pthread_join(ut, NULL), 0);
+	if (u.ret)
+		SKIP(return, "unloading configs: %s", strerror(-u.ret));
+
+	/*
+	 * The page that was read before the removal still arrives and the
+	 * next piece isn't filled anymore, then nothing.
+	 */
+	EXPECT_EQ(r.ret, ref_len);
+	EXPECT_EQ(memcmp(buf, ref, ref_len), 0);
+	EXPECT_EQ(read(r.fd, buf, psz), -1);
+	EXPECT_EQ(errno, EIO);
+	free(ref);
+}
+
+TEST_HARNESS_MAIN

-- 
2.53.0


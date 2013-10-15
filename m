From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/3] kexec: Let slurp_file_len() return the number of bytes read
Date: Tue, 15 Oct 2013 19:50:58 +0200
Message-ID: <1381859460-13645-2-git-send-email-geert@linux-m68k.org>
References: <1381859460-13645-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381859460-13645-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>

Add an optional output parameter to slurp_file_len() so it can return the
actual number of bytes read.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Dave Young <dyoung@redhat.com>
---
 kexec/arch/i386/crashdump-x86.c |    5 ++---
 kexec/kexec.c                   |    4 +++-
 kexec/kexec.h                   |    2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/kexec/arch/i386/crashdump-x86.c b/kexec/arch/i386/crashdump-x86.c
index e44fcebbd32b..e2da50b54c91 100644
--- a/kexec/arch/i386/crashdump-x86.c
+++ b/kexec/arch/i386/crashdump-x86.c
@@ -121,7 +121,7 @@ static int get_kernel_vaddr_and_size(struct kexec_info *UNUSED(info),
 	struct mem_ehdr ehdr;
 	struct mem_phdr *phdr, *end_phdr;
 	int align;
-	unsigned long size;
+	off_t size;
 	uint32_t elf_flags = 0;
 
 	if (elf_info->machine != EM_X86_64)
@@ -131,8 +131,7 @@ static int get_kernel_vaddr_and_size(struct kexec_info *UNUSED(info),
 		return 0;
 
 	align = getpagesize();
-	size = KCORE_ELF_HEADERS_SIZE;
-	buf = slurp_file_len(kcore, size);
+	buf = slurp_file_len(kcore, KCORE_ELF_HEADERS_SIZE, &size);
 	if (!buf) {
 		fprintf(stderr, "Cannot read %s: %s\n", kcore, strerror(errno));
 		return -1;
diff --git a/kexec/kexec.c b/kexec/kexec.c
index 2ce570f7bb43..185c85bef342 100644
--- a/kexec/kexec.c
+++ b/kexec/kexec.c
@@ -537,7 +537,7 @@ char *slurp_file(const char *filename, off_t *r_size)
 /* This functions reads either specified number of bytes from the file or
    lesser if EOF is met. */
 
-char *slurp_file_len(const char *filename, off_t size)
+char *slurp_file_len(const char *filename, off_t size, off_t *nread)
 {
 	int fd;
 	char *buf;
@@ -575,6 +575,8 @@ char *slurp_file_len(const char *filename, off_t size)
 		die("Close of %s failed: %s\n",
 			filename, strerror(errno));
 	}
+	if (nread)
+		*nread = progress;
 	return buf;
 }
 
diff --git a/kexec/kexec.h b/kexec/kexec.h
index 2904e03c79b8..8d5b512e365f 100644
--- a/kexec/kexec.h
+++ b/kexec/kexec.h
@@ -237,7 +237,7 @@ extern void die(const char *fmt, ...)
 extern void *xmalloc(size_t size);
 extern void *xrealloc(void *ptr, size_t size);
 extern char *slurp_file(const char *filename, off_t *r_size);
-extern char *slurp_file_len(const char *filename, off_t size);
+extern char *slurp_file_len(const char *filename, off_t size, off_t *nread);
 extern char *slurp_decompress_file(const char *filename, off_t *r_size);
 extern unsigned long virt_to_phys(unsigned long addr);
 extern void add_segment(struct kexec_info *info,
-- 
1.7.9.5

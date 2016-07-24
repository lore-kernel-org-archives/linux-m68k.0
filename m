From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v5 12/15] binfmt_flat: allow compressed flat binary format to work on MMU systems
Date: Sun, 24 Jul 2016 11:30:26 -0400
Message-ID: <1469374229-21585-13-git-send-email-nicolas.pitre__30385.4776583195$1469375158$gmane$org@linaro.org>
References: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, linux-fsdevel@vger.kernel.org
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Let's take the simple and obvious approach by decompressing the binary
into a kernel buffer and then copying it to user space.  Those who are
looking for top performance on an MMU system are unlikely to choose this
executable format anyway.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>
---
 fs/binfmt_flat.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 7b999aebad..98cfefadb6 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -34,6 +34,7 @@
 #include <linux/init.h>
 #include <linux/flat.h>
 #include <linux/uaccess.h>
+#include <linux/vmalloc.h>
 
 #include <asm/byteorder.h>
 #include <asm/unaligned.h>
@@ -628,6 +629,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 		 * load it all in and treat it like a RAM load from now on
 		 */
 		if (flags & FLAT_FLAG_GZIP) {
+#ifndef CONFIG_MMU
 			result = decompress_exec(bprm, sizeof(struct flat_hdr),
 					 (((char *)textpos) + sizeof(struct flat_hdr)),
 					 (text_len + full_data
@@ -635,13 +637,51 @@ static int load_flat_file(struct linux_binprm *bprm,
 					 0);
 			memmove((void *) datapos, (void *) realdatastart,
 					full_data);
+#else
+			/*
+			 * This is used on MMU systems mainly for testing.
+			 * Let's use a kernel buffer to simplify things.
+			 */
+			long unz_text_len = text_len - sizeof(struct flat_hdr);
+			long unz_len = unz_text_len + full_data;
+			char *unz_data = vmalloc(unz_len);
+			if (!unz_data) {
+				result = -ENOMEM;
+			} else {
+				result = decompress_exec(bprm, sizeof(struct flat_hdr),
+							 unz_data, unz_len, 0);
+				if (result == 0 &&
+				    (copy_to_user((void __user *)textpos + sizeof(struct flat_hdr),
+						  unz_data, unz_text_len) ||
+				     copy_to_user((void __user *)datapos,
+						  unz_data + unz_text_len, full_data)))
+					result = -EFAULT;
+				vfree(unz_data);
+			}
+#endif
 		} else if (flags & FLAT_FLAG_GZDATA) {
 			result = read_code(bprm->file, textpos, 0, text_len);
-			if (!IS_ERR_VALUE(result))
+			if (!IS_ERR_VALUE(result)) {
+#ifndef CONFIG_MMU
 				result = decompress_exec(bprm, text_len, (char *) datapos,
 						 full_data, 0);
-		} else
+#else
+				char *unz_data = vmalloc(full_data);
+				if (!unz_data) {
+					result = -ENOMEM;
+				} else {
+					result = decompress_exec(bprm, text_len,
+						       unz_data, full_data, 0);
+					if (result == 0 &&
+					    copy_to_user((void __user *)datapos,
+							 unz_data, full_data))
+						result = -EFAULT;
+					vfree(unz_data);
+				}
 #endif
+			}
+		} else
+#endif /* CONFIG_BINFMT_ZFLAT */
 		{
 			result = read_code(bprm->file, textpos, 0, text_len);
 			if (!IS_ERR_VALUE(result))
-- 
2.7.4

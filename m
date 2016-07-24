From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v5 08/15] binfmt_flat: use proper user space accessors with old relocs code
Date: Sun, 24 Jul 2016 11:30:22 -0400
Message-ID: <1469374229-21585-9-git-send-email-nicolas.pitre__25442.0324381956$1469375164$gmane$org@linaro.org>
References: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, linux-fsdevel@vger.kernel.org
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>
---
 fs/binfmt_flat.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 9deafb282d..63756ca6a7 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -379,35 +379,38 @@ static void old_reloc(unsigned long rl)
 {
 	static const char *segment[] = { "TEXT", "DATA", "BSS", "*UNKNOWN*" };
 	flat_v2_reloc_t	r;
-	unsigned long *ptr;
+	unsigned long __user *ptr;
+	unsigned long val;
 
 	r.value = rl;
 #if defined(CONFIG_COLDFIRE)
-	ptr = (unsigned long *) (current->mm->start_code + r.reloc.offset);
+	ptr = (unsigned long __user *)(current->mm->start_code + r.reloc.offset);
 #else
-	ptr = (unsigned long *) (current->mm->start_data + r.reloc.offset);
+	ptr = (unsigned long __user *)(current->mm->start_data + r.reloc.offset);
 #endif
+	__get_user(val, ptr);
 
 	pr_debug("Relocation of variable at DATASEG+%x "
 		 "(address %p, currently %lx) into segment %s\n",
-		 r.reloc.offset, ptr, *ptr, segment[r.reloc.type]);
+		 r.reloc.offset, ptr, val, segment[r.reloc.type]);
 
 	switch (r.reloc.type) {
 	case OLD_FLAT_RELOC_TYPE_TEXT:
-		*ptr += current->mm->start_code;
+		val += current->mm->start_code;
 		break;
 	case OLD_FLAT_RELOC_TYPE_DATA:
-		*ptr += current->mm->start_data;
+		val += current->mm->start_data;
 		break;
 	case OLD_FLAT_RELOC_TYPE_BSS:
-		*ptr += current->mm->end_data;
+		val += current->mm->end_data;
 		break;
 	default:
 		pr_err("Unknown relocation type=%x\n", r.reloc.type);
 		break;
 	}
+	__put_user(val, ptr);
 
-	pr_debug("Relocation became %lx\n", *ptr);
+	pr_debug("Relocation became %lx\n", val);
 }
 
 /****************************************************************************/
@@ -780,8 +783,13 @@ static int load_flat_file(struct linux_binprm *bprm,
 			}
 		}
 	} else {
-		for (i = 0; i < relocs; i++)
-			old_reloc(ntohl(reloc[i]));
+		for (i = 0; i < relocs; i++) {
+			unsigned long relval;
+			if (get_user(relval, reloc + i))
+				return -EFAULT;
+			relval = ntohl(relval);
+			old_reloc(relval);
+		}
 	}
 
 	flush_icache_range(start_code, end_code);
-- 
2.7.4

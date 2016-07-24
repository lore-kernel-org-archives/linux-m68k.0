From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v5 10/15] binfmt_flat: update libraries' data segment pointer with userspace accessors
Date: Sun, 24 Jul 2016 11:30:24 -0400
Message-ID: <1469374229-21585-11-git-send-email-nicolas.pitre__33626.7951796346$1469375155$gmane$org@linaro.org>
References: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, linux-fsdevel@vger.kernel.org
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

This is needed on systems with a MMU.  This also gets rid of the
strangest C code I've seen lateli i.e. an integer indexed with a
pointer value within square brackets. That really looked backwards.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>
---
 fs/binfmt_flat.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 92c1530a2c..aa7971ce6a 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -894,12 +894,19 @@ static int load_flat_binary(struct linux_binprm *bprm)
 		return res;
 
 	/* Update data segment pointers for all libraries */
-	for (i = 0; i < MAX_SHARED_LIBS; i++)
-		if (libinfo.lib_list[i].loaded)
-			for (j = 0; j < MAX_SHARED_LIBS; j++)
-				(-(j+1))[(unsigned long *)(libinfo.lib_list[i].start_data)] =
-					(libinfo.lib_list[j].loaded) ?
-						libinfo.lib_list[j].start_data : UNLOADED_LIB;
+	for (i = 0; i < MAX_SHARED_LIBS; i++) {
+		if (!libinfo.lib_list[i].loaded)
+			continue;
+		for (j = 0; j < MAX_SHARED_LIBS; j++) {
+			unsigned long val = libinfo.lib_list[j].loaded ?
+				libinfo.lib_list[j].start_data : UNLOADED_LIB;
+			unsigned long __user *p = (unsigned long __user *)
+				libinfo.lib_list[i].start_data;
+			p -= j + 1;
+			if (put_user(val, p))
+				return -EFAULT;
+		}
+	}
 
 	install_exec_creds(bprm);
 
-- 
2.7.4

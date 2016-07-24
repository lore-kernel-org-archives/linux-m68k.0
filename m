From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v5 03/15] binfmt_flat: prevent kernel dammage from corrupted executable headers
Date: Sun, 24 Jul 2016 11:30:17 -0400
Message-ID: <1469374229-21585-4-git-send-email-nicolas.pitre__43909.9506977529$1469375154$gmane$org@linaro.org>
References: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, linux-fsdevel@vger.kernel.org
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 fs/binfmt_flat.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index c3ccdefdea..03301bad1f 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -466,6 +466,17 @@ static int load_flat_file(struct linux_binprm *bprm,
 	}
 
 	/*
+	 * Make sure the header params are sane.
+	 * 28 bits (256 MB) is way more than reasonable in this case.
+	 * If some top bits are set we have probable binary corruption.
+	*/
+	if ((text_len | data_len | bss_len | stack_len | full_data) >> 28) {
+		pr_err("bad header\n");
+		ret = -ENOEXEC;
+		goto err;
+	}
+
+	/*
 	 * fix up the flags for the older format,  there were all kinds
 	 * of endian hacks,  this only works for the simple cases
 	 */
-- 
2.7.4

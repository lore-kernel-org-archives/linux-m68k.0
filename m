From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/3] binfmt_flat: Use %u to format u32
Date: Sun, 16 Jul 2017 13:57:27 +0200
Message-ID: <1500206249-16670-1-git-send-email-geert__9425.65370719439$1500206259$gmane$org@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexander Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Miao <realmz6@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Greg Ungerer <gerg@linux-m68k.org>, adi-buildroot-devel@lists.sourceforge.net, uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Several variables had their types changed from unsigned long to u32,
but the printk()-style format to print them wasn't updated, leading to:

    fs/binfmt_flat.c: In function ‘load_flat_file’:
    fs/binfmt_flat.c:577: warning: format ‘%ld’ expects type ‘long int’, but argument 3 has type ‘u32’

Fixes: 468138d78510688f ("binfmt_flat: flat_{get,put}_addr_from_rp() should be able to fail")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 fs/binfmt_flat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 69ec23daa25e003f..a1e6860b6f46a091 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -574,7 +574,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 				MAX_SHARED_LIBS * sizeof(unsigned long),
 				FLAT_DATA_ALIGN);
 
-		pr_debug("Allocated data+bss+stack (%ld bytes): %lx\n",
+		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
 			 data_len + bss_len + stack_len, datapos);
 
 		fpos = ntohl(hdr->data_start);
-- 
2.7.4

From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v5 05/15] binfmt_flat: use generic transfer_args_to_stack()
Date: Sun, 24 Jul 2016 11:30:19 -0400
Message-ID: <1469374229-21585-6-git-send-email-nicolas.pitre__13889.5413525917$1469375159$gmane$org@linaro.org>
References: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, linux-fsdevel@vger.kernel.org
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

This gets rid of the rather ugly, open coded and suboptimal copy code.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>
---
 fs/binfmt_flat.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 03301bad1f..a002e1a3b9 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -846,10 +846,8 @@ static int load_flat_binary(struct linux_binprm *bprm)
 {
 	struct lib_info libinfo;
 	struct pt_regs *regs = current_pt_regs();
-	unsigned long p = bprm->p;
-	unsigned long stack_len;
+	unsigned long sp, stack_len;
 	unsigned long start_addr;
-	unsigned long *sp;
 	int res;
 	int i, j;
 
@@ -884,15 +882,15 @@ static int load_flat_binary(struct linux_binprm *bprm)
 
 	set_binfmt(&flat_format);
 
-	p = ((current->mm->context.end_brk + stack_len + 3) & ~3) - 4;
-	pr_debug("p=%lx\n", p);
+	sp = ((current->mm->context.end_brk + stack_len + 3) & ~3) - 4;
+	pr_debug("sp=%lx\n", sp);
 
-	/* copy the arg pages onto the stack, this could be more efficient :-) */
-	for (i = TOP_OF_ARGS - 1; i >= bprm->p; i--)
-		*(char *) --p =
-			((char *) page_address(bprm->page[i/PAGE_SIZE]))[i % PAGE_SIZE];
+	/* copy the arg pages onto the stack */
+	res = transfer_args_to_stack(bprm, &sp);
+	if (res)
+		return res;
 
-	sp = (unsigned long *) create_flat_tables(p, bprm);
+	sp = create_flat_tables(sp, bprm);
 
 	/* Fake some return addresses to ensure the call chain will
 	 * initialise library in order for us.  We are required to call
@@ -904,14 +902,14 @@ static int load_flat_binary(struct linux_binprm *bprm)
 	for (i = MAX_SHARED_LIBS-1; i > 0; i--) {
 		if (libinfo.lib_list[i].loaded) {
 			/* Push previos first to call address */
-			--sp;	put_user(start_addr, sp);
+			--sp;	put_user(start_addr, (unsigned long *)sp);
 			start_addr = libinfo.lib_list[i].entry;
 		}
 	}
 #endif
 
 	/* Stash our initial stack pointer into the mm structure */
-	current->mm->start_stack = (unsigned long)sp;
+	current->mm->start_stack = sp;
 
 #ifdef FLAT_PLAT_INIT
 	FLAT_PLAT_INIT(regs);
-- 
2.7.4
